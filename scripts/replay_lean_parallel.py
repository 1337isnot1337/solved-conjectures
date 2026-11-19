#!/usr/bin/env python3
"""Guarded internal parallelism of the unchanged pinned stock Lean checker.

One invocation replays the complete materialized project closure, including
namespace roots. Every replayed module must occur exactly once in the log.
LEAN_NUM_THREADS selects ordinary worker tasks on the inspected checker path;
the process is also stopped if sampled RSS or OS thread counts exceed limits.

This is only a kernel phase. A source receipt can bind the exact fresh build;
the separate import-all axiom/private-proof audit is still required.
"""
from __future__ import annotations

import argparse
from collections import Counter
import json
import os
from pathlib import Path
import resource
import shutil
import signal
import subprocess
import sys
import time

from build_lean_parallel import (
    LEAN_COMMIT, MAX_WORKERS, assert_inputs, direct_file, gate_lock, git_head,
    interrupted, object_hashes, output_directory, process_tree_stats, scope_plan,
    sha256, snapshot_inputs, stop_processes, write_json,
)
from replay_lean import MODULE, PROJECT_NAMESPACES

CHECKER_SHA256 = "12c38901cdbfab178f1bf6145dd30012e9a3b2c11ca695292a5884fa3cbaddb6"


def name_is_prefix(prefix, module):
    """Lean Name.isPrefixOf on validated ASCII module-name components."""
    if not MODULE.fullmatch(prefix) or not MODULE.fullmatch(module):
        raise ValueError("Unsupported Lean module name")
    first, second = prefix.split("."), module.split(".")
    return second[:len(first)] == first


def exact_replay_set(output, expected):
    replayed = []
    for line in output.splitlines():
        if line.startswith("replaying"):
            if not line.startswith("replaying ") or not MODULE.fullmatch(line[10:]):
                raise ValueError(f"Malformed stock-checker replay line: {line!r}")
            replayed.append(line[10:])
    counts = Counter(replayed)
    missing = sorted(set(expected) - set(counts))
    extra = sorted(set(counts) - set(expected))
    duplicates = sorted(m for m, count in counts.items() if count != 1)
    if missing or extra or duplicates:
        raise ValueError(f"Incomplete kernel replay: missing={missing}; extra={extra}; duplicates={duplicates}")
    return replayed


def staged_search_path(lean, objects, staged, current):
    project_paths = {(lean / ".lake/build/lib/lean").resolve(), objects.resolve()}
    paths = [Path(path).absolute() for path in current.split(os.pathsep) if path]
    if not any(path.resolve() in project_paths for path in paths):
        raise ValueError("Run through lake env with the project object path on LEAN_PATH")
    external = []
    for path in paths:
        if path.resolve() in project_paths:
            continue
        if any((path / ns).exists() or (path / (ns + ".olean")).exists()
               for ns in PROJECT_NAMESPACES):
            raise ValueError(f"Another LEAN_PATH entry exposes project modules: {path}")
        if path not in external:
            external.append(path)
    return os.pathsep.join(map(str, [staged, *external]))


def stage_objects(lean, objects, staged, modules, prefixes):
    if objects.resolve() != objects.absolute():
        raise ValueError("Project object directory must not be indirect")
    hashes = {}
    for module in sorted(modules):
        if sum(name_is_prefix(prefix, module) for prefix in prefixes) != 1:
            raise ValueError(f"Module is not selected by exactly one checker prefix: {module}")
        hashes[module] = object_hashes(lean, objects, module)
        for facet, expected in hashes[module].items():
            relative = module.replace(".", "/") + facet
            source, target = objects / relative, staged / relative
            target.parent.mkdir(parents=True, exist_ok=True)
            shutil.copyfile(source, target)
            direct_file(target)
            if sha256(target) != expected:
                raise ValueError(f"Artifact changed while staging: {relative}")
    discovered = {".".join(path.relative_to(staged).with_suffix("").parts)
                  for path in staged.rglob("*.olean")}
    if discovered != set(modules):
        raise ValueError("Materialized public objects differ from the exact source closure")
    return hashes


def assert_artifacts(lean, objects, staged, hashes):
    for module, expected in hashes.items():
        if object_hashes(lean, objects, module) != expected:
            raise ValueError(f"Original project artifacts changed: {module}")
        if object_hashes(lean, staged, module) != expected:
            raise ValueError(f"Staged project artifacts changed: {module}")


