#!/usr/bin/env python3
import argparse
import hashlib
import json
import subprocess
from datetime import UTC, datetime
from pathlib import Path

from config import ROOT
from document_model import Output, Variant, documents, load_manifest, publication_variants
from pdf import page_count


def run(*args: str) -> None:
    subprocess.run(args, cwd=ROOT, check=True)


def build(entry: Path, variant: str | None = None) -> None:
    manifest_path = entry.with_name("manifest.json")
    manifest = load_manifest(manifest_path)
    variants: dict[str, Variant] = {name: manifest["variants"][name] for name in publication_variants(manifest)}
    if variant and variant in manifest["variants"]:
        variants = {variant: manifest["variants"][variant]}
    target = ROOT / "assets/targets" / entry.parent.relative_to(ROOT / "documents")
    target.mkdir(parents=True, exist_ok=True)
    if variant and variant not in variants:
        raise ValueError(f"{entry.parent.name}: unknown variant {variant}")
    created = datetime.fromisoformat(manifest["received_date"]).replace(tzinfo=UTC)
    timestamp = str(int(created.timestamp()))
    figures = manifest.get("figure_renders", [])
    for figure in figures:
        destination = entry.parent / figure["output"]
        destination.parent.mkdir(parents=True, exist_ok=True)
        command = [
            "typst",
            "compile",
            "--root",
            str(ROOT),
            "--font-path",
            str(ROOT / "assets/fonts"),
            "--ppi",
            str(figure.get("ppi", 600)),
        ]
        for key, value in figure.get("inputs", {}).items():
            command.extend(["--input", f"{key}={value}"])
        run(*command, str(entry.parent / figure["entry"]), str(destination))
    outputs = manifest.get("outputs", {}).copy()
    changed = False
    if variant:
        variants = {variant: variants[variant]}
    for name, spec in variants.items():
        pdf = target / spec["filename"]
        command = [
            "typst",
            "compile",
            "--root",
            str(ROOT),
            "--pdf-standard",
            "1.5",
            "--creation-timestamp",
            timestamp,
            "--font-path",
            str(ROOT / "assets/fonts"),
        ]
        for key, value in spec.get("inputs", {}).items():
            command.extend(["--input", f"{key}={value}"])
        print(f"Build {entry.parent.relative_to(ROOT)} → {pdf.name}", flush=True)
        run(*command, str(entry), str(pdf))
        data = pdf.read_bytes()
        output: Output = {
            "pdf": str(pdf.relative_to(ROOT)),
            "pages": page_count(pdf),
            "bytes": len(data),
            "sha256": hashlib.sha256(data).hexdigest(),
        }
        previous = outputs.get(name, {})
        changed |= previous.get("sha256") != output["sha256"]
        outputs[name] = output
    manifest["outputs"] = outputs
    manifest.setdefault("qa", {})["compile"] = "passed"
    if changed:
        manifest["qa"]["review_status"] = "pending"
    manifest_path.write_text(json.dumps(manifest, ensure_ascii=False, indent=2) + "\n")


def main():
    parser = argparse.ArgumentParser(description="Build Typst documents and variants declared in manifests.")
    parser.add_argument("--document", help="Unique name fragment or YYYY-MM/category/document-id")
    parser.add_argument("--variant", choices=["de", "de-cach", "dap-an", "de-dap-an"], help="Build one variant")
    parser.add_argument("--list", action="store_true", help="List documents and available variants")
    args = parser.parse_args()
    if not args.list and not args.document:
        parser.error("--document is required for build")
    try:
        entries = [path.with_name("main.typ") for path in documents(args.document)]
    except ValueError as error:
        parser.error(str(error))
    if args.list:
        for entry in entries:
            manifest = load_manifest(entry.with_name("manifest.json"))
            print(f"{entry.parent.relative_to(ROOT / 'documents')}  [{', '.join(publication_variants(manifest))}]")
        return
    if args.variant:
        incompatible = [
            e.parent.name
            for e in entries
            if args.variant not in load_manifest(e.with_name("manifest.json"))["variants"]
        ]
        if incompatible:
            parser.error(f"Variant {args.variant} unavailable: {', '.join(incompatible)}")
    if not entries:
        parser.error("No documents found.")
    try:
        for entry in entries:
            build(entry, variant=args.variant)
    except FileNotFoundError as error:
        parser.exit(1, f"Missing build tool: {error.filename}\n")
    except ValueError as error:
        parser.exit(1, f"Build failed: {error}\n")
    except subprocess.CalledProcessError as error:
        parser.exit(1, f"Build failed (exit {error.returncode}). See tool output above.\n")


if __name__ == "__main__":
    main()
