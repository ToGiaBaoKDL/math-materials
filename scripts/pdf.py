"""Read PDF metadata without depending on the build runner."""

import re
import subprocess
from pathlib import Path


def page_count(pdf: Path) -> int:
    info = subprocess.check_output(["pdfinfo", str(pdf)], text=True)
    match = re.search(r"^Pages:\s+(\d+)", info, re.MULTILINE)
    if match is None:
        raise ValueError(f"Cannot read PDF page count: {pdf}")
    return int(match[1])
