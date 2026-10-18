import argparse
import hashlib
import re
from pathlib import Path

from config import ROOT
from document_model import PROFILES, DocumentFiles, Manifest, load_manifest, publication_variants
from document_model import documents as documents


def check_month(month: str | None) -> str:
    if not month or not re.fullmatch(r"[0-9]{4}-(0[1-9]|1[0-2])", month) or month.startswith("0000"):
        raise ValueError("Invalid publication month; expected YYYY-MM")
    return month


def publication_category(path: Path) -> str:
    manifest = load_manifest(path)
    return manifest.get("publication", {}).get("category", PROFILES[manifest["kind"]].category)


def document_title(filename: str) -> str:
    for suffix in (" - ĐỀ + ĐÁP ÁN.pdf", " - ĐỀ CÁCH.pdf", " - ĐÁP ÁN.pdf", " - ĐỀ.pdf"):
        if filename.endswith(suffix):
            return filename.removesuffix(suffix)
    raise ValueError(f"Invalid publication filename: {filename}")


def sheet_variants(manifest: Manifest, files: DocumentFiles) -> list[str]:
    combined = "de-dap-an" in publication_variants(manifest)
    if combined:
        if "de-dap-an" not in files:
            raise ValueError("combine_answers requires a built and uploaded de-dap-an variant")
        return ["de-dap-an"]
    result = ["de"] if "de" in files or "de-cach" in files else []
    if "dap-an" in files:
        result.append("dap-an")
    if not result:
        raise ValueError("No separate question/answer variants; set publication.combine_answers for a combined file")
    return result


def document_files(path: Path) -> DocumentFiles:
    manifest = load_manifest(path)
    mapping = manifest["drive"]
    variants = {key: manifest["variants"][key] for key in publication_variants(manifest)}
    relative = path.parent.relative_to(ROOT / "documents")
    files = {}
    for name, spec in variants.items():
        pdf = ROOT / "assets/targets" / relative / spec["filename"]
        output = manifest.get("outputs", {}).get(name, {})
        if not pdf.is_file() or hashlib.sha256(pdf.read_bytes()).hexdigest() != output.get("sha256"):
            raise ValueError(f"Build required before upload: {pdf}")
        files[name] = (pdf, mapping["filenames"][name])
    sources = sorted((ROOT / "assets/sources" / relative).glob("source.*"))
    if len(sources) != 1:
        raise ValueError(f"{relative}: expected one source.* file, found {len(sources)}")
    titles = {document_title(filename) for filename in mapping["filenames"].values()}
    if len(titles) != 1:
        raise ValueError(f"Inconsistent document titles in Drive filenames: {path}")
    files["goc"] = (sources[0], titles.pop() + " - GỐC" + sources[0].suffix)
    for _, filename in files.values():
        if "/" in filename or "\\" in filename:
            raise ValueError(f"Invalid Drive filename: {filename}")
    return files


def add_publication_arguments(parser: argparse.ArgumentParser) -> None:
    parser.add_argument("--document", required=True, help="Unique document name fragment or full ID")
    parser.add_argument("--drive-month", help="Override the document month, YYYY-MM")


def publication_month(path: Path, override: str | None = None) -> str:
    return check_month(override if override is not None else path.parent.parent.parent.name)


def plan(document: str, month: str | None = None) -> list[tuple[Path, str, str]]:
    result = []
    destinations = set()
    if not document.strip():
        raise ValueError("Choose one document")
    path = documents(document)[0]
    target_month = publication_month(path, month)
    for local, filename in document_files(path).values():
        destination = f"{publication_category(path)}/{path.parent.name}/{filename}"
        key = (target_month, destination)
        if key in destinations:
            raise ValueError(f"Duplicate Drive destination: {target_month}/{destination}")
        destinations.add(key)
        result.append((local, target_month, destination))
    return result
