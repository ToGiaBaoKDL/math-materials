#!/usr/bin/env python3
# /// script
# dependencies = ["google-api-python-client>=2,<3", "google-auth-oauthlib>=1,<2"]
# ///
import argparse
import hashlib
import json
import re
import unicodedata
from datetime import date
from pathlib import Path
from urllib.parse import quote

from build import ROOT, page_count
from upload import DRIVE_ROOT, check_month, document_files, documents

GITHUB = 'https://github.com/ToGiaBaoKDL/math-materials/tree/main'
SPREADSHEET = '1q7giSA18z4UkTomn9xQBqrDgdjssXeUSDj4fTtVYOVs'
SCOPES = ['https://www.googleapis.com/auth/spreadsheets', 'https://www.googleapis.com/auth/drive.readonly']


def credentials(path, client=None):
    from google.auth.transport.requests import Request
    from google.oauth2.credentials import Credentials
    from google.oauth2.service_account import Credentials as ServiceCredentials

    if client:
        from google_auth_oauthlib.flow import InstalledAppFlow
        flow = InstalledAppFlow.from_client_secrets_file(str(client), SCOPES)
        creds = flow.run_local_server(port=0)
        if path is None:
            from googleapiclient.discovery import build
            user = build('drive', 'v3', credentials=creds, cache_discovery=False).about().get(
                fields='user(emailAddress)').execute(num_retries=0)['user']
            email = user['emailAddress'].lower()
            name = email.removesuffix('@gmail.com')
            name = re.sub(r'[^a-z0-9@._-]', '_', name)
            path = ROOT / '.secret' / f'{name}-token.json'
    else:
        if not path.is_file():
            raise ValueError(f'Authorize first: make sheets-auth CLIENT=path/to/oauth-client.json CREDENTIALS={path}')
        info = json.loads(path.read_text())
        if info.get('type') == 'service_account':
            return ServiceCredentials.from_service_account_info(info, scopes=SCOPES)
        creds = Credentials.from_authorized_user_info(info, SCOPES)
        if not creds.valid:
            if not creds.refresh_token:
                raise ValueError('Sheets credentials have no refresh token; run sheets-auth.')
            creds.refresh(Request())
    path.parent.mkdir(parents=True, exist_ok=True)
    path.touch(mode=0o600, exist_ok=True)
    path.chmod(0o600)
    path.write_text(creds.to_json() + '\n')
    if client:
        print(f'Sheets authorization saved to {path}')
    return creds


class Drive:
    def __init__(self, service):
        self.service = service
        self.cache = {}

    def children(self, parent):
        if parent not in self.cache:
            items, token = [], None
            while True:
                result = self.service.files().list(
                    q=f"'{parent}' in parents and trashed = false", pageSize=1000,
                    pageToken=token, supportsAllDrives=True, includeItemsFromAllDrives=True,
                    fields='nextPageToken,files(id,name,mimeType,md5Checksum,webViewLink)',
                ).execute(num_retries=0)
                items.extend(result.get('files', []))
                token = result.get('nextPageToken')
                if not token:
                    break
            self.cache[parent] = items
        return self.cache[parent]

    def find(self, parent, name, folder=False):
        matches = [item for item in self.children(parent) if item['name'] == name
                   and (item['mimeType'] == 'application/vnd.google-apps.folder') == folder]
        if len(matches) != 1:
            raise ValueError(f'Drive: expected one {name!r}, found {len(matches)}. Upload the complete set first.')
        return matches[0]


def cell(value='', link=None):
    if value == '':
        return {}
    result = {'userEnteredValue': {'numberValue' if isinstance(value, int) else 'stringValue': value}}
    if link:
        result['textFormatRuns'] = [{'startIndex': 0, 'format': {'link': {'uri': link}}}]
    return result


