#!/usr/bin/env python3
"""Retire one exact obsolete CI allowlist, then request the unchanged Lean gate.

Completed runs and their artifacts are never deleted. Every cancellation is
preceded by exact run metadata, active-status, current-main, and ancestry
checks. The one quotient candidate has a separate replacement/failure guard.
Without --apply this script performs only reads and writes its local report.
"""
from __future__ import annotations

import argparse
from dataclasses import dataclass
from datetime import datetime, timezone
import json
import os
from pathlib import Path
import re
import time
from urllib.error import HTTPError
from urllib.parse import urlencode
from urllib.request import Request, urlopen

REPOSITORY = "1337isnot1337/solved-conjectures"
WORKFLOW = ".github/workflows/lean.yml"
WORKFLOW_NAME = "Lean proofs and certificates"
ACTIVE = {"queued", "in_progress", "requested", "waiting", "pending"}
TARGETS = {
    "44503773918": "c068236c89144746c1fa24669a0313a71fb11621",
    "44504049499": "dcd1e055ab61279a1a63b03c9f0ce3c962b4eeec",
    "44504109789": "5c5f82088981d75438b254cf149d214c6cf5d39c",
    "44504176975": "556b5f6ac436b06af4ce1b3cbd21520621cb285f",
    "44504678814": "2d70d7816b07a475d3a5dd74a126ac2ac8764dca",
    "44504719640": "25382f01fc75c49d1a0d44392273a0742eaedd56",
    "44505006067": "050ec13ddc5c454c56ae081e82a2aa4f91fa1722",
    "44505064299": "14b5adece4c0e5ee8b2eddf24decba85f0b0a1cd",
    "44505281080": "a1e025a593d5010e5c2eede62fc5eb87f523f02c",
    "44505669742": "8ce04725bcbcef2b36d51a2996f647e783637a9b",
    "44505832415": "9ed02b08681410de414b82cc1069df5b8504af79",
    "44506022704": "35e864f21d7539c4a2150691cbf8991f474968e2",
    "44506148355": "a00306b9b7324a29afdf383ad49b99e7258f452e",
    "44506434341": "cadb700e7275582f6bd8bdb7f8637743c60b1ed0",
    "44506501258": "48c52baa189bc532db74634bc2b941c29eea1e60",
    "44506934394": "cfcb2232fecf0438f7005e00b931ed0e337c6b16",
    "44507055094": "2bd134592bbe6a411d55e71ac1ddbfb04f11dcbe",
    "44507137567": "00eab5d18c68ff04ab6da3bca06477e9f68f7179",
    "44507923273": "6543ad2940e22a1adf6d1f84f9a5e3e2e07f793f",
    "44508040395": "94d70e39bb5810999dcdfed948d4ba3de87e362a",
    "44508214756": "674889998f127d37e8439ef9fc62a111fe74c081",
    "44508575787": "e911b12c6ee8eb2ae02a0226e855f9314b24237e",
    "44508611279": "b748581ee3a4daca23199bb90253d57b422c3c62",
}
QUOTIENT_WORKFLOW = ".github/workflows/lean-hadamard-quotient133-candidates.yml"
QUOTIENT_NAME = "Lean quotient-133 certificate candidates"
QUOTIENT_ID = 44521787144
QUOTIENT_SHA = "dd9f1ee90f34127ec680b37594bc9eb4e0fcb176"
REPLACEMENT_ID = 44524685962
REPLACEMENT_SHA = "9bd0e3fe3a25bf3d7c319425a392770aff98a122"
FAILED_ROWS_JOB = 135552040110
ROWS_JOB_NAME = "quotient-133 strict source rows_verified"
SHA = re.compile(r"[0-9a-f]{40}")
MAINTENANCE_FILES = (
    "scripts/prune_legacy_accepted_runs.py",
    ".github/workflows/prune-legacy-accepted-runs.yml",
    "scripts/test_prune_legacy_accepted_runs.py",
)


