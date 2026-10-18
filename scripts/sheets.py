#!/usr/bin/env python3
import argparse
import re
import unicodedata
from datetime import date, datetime
from pathlib import Path
from typing import Any
from urllib.parse import quote
from zoneinfo import ZoneInfo

from config import DRIVE_ROOT, ROOT, SPREADSHEET
from document_model import DocumentFiles, load_manifest
from drive import Drive
from google_auth import credentials
from pdf import page_count
from publishing import (
    add_publication_arguments,
    document_files,
    document_title,
    documents,
    publication_category,
    publication_month,
    sheet_variants,
)

GITHUB = "https://github.com/ToGiaBaoKDL/math-materials/tree/main"
SHEETS_DATE_EPOCH = date(1899, 12, 30)


def cell(value: str | int = "", link: str | None = None) -> dict[str, Any]:
    if value == "":
        return {}
    result: dict[str, Any] = {"userEnteredValue": {"numberValue" if isinstance(value, int) else "stringValue": value}}
    if link:
        result["textFormatRuns"] = [{"startIndex": 0, "format": {"link": {"uri": link}}}]
    return result


def document_rows(
    path: Path, files: DocumentFiles, drive: Drive, month_id: str, uploaded_on: date
) -> list[tuple[str, list[dict[str, Any] | None]]]:
    category = publication_category(path)
    category_folder = drive.find(month_id, category, folder=True)
    assert category_folder is not None
    document_folder = drive.find(category_folder["id"], path.parent.name, folder=True)
    assert document_folder is not None
    folder = document_folder["id"]
    links = drive.verified_links(folder, files)
    code = GITHUB + "/" + quote(str(path.parent.relative_to(ROOT)), safe="/")
    serial = (uploaded_on - SHEETS_DATE_EPOCH).days
    rows = []
    for variant in sheet_variants(load_manifest(path), files):
        answer = variant == "dap-an"
        primary = variant if variant in files else "de-cach"
        base = document_title(files[primary][1])
        suffix = {"de": "ĐỀ", "dap-an": "ĐÁP ÁN", "de-dap-an": "ĐỀ + ĐÁP ÁN"}[variant]
        title = base + " - " + suffix
        label = {"de": "ĐỀ - KHÔNG CÁCH", "dap-an": "ĐÁP ÁN", "de-dap-an": "ĐỀ + ĐÁP ÁN"}[variant]
        rows.append(
            (
                title,
                [
                    cell() if answer else cell(serial),
                    cell() if answer else cell("ĐỀ - GỐC", links["goc"]),
                    cell(title),
                    cell() if answer else cell("Github", code),
                    cell(label, links[variant]) if variant in links else None,
                    cell("ĐỀ - CÁCH", links["de-cach"])
                    if not answer and "de-cach" in links
                    else cell()
                    if variant == "de-dap-an"
                    else None,
                    cell(page_count(files[variant][0])) if variant in files else None,
                ],
            )
        )
    return rows


def normalized(text):
    return " ".join(unicodedata.normalize("NFKC", text).replace("–", "-").replace("—", "-").split()).casefold()


def row_identity(title: str) -> tuple[str, str]:
    base, separator, suffix = normalized(title).rpartition(" - ")
    if separator and suffix in ("đề", "đề cách", "đề + đáp án"):
        return base, "question"
    if separator and suffix == "đáp án":
        return base, "answer"
    return normalized(title), "other"


def month_value(text):
    match = re.fullmatch(r"tháng\s*(\d{1,2})\s*[-/]\s*(\d{4})", normalized(text))
    return f"{match[2]}-{int(match[1]):02}" if match else text.strip()


def sheet_rows(sheet):
    result = {}
    for data in sheet.get("data", []):
        for offset, row in enumerate(data.get("rowData", [])):
            result[data.get("startRow", 0) + offset] = row.get("values", [])
    return result


def displayed(rows, row, column):
    cells = rows.get(row, [])
    return cells[column].get("formattedValue", "") if column < len(cells) else ""


def month_range(sheet_id: int, start: int, end: int) -> dict[str, int]:
    return {"sheetId": sheet_id, "startRowIndex": start, "endRowIndex": end, "startColumnIndex": 0, "endColumnIndex": 1}


