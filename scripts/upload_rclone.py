#!/usr/bin/env python3
import argparse
import json
import subprocess

from build import ROOT
from publishing import DRIVE_ROOT, plan


def folder_id(remote, parent_id, name):
    flags = [
        "--drive-root-folder-id",
        parent_id,
        "--contimeout",
        "10s",
        "--timeout",
        "30s",
        "--retries",
        "3",
        "--tpslimit",
        "3",
        "--tpslimit-burst",
        "1",
        "--low-level-retries",
        "1",
    ]

    def lookup():
        folders = json.loads(
            subprocess.check_output(["rclone", "lsjson", f"{remote}:", "--dirs-only", *flags], text=True)
        )
        matches = [folder for folder in folders if folder["Name"] == name]
        if len(matches) > 1:
            raise ValueError(f"Multiple Drive folders named {name} under {parent_id}")
        return matches[0]["ID"] if matches else None

    found = lookup()
    if not found:
        subprocess.run(["rclone", "mkdir", f"{remote}:{name}", *flags], check=True)
        found = lookup()
    if not found:
        raise ValueError(f"Cannot resolve Drive folder: {name}")
    print(f"Drive {name}: {found}", flush=True)
    return found


def main():
    parser = argparse.ArgumentParser(description="Upload PDFs and original source to their month/category on Drive.")
    parser.add_argument("--document")
    parser.add_argument("--variant", choices=["de", "de-cach", "dap-an", "de-dap-an"])
    parser.add_argument("--remote", default="dxt-gdrive")
    parser.add_argument("--root-id", default=DRIVE_ROOT)
    parser.add_argument("--drive-month", required=True, help="Destination Drive month in YYYY-MM format")
    parser.add_argument("--category", choices=["Đề thi", "Chuyên đề"])
    parser.add_argument("--dry-run", action="store_true", help="Show mapping locally without contacting Drive")
    args = parser.parse_args()
    try:
        jobs = plan(args.document, args.variant, args.drive_month, args.category)
        remote = args.remote.rstrip(":")
        folders = {}
        if not args.dry_run:
            for month in sorted({month for _, month, _ in jobs}):
                categories = {destination.split("/", 1)[0] for _, job_month, destination in jobs if job_month == month}
                month_id = folder_id(remote, args.root_id, month)
                category_folders = {category: folder_id(remote, month_id, category) for category in sorted(categories)}
                folders[month] = {}
                documents = {destination.rsplit("/", 1)[0] for _, job_month, destination in jobs if job_month == month}
                for document in sorted(documents):
                    category, name = document.split("/", 1)
                    folders[month][document] = folder_id(remote, category_folders[category], name)
        for pdf, month, destination in jobs:
            print(f"{pdf.relative_to(ROOT)} → {month}/{destination}", flush=True)
            if not args.dry_run:
                document, filename = destination.rsplit("/", 1)
                subprocess.run(
                    [
                        "rclone",
                        "copyto",
                        str(pdf),
                        f"{remote}:{filename}",
                        "--drive-root-folder-id",
                        folders[month][document],
                        "--checksum",
                        "--contimeout",
                        "15s",
                        "--timeout",
                        "60s",
                        "--retries",
                        "3",
                        "--tpslimit",
                        "3",
                        "--tpslimit-burst",
                        "1",
                        "--low-level-retries",
                        "1",
                    ],
                    check=True,
                )
    except (ValueError, KeyError, FileNotFoundError, subprocess.CalledProcessError) as error:
        parser.exit(1, f"Upload failed: {error}\n")


if __name__ == "__main__":
    main()
