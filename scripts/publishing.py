import hashlib
import json
import re

from build import ROOT

CATEGORIES = ("Đề thi", "Chuyên đề", "Livestream")

DRIVE_ROOT = "11EmKdVdsShhjyQpzlozlr8bEVDiThA8R"


def documents(document=None, category=None):
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


def check_month(month):
    if not month or not re.fullmatch(r"[0-9]{4}-(0[1-9]|1[0-2])", month) or month.startswith("0000"):
        raise ValueError("DRIVE_MONTH is required in YYYY-MM format, e.g. DRIVE_MONTH=2026-10")
    return month


def publication_category(path):
    category = path.parent.parent.name
    return "Chuyên đề" if category == "Livestream" else category


def document_title(filename):
    for suffix in (" - ĐỀ + ĐÁP ÁN.pdf", " - ĐỀ CÁCH.pdf", " - ĐÁP ÁN.pdf", " - ĐỀ.pdf"):
        if filename.endswith(suffix):
            return filename.removesuffix(suffix)
    raise ValueError(f"Invalid publication filename: {filename}")


def sheet_variants(manifest, files):
    combined = manifest.get("publication", {}).get("combine_answers", False)
    if not isinstance(combined, bool):
        raise ValueError("publication.combine_answers must be a boolean")
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


def document_files(path, variant=None):
    manifest = json.loads(path.read_text())
    mapping = manifest["drive"]
    if mapping["folder"] != publication_category(path) or mapping["folder"] not in CATEGORIES:
        raise ValueError(f"Drive category differs from local category: {path}")
    variants = manifest["variants"]
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


def plan(document=None, variant=None, month=None, category=None):
    check_month(month)
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