def month_label_request(sheet_id: int, row: int, month: str) -> dict[str, Any]:
    return {
        "updateCells": {
            "start": {"sheetId": sheet_id, "rowIndex": row, "columnIndex": 0},
            "rows": [{"values": [cell(f"Tháng {month[5:]}-{month[:4]}")]}],
            "fields": "userEnteredValue",
        }
    }


def updates_for_sheet(
    sheet: dict[str, Any], month: str, records: list[tuple[str, list[dict[str, Any] | None]]]
) -> tuple[list[dict[str, Any]], list[str]]:
    props = sheet["properties"]
    sheet_id = props["sheetId"]
    rows = sheet_rows(sheet)
    # The supplied template has a title row, then A:I column headers.
    headers = [
        ("Tháng",),
        ("Ngày/Tháng/Năm",),
        ("File gốc thầy gửi",),
        ("Tiêu đề bài giảng", "Đề thi"),
        ("Link code tài liệu gốc",),
        ("File pdf (ko cách)",),
        ("File pdf (cách)",),
        ("Số trang/File ko cách", "Số trang/File không cách"),
        ("Thù lao",),
    ]
    if any(normalized(displayed(rows, 1, c)) not in {normalized(v) for v in names} for c, names in enumerate(headers)):
        raise ValueError(f"{props['title']}: expected the supplied A:I table header on row 2.")
    merges = sheet.get("merges", [])
    month_rows = [r for r in rows if r >= 2 and month_value(displayed(rows, r, 0)) == month]
    if len(month_rows) > 1:
        raise ValueError(f"{props['title']}: duplicate month blocks for {month}")
    requests: list[dict[str, Any]] = []
    grid_rows = props["gridProperties"]["rowCount"]
    if month_rows:
        start = month_rows[0]
        merge = next(
            (
                m
                for m in merges
                if m.get("startColumnIndex", 0) == 0 and m["endColumnIndex"] == 1 and m.get("startRowIndex", 0) == start
            ),
            None,
        )
        end = (
            merge["endRowIndex"]
            if merge
            else next((r for r in sorted(rows) if r > start and displayed(rows, r, 0)), grid_rows)
        )
    else:
        occupied = [r + 1 for r, cells in rows.items() if any(c.get("userEnteredValue") for c in cells)]
        start = max([2, *occupied, *(m["endRowIndex"] for m in merges)])
        end = start + max(30, len(records))
        if end > grid_rows:
            requests.append({"appendDimension": {"sheetId": sheet_id, "dimension": "ROWS", "length": end - grid_rows}})
        requests.extend(
            [
                {
                    "copyPaste": {
                        "source": {
                            "sheetId": sheet_id,
                            "startRowIndex": 2,
                            "endRowIndex": 3,
                            "startColumnIndex": 0,
                            "endColumnIndex": 9,
                        },
                        "destination": {
                            "sheetId": sheet_id,
                            "startRowIndex": start,
                            "endRowIndex": end,
                            "startColumnIndex": 0,
                            "endColumnIndex": 9,
                        },
                        "pasteType": "PASTE_FORMAT",
                    }
                },
                {
                    "mergeCells": {
                        "range": {
                            "sheetId": sheet_id,
                            "startRowIndex": start,
                            "endRowIndex": end,
                            "startColumnIndex": 0,
                            "endColumnIndex": 1,
                        },
                        "mergeType": "MERGE_ALL",
                    }
                },
                month_label_request(sheet_id, start, month),
            ]
        )
    arranged = {r: displayed(rows, r, 3) for r in range(start, end)}
    reserved = set()
    added = 0
    summary = []
    for title, values in records:
        pdf_urls = {
            value["textFormatRuns"][0]["format"]["link"]["uri"]
            for value in values[4:6]
            if value and "textFormatRuns" in value
        }
        matches = [
            r
            for r in range(start, end)
            if row_identity(displayed(rows, r, 3)) == row_identity(title)
            or any(c.get("hyperlink") in pdf_urls for c in rows.get(r, [])[5:7])
        ]
        if len(matches) > 1:
            raise ValueError(f"{props['title']}: duplicate rows for {title}")
        target = (
            matches[0]
            if matches
            else next(
                (
                    r
                    for r in range(start, end)
                    if r not in reserved and not any(c.get("userEnteredValue") for c in rows.get(r, [])[1:9])
                ),
                None,
            )
        )
        if target is None:
            target = end + added
            added += 1
        if target in reserved:
            raise ValueError(f"Duplicate destination row for {title}")
        reserved.add(target)
        arranged[target] = title
        if normalized(title).endswith(" - đề + đáp án"):
            base = row_identity(title)[0]
            old_answers = [r for r in range(start, end) if row_identity(displayed(rows, r, 3)) == (base, "answer")]
            if len(old_answers) > 1:
                raise ValueError(f"{props['title']}: duplicate answer rows for {title}")
            for row in old_answers:
                requests.append(
                    {
                        "updateCells": {
                            "start": {"sheetId": sheet_id, "rowIndex": row, "columnIndex": 1},
                            "rows": [{"values": [{} for _ in range(7)]}],
                            "fields": "userEnteredValue,textFormatRuns",
                        }
                    }
                )
                arranged[row] = ""
        # None means this variant is absent: preserve any previously published cell.
        for column, value in enumerate(values, 1):
            if value is not None:
                requests.append(
                    {
                        "updateCells": {
                            "start": {"sheetId": sheet_id, "rowIndex": target, "columnIndex": column},
                            "rows": [{"values": [value]}],
                            "fields": "userEnteredValue,textFormatRuns",
                        }
                    }
                )
        requests.append(
            {
                "repeatCell": {
                    "range": {
                        "sheetId": sheet_id,
                        "startRowIndex": target,
                        "endRowIndex": target + 1,
                        "startColumnIndex": 3,
                        "endColumnIndex": 4,
                    },
                    "cell": {"userEnteredFormat": {"horizontalAlignment": "LEFT"}},
                    "fields": "userEnteredFormat.horizontalAlignment",
                }
            }
        )
        if values[0]:
            requests.append(
                {
                    "repeatCell": {
                        "range": {
                            "sheetId": sheet_id,
                            "startRowIndex": target,
                            "endRowIndex": target + 1,
                            "startColumnIndex": 1,
                            "endColumnIndex": 2,
                        },
                        "cell": {"userEnteredFormat": {"numberFormat": {"type": "DATE", "pattern": "dd/mm/yyyy"}}},
                        "fields": "userEnteredFormat.numberFormat",
                    }
                }
            )
        summary.append(f"{props['title']}!B{target + 1}:H{target + 1} → {title}")
    if added:
        month_cells = month_range(sheet_id, start, end)
        extension: list[dict[str, Any]] = [{"unmergeCells": {"range": month_cells}}]
        if end == grid_rows:
            extension.append({"appendDimension": {"sheetId": sheet_id, "dimension": "ROWS", "length": added}})
        else:
            extension.append(
                {
                    "insertDimension": {
                        "range": {"sheetId": sheet_id, "dimension": "ROWS", "startIndex": end, "endIndex": end + added},
                        "inheritFromBefore": True,
                    }
                }
            )
        extension.append(
            {
                "copyPaste": {
                    "source": {
                        "sheetId": sheet_id,
                        "startRowIndex": end - 1,
                        "endRowIndex": end,
                        "startColumnIndex": 0,
                        "endColumnIndex": 9,
                    },
                    "destination": {
                        "sheetId": sheet_id,
                        "startRowIndex": end,
                        "endRowIndex": end + added,
                        "startColumnIndex": 0,
                        "endColumnIndex": 9,
                    },
                    "pasteType": "PASTE_FORMAT",
                }
            }
        )
        for data in sheet.get("data", []):
            index = end - 1 - data.get("startRow", 0)
            metadata = data.get("rowMetadata", [])
            if 0 <= index < len(metadata) and "pixelSize" in metadata[index]:
                extension.append(
                    {
                        "updateDimensionProperties": {
                            "range": {
                                "sheetId": sheet_id,
                                "dimension": "ROWS",
                                "startIndex": end,
                                "endIndex": end + added,
                            },
                            "properties": {"pixelSize": metadata[index]["pixelSize"]},
                            "fields": "pixelSize",
                        }
                    }
                )
                break
        extension.append(
            {"mergeCells": {"range": dict(month_cells, endRowIndex=end + added), "mergeType": "MERGE_ALL"}}
        )
        requests = extension + requests
        summary.insert(0, f"{props['title']}: extend {month} by {added} rows, keeping existing formatting.")
    # Move complete rows so links, fees, formatting and row heights stay together.
    moves: list[dict[str, Any]] = []
    for title, _ in records:
        base, separator, variant = normalized(title).rpartition(" - ")
        if not separator or variant not in ("đề", "đáp án"):
            continue
        pair = []
        for suffix in ("đề", "đáp án"):
            matches = [r for r, name in arranged.items() if normalized(name) == base + " - " + suffix]
            if len(matches) > 1:
                raise ValueError(f"{props['title']}: duplicate rows for {base} - {suffix}")
            pair.append(matches[0] if matches else None)
        question, answer = pair
        if question is None or answer is None or answer == question + 1:
            continue
        # If the answer precedes its question, bring the question directly above it.
        source, target = (question, answer) if answer < question else (answer, question + 1)
        moves.append(
            {
                "moveDimension": {
                    "source": {"sheetId": sheet_id, "dimension": "ROWS", "startIndex": source, "endIndex": source + 1},
                    "destinationIndex": target if target < source else target + 1,
                }
            }
        )
        names = [arranged.get(r, "") for r in range(start, end + added)]
        name = names.pop(source - start)
        names.insert(target - start, name)
        arranged = dict(enumerate(names, start))
    if moves:
        month_cells = month_range(sheet_id, start, end + added)
        requests.extend(
            [
                {"unmergeCells": {"range": month_cells}},
                *moves,
                {"repeatCell": {"range": month_cells, "cell": {}, "fields": "userEnteredValue"}},
                month_label_request(sheet_id, start, month),
                {"mergeCells": {"range": month_cells, "mergeType": "MERGE_ALL"}},
            ]
        )
        summary.append(f"{props['title']}: reordered {len(moves)} rows to keep each answer below its question.")
    return requests, summary