def run_checker(command, *, lean, env, log, workers, memory_limit_mib,
                timeout_seconds, metrics=None):
    if not 1 <= workers <= MAX_WORKERS or memory_limit_mib <= 0 or timeout_seconds <= 0:
        raise ValueError("Invalid replay resource bound")
    if metrics is None:
        metrics = {}
    metrics.update(sampled_peak_rss_kib=0, sampled_peak_high_water_kib=0,
                   sampled_peak_threads=0, sampled_peak_processes=0, thread_limit=workers + 1)
    started = time.monotonic()
    with log.open("w", encoding="utf-8") as stream:
        process = subprocess.Popen(command, cwd=lean, env=env, stdout=stream,
            stderr=subprocess.STDOUT, start_new_session=True)
        try:
            while True:
                stats = process_tree_stats(process.pid)
                metrics["sampled_peak_rss_kib"] = max(metrics["sampled_peak_rss_kib"], stats["rss_kib"])
                metrics["sampled_peak_high_water_kib"] = max(
                    metrics["sampled_peak_high_water_kib"], stats["high_water_sum_kib"])
                metrics["sampled_peak_threads"] = max(metrics["sampled_peak_threads"], stats["threads"])
                metrics["sampled_peak_processes"] = max(metrics["sampled_peak_processes"], stats["processes"])
                if stats["processes"] > 1:
                    raise RuntimeError("Stock checker unexpectedly spawned a child process")
                if stats["threads"] > workers + 1:
                    raise RuntimeError(f"Stock checker exceeded the {workers + 1}-thread guard")
                if stats["rss_kib"] > memory_limit_mib * 1024:
                    raise RuntimeError(f"Stock checker exceeded the {memory_limit_mib} MiB RSS guard")
                if time.monotonic() - started > timeout_seconds:
                    raise RuntimeError("Stock checker exceeded its timeout")
                if process.poll() is not None:
                    break
                time.sleep(0.05)
        finally:
            if process.poll() is None:
                stop_processes([process])
            stream.flush()
            metrics.update(exit_code=process.returncode, elapsed_seconds=time.monotonic() - started,
                           command=command, log_sha256=sha256(log))
    if process.returncode:
        raise RuntimeError(f"Stock checker exited {process.returncode}; see {log}")
    return metrics


def validate_source_receipt(path, *, head, modules, inputs, artifacts):
    direct_file(path)
    receipt = json.loads(path.read_text(encoding="utf-8"))
    if (receipt.get("status") != "passed" or receipt.get("phase") != "source"
            or receipt.get("fresh_project_build") is not True or receipt.get("git_head") != head
            or set(receipt.get("project_modules", [])) != set(modules)
            or receipt.get("artifact_sha256") != artifacts):
        raise ValueError("Source receipt does not describe this exact fresh closure")
    for name, expected in inputs.items():
        if receipt.get("input_sha256", {}).get(name) != expected:
            raise ValueError(f"Source receipt input mismatch: {name}")
    compiler = Path(receipt.get("compiler_path", ""))
    direct_file(compiler)
    if sha256(compiler) != receipt.get("compiler_sha256"):
        raise ValueError("Source receipt's actual compiler binary changed")
    return {"path": str(path), "sha256": sha256(path),
            "compiler_path": str(compiler), "compiler_sha256": sha256(compiler)}


