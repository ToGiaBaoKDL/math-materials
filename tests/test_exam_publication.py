"""Exam writing variants are explicitly opted in without changing legacy exports."""

import sys
import unittest
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "scripts"))
from document_model import publication_variants


class ExamPublicationTests(unittest.TestCase):
    def manifest(self, solutions=False, writing=False):
        return {
            "kind": "exam",
            "scope": {"has_questions": True, "has_solutions": solutions},
            "variants": {v: {} for v in ("de", "de-cach", "dap-an", "de-dap-an")},
            "publication": {"include_writing": writing},
        }

    def test_legacy_recipes_not_automatically_published(self):
        self.assertEqual(publication_variants(self.manifest()), ("de",))
        self.assertEqual(publication_variants(self.manifest(solutions=True)), ("de-dap-an",))

    def test_optional_writing_with_questions_or_combined_answers(self):
        self.assertEqual(publication_variants(self.manifest(writing=True)), ("de", "de-cach"))
        self.assertEqual(publication_variants(self.manifest(True, True)), ("de-dap-an", "de-cach"))

    def test_missing_writing_recipe_rejected(self):
        m = self.manifest(writing=True)
        del m["variants"]["de-cach"]
        with self.assertRaises(ValueError):
            publication_variants(m)

    def test_separate_answers_and_writing(self):
        m = self.manifest(True, True)
        m["publication"]["combine_answers"] = False
        self.assertEqual(publication_variants(m), ("de", "de-cach", "dap-an"))