def document_rows(path, files, drive, month_id, uploaded_on):
    category = path.parent.parent.name
    category_id = drive.find(month_id, category, folder=True)['id']
    folder = drive.find(category_id, path.parent.name, folder=True)['id']
    links = {}
    for key, (local, filename) in files.items():
        remote = drive.find(folder, filename)
        if remote.get('md5Checksum') != hashlib.md5(local.read_bytes()).hexdigest():
            raise ValueError(f'Drive differs from local: {filename}. Upload the approved files first.')
        links[key] = remote.get('webViewLink') or f"https://drive.google.com/file/d/{remote['id']}/view"
    code = GITHUB + '/' + quote(str(path.parent.relative_to(ROOT)), safe='/')
    serial = (uploaded_on - date(1899, 12, 30)).days
    title = files['de'][1].removesuffix('.pdf')
    rows = [(title, [cell(serial), cell('ĐỀ - GỐC', links['goc']), cell(title),
                     cell('Github', code), cell('ĐỀ - KHÔNG CÁCH', links['de']),
                     cell('ĐỀ - CÁCH', links['de-cach']), cell(page_count(files['de'][0]))])]
    if 'dap-an' in files:
        title = files['dap-an'][1].removesuffix('.pdf')
        rows.append((title, [cell(), cell(), cell(title), cell(),
                            cell('ĐÁP ÁN', links['dap-an']), cell(), cell(page_count(files['dap-an'][0]))]))
    return rows


def normalized(text):
    return ' '.join(unicodedata.normalize('NFKC', text).replace('–', '-').replace('—', '-').split()).casefold()


def month_value(text):
    match = re.fullmatch(r'tháng\s*(\d{1,2})\s*[-/]\s*(\d{4})', normalized(text))
    return f'{match[2]}-{int(match[1]):02}' if match else text.strip()


def sheet_rows(sheet):
    result = {}
    for data in sheet.get('data', []):
        for offset, row in enumerate(data.get('rowData', [])):
            result[data.get('startRow', 0) + offset] = row.get('values', [])
    return result


def displayed(rows, row, column):
    cells = rows.get(row, [])
    return cells[column].get('formattedValue', '') if column < len(cells) else ''


