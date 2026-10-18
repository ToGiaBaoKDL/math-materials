"""Conservative figure cache: all template, document, branding and font inputs."""

import hashlib
import json
import subprocess
from functools import lru_cache
from pathlib import Path
from typing import Any

from config import ROOT


def digest(path: Path) -> str:
    with path.open("rb") as stream:
        return hashlib.file_digest(stream, "sha256").hexdigest()


@lru_cache(maxsize=1)
def shared_inputs() -> str | None:
    try:
        version = subprocess.check_output(["typst", "--version"], text=True)
        system_fonts = subprocess.check_output(["fc-list", "--format=%{file}\n"], text=True).splitlines()
    except (OSError, subprocess.CalledProcessError):
        # Without a complete font inventory, rebuilding is safer than a stale cache.
        return None
    paths = {Path(p) for p in system_fonts}
    for folder in ("templates", "assets/fonts", "assets/branding", "assets/sources"):
        paths.update(p for p in (ROOT / folder).rglob("*") if p.is_file())
    return hashlib.sha256((version + json.dumps([(str(p), digest(p)) for p in sorted(paths)])).encode()).hexdigest()


def input_key(directory: Path, figures: list[dict[str, Any]]) -> str | None:
    shared = shared_inputs()
    if shared is None:
        return None
    generated = {(directory / f["output"]).resolve() for f in figures}
    files = [
        p for p in directory.rglob("*") if p.is_file() and p.name != "manifest.json" and p.resolve() not in generated
    ]
    # Hash sibling document sources too: cross-document imports remain safe.
    files.extend(p for p in (ROOT / "documents").rglob("*.typ") if directory not in p.parents)
    return hashlib.sha256(
        json.dumps([shared, figures, [(str(p), digest(p)) for p in sorted(files)]]).encode()
    ).hexdigest()


def cached(cache: dict[str, Any], output: Path, key: str | None) -> bool:
    previous = cache.get(str(output), {})
    return bool(key and output.is_file() and previous.get("input") == key and previous.get("sha256") == digest(output))