def main(argv=None):
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--lean-dir", type=Path, default=Path(__file__).resolve().parent.parent / "lean")
    parser.add_argument("--root")
    parser.add_argument("--object-dir", type=Path)
    parser.add_argument("--workers", type=int, choices=range(1, MAX_WORKERS + 1), default=2)
    parser.add_argument("--memory-limit-mib", type=int, default=12288)
    parser.add_argument("--timeout-seconds", type=float, default=21600)
    parser.add_argument("--output-dir", type=Path)
    parser.add_argument("--source-receipt", type=Path)
    parser.add_argument("--dry-run", action="store_true")
    parser.add_argument("modules", nargs="*")
    args = parser.parse_args(argv)
    lean = args.lean_dir.resolve()
    repo = lean.parent
    graph, prefixes, _external, extra = scope_plan(repo, args.modules, args.root)
    if args.dry_run:
        print(json.dumps({"mode": "candidate" if args.root else "accepted", "root": args.root,
            "workers": args.workers, "project_modules": sorted(graph),
            "checker_prefixes": prefixes, "checker_sha256": CHECKER_SHA256}, indent=2))
        return 0
    if not Path("/proc/self/status").is_file():
        raise ValueError("Replay resource guards require Linux /proc")
    with gate_lock(lean):
        output = output_directory(lean, args.output_dir, "parallel-replay-")
        receipt = {"status": "running", "phase": "kernel", "root": args.root,
            "mode": "candidate" if args.root else "accepted", "workers": args.workers,
            "memory_limit_mib": args.memory_limit_mib, "timeout_seconds": args.timeout_seconds,
            "project_modules": sorted(graph), "checker_prefixes": prefixes,
            "claims_source_check": False, "claims_axiom_audit": False,
            "reuses_prior_kernel_pass": False, "output_directory": str(output), "kernel": {}}
        started = time.monotonic()
        try:
            head = git_head(repo)
            inputs = snapshot_inputs(repo, graph, extra)
            receipt.update(git_head=head, input_sha256=inputs)
            checker_name = shutil.which("leanchecker")
            if checker_name is None:
                raise ValueError("Pinned leanchecker is unavailable")
            checker = Path(checker_name).absolute()
            if sha256(checker) != CHECKER_SHA256:
                raise ValueError("leanchecker is not the pinned unchanged Linux binary")
            receipt.update(checker_path=str(checker), checker_sha256=CHECKER_SHA256, lean_commit=LEAN_COMMIT)
            objects = args.object_dir.absolute() if args.object_dir else lean / ".lake/build/lib/lean"
            staged = output / "lib/lean"
            staged.mkdir(parents=True)
            artifacts = stage_objects(lean, objects, staged, graph, prefixes)
            receipt.update(artifact_sha256=artifacts, original_object_directory=str(objects))
            if args.source_receipt:
                receipt["source_receipt"] = validate_source_receipt(args.source_receipt.absolute(),
                    head=head, modules=graph, inputs=inputs, artifacts=artifacts)
            env = os.environ.copy()
            env["LEAN_NUM_THREADS"] = str(args.workers)
            env["LEAN_PATH"] = staged_search_path(lean, objects, staged, env.get("LEAN_PATH", ""))
            command = [str(checker), "-v", *prefixes]
            stdbuf = shutil.which("stdbuf")
            if stdbuf:
                command = [stdbuf, "-oL", "-eL", *command]
            receipt["environment"] = {"LEAN_NUM_THREADS": env["LEAN_NUM_THREADS"], "LEAN_PATH": env["LEAN_PATH"]}
            assert_inputs(repo, inputs, head)
            assert_artifacts(lean, objects, staged, artifacts)
            print(json.dumps({"phase": "kernel", "modules": len(graph), "workers": args.workers,
                              "prefixes": prefixes, "log": str(output / "kernel.log")}), flush=True)
            run_checker(command, lean=lean, env=env, log=output / "kernel.log",
                workers=args.workers, memory_limit_mib=args.memory_limit_mib,
                timeout_seconds=args.timeout_seconds, metrics=receipt["kernel"])
            replayed = exact_replay_set((output / "kernel.log").read_text(), graph)
            assert_inputs(repo, inputs, head)
            assert_artifacts(lean, objects, staged, artifacts)
            if sha256(checker) != CHECKER_SHA256:
                raise ValueError("Pinned checker changed during replay")
            if args.source_receipt:
                prior = receipt["source_receipt"]
                if sha256(args.source_receipt) != prior["sha256"]:
                    raise ValueError("Source receipt changed during replay")
                if sha256(prior["compiler_path"]) != prior["compiler_sha256"]:
                    raise ValueError("Source compiler changed during replay")
            receipt.update(status="passed", exact_replay_set=replayed,
                           replayed_module_count=len(replayed), all_frozen_hashes_unchanged=True)
        except BaseException as error:
            receipt.update(status="failed", error=f"{type(error).__name__}: {error}")
            raise
        finally:
            receipt.update(elapsed_seconds=time.monotonic() - started,
                           child_maxrss_kib=resource.getrusage(resource.RUSAGE_CHILDREN).ru_maxrss)
            write_json(output / "receipt.json", receipt)
            print(json.dumps({"status": receipt["status"], "phase": "kernel",
                              "receipt": str(output / "receipt.json")}), flush=True)
    return 0


if __name__ == "__main__":
    signal.signal(signal.SIGTERM, interrupted)
    try:
        raise SystemExit(main())
    except (OSError, ValueError, RuntimeError, subprocess.SubprocessError) as error:
        print(f"FAIL: {error}", file=sys.stderr)
        raise SystemExit(1) from error
