import hashlib
import re
from pathlib import Path

from config import ROOT
from document_model import PROFILES, DocumentFiles, Manifest, load_manifest, publication_variants
from document_model import documents as documents


def check_month(month: str | None) -> str:
    if not month or not re.fullmatch(r"[0-9]{4}-(0[1-9]|1[0-2])", month) or month.startswith("0000"):
        raise ValueError("DRIVE_MONTH is required in YYYY-MM format, e.g. DRIVE_MONTH=2026-10")
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


def document_files(path: Path, variant: str | None = None) -> DocumentFiles:
    manifest = load_manifest(path)
    mapping = manifest["drive"]
    variants = {key: manifest["variants"][key] for key in publication_variants(manifest)}
    if variant:
        if variant not in variants:
            raise ValueError(f"{path.parent.name}: variant {variant} unavailable")
        variants = {variant: variants[variant]}
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


def plan(
    document: str | None = None, variant: str | None = None, month: str | None = None, category: str | None = None
) -> list[tuple[Path, str, str]]:
    month = check_month(month)
    result = []
    destinations = set()
    for path in documents(document, category):
        for local, filename in document_files(path, variant).values():
            destination = f"{publication_category(path)}/{path.parent.name}/{filename}"
            if destination in destinations:
                raise ValueError(f"Duplicate Drive destination: {destination}")
            destinations.add(destination)
            result.append((local, month, destination))
    return result
