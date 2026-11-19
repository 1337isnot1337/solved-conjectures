#!/usr/bin/env python3
"""One-time cleanup of eight superseded accepted-package push checks.

The immutable allowlist excludes every component-proof workflow. Both older
checkpoint runs and the newest recorded full-package run are retained.
Cancelled checks provide no verification evidence.
"""
from __future__ import annotations

import argparse
import json
import os
from urllib.error import HTTPError
from urllib.request import Request, urlopen

REPOSITORY = "1337isnot1337/solved-conjectures"
WORKFLOW = ".github/workflows/lean.yml"
TARGETS = {
    "44501434274": "71da11155aee90e632129b7f5d0d59edb0b3206e",
    "44501687611": "83f723c771a2f2b6852c5dab3f6358c2556c1761",
    "44501894878": "93638440510191df8e8801db36b6616a4ae69741",
    "44502564799": "6bd9626acf9c062772ee235237ade6b7eadf175d",
    "44502719078": "94adb73065997a3b20804b683a0e16706ca6c571",
    "44503050629": "a48f80f5f0e7d5e27d9429c324ad07097d070161",
    "44503249660": "dc7d79882ed4b73e4c3ced3668f208f0338e45cb",
    "44503413585": "68d44e53fa3968647aac7dac60c545e302ee5fd5"
}
KEEP = {
    "44499147994": "14ab84e7c177f85609af381e526583ba9a5a4dab",
    "44501343722": "62427d3e2cbad1a3ba88cb601dfef2fc2f4dae37",
    "44503773918": "c068236c89144746c1fa24669a0313a71fb11621"
}
NEWEST_KEEPER = 44503773918
ACTIVE = {"queued", "in_progress", "requested", "waiting", "pending"}


def matches(run: dict, expected: str) -> bool:
    return (run.get("path") == WORKFLOW
            and run.get("name") == "Lean proofs and certificates"
            and run.get("event") == "push"
            and run.get("head_branch") == "main"
            and run.get("head_sha") == expected)


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--apply", action="store_true")
    args = parser.parse_args()
    if os.environ.get("GITHUB_REPOSITORY") != REPOSITORY:
        raise RuntimeError("Wrong repository")
    token = os.environ["GH_TOKEN"]
    root = f"https://api.github.com/repos/{REPOSITORY}"

    def api(path: str, method: str = "GET"):
        request = Request(root + path, method=method, headers={
            "Accept": "application/vnd.github+json",
            "Authorization": f"Bearer {token}",
            "X-GitHub-Api-Version": "2022-11-28",
        })
        with urlopen(request, timeout=30) as response:
            payload = response.read()
            return json.loads(payload) if payload else None

    assert not (set(TARGETS) & set(KEEP))
    keep_runs = {int(k): api(f"/actions/runs/{k}") for k in KEEP}
    for key, expected in KEEP.items():
        run = keep_runs[int(key)]
        if not matches(run, expected):
            raise RuntimeError(f"Keeper metadata mismatch: {key}")
    keeper = keep_runs[NEWEST_KEEPER]
    if keeper["status"] not in ACTIVE and keeper.get("conclusion") != "success":
        raise RuntimeError("Newest retained full check is neither active nor successful")
    print(json.dumps({"keep": KEEP, "targets": TARGETS, "apply": args.apply}, indent=2))

    for key, expected in TARGETS.items():
        run_id = int(key)
        current = api(f"/actions/runs/{run_id}")
        if not matches(current, expected):
            raise RuntimeError(f"Target metadata mismatch: {run_id}")
        if current["status"] not in ACTIVE:
            print(f"SKIP {run_id}: already completed", flush=True)
            continue
        comparison = api(f"/compare/{expected}...{keeper['head_sha']}")
        if comparison.get("status") not in {"ahead", "identical"}:
            raise RuntimeError(f"Target is not an ancestor of the retained checkpoint: {run_id}")
        current = api(f"/actions/runs/{run_id}")
        if not matches(current, expected) or current["status"] not in ACTIVE:
            print(f"SKIP {run_id}: no longer an eligible active run", flush=True)
            continue
        if not args.apply:
            print(f"SELECT {run_id}", flush=True)
            continue
        try:
            api(f"/actions/runs/{run_id}/cancel", method="POST")
        except HTTPError as error:
            if error.code == 409:
                print(f"SKIP {run_id}: finished before cancellation", flush=True)
                continue
            raise
        print(f"CANCEL REQUESTED {run_id}", flush=True)


if __name__ == "__main__":
    main()
