"""Offline safety guards for the single immutable CI retirement allowlist."""
from copy import deepcopy
from contextlib import redirect_stdout
from io import StringIO
import unittest

import prune_legacy_accepted_runs as prune


def run(spec=prune.RunSpec(44508611279, prune.TARGETS["44508611279"])):
    return {"id": spec.run_id, "head_sha": spec.head_sha, "path": spec.path,
            "name": spec.name, "event": spec.event, "head_branch": "main",
            "status": "in_progress", "conclusion": None,
            "repository": {"full_name": prune.REPOSITORY},
            "head_repository": {"full_name": prune.REPOSITORY}}


def failed_rows():
    return {"jobs": [{"id": prune.FAILED_ROWS_JOB, "run_id": prune.QUOTIENT_ID,
                     "name": prune.ROWS_JOB_NAME, "status": "completed",
                     "conclusion": "failure"}]}


class RetirementGuards(unittest.TestCase):
    def test_exact_legacy_metadata(self):
        spec = prune.RunSpec(44508611279, prune.TARGETS["44508611279"])
        self.assertTrue(prune.target_active(run(spec), spec))
        for key, value in (
            ("id", 1), ("path", prune.QUOTIENT_WORKFLOW), ("name", "another workflow"),
            ("head_sha", "a" * 40), ("event", "pull_request"), ("head_branch", "other"),
            ("repository", {"full_name": "other/repository"}),
            ("head_repository", {"full_name": "other/repository"}),
            ("status", "unknown"),
        ):
            with self.subTest(key=key):
                changed = run(spec)
                changed[key] = value
                with self.assertRaises(RuntimeError):
                    prune.target_active(changed, spec)

    def test_completed_runs_are_preserved(self):
        spec = prune.RunSpec(44508611279, prune.TARGETS["44508611279"])
        for conclusion in ("success", "failure", "cancelled", "skipped"):
            with self.subTest(conclusion=conclusion):
                changed = run(spec)
                changed.update(status="completed", conclusion=conclusion)
                self.assertFalse(prune.target_active(changed, spec))

    def test_exact_scope_excludes_other_candidates(self):
        self.assertEqual(len(prune.TARGETS), 23)
        self.assertNotIn(str(prune.QUOTIENT_ID), prune.TARGETS)
        self.assertNotIn(str(prune.REPLACEMENT_ID), prune.TARGETS)
        spec = prune.RunSpec(44508611279, prune.TARGETS["44508611279"])
        with self.assertRaises(RuntimeError):
            prune.validate_run(run(prune.QUOTIENT), spec)

    def test_current_main_must_remain_the_selected_snapshot(self):
        head = "c" * 40
        good = {"ref": "refs/heads/main", "object": {"type": "commit", "sha": head}}
        prune.current_main(lambda _: good, head)
        for changed in (
            {"ref": "refs/heads/other", "object": good["object"]},
            {"ref": good["ref"], "object": {"type": "tag", "sha": head}},
            {"ref": good["ref"], "object": {"type": "commit", "sha": "d" * 40}},
        ):
            with self.assertRaises(RuntimeError):
                prune.current_main(lambda _: changed, head)

    def test_ancestry_must_use_exact_base(self):
        base = prune.QUOTIENT_SHA
        good = {"status": "ahead", "behind_by": 0,
                "base_commit": {"sha": base}, "merge_base_commit": {"sha": base}}
        prune.validate_ancestry(good, base)
        for key, value in (
            ("status", "behind"), ("status", "diverged"), ("behind_by", 1),
            ("base_commit", {"sha": "a" * 40}),
            ("merge_base_commit", {"sha": "b" * 40}),
        ):
            changed = deepcopy(good)
            changed[key] = value
            with self.subTest(key=key, value=value), self.assertRaises(RuntimeError):
                prune.validate_ancestry(changed, base)

    def test_quotient_requires_exact_replacement(self):
        old, replacement, jobs = run(prune.QUOTIENT), run(prune.REPLACEMENT), failed_rows()
        prune.validate_quotient_guard(old, replacement, jobs)
        for key, value in (
            ("id", 1), ("head_sha", "a" * 40), ("path", prune.WORKFLOW),
            ("name", prune.WORKFLOW_NAME), ("event", "workflow_dispatch"),
            ("head_branch", "other"), ("status", "completed"),
        ):
            with self.subTest(key=key):
                changed = deepcopy(replacement)
                changed[key] = value
                with self.assertRaises(RuntimeError):
                    prune.validate_quotient_guard(old, changed, jobs)
        replacement.update(status="completed", conclusion="success")
        prune.validate_quotient_guard(old, replacement, jobs)
        for conclusion in ("failure", "cancelled", "skipped"):
            replacement["conclusion"] = conclusion
            with self.subTest(conclusion=conclusion), self.assertRaises(RuntimeError):
                prune.validate_quotient_guard(old, replacement, jobs)

    def test_quotient_requires_the_recorded_failed_job(self):
        for key, value in (
            ("id", 1), ("run_id", 2), ("name", "another stage"),
            ("status", "in_progress"), ("conclusion", "success"),
        ):
            jobs = failed_rows()
            jobs["jobs"][0][key] = value
            with self.subTest(key=key), self.assertRaises(RuntimeError):
                prune.validate_quotient_guard(run(prune.QUOTIENT), run(prune.REPLACEMENT), jobs)
        with self.assertRaises(RuntimeError):
            prune.validate_quotient_guard(run(prune.QUOTIENT), run(prune.REPLACEMENT), {"jobs": []})

    def test_fresh_dispatch_requires_exact_snapshot_and_workflow(self):
        head = "c" * 40
        good = run(prune.RunSpec(999, head, event="workflow_dispatch"))
        self.assertEqual(prune.fresh_dispatches([good], head, set()), [good])
        self.assertEqual(prune.fresh_dispatches([good], head, {999}), [])
        for key, value in (
            ("head_sha", "d" * 40), ("path", prune.QUOTIENT_WORKFLOW),
            ("name", prune.QUOTIENT_NAME), ("event", "push"), ("head_branch", "other"),
        ):
            changed = deepcopy(good)
            changed[key] = value
            with self.subTest(key=key):
                self.assertEqual(prune.fresh_dispatches([changed], head, set()), [])

    def test_dry_run_and_apply_preserve_completed_runs(self):
        head = "c" * 40
        active_id = 44508611279
        for apply in (False, True):
            runs = {int(key): run(prune.RunSpec(int(key), sha))
                    for key, sha in prune.TARGETS.items()}
            runs[prune.QUOTIENT_ID] = run(prune.QUOTIENT)
            for key, value in runs.items():
                if key != active_id:
                    value.update(status="completed", conclusion="success")
            posts, dispatched = [], []

            def api(path, method="GET", body=None):
                if method == "POST":
                    posts.append((path, body))
                    if path.endswith("/cancel"):
                        key = int(path.split("/")[-2])
                        runs[key].update(status="completed", conclusion="cancelled")
                    elif path == "/actions/workflows/lean.yml/dispatches":
                        dispatched.append(run(prune.RunSpec(999, head, event="workflow_dispatch")))
                    else:
                        self.fail(f"Unexpected mutation: {path}")
                    return None
                if path == "/git/ref/heads/main":
                    return {"ref": "refs/heads/main", "object": {"type": "commit", "sha": head}}
                if path.startswith("/compare/"):
                    base = path.split("/")[-1].split("...")[0]
                    return {"status": "ahead", "behind_by": 0,
                            "base_commit": {"sha": base}, "merge_base_commit": {"sha": base}}
                if path.startswith("/actions/runs?"):
                    return {"workflow_runs": deepcopy(dispatched)}
                if "/jobs?" in path:
                    return {"jobs": []}
                return deepcopy(runs[int(path.split("/")[-1])])

            report = {}
            with redirect_stdout(StringIO()):
                prune.perform(api, head, apply, report)
            if apply:
                self.assertEqual(posts, [(f"/actions/runs/{active_id}/cancel", None),
                                         ("/actions/workflows/lean.yml/dispatches", {"ref": "main"})])
                self.assertEqual(report["dispatched_run"]["head_sha"], head)
            else:
                self.assertEqual(posts, [])
            self.assertEqual(sum(row["action"] == "preserved_completed_run"
                                 for row in report["actions"]), 23)


if __name__ == "__main__":
    unittest.main()
