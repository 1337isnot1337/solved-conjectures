#!/usr/bin/env python3
"""Negative controls for the accepted-source CI selection boundary."""
from pathlib import Path
import tempfile
import unittest

from plan_accepted_lean import GATE_INPUTS, plan


class AcceptedPlanTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.lean = Path(self.temp.name)
        for name, text in {
            "Conjectures.lean": "import Conjectures.Middle\n",
            "Solitaire.lean": "import Solitaire.Checked\n",
            "ProofAudit.lean": "import Conjectures\nimport Solitaire\n",
            "Conjectures/Middle.lean": "module\npublic meta import all Conjectures.Leaf\n",
            "Conjectures/Leaf.lean": "theorem leaf : True := True.intro\n",
            "Solitaire/Checked.lean": "theorem checked : True := True.intro\n",
            "Conjectures/Candidate.lean": "import Conjectures.Leaf\n",
        }.items():
            path = self.lean / name
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(text)

    def tearDown(self):
        self.temp.cleanup()

    def test_transitive_and_root_changes_cannot_skip(self):
        for path in ["Conjectures.lean", "Solitaire.lean", "ProofAudit.lean",
                     "Conjectures/Middle.lean", "Conjectures/Leaf.lean", "Solitaire/Checked.lean"]:
            with self.subTest(path=path):
                self.assertTrue(plan(self.lean, {"lean/" + path})["run"])

    def test_only_unregistered_or_documentation_changes_skip(self):
        self.assertFalse(plan(self.lean, {"lean/Conjectures/Candidate.lean", "README.md"})["run"])
        self.assertTrue(plan(self.lean, {"lean/generated-data.json"})["run"])
        for path in GATE_INPUTS:
            with self.subTest(path=path):
                self.assertTrue(plan(self.lean, {path})["run"])

    def test_missing_information_and_missing_sources_cannot_skip(self):
        self.assertTrue(plan(self.lean, None)["run"])
        (self.lean / "Conjectures/Leaf.lean").unlink()
        self.assertTrue(plan(self.lean, {"README.md"})["run"])
        (self.lean / "ProofAudit.lean").unlink()
        self.assertTrue(plan(self.lean, set())["run"])

    def test_registering_a_candidate_changes_the_boundary(self):
        path = "lean/Conjectures/Candidate.lean"
        self.assertFalse(plan(self.lean, {path})["run"])
        with (self.lean / "Conjectures.lean").open("a") as handle:
            handle.write("import Conjectures.Candidate\n")
        self.assertTrue(plan(self.lean, {path})["run"])


if __name__ == "__main__":
    unittest.main()
