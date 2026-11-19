#!/usr/bin/env python3
"""Negative control: stale dependent objects cannot bypass a source failure."""
from pathlib import Path
import subprocess
import tempfile
import unittest
from unittest.mock import patch

import verify_line_size_candidate as gate


class CandidateFailureTests(unittest.TestCase):
    def test_failed_dependency_blocks_even_with_a_stale_object(self):
        with tempfile.TemporaryDirectory() as temp:
            lean = Path(temp)
            sources = {}
            for name, body in {
                "Conjectures.Bad": "theorem bad : False := unknown\n",
                "Conjectures.Dependent": "public import Conjectures.Bad\n",
                "Conjectures.Independent": "theorem good : True := True.intro\n",
            }.items():
                path = lean / (name.replace(".", "/") + ".lean")
                path.parent.mkdir(parents=True, exist_ok=True)
                path.write_text(body)
                sources[name] = path
            stale = lean / ".lake/build/lib/lean/Conjectures/Bad.olean"
            stale.parent.mkdir(parents=True)
            stale.write_bytes(b"stale object must not be consumed")
            calls = []

            def compiler(*args):
                calls.append(args)
                if "Conjectures/Bad.lean" in args:
                    raise subprocess.CalledProcessError(1, args)

            receipt = {}
            with patch.object(gate, "LEAN", lean), patch.object(gate, "source", sources.__getitem__), \
                    patch.object(gate, "run", compiler):
                with self.assertRaises(RuntimeError):
                    gate.check_sources(list(sources), receipt)
            self.assertEqual(receipt["checked_sources"], ["Conjectures.Independent"])
            self.assertEqual(set(receipt["source_failures"]),
                             {"Conjectures.Bad", "Conjectures.Dependent"})
            self.assertEqual(len(calls), 2)
            self.assertFalse(any("Conjectures/Dependent.lean" in call for call in calls))
            self.assertTrue(all("-DwarningAsError=true" in call for call in calls))


if __name__ == "__main__":
    unittest.main()