def main():
    parser = argparse.ArgumentParser(description="Update the approved-document register, separately from upload.")
    add_publication_arguments(parser)
    parser.add_argument("--date", help="Upload date to record, YYYY-MM-DD")
    parser.add_argument("--sheet-id", default=SPREADSHEET)
    parser.add_argument("--root-id", default=DRIVE_ROOT)
    parser.add_argument("--credentials", type=Path)
    parser.add_argument(
        "--dry-run", action="store_true", help="Read Drive and Sheet and print planned rows; do not write"
    )
    args = parser.parse_args()
    try:
        uploaded_on = date.fromisoformat(args.date) if args.date else datetime.now(ZoneInfo("Asia/Ho_Chi_Minh")).date()
        path = documents(args.document)[0]
        month = publication_month(path, args.drive_month)
        files = document_files(path)
        from googleapiclient.discovery import build

        creds = credentials(args.credentials)
        drive = Drive(build("drive", "v3", credentials=creds, cache_discovery=False))
        sheets = build("sheets", "v4", credentials=creds, cache_discovery=False).spreadsheets()
        month_folder = drive.find(args.root_id, month, folder=True)
        assert month_folder is not None
        category = publication_category(path)
        records = document_rows(path, files, drive, month_folder["id"], uploaded_on)
        spreadsheet = sheets.get(
            spreadsheetId=args.sheet_id,
            ranges=[f"'{category}'!A:I"],
            fields="sheets(properties,merges,data(startRow,rowMetadata(pixelSize),rowData(values(formattedValue,userEnteredValue,hyperlink))))",
        ).execute(num_retries=0)
        tab = next(tab for tab in spreadsheet["sheets"] if tab["properties"]["title"] == category)
        requests, summary = updates_for_sheet(tab, month, records)
        print("\n".join(summary))
        if args.dry_run:
            print(f"Dry run: {len(records)} rows; no Sheet writes.")
        else:
            sheets.batchUpdate(spreadsheetId=args.sheet_id, body={"requests": requests}).execute(num_retries=0)
            print("Sheet updated; upload and file permissions were not changed.")
    except Exception as error:
        parser.exit(1, f"Sheet update failed: {error}\n")


if __name__ == "__main__":
    main()
