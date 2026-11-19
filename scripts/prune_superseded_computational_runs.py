#!/usr/bin/env python3
"""Retain the oldest active and newest computational replay on main.

This command never selects Lean verification workflows. Cancellation is
restricted to superseded push runs of .github/workflows/verify.yml in this
repository. Without --apply it only reports the selected run identifiers.
"""
from __future__ import annotations

import argparse
import json
import os
from urllib.error import HTTPError
from urllib.parse import urlencode
from urllib.request import Request, urlopen

REPOSITORY = "1337isnot1337/solved-conjectures"
WORKFLOW = ".github/workflows/verify.yml"
ACTIVE = {"queued", "in_progress", "requested", "waiting", "pending"}


def eligible(run: dict) -> bool:
    return (run.get("path") == WORKFLOW
            and run.get("name") == "verify conjecture results"
            and run.get("event") == "push"
            and run.get("head_branch") == "main"
            and run.get("status") in ACTIVE)


def select(runs: list[dict]) -> tuple[list[int], list[int]]:
    candidates = {r["id"]: r for r in runs if eligible(r)}
    if not candidates:
        return [], []
    keep = {max(candidates)}
    running = [r for r in candidates.values() if r["status"] == "in_progress"]
    if running:
        keep.add(min(running, key=lambda r: (r["created_at"], r["id"]))["id"])
    return sorted(keep), sorted(set(candidates) - keep)


def self_test() -> None:
    def row(i, status="queued", **changes):
        return {"id": i, "path": WORKFLOW, "name": "verify conjecture results",
                "event": "push", "head_branch": "main", "status": status,
                "created_at": f"2026-11-19T10:{i:02d}:00Z", **changes}
    assert select([]) == ([], [])
    assert select([row(1)]) == ([1], [])
    assert select([row(1), row(2), row(3)]) == ([3], [1, 2])
    assert select([row(1, "in_progress"), row(2, "in_progress"), row(3)]) == ([1, 3], [2])
    protected = [
        row(40, path=".github/workflows/lean.yml", name="Lean proofs and certificates"),
        row(41, head_branch="other"),
        row(42, event="pull_request"),
        row(43, status="completed"),
        row(44, name="another workflow"),
    ]
    assert select([row(1, "in_progress"), row(2), row(3), *protected]) == ([1, 3], [2])
    assert select([row(1), row(1), row(2)]) == ([2], [1])


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--apply", action="store_true")
    args = parser.parse_args()
    self_test()
    if os.environ.get("GITHUB_REPOSITORY") != REPOSITORY:
        raise RuntimeError("This maintenance command is restricted to its repository")
    token = os.environ["GH_TOKEN"]
    root = f"https://api.github.com/repos/{REPOSITORY}"

    def api(path: str, method: str = "GET"):
        request = Request(root + path, method=method, headers={
            "Accept": "application/vnd.github+json",
            "Authorization": f"Bearer {token}",
            "X-GitHub-Api-Version": "2022-11-28",
        })
        with urlopen(request, timeout=30) as response:
            body = response.read()
            return json.loads(body) if body else None

    runs = {}
    for status in sorted(ACTIVE):
        for page in range(1, 11):
            query = urlencode({"event": "push", "branch": "main",
                               "status": status, "per_page": 100, "page": page})
            batch = api("/actions/runs?" + query)["workflow_runs"]
            for run in batch:
                runs[run["id"]] = run
            if len(batch) < 100:
                break
        else:
            raise RuntimeError("Active run listing exceeded the conservative page bound")
    keep, cancel = select(list(runs.values()))
    print(json.dumps({"keep": keep, "superseded_computational_runs": cancel,
                      "apply": args.apply}, indent=2))
    if not args.apply:
        return
    for run_id in cancel:
        current = api(f"/actions/runs/{run_id}")
        if not eligible(current):
            print(f"SKIP {run_id}: no longer an eligible active computational run")
            continue
        try:
            api(f"/actions/runs/{run_id}/cancel", method="POST")
        except HTTPError as error:
            if error.code == 409:
                print(f"SKIP {run_id}: completed while cancellation was requested")
                continue
            raise
        print(f"CANCEL REQUESTED {run_id}")


if __name__ == "__main__":
    main()
