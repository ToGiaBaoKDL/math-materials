import hashlib
import json
import re

from build import ROOT

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


def document_files(path, variant=None):
    manifest = json.loads(path.read_text())
    mapping = manifest["drive"]
    if mapping["folder"] != path.parent.parent.name or mapping["folder"] not in ("Đề thi", "Chuyên đề"):
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
    title = mapping["filenames"]["de"]
    if not title.endswith(" - ĐỀ.pdf"):
        raise ValueError(f'Expected convention ending in " - ĐỀ.pdf": {title}')
    files["goc"] = (sources[0], title.removesuffix(" - ĐỀ.pdf") + " - GỐC" + sources[0].suffix)
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
            destination = f"{path.parent.parent.name}/{path.parent.name}/{filename}"
            if destination in destinations:
                raise ValueError(f"Duplicate Drive destination: {destination}")
            destinations.add(destination)
            result.append((local, month, destination))
    return result
