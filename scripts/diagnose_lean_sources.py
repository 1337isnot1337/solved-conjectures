#!/usr/bin/env python3
"""Strict source diagnostics for the accepted closure; never a proof acceptance gate.

Independent source branches continue after a failure. Failed dependencies block
their descendants. This tool performs no axiom audit or stock-kernel replay and
does not replace the fail-fast accepted verification pipeline.
"""
from __future__ import annotations

import argparse
from concurrent.futures import FIRST_COMPLETED, ThreadPoolExecutor, wait
import json
import os
from pathlib import Path
import shutil
import subprocess
import time

import audit_lean_all_owned as audit
import build_lean_parallel as build
import verify_frankl_orbit_batches as runtime

ROOT = Path(__file__).resolve().parents[1]
OWN_INPUTS = (
    "scripts/diagnose_lean_sources.py",
    "scripts/test_diagnose_lean_sources.py",
    ".github/workflows/lean-source-diagnostics.yml",
)
EXTRA_HELPERS = (
    "scripts/audit_lean_all_owned.py",
    "scripts/verify_frankl_orbit_batches.py",
    "scripts/plan_lean_candidates.py",
    "scripts/verify_lean_candidate.py",
)
LEAN_SHA256 = "bf8d54e4714cc4b03d3f6bb34c83b7202b87e49c8bfcbff6895c085bb90ceb38"