@dataclass(frozen=True)
class RunSpec:
    run_id: int
    head_sha: str
    path: str = WORKFLOW
    name: str = WORKFLOW_NAME
    event: str = "push"


QUOTIENT = RunSpec(QUOTIENT_ID, QUOTIENT_SHA, QUOTIENT_WORKFLOW, QUOTIENT_NAME)
REPLACEMENT = RunSpec(REPLACEMENT_ID, REPLACEMENT_SHA, QUOTIENT_WORKFLOW, QUOTIENT_NAME)


def require(condition: bool, message: str) -> None:
    if not condition:
        raise RuntimeError(message)


def validate_run(run: dict, expected: RunSpec) -> None:
    fields = {
        "id": expected.run_id, "head_sha": expected.head_sha,
        "path": expected.path, "name": expected.name,
        "event": expected.event, "head_branch": "main",
    }
    require(all(run.get(key) == value for key, value in fields.items()),
            f"Run metadata mismatch: {expected.run_id}")
    require(run.get("repository", {}).get("full_name") == REPOSITORY,
            f"Run repository mismatch: {expected.run_id}")
    require(run.get("head_repository", {}).get("full_name") == REPOSITORY,
            f"Run head repository mismatch: {expected.run_id}")


def target_active(run: dict, expected: RunSpec) -> bool:
    validate_run(run, expected)
    if run.get("status") == "completed":
        return False
    require(run.get("status") in ACTIVE, f"Unknown run status: {expected.run_id}")
    return True


def validate_ancestry(comparison: dict, base: str) -> None:
    require(comparison.get("status") in {"ahead", "identical"}
            and comparison.get("behind_by") == 0
            and comparison.get("base_commit", {}).get("sha") == base
            and comparison.get("merge_base_commit", {}).get("sha") == base,
            f"Source is not an ancestor of the selected snapshot: {base}")


def validate_quotient_guard(old: dict, replacement: dict, jobs: dict) -> None:
    require(target_active(old, QUOTIENT), "Old quotient run is no longer active")
    validate_run(replacement, REPLACEMENT)
    require(replacement.get("status") in ACTIVE
            or (replacement.get("status") == "completed"
                and replacement.get("conclusion") == "success"),
            "The repaired quotient replacement is neither active nor successful")
    rows = [job for job in jobs.get("jobs", []) if job.get("id") == FAILED_ROWS_JOB]
    require(len(rows) == 1, "The recorded failed rows job is absent or ambiguous")
    row = rows[0]
    require(row.get("run_id") == QUOTIENT_ID and row.get("name") == ROWS_JOB_NAME
            and row.get("status") == "completed" and row.get("conclusion") == "failure",
            "The recorded old quotient rows failure is not confirmed")


def metadata(run: dict) -> dict:
    keys = ("id", "path", "name", "event", "head_branch", "head_sha",
            "status", "conclusion", "html_url", "created_at", "updated_at")
    return {key: run.get(key) for key in keys}


def fresh_dispatches(runs: list[dict], head: str, previous: set[int]) -> list[dict]:
    found = []
    for run in runs:
        if run.get("id") in previous:
            continue
        expected = RunSpec(run.get("id"), head, event="workflow_dispatch")
        try:
            validate_run(run, expected)
        except RuntimeError:
            continue
        found.append(run)
    return found


def api_client(token: str):
    root = f"https://api.github.com/repos/{REPOSITORY}"

    def api(path: str, method: str = "GET", body=None):
        payload = None if body is None else json.dumps(body).encode("utf-8")
        request = Request(root + path, data=payload, method=method, headers={
            "Accept": "application/vnd.github+json",
            "Authorization": f"Bearer {token}",
            "Content-Type": "application/json",
            "X-GitHub-Api-Version": "2022-11-28",
        })
        with urlopen(request, timeout=30) as response:
            data = response.read()
            return json.loads(data) if data else None
    return api


