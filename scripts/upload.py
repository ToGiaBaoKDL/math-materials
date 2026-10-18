#!/usr/bin/env python3
import argparse
from pathlib import Path

from config import CATEGORIES, DRIVE_ROOT, ROOT
from drive import Drive
from google_auth import credentials
from publishing import plan


def main():
    parser = argparse.ArgumentParser(description="Upload PDFs and original sources using Google Drive OAuth 2.")
    parser.add_argument("--document")
    parser.add_argument("--variant", choices=["de", "de-cach", "dap-an", "de-dap-an"])
    parser.add_argument("--root-id", default=DRIVE_ROOT)
    parser.add_argument("--drive-month")
    parser.add_argument("--category", choices=CATEGORIES)
    parser.add_argument("--credentials", type=Path)
    parser.add_argument("--dry-run", action="store_true", help="Show mapping locally without contacting Drive")
    args = parser.parse_args()
    try:
        jobs = plan(args.document, args.variant, args.drive_month, args.category)
        if args.dry_run:
            for local, month, destination in jobs:
                print(f"{local.relative_to(ROOT)} → {month}/{destination}")
            return
        from googleapiclient.discovery import build

        creds = credentials(args.credentials)
        drive = Drive(build("drive", "v3", credentials=creds, cache_discovery=False))
        folders = {}
        for local, month, destination in jobs:
            parent = args.root_id
            *parts, name = [month, *destination.split("/")]
            for part in parts:
                key = (parent, part)
                if key not in folders:
                    folders[key] = drive.ensure_folder(parent, part)
                parent = folders[key]
            action, remote = drive.upload(parent, name, local)
            print(f"{action}: {month}/{destination} (ID: {remote['id']})", flush=True)
    except Exception as error:
        parser.exit(1, f"Upload failed: {error}\n")


if __name__ == "__main__":
    main()