def updates_for_sheet(sheet, month, records):
    props = sheet['properties']
    sheet_id = props['sheetId']
    rows = sheet_rows(sheet)
    # The supplied template has a title row, then A:I column headers.
    headers = [
        ('Tháng',), ('Ngày/Tháng/Năm',), ('File gốc thầy gửi',), ('Tiêu đề bài giảng', 'Đề thi'),
        ('Link code tài liệu gốc',), ('File pdf (ko cách)',), ('File pdf (cách)',),
        ('Số trang/File ko cách', 'Số trang/File không cách'), ('Thù lao',),
    ]
    if any(normalized(displayed(rows, 1, c)) not in {normalized(v) for v in names}
           for c, names in enumerate(headers)):
        raise ValueError(f"{props['title']}: expected the supplied A:I table header on row 2.")
    merges = sheet.get('merges', [])
    month_rows = [r for r in rows if r >= 2 and month_value(displayed(rows, r, 0)) == month]
    if len(month_rows) > 1:
        raise ValueError(f"{props['title']}: duplicate month blocks for {month}")
    requests = []
    grid_rows = props['gridProperties']['rowCount']
    if month_rows:
        start = month_rows[0]
        merge = next((m for m in merges if m.get('startColumnIndex', 0) == 0
                      and m['endColumnIndex'] == 1 and m.get('startRowIndex', 0) == start), None)
        end = merge['endRowIndex'] if merge else next(
            (r for r in sorted(rows) if r > start and displayed(rows, r, 0)), grid_rows)
    else:
        occupied = [r + 1 for r, cells in rows.items() if any(c.get('userEnteredValue') for c in cells)]
        start = max([2, *occupied, *(m['endRowIndex'] for m in merges)])
        end = start + max(30, len(records))
        if end > grid_rows:
            requests.append({'appendDimension': {'sheetId': sheet_id, 'dimension': 'ROWS', 'length': end - grid_rows}})
        requests.extend([
            {'copyPaste': {'source': {'sheetId': sheet_id, 'startRowIndex': 2, 'endRowIndex': 3,
                                     'startColumnIndex': 0, 'endColumnIndex': 9},
                           'destination': {'sheetId': sheet_id, 'startRowIndex': start, 'endRowIndex': end,
                                           'startColumnIndex': 0, 'endColumnIndex': 9}, 'pasteType': 'PASTE_FORMAT'}},
            {'mergeCells': {'range': {'sheetId': sheet_id, 'startRowIndex': start, 'endRowIndex': end,
                                      'startColumnIndex': 0, 'endColumnIndex': 1}, 'mergeType': 'MERGE_ALL'}},
            {'updateCells': {'start': {'sheetId': sheet_id, 'rowIndex': start, 'columnIndex': 0},
                             'rows': [{'values': [cell(f'Tháng {month[5:]}-{month[:4]}')]}],
                             'fields': 'userEnteredValue'}},
        ])
    arranged = {r: displayed(rows, r, 3) for r in range(start, end)}
    reserved = set()
    added = 0
    summary = []
    for title, values in records:
        pdf_url = values[4]['textFormatRuns'][0]['format']['link']['uri']
        matches = [r for r in range(start, end) if normalized(displayed(rows, r, 3)) == normalized(title)
                   or (len(rows.get(r, [])) > 5 and rows[r][5].get('hyperlink') == pdf_url)]
        if len(matches) > 1:
            raise ValueError(f"{props['title']}: duplicate rows for {title}")
        target = matches[0] if matches else next((r for r in range(start, end) if r not in reserved
                 and not any(c.get('userEnteredValue') for c in rows.get(r, [])[1:9])), None)
        if target is None:
            target = end + added
            added += 1
        if target in reserved:
            raise ValueError(f'Duplicate destination row for {title}')
        reserved.add(target)
        arranged[target] = title
        requests.append({'updateCells': {
            'start': {'sheetId': sheet_id, 'rowIndex': target, 'columnIndex': 1},
            'rows': [{'values': values}], 'fields': 'userEnteredValue,textFormatRuns',
        }})
        requests.append({'repeatCell': {
            'range': {'sheetId': sheet_id, 'startRowIndex': target, 'endRowIndex': target + 1,
                      'startColumnIndex': 3, 'endColumnIndex': 4},
            'cell': {'userEnteredFormat': {'horizontalAlignment': 'LEFT'}},
            'fields': 'userEnteredFormat.horizontalAlignment',
        }})
        if values[0]:
            requests.append({'repeatCell': {
                'range': {'sheetId': sheet_id, 'startRowIndex': target, 'endRowIndex': target + 1,
                          'startColumnIndex': 1, 'endColumnIndex': 2},
                'cell': {'userEnteredFormat': {'numberFormat': {'type': 'DATE', 'pattern': 'dd/mm/yyyy'}}},
                'fields': 'userEnteredFormat.numberFormat',
            }})
        summary.append(f"{props['title']}!B{target + 1}:H{target + 1} → {title}")
    if added:
        month_range = {'sheetId': sheet_id, 'startRowIndex': start, 'endRowIndex': end,
                       'startColumnIndex': 0, 'endColumnIndex': 1}
        extension = [{'unmergeCells': {'range': month_range}}]
        if end == grid_rows:
            extension.append({'appendDimension': {'sheetId': sheet_id, 'dimension': 'ROWS', 'length': added}})
        else:
            extension.append({'insertDimension': {
                'range': {'sheetId': sheet_id, 'dimension': 'ROWS', 'startIndex': end, 'endIndex': end + added},
                'inheritFromBefore': True,
            }})
        extension.append({'copyPaste': {
            'source': {'sheetId': sheet_id, 'startRowIndex': end - 1, 'endRowIndex': end,
                       'startColumnIndex': 0, 'endColumnIndex': 9},
            'destination': {'sheetId': sheet_id, 'startRowIndex': end, 'endRowIndex': end + added,
                            'startColumnIndex': 0, 'endColumnIndex': 9},
            'pasteType': 'PASTE_FORMAT',
        }})
        for data in sheet.get('data', []):
            index = end - 1 - data.get('startRow', 0)
            metadata = data.get('rowMetadata', [])
            if 0 <= index < len(metadata) and 'pixelSize' in metadata[index]:
                extension.append({'updateDimensionProperties': {
                    'range': {'sheetId': sheet_id, 'dimension': 'ROWS', 'startIndex': end, 'endIndex': end + added},
                    'properties': {'pixelSize': metadata[index]['pixelSize']}, 'fields': 'pixelSize',
                }})
                break
        extension.append({'mergeCells': {'range': dict(month_range, endRowIndex=end + added), 'mergeType': 'MERGE_ALL'}})
        requests = extension + requests
        summary.insert(0, f"{props['title']}: extend {month} by {added} rows, keeping existing formatting.")
    # Move complete rows so links, fees, formatting and row heights stay together.
    moves = []
    for title, _ in records:
        base, separator, variant = normalized(title).rpartition(' - ')
        if not separator or variant not in ('đề', 'đáp án'):
            continue
        pair = []
        for suffix in ('đề', 'đáp án'):
            matches = [r for r, name in arranged.items() if normalized(name) == base + ' - ' + suffix]
            if len(matches) > 1:
                raise ValueError(f"{props['title']}: duplicate rows for {base} - {suffix}")
            pair.append(matches[0] if matches else None)
        question, answer = pair
        if question is None or answer is None or answer == question + 1:
            continue
        # If the answer precedes its question, bring the question directly above it.
        source, target = (question, answer) if answer < question else (answer, question + 1)
        moves.append({'moveDimension': {
            'source': {'sheetId': sheet_id, 'dimension': 'ROWS',
                       'startIndex': source, 'endIndex': source + 1},
            'destinationIndex': target if target < source else target + 1,
        }})
        names = [arranged.get(r, '') for r in range(start, end + added)]
        name = names.pop(source - start)
        names.insert(target - start, name)
        arranged = dict(enumerate(names, start))
    if moves:
        month_range = {'sheetId': sheet_id, 'startRowIndex': start, 'endRowIndex': end + added,
                       'startColumnIndex': 0, 'endColumnIndex': 1}
        requests.extend([
            {'unmergeCells': {'range': month_range}},
            *moves,
            {'repeatCell': {'range': month_range, 'cell': {}, 'fields': 'userEnteredValue'}},
            {'updateCells': {'start': {'sheetId': sheet_id, 'rowIndex': start, 'columnIndex': 0},
                             'rows': [{'values': [cell(f'Tháng {month[5:]}-{month[:4]}')]}],
                             'fields': 'userEnteredValue'}},
            {'mergeCells': {'range': month_range, 'mergeType': 'MERGE_ALL'}},
        ])
        summary.append(f"{props['title']}: reordered {len(moves)} rows to keep each answer below its question.")
    return requests, summary