def current_main(api, expected: str) -> None:
    ref = api("/git/ref/heads/main")
    require(ref.get("ref") == "refs/heads/main"
            and ref.get("object", {}).get("type") == "commit"
            and ref.get("object", {}).get("sha") == expected,
            "Current main changed from the selected main snapshot")


def ancestor(api, base: str, head: str) -> None:
    require(SHA.fullmatch(base) is not None and SHA.fullmatch(head) is not None,
            "Invalid source SHA")
    validate_ancestry(api(f"/compare/{base}...{head}?per_page=1"), base)


def maintenance_blobs(api, head: str) -> dict[str, str]:
    blobs = {}
    for path in MAINTENANCE_FILES:
        item = api(f"/contents/{path}?{urlencode({'ref': head})}")
        sha = item.get("sha", "")
        require(item.get("type") == "file" and item.get("path") == path
                and isinstance(sha, str) and SHA.fullmatch(sha) is not None,
                f"Maintenance file metadata mismatch: {path}")
        blobs[path] = sha
    return blobs


def select_main(api, checkout: str, report: dict) -> str:
    require(SHA.fullmatch(checkout) is not None, "Invalid checkout SHA")
    report["checkout_sha"] = checkout
    ref = api("/git/ref/heads/main")
    head = ref.get("object", {}).get("sha", "")
    require(ref.get("ref") == "refs/heads/main"
            and ref.get("object", {}).get("type") == "commit"
            and isinstance(head, str) and SHA.fullmatch(head) is not None,
            "Invalid current-main reference")
    report["selected_head_sha"] = head
    ancestor(api, checkout, head)
    bindings = {"checkout": maintenance_blobs(api, checkout),
                "selected": maintenance_blobs(api, head)}
    report["maintenance_blob_bindings"] = bindings
    require(bindings["checkout"] == bindings["selected"],
            "Reviewed maintenance files changed after checkout")
    current_main(api, head)
    return head


def checked_run(api, spec: RunSpec) -> dict:
    run = api(f"/actions/runs/{spec.run_id}")
    validate_run(run, spec)
    return run


def quotient_guard(api, old: dict, selected_head: str) -> dict:
    replacement = checked_run(api, REPLACEMENT)
    jobs = api(f"/actions/runs/{QUOTIENT_ID}/jobs?filter=latest&per_page=100")
    validate_quotient_guard(old, replacement, jobs)
    ancestor(api, QUOTIENT_SHA, REPLACEMENT_SHA)
    ancestor(api, REPLACEMENT_SHA, selected_head)
    return metadata(replacement)


def dispatch_full_gate(api, head: str, report: dict) -> None:
    current_main(api, head)
    query = urlencode({"event": "workflow_dispatch", "head_sha": head, "per_page": 100})
    listing = f"/actions/runs?{query}"
    previous = {run["id"] for run in api(listing)["workflow_runs"]}
    request = {"workflow": WORKFLOW, "ref": "main", "head_sha": head,
               "requested_at": datetime.now(timezone.utc).isoformat()}
    report["dispatch_request"] = request
    api("/actions/workflows/lean.yml/dispatches", method="POST", body={"ref": "main"})
    current_main(api, head)
    for _ in range(45):
        current_main(api, head)
        matches = fresh_dispatches(api(listing)["workflow_runs"], head, previous)
        require(len(matches) <= 1, "Multiple matching fresh dispatches; see run listing")
        if matches:
            run = matches[0]
            require(run.get("status") in ACTIVE
                    or (run.get("status") == "completed"
                        and run.get("conclusion") == "success"),
                    "The fresh full-gate dispatch was already cancelled or failed")
            report["dispatched_run"] = metadata(run)
            report["dispatched_jobs"] = api(
                f"/actions/runs/{run['id']}/jobs?filter=latest&per_page=100")
            return
        time.sleep(2)
    raise RuntimeError("Dispatch was requested, but its exact run was not observed within 90 seconds")


