#!/usr/bin/env python3
import argparse
import hashlib
import json
import re
import subprocess
from pathlib import Path
from datetime import datetime, timezone
from PIL import Image

ROOT = Path(__file__).resolve().parents[1]


def run(*args):
    subprocess.run(args, cwd=ROOT, check=True)


def page_count(pdf):
    info = subprocess.check_output(['pdfinfo', str(pdf)], text=True)
    return int(re.search(r'^Pages:\s+(\d+)', info, re.MULTILINE)[1])


def previews(pdf, folder):
    folder.mkdir(parents=True, exist_ok=True)
    for old in folder.glob('page-*.png'):
        old.unlink()
    # Supersampling avoids unequal pixel-snapping of equal-width vector edges.
    run('pdftoppm', '-r', '432', '-png', str(pdf), str(folder / 'page'))
    for image in sorted(folder.glob('page-*.png')):
        number = int(image.stem.removeprefix('page-'))
        destination = folder / f'page-{number:02}.png'
        with Image.open(image) as rendered:
            size = (round(rendered.width / 3), round(rendered.height / 3))
            rendered.resize(size, Image.Resampling.LANCZOS if hasattr(Image, 'Resampling') else Image.LANCZOS).save(destination)
        if image != destination:
            image.unlink()
    return [str(p.relative_to(ROOT)) for p in sorted(folder.glob('page-*.png'))]


def build(entry, render=False, variant=None):
    manifest_path = entry.with_name('manifest.json')
    manifest = json.loads(manifest_path.read_text())
    variants = manifest.get('variants', {'document': {'filename': 'document.pdf', 'inputs': {}}})
    target = ROOT / 'assets/targets' / entry.parent.relative_to(ROOT / 'documents')
    target.mkdir(parents=True, exist_ok=True)
    if variant and variant not in variants:
        raise ValueError(f'{entry.parent.name}: unknown variant {variant}')
    created = datetime.fromisoformat(manifest['received_date']).replace(tzinfo=timezone.utc)
    timestamp = str(int(created.timestamp()))
    for figure in manifest.get('figure_renders', []):
        destination = entry.parent / figure['output']
        destination.parent.mkdir(parents=True, exist_ok=True)
        command = ['typst', 'compile', '--root', str(ROOT), '--font-path', str(ROOT / 'assets/fonts'),
                   '--ppi', str(figure.get('ppi', 600))]
        for key, value in figure.get('inputs', {}).items():
            command.extend(['--input', f'{key}={value}'])
        run(*command, str(entry.parent / figure['entry']), str(destination))
    outputs = manifest.get('outputs', {}).copy()
    if 'output' in manifest:
        outputs['document'] = manifest['output']
    changed = False
    if variant:
        variants = {variant: variants[variant]}
    for name, spec in variants.items():
        pdf = target / spec['filename']
        command = ['typst', 'compile', '--root', str(ROOT), '--pdf-standard', '1.5', '--creation-timestamp', timestamp, '--font-path', str(ROOT / 'assets/fonts')]
        for key, value in spec.get('inputs', {}).items():
            command.extend(['--input', f'{key}={value}'])
        print(f'Build {entry.parent.relative_to(ROOT)} → {pdf.name}', flush=True)
        run(*command, str(entry), str(pdf))
        data = pdf.read_bytes()
        output = {'pdf': str(pdf.relative_to(ROOT)), 'pages': page_count(pdf),
                  'bytes': len(data), 'sha256': hashlib.sha256(data).hexdigest()}
        previous = outputs.get(name, {})
        changed |= previous.get('sha256') != output['sha256']
        if not render and previous.get('sha256') == output['sha256'] and 'previews' in previous:
            output['previews'] = previous['previews']
        if render:
            folder = target / 'previews'
            if 'variants' in manifest:
                folder /= name
            output['previews'] = previews(pdf, folder)
        outputs[name] = output
    if 'variants' in manifest:
        manifest['outputs'] = outputs
    else:
        manifest['output'] = outputs['document']
    manifest.setdefault('qa', {})['compile'] = 'passed'
    if changed:
        manifest['qa']['review_status'] = 'pending'
    manifest_path.write_text(json.dumps(manifest, ensure_ascii=False, indent=2) + '\n')


def main():
    parser = argparse.ArgumentParser(description='Build Typst documents and variants declared in manifests.')
    parser.add_argument('--document', help='Unique name fragment or YYYY-MM-DD/document-id; omit for all')
    parser.add_argument('--variant', choices=['de', 'de-cach', 'dap-an'], help='Build one variant')
    parser.add_argument('--list', action='store_true', help='List documents and available variants')
    parser.add_argument('--preview', action='store_true', help='Render pages as PNG')
    args = parser.parse_args()
    entries = sorted((ROOT / 'documents').glob('*/*/main.typ'))
    if args.document:
        entries = [e for e in entries if args.document in str(e.parent.relative_to(ROOT / 'documents'))]
        if len(entries) != 1:
            parser.error(f'Document selector must match exactly one document (matched {len(entries)}). Use --list.')
    if args.list:
        for entry in entries:
            manifest = json.loads(entry.with_name('manifest.json').read_text())
            print(f"{entry.parent.relative_to(ROOT / 'documents')}  [{', '.join(manifest.get('variants', {}))}]")
        return
    if args.variant:
        incompatible = [e.parent.name for e in entries if args.variant not in json.loads(e.with_name('manifest.json').read_text()).get('variants', {})]
        if incompatible:
            parser.error(f"Variant {args.variant} unavailable: {', '.join(incompatible)}")
    if not entries:
        parser.error('No documents found.')
    try:
        for entry in entries:
            build(entry, render=args.preview, variant=args.variant)
    except FileNotFoundError as error:
        parser.exit(1, f'Missing build tool: {error.filename}\n')
    except subprocess.CalledProcessError as error:
        parser.exit(1, f'Build failed (exit {error.returncode}). See tool output above.\n')



if __name__ == '__main__':
    main()
