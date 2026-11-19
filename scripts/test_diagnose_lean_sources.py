#!/usr/bin/env python3
"""Protocol tests for non-accepting strict source diagnostics."""
from __future__ import annotations

from graphlib import CycleError
import threading
import time
import unittest

from diagnose_lean_sources import schedule


class DiagnosticScheduleTests(unittest.TestCase):
    def test_all_pass_is_exact(self):
        graph = {"A": set(), "B": {"A"}, "C": {"A", "B"}}
        calls = []
        report = schedule(graph, lambda m: calls.append(m) or {"status": "passed"}, jobs=2)
        self.assertEqual(calls, ["A", "B", "C"])
        self.assertEqual(report["passed"], ["A", "B", "C"])
        self.assertEqual(report["failed"], [])
        self.assertEqual(report["blocked"], [])

    def test_independent_branch_continues(self):
        graph = {"A": set(), "B": {"A"}, "C": set(), "D": {"C"}}
        calls = []
        def run(module):
            calls.append(module)
            return {"status": "failed" if module == "A" else "passed"}
        report = schedule(graph, run, jobs=2)
        self.assertEqual(report["failed"], ["A"])
        self.assertEqual(report["blocked"], ["B"])
        self.assertEqual(report["passed"], ["C", "D"])
        self.assertNotIn("B", calls)
        self.assertEqual(report["results"]["B"]["failed_ancestors"], ["A"])

    def test_transitive_blocking(self):
        graph = {"A": set(), "B": {"A"}, "C": {"B"}, "D": {"C"}}
        report = schedule(graph, lambda _: {"status": "failed"}, jobs=2)
        self.assertEqual(report["blocked"], ["B", "C", "D"])
        for module in report["blocked"]:
            self.assertEqual(report["results"][module]["failed_ancestors"], ["A"])

    def test_all_failed_ancestors_recorded(self):
        graph = {"A": set(), "B": set(), "C": {"A", "B"}, "D": {"C"}}
        report = schedule(graph, lambda _: {"status": "failed"}, jobs=2)
        self.assertEqual(report["failed"], ["A", "B"])
        for module in ("C", "D"):
            self.assertEqual(report["results"][module]["failed_ancestors"], ["A", "B"])

    def test_exception_is_failure(self):
        def run(_):
            raise RuntimeError("synthetic source failure")
        report = schedule({"A": set(), "B": {"A"}}, run, jobs=1)
        self.assertEqual(report["failed"], ["A"])
        self.assertEqual(report["blocked"], ["B"])
        self.assertIn("synthetic source failure", report["results"]["A"]["error"])

    def test_dependency_not_started_early(self):
        graph = {"A": set(), "B": set(), "C": {"A", "B"}}
        lock, completed = threading.Lock(), set()
        def run(module):
            if module == "A":
                time.sleep(0.02)
            with lock:
                if module == "C":
                    self.assertEqual(completed, {"A", "B"})
                completed.add(module)
            return {"status": "passed"}
        report = schedule(graph, run, jobs=2)
        self.assertEqual(report["passed"], ["A", "B", "C"])

    def test_worker_bound(self):
        active = peak = 0
        lock = threading.Lock()
        def run(_):
            nonlocal active, peak
            with lock:
                active += 1
                peak = max(peak, active)
            time.sleep(0.01)
            with lock:
                active -= 1
            return {"status": "passed"}
        report = schedule({str(i): set() for i in range(8)}, run, jobs=2)
        self.assertLessEqual(peak, 2)
        self.assertEqual(peak, 2)
        self.assertEqual(report["peak_active"], 2)

    def test_missing_dependency_rejected(self):
        with self.assertRaises(ValueError):
            schedule({"A": {"missing"}}, lambda _: {"status": "passed"}, jobs=1)

    def test_cycle_rejected(self):
        with self.assertRaises(CycleError):
            schedule({"A": {"B"}, "B": {"A"}}, lambda _: {"status": "passed"}, jobs=1)

    def test_invalid_status_rejected(self):
        with self.assertRaises(RuntimeError):
            schedule({"A": set()}, lambda _: {"status": "skipped"}, jobs=1)

    def test_invalid_resources_rejected(self):
        for jobs in (0, 5):
            with self.assertRaises(ValueError):
                schedule({}, lambda _: {"status": "passed"}, jobs=jobs)
        with self.assertRaises(ValueError):
            schedule({}, lambda _: {"status": "passed"}, jobs=1, timeout_seconds=0)

    def test_empty_diagnostic_has_no_proof_status(self):
        report = schedule({}, lambda _: {"status": "passed"}, jobs=1)
        self.assertEqual(report["results"], {})
        self.assertNotIn("status", report)
        self.assertNotIn("proof_verification_passed", report)


if __name__ == "__main__":
    unittest.main()