def perform(api, head: str, apply: bool, report: dict) -> None:
    current_main(api, head)
    specs = [RunSpec(int(run_id), sha) for run_id, sha in TARGETS.items()] + [QUOTIENT]
    require(len({spec.run_id for spec in specs}) == 24, "Retirement allowlist changed shape")
    report["preflight"] = []
    # Validate every target before making the first cancellation request.
    for spec in specs:
        run = checked_run(api, spec)
        active = target_active(run, spec)
        record = {"run": metadata(run), "selected": active}
        if active:
            ancestor(api, spec.head_sha, head)
            if spec == QUOTIENT:
                record["replacement"] = quotient_guard(api, run, head)
        report["preflight"].append(record)
    current_main(api, head)
    report["actions"] = []
    requested = []
    for spec in specs:
        run = checked_run(api, spec)
        record = {"run": metadata(run)}
        report["actions"].append(record)
        if not target_active(run, spec):
            record["action"] = "preserved_completed_run"
            continue
        current_main(api, head)
        ancestor(api, spec.head_sha, head)
        if spec == QUOTIENT:
            record["replacement"] = quotient_guard(api, run, head)
        # Re-read target metadata immediately before the only cancel request.
        run = checked_run(api, spec)
        if not target_active(run, spec):
            record.update(action="completed_before_request", run=metadata(run))
            continue
        if not apply:
            record["action"] = "would_cancel"
            continue
        current_main(api, head)
        try:
            api(f"/actions/runs/{spec.run_id}/cancel", method="POST")
        except HTTPError as error:
            if error.code != 409:
                raise
            finished = checked_run(api, spec)
            require(not target_active(finished, spec),
                    f"Cancellation conflict while run remains active: {spec.run_id}")
            record.update(action="completed_before_request", run=metadata(finished))
            continue
        record["action"] = "cancel_requested"
        requested.append(spec)
        print(f"CANCEL REQUESTED {spec.run_id}", flush=True)
    if not apply:
        report["dispatch_request"] = {"workflow": WORKFLOW, "ref": "main",
                                      "head_sha": head, "action": "would_dispatch"}
        return
    # Confirm requests have completed before scheduling the new full proof check.
    remaining = requested
    report["retired_runs"] = []
    for _ in range(45):
        pending = []
        for spec in remaining:
            run = checked_run(api, spec)
            if target_active(run, spec):
                pending.append(spec)
            else:
                report["retired_runs"].append(metadata(run))
        remaining = pending
        if not remaining:
            break
        time.sleep(2)
    require(not remaining, "Some cancellation requests remain active after 90 seconds")
    dispatch_full_gate(api, head, report)


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--apply", action="store_true")
    parser.add_argument("--report", type=Path,
                        default=Path("build/maintenance/accepted-run-retirement.json"))
    args = parser.parse_args()
    report = {"scope": "CI maintenance only; no proof verification evidence",
              "apply": args.apply, "started_at": datetime.now(timezone.utc).isoformat(),
              "status": "started"}
    try:
        require(os.environ.get("GITHUB_REPOSITORY") == REPOSITORY, "Wrong repository")
        require(os.environ.get("GITHUB_REF") == "refs/heads/main", "Wrong workflow ref")
        api = api_client(os.environ["GH_TOKEN"])
        head = select_main(api, os.environ.get("GITHUB_SHA", ""), report)
        perform(api, head, args.apply, report)
        report["status"] = "completed"
        return 0
    except Exception as error:
        report.update(status="failed", error=f"{type(error).__name__}: {error}")
        print(report["error"], flush=True)
        return 1
    finally:
        report["finished_at"] = datetime.now(timezone.utc).isoformat()
        args.report.parent.mkdir(parents=True, exist_ok=True)
        args.report.write_text(json.dumps(report, indent=2, sort_keys=True) + "\n")
        print(json.dumps(report, indent=2, sort_keys=True), flush=True)


if __name__ == "__main__":
    raise SystemExit(main())
