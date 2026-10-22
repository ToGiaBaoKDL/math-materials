"""Month-block recovery must preserve data and reuse the existing template."""

import sys
import unittest
from copy import deepcopy
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "scripts"))
from sheets import cell, updates_for_sheet


class MonthRecoveryTests(unittest.TestCase):
    def setUp(self):
        headers = [
            "Tháng",
            "Ngày/Tháng/Năm",
            "File gốc thầy gửi",
            "Tiêu đề bài giảng",
            "Link code tài liệu gốc",
            "File pdf (ko cách)",
            "File pdf (cách)",
            "Số trang/File ko cách",
            "Thù lao",
        ]
        self.sheet = {
            "properties": {"sheetId": 1, "title": "Livestream", "gridProperties": {"rowCount": 62}},
            "merges": [{"startRowIndex": 2, "endRowIndex": 32, "startColumnIndex": 0, "endColumnIndex": 1}],
            "data": [
                {
                    "rowData": [{}, {"values": [{"formattedValue": h} for h in headers]}]
                    + [{"values": []} for _ in range(60)]
                }
            ],
        }
        self.records = [("LIVE - ĐỀ", [cell(), cell(), cell("LIVE - ĐỀ"), cell(), cell(), None, cell(5)])]

    def put(self, row, column, value):
        cells = self.sheet["data"][0]["rowData"][row]["values"]
        cells.extend({} for _ in range(column + 1 - len(cells)))
        cells[column] = {**cell(value), "formattedValue": value}

    def test_blank_merged_month_reuses_first_row(self):
        original = deepcopy(self.sheet)
        requests, summary = updates_for_sheet(self.sheet, "2026-10", self.records)
        self.assertIn("!B3:H3", summary[0])
        self.assertFalse(any("appendDimension" in r or "insertDimension" in r for r in requests))
        self.assertEqual(self.sheet, original)
        self.assertEqual(requests[0]["updateCells"]["start"]["rowIndex"], 2)

    def test_deleted_label_recovers_existing_document(self):
        self.put(5, 1, "18/10/2026")
        self.put(5, 3, "LIVE - ĐỀ")
        self.put(5, 8, "Paid")
        requests, summary = updates_for_sheet(self.sheet, "2026-10", self.records)
        self.assertIn("!B6:H6", summary[0])
        self.assertTrue(all(r["updateCells"]["start"]["columnIndex"] < 8 for r in requests if "updateCells" in r))

    def test_other_month_is_not_relabelled(self):
        self.put(3, 1, "18/09/2026")
        self.put(3, 3, "OLDER - ĐỀ")
        _, summary = updates_for_sheet(self.sheet, "2026-10", self.records)
        self.assertIn("!B33:H33", summary[0])

    def test_named_month_remains_authoritative(self):
        self.put(32, 0, "Tháng 10-2026")
        self.sheet["merges"].append(
            {"startRowIndex": 32, "endRowIndex": 62, "startColumnIndex": 0, "endColumnIndex": 1}
        )
        _, summary = updates_for_sheet(self.sheet, "2026-10", self.records)
        self.assertIn("!B33:H33", summary[0])

    def test_unmerged_empty_template_starts_at_row_three(self):
        self.sheet["merges"] = []
        requests, summary = updates_for_sheet(self.sheet, "2026-10", self.records)
        self.assertIn("!B3:H3", summary[0])
        self.assertTrue(any("mergeCells" in r for r in requests))


if __name__ == "__main__":
    unittest.main()
