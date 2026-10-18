"""Validated manifest and one output policy shared by all publication commands."""

import json
from dataclasses import dataclass
from datetime import date
from pathlib import Path
from typing import Any, TypedDict

from config import CATEGORIES, ROOT


class Variant(TypedDict):
    filename: str
    inputs: dict[str, str]


class Output(TypedDict):
    pdf: str
    pages: int
    bytes: int
    sha256: str


@dataclass(frozen=True)
class Profile:
    template: str
    variants: tuple[str, ...]
    category: str


PROFILES = {
    "tinh-hoa": Profile("lesson", ("de", "de-cach", "dap-an"), "Chuyên đề"),
    "livestream": Profile("lesson", ("de", "de-cach"), "Chuyên đề"),
    "exam": Profile("exam", ("de-dap-an",), "Đề thi"),
}
Manifest = dict[str, Any]
DocumentFiles = dict[str, tuple[Path, str]]


def publication_variants(manifest: Manifest) -> tuple[str, ...]:
    profile = PROFILES[manifest["kind"]]
    combine = manifest.get("publication", {}).get("combine_answers", manifest["kind"] == "exam")
    if type(combine) is not bool:
        raise ValueError("publication.combine_answers must be boolean")
    available = manifest["variants"]
    has_questions = manifest["scope"]["has_questions"]
    has_solutions = manifest["scope"]["has_solutions"]
    if combine and has_questions and has_solutions:
        if "de-dap-an" not in available:
            raise ValueError("Combined publication requires a de-dap-an build variant")
        return ("de-dap-an",) + (("de-cach",) if manifest["kind"] != "exam" and "de-cach" in available else ())
    expected = profile.variants if manifest["kind"] != "exam" else ("de", "dap-an")
    selected = tuple(v for v in expected if v in available and (has_solutions if v == "dap-an" else has_questions))
    if not selected:
        raise ValueError("No publishable variants for the declared source scope")
    return selected


def load_manifest(path: Path) -> Manifest:
    manifest = json.loads(path.read_text())
    allowed = {
        "schema_version",
        "id",
        "kind",
        "received_date",
        "status",
        "metadata",
        "sources",
        "scope",
        "content_mapping",
        "provenance",
        "variants",
        "publication",
        "figure_renders",
        "drive",
        "outputs",
        "qa",
    }
    if unknown := manifest.keys() - allowed:
        raise ValueError(f"Unknown manifest fields {sorted(unknown)}: {path}")
    if manifest.get("schema_version") != 1 or manifest.get("kind") not in PROFILES:
        raise ValueError(f"Unsupported manifest schema/kind: {path}")
    if manifest.get("id") != path.parent.name:
        raise ValueError(f"Manifest id differs from folder: {path}")
    date.fromisoformat(manifest["received_date"])
    if not isinstance(manifest.get("metadata", {}).get("title"), str) or not manifest["metadata"]["title"].strip():
        raise ValueError(f"metadata.title is required: {path}")
    for key in ("has_questions", "has_solutions"):
        if type(manifest.get("scope", {}).get(key)) is not bool:
            raise ValueError(f"scope.{key} must be boolean: {path}")
    for item in manifest.get("content_mapping", []):
        if set(item) != {"id", "role", "source"} or item["role"] not in {"source", "question", "solution", "figure"}:
            raise ValueError(f"Invalid content_mapping entry: {path}")
        if not isinstance(item["source"], dict):
            raise ValueError(f"Mapping source must be an object: {path}")
    ids = [item["id"] for item in manifest.get("content_mapping", [])]
    if len(ids) != len(set(ids)):
        raise ValueError(f"Duplicate content mapping IDs: {path}")
    for name, spec in manifest["variants"].items():
        if name not in ("de", "de-cach", "dap-an", "de-dap-an"):
            raise ValueError(f"Unknown variant: {name}")
        filename = spec["filename"]
        if Path(filename).name != filename or not filename.endswith(".pdf") or "\\" in filename:
            raise ValueError(f"Invalid output filename: {filename}")
        if name not in manifest["drive"]["filenames"]:
            raise ValueError(f"Missing Drive filename for {name}: {path}")
    category = manifest.get("publication", {}).get("category", PROFILES[manifest["kind"]].category)
    if category not in CATEGORIES or manifest["drive"].get("folder") != category:
        raise ValueError(f"drive.folder must match the publication category {category}: {path}")
    publication_variants(manifest)
    return manifest


def documents(document: str | None = None, category: str | None = None) -> list[Path]:
    paths = sorted((ROOT / "documents").glob("*/*/*/manifest.json"))
    if category:
        paths = [p for p in paths if p.parent.parent.name == category]
    if document:
        paths = [p for p in paths if document in str(p.parent.relative_to(ROOT / "documents"))]
        if len(paths) != 1:
            raise ValueError(f"Document must match exactly one entry (matched {len(paths)}).")
    if not paths:
        raise ValueError("No documents found.")
    return paths