def main():
    parser = argparse.ArgumentParser(description='Update the approved-document register, separately from upload.')
    parser.add_argument('--drive-month', help='Drive folder and Sheet month block, YYYY-MM')
    parser.add_argument('--date', help='Upload date to record, YYYY-MM-DD')
    parser.add_argument('--document')
    parser.add_argument('--category', choices=['Đề thi', 'Chuyên đề'])
    parser.add_argument('--sheet-id', default=SPREADSHEET)
    parser.add_argument('--root-id', default=DRIVE_ROOT)
    parser.add_argument('--credentials', type=Path)
    parser.add_argument('--authorize', action='store_true')
    parser.add_argument('--client', type=Path, default=ROOT / '.secret/dxt-toan-2027-client.json')
    parser.add_argument('--dry-run', action='store_true', help='Read Drive and Sheet and print planned rows; do not write')
    args = parser.parse_args()
    try:
        if args.authorize:
            credentials(args.credentials, args.client)
            return
        if not args.date or not re.fullmatch(r'[0-9]{4}-[0-9]{2}-[0-9]{2}', args.date):
            parser.error('DATE is required in YYYY-MM-DD format')
        uploaded_on = date.fromisoformat(args.date)
        month = check_month(args.drive_month)
        paths = documents(args.document, args.category)
        files = {p: document_files(p) for p in paths}
        from googleapiclient.discovery import build
        creds = credentials(args.credentials or ROOT / '.secret/togiabaode-token.json')
        drive = Drive(build('drive', 'v3', credentials=creds, cache_discovery=False))
        sheets = build('sheets', 'v4', credentials=creds, cache_discovery=False).spreadsheets()
        month_id = drive.find(args.root_id, month, folder=True)['id']
        groups = {}
        for path in paths:
            groups.setdefault(path.parent.parent.name, []).extend(
                document_rows(path, files[path], drive, month_id, uploaded_on))
        spreadsheet = sheets.get(
            spreadsheetId=args.sheet_id, ranges=[f"'{name}'!A:I" for name in groups],
            fields='sheets(properties,merges,data(startRow,rowMetadata(pixelSize),rowData(values(formattedValue,userEnteredValue,hyperlink))))',
        ).execute(num_retries=0)
        tabs = {s['properties']['title']: s for s in spreadsheet['sheets']}
        requests = []
        for name, records in groups.items():
            batch, summary = updates_for_sheet(tabs[name], month, records)
            requests.extend(batch)
            print('\n'.join(summary))
        if args.dry_run:
            print(f'Dry run: {sum(len(r) for r in groups.values())} rows; no Sheet writes.')
        else:
            sheets.batchUpdate(spreadsheetId=args.sheet_id, body={'requests': requests}).execute(num_retries=0)
            print('Sheet updated; upload and file permissions were not changed.')
    except Exception as error:
        parser.exit(1, f'Sheet update failed: {error}\n')


if __name__ == '__main__':
    main()