def schedule(graph, run_one, *, jobs, timeout_seconds=21000):
    """Return a complete source-status partition, including all blocked descendants."""
    if not 1 <= jobs <= build.MAX_WORKERS or timeout_seconds <= 0:
        raise ValueError("Invalid diagnostic scheduling bound")
    build.validate_graph(graph)
    states = {module: "waiting" for module in graph}
    results, active = {}, {}
    peak_active = 0
    started = time.monotonic()
    with ThreadPoolExecutor(max_workers=jobs) as pool:
        while any(state == "waiting" for state in states.values()) or active:
            if time.monotonic() - started > timeout_seconds:
                raise RuntimeError("Diagnostic source phase exceeded its timeout")
            changed = True
            while changed:
                changed = False
                for module in sorted(graph):
                    if states[module] == "waiting" and any(
                            states[dependency] in {"failed", "blocked"}
                            for dependency in graph[module]):
                        states[module] = "blocked"
                        results[module] = {"status": "blocked"}
                        changed = True
            ready = [module for module in sorted(graph)
                     if states[module] == "waiting"
                     and all(states[dependency] == "passed" for dependency in graph[module])]
            for module in ready[:max(0, jobs - len(active))]:
                states[module] = "running"
                active[pool.submit(run_one, module)] = module
                peak_active = max(peak_active, len(active))
            if not active:
                if any(state == "waiting" for state in states.values()):
                    raise RuntimeError("Diagnostic DAG stalled")
                break
            completed, _ = wait(active, timeout=0.1, return_when=FIRST_COMPLETED)
            for future in completed:
                module = active.pop(future)
                try:
                    result = future.result()
                except Exception as error:
                    result = {"status": "failed", "error": f"{type(error).__name__}: {error}"}
                if not isinstance(result, dict) or result.get("status") not in {"passed", "failed"}:
                    raise RuntimeError("Source diagnostic returned an invalid status")
                states[module] = result["status"]
                results[module] = result
    if set(results) != set(graph):
        raise RuntimeError("Diagnostic module accounting differs")

    def failed_ancestors(module):
        failed, visited, pending = set(), set(), list(graph[module])
        while pending:
            dependency = pending.pop()
            if dependency in visited:
                continue
            visited.add(dependency)
            if states[dependency] == "failed":
                failed.add(dependency)
            pending.extend(graph[dependency])
        return sorted(failed)

    for module in graph:
        if states[module] == "blocked":
            results[module]["failed_ancestors"] = failed_ancestors(module)
            if not results[module]["failed_ancestors"]:
                raise RuntimeError("Blocked module has no failed ancestor")
    return {
        "results": {module: results[module] for module in sorted(graph)},
        "passed": sorted(module for module in graph if states[module] == "passed"),
        "failed": sorted(module for module in graph if states[module] == "failed"),
        "blocked": sorted(module for module in graph if states[module] == "blocked"),
        "peak_active": peak_active,
        "elapsed_seconds": time.monotonic() - started,
    }


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--plan", action="store_true")
    parser.add_argument("--jobs", type=int, choices=range(1, build.MAX_WORKERS + 1), default=2)
    parser.add_argument("--memory-limit-mib", type=int, default=12288)
    parser.add_argument("--timeout-seconds", type=float, default=21000)
    parser.add_argument("--module-timeout-seconds", type=float, default=1800)
    parser.add_argument("--artifact-dir", type=Path,
                        default=ROOT / ".candidate-artifacts/lean-source-diagnostics")
    args = parser.parse_args()
    spec = audit.accepted_spec(ROOT)
    graph, prefixes, external, extra = build.scope_plan(ROOT, spec["registered_modules"], None)
    if sorted(graph) != spec["modules"]:
        raise ValueError("Accepted diagnostic closure differs from the validated registry")
    plan = {
        "diagnostic_only": True, "proof_verification_passed": False,
        "project_modules": sorted(graph), "dependencies": {m: sorted(d) for m, d in graph.items()},
        "claims_axiom_audit": False, "claims_kernel_replay": False,
        "accepted_registry_changed": False,
    }
    if args.plan:
        print(json.dumps(plan, indent=2, sort_keys=True))
        return 0
    if args.memory_limit_mib // args.jobs < 4500:
        raise ValueError("Each source worker needs at least 4500 MiB within the aggregate guard")
    if args.timeout_seconds <= 0 or args.module_timeout_seconds <= 0:
        raise ValueError("Invalid diagnostic timeout")
    if not Path("/proc/self/status").is_file():
        raise ValueError("Source resource guards require Linux /proc")
    stage = args.artifact_dir.absolute()
    if stage.exists() or stage.resolve() != stage:
        raise ValueError("Choose a fresh direct diagnostic stage")
    for directory in ("src", "lib/lean", "logs"):
        (stage / directory).mkdir(parents=True, exist_ok=True)
    head = build.git_head(ROOT)
    inputs = build.snapshot_inputs(ROOT, graph, extra)
    for path in (*OWN_INPUTS, *EXTRA_HELPERS):
        build.direct_file(ROOT / path)
        inputs[path] = build.sha256(ROOT / path)
    receipt = {
        **plan, "schema": "lean-strict-source-diagnostic-v1", "status": "running",
        "git_commit": head, "input_sha256": inputs, "source_policy": {
            "warning_as_error": True, "linter_override": False,
            "fresh_project_objects": True, "source_threads": 1,
            "public_configuration_unchanged": True,
        },
        "jobs": args.jobs, "memory_limit_mib": args.memory_limit_mib,
        "per_worker_memory_limit_mib": args.memory_limit_mib // args.jobs,
        "timeout_seconds": args.timeout_seconds,
        "module_timeout_seconds": args.module_timeout_seconds,
    }
    receipt_path = stage / "receipt.json"
    def save():
        build.write_json(receipt_path, receipt)
    save()
    try:
        compiler, external_paths, toolchain = runtime.resolve_runtime(None)
        if toolchain["lean_sha256"] != LEAN_SHA256:
            raise ValueError("Diagnostic selected a different Lean compiler")
        receipt["toolchain"] = toolchain
        environment = {
            **os.environ,
            "PATH": str(compiler / "bin") + os.pathsep + os.environ.get("PATH", ""),
            "LEAN_PATH": os.pathsep.join([str(stage / "lib/lean"), *external_paths]),
            "LEAN_SYSROOT": str(compiler), "LEAN_NUM_THREADS": "1", "UV_USE_IO_URING": "0",
        }
        for module in graph:
            relative = module.replace(".", "/") + ".lean"
            copied = stage / "src" / relative
            copied.parent.mkdir(parents=True, exist_ok=True)
            shutil.copy2(ROOT / "lean" / relative, copied)
            if build.sha256(copied) != inputs["lean/" + relative]:
                raise ValueError("Copied diagnostic source changed: " + module)

        def run_one(module):
            relative = module.replace(".", "/")
            source = stage / "src" / (relative + ".lean")
            expected = inputs["lean/" + relative + ".lean"]
            if build.sha256(source) != expected:
                raise ValueError("Source changed before diagnostic: " + module)
            target = stage / "lib/lean" / (relative + ".olean")
            target.parent.mkdir(parents=True, exist_ok=True)
            command = [str(compiler / "bin/lean"), "-j1", "-M4500", "-DwarningAsError=true",
                       "-o", str(target), relative + ".lean"]
            records, metrics = [], {}
            result = {"status": "failed", "source_sha256": expected,
                      "process_records": records, "metrics": metrics}
            try:
                build.run_dag({module: set()}, lambda _: command, cwd=stage / "src",
                    env=environment, output=stage / "logs", jobs=1,
                    memory_limit_mib=args.memory_limit_mib // args.jobs,
                    records=records, metrics=metrics,
                    timeout_seconds=args.module_timeout_seconds)
                if build.sha256(source) != expected:
                    raise ValueError("Source changed during diagnostic: " + module)
                result["artifact_sha256"] = build.object_hashes(
                    stage / "src", stage / "lib/lean", module)
                result["status"] = "passed"
            except Exception as error:
                result["error"] = f"{type(error).__name__}: {error}"
            return result

        report = schedule(graph, run_one, jobs=args.jobs, timeout_seconds=args.timeout_seconds)
        receipt.update(report)
        build.assert_inputs(ROOT, inputs, head)
        for module, result in report["results"].items():
            source = stage / "src" / (module.replace(".", "/") + ".lean")
            if build.sha256(source) != inputs["lean/" + module.replace(".", "/") + ".lean"]:
                raise ValueError("Copied diagnostic source changed after the run")
            if result["status"] == "passed" and build.object_hashes(
                    stage / "src", stage / "lib/lean", module) != result["artifact_sha256"]:
                raise ValueError("Diagnostic object bytes changed after compilation")
            for record in result.get("process_records", []):
                if build.sha256(record["log"]) != record["log_sha256"]:
                    raise ValueError("Diagnostic process log changed")
        if build.sha256(compiler / "bin/lean") != LEAN_SHA256:
            raise ValueError("Diagnostic compiler changed")
        receipt.update(status="diagnostic_complete", all_frozen_hashes_unchanged=True)
        save()
        for module in report["failed"]:
            print("FAILED-SOURCE-DIAGNOSTIC " + module, flush=True)
            log = stage / "logs" / (module + ".log")
            if log.is_file():
                print(log.read_text(errors="replace")[-16000:], flush=True)
        print(json.dumps({
            "status": "diagnostic_complete", "proof_verification_passed": False,
            "modules": len(graph), "passed_sources": len(report["passed"]),
            "failed_sources": report["failed"], "blocked_sources": report["blocked"],
            "claims_axiom_audit": False, "claims_kernel_replay": False,
            "receipt_sha256": build.sha256(receipt_path),
        }), flush=True)
        return 1 if report["failed"] or report["blocked"] else 0
    except BaseException as error:
        receipt.update(status="diagnostic_incomplete", error=f"{type(error).__name__}: {error}")
        raise
    finally:
        save()


if __name__ == "__main__":
    raise SystemExit(main())
