#!/usr/bin/env python3
"""Fresh bounded source builds for an exact accepted or candidate Lean closure.

This opt-in helper performs only the source phase. It neither audits axioms nor
claims kernel replay. It cleans only this project's build outputs, checks each
project dependency before releasing its dependents, and stops on any failure.
No successful project source build is resumed from an earlier invocation.
"""
from __future__ import annotations

import argparse
from contextlib import contextmanager
import fcntl
from graphlib import TopologicalSorter
import hashlib
import json
import os
from pathlib import Path
import resource
import shutil
import signal
import subprocess
import sys
import tempfile
import time
import tomllib

from plan_accepted_lean import EXTERNAL_NAMESPACES, accepted_inputs, check_layout, imports_of
from replay_lean import header_tokens, project_namespace, replay_plan

FACETS = (".olean", ".olean.server", ".olean.private")
CONFIG = ("lean/lean-toolchain", "lean/lakefile.toml", "lean/lake-manifest.json")
SCRIPT_INPUTS = (
    "scripts/replay_lean.py", "scripts/plan_accepted_lean.py",
    "scripts/build_lean_parallel.py", "scripts/replay_lean_parallel.py",
    "scripts/test_lean_parallel.py", "scripts/verify_lean_parallel_candidate.py",
    "scripts/verify_lean.sh",
)
MAX_WORKERS = 4
LEAN_COMMIT = "eb6cafb7290e8bd5f2937522d8d804f58f02bafc"


def sha256(path):
    with Path(path).open("rb") as stream:
        return hashlib.file_digest(stream, "sha256").hexdigest()


def write_json(path, value):
    temporary = path.with_suffix(path.suffix + ".tmp")
    temporary.write_text(json.dumps(value, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    temporary.replace(path)


def direct_file(path):
    if not path.is_file() or path.resolve() != path.absolute():
        raise ValueError(f"Missing or indirect input: {path}")


def git_head(repo):
    return subprocess.run(["git", "rev-parse", "HEAD"], cwd=repo, check=True,
        capture_output=True, text=True, timeout=30).stdout.strip()


def source_path(lean, module):
    return lean / (module.replace(".", "/") + ".lean")


def modern_module(path):
    return next(header_tokens(path.read_text(encoding="utf-8")), None) == "module"


def validate_graph(graph):
    missing = set().union(*graph.values()) - set(graph) if graph else set()
    if missing:
        raise ValueError(f"Dependency nodes are absent from the scheduled set: {sorted(missing)}")
    tuple(TopologicalSorter(graph).static_order())


def scope_plan(repo, modules, root=None):
    """Reuse the accepted-set validator and the strict existing header parser."""
    check_layout(repo)
    lean = repo / "lean"
    closure, prefixes = replay_plan(lean, modules, root)
    graph, external = {}, set()
    for module in sorted(closure):
        source = source_path(lean, module)
        direct_file(source)
        graph[module] = set()
        for imported in imports_of(source):
            local = source_path(lean, imported)
            if local.exists() or project_namespace(imported) is not None:
                direct_file(local)
                if imported not in closure:
                    raise ValueError(f"Project import outside the selected closure: {imported}")
                graph[module].add(imported)
            elif imported.split(".", 1)[0] not in EXTERNAL_NAMESPACES:
                raise ValueError(f"Unknown external import: {imported}")
            else:
                external.add(imported)
    validate_graph(graph)
    extra = set()
    if root is None:
        accepted, _ = accepted_inputs(repo)
        expected = {"lean/" + m.replace(".", "/") + ".lean" for m in graph}
        if accepted != expected | {"lean/ProofAudit.lean"}:
            raise ValueError("ProofAudit adds unregistered project sources")
        extra.add("lean/ProofAudit.lean")
    return graph, prefixes, external, extra


def snapshot_inputs(repo, graph, extra=()):
    names = set(CONFIG) | set(extra)
    names.update("lean/" + m.replace(".", "/") + ".lean" for m in graph)
    names.update(name for name in SCRIPT_INPUTS if (repo / name).is_file())
    result = {}
    for name in sorted(names):
        direct_file(repo / name)
        result[name] = sha256(repo / name)
    return result


def assert_inputs(repo, inputs, head):
    if git_head(repo) != head:
        raise ValueError("Checkout HEAD changed during verification")
    for name, expected in inputs.items():
        direct_file(repo / name)
        if sha256(repo / name) != expected:
            raise ValueError(f"Input changed during verification: {name}")


def object_hashes(lean, objects, module):
    paths = {facet: objects / (module.replace(".", "/") + facet) for facet in FACETS}
    if any(path.is_symlink() for path in paths.values()):
        raise ValueError(f"Indirect object facet: {module}")
    # Stock LeanChecker opens private data only after finding the server facet.
    # Even a legacy source must not have a silently ignored partial pair.
    if paths[".olean.server"].exists() != paths[".olean.private"].exists():
        raise ValueError(f"Incomplete server/private object-facet pair: {module}")
    required = FACETS if modern_module(source_path(lean, module)) else FACETS[:1]
    result = {}
    for facet, path in paths.items():
        if path.exists() or facet in required:
            direct_file(path)
            result[facet] = sha256(path)
    return result


@contextmanager
def gate_lock(lean):
    lake = lean / ".lake"
    lake.mkdir(exist_ok=True)
    if lake.resolve() != lake:
        raise ValueError("The project's .lake directory must not be indirect")
    path = lake / "parallel-gate.lock"
    if path.is_symlink():
        raise ValueError("Indirect scheduler lock")
    with path.open("a+") as lock:
        try:
            fcntl.flock(lock, fcntl.LOCK_EX | fcntl.LOCK_NB)
        except BlockingIOError as error:
            raise ValueError("Another bounded source/replay helper holds the project lock") from error
        try:
            yield
        finally:
            fcntl.flock(lock, fcntl.LOCK_UN)


def process_tree_stats(pid):
    """Include children spawned by every worker thread, not just the main TID."""
    pending, seen = [pid], set()
    rss = high_water = threads = count = 0
    while pending:
        current = pending.pop()
        if current in seen:
            continue
        seen.add(current)
        proc = Path(f"/proc/{current}")
        try:
            status = (proc / "status").read_text()
        except (FileNotFoundError, ProcessLookupError):
            continue
        fields = {line.split(":", 1)[0]: line.split(":", 1)[1].strip()
                  for line in status.splitlines() if ":" in line}
        rss += int(fields.get("VmRSS", "0").split()[0])
        high_water += int(fields.get("VmHWM", "0").split()[0])
        threads += int(fields.get("Threads", "0"))
        count += 1
        for children in (proc / "task").glob("*/children"):
            try:
                pending.extend(map(int, children.read_text().split()))
            except (FileNotFoundError, ProcessLookupError):
                pass
    return {"rss_kib": rss, "high_water_sum_kib": high_water,
            "threads": threads, "processes": count}


def stop_processes(processes):
    live = [p for p in processes if p.poll() is None]
    for process in live:
        try:
            os.killpg(process.pid, signal.SIGTERM)
        except ProcessLookupError:
            pass
    deadline = time.monotonic() + 1.0
    while live and time.monotonic() < deadline:
        live = [p for p in live if p.poll() is None]
        if live:
            time.sleep(0.02)
    for process in live:
        try:
            os.killpg(process.pid, signal.SIGKILL)
        except ProcessLookupError:
            pass
    for process in processes:
        process.wait()


def run_dag(graph, command_for, *, cwd, env, output, jobs, memory_limit_mib,
            records, timeout_seconds=21600, metrics=None,
            before_start=lambda _: None, after_success=lambda _m, _r: None):
    if not 1 <= jobs <= MAX_WORKERS or memory_limit_mib <= 0 or timeout_seconds <= 0:
        raise ValueError("Invalid source resource bound")
    validate_graph(graph)
    sorter = TopologicalSorter(graph)
    sorter.prepare()
    ready, active = [], {}
    if metrics is None:
        metrics = {}
    metrics.update(peak_active_builds=0, sampled_peak_rss_kib=0,
                   sampled_peak_processes=0, sampled_peak_threads=0)
    phase_started = time.monotonic()
    try:
        while sorter.is_active() or active:
            if time.monotonic() - phase_started > timeout_seconds:
                raise RuntimeError("Source phase exceeded its timeout")
            ready.extend(sorter.get_ready())
            ready.sort()
            while ready and len(active) < jobs:
                module = ready.pop(0)
                before_start(module)
                command = command_for(module)
                log = output / (module + ".log")
                stream = log.open("w", encoding="utf-8")
                try:
                    process = subprocess.Popen(command, cwd=cwd, env=env, stdout=stream,
                        stderr=subprocess.STDOUT, start_new_session=True)
                except BaseException:
                    stream.close()
                    raise
                active[module] = (process, stream, log, command, time.monotonic(), 0)
                metrics["peak_active_builds"] = max(metrics["peak_active_builds"], len(active))
            total_rss = total_threads = total_processes = 0
            finished = []
            for module, item in list(active.items()):
                process, stream, log, command, started, peak = item
                stats = process_tree_stats(process.pid)
                total_rss += stats["rss_kib"]
                total_threads += stats["threads"]
                total_processes += stats["processes"]
                peak = max(peak, stats["high_water_sum_kib"])
                active[module] = (process, stream, log, command, started, peak)
                if process.poll() is not None:
                    finished.append(module)
            metrics["sampled_peak_rss_kib"] = max(metrics["sampled_peak_rss_kib"], total_rss)
            metrics["sampled_peak_threads"] = max(metrics["sampled_peak_threads"], total_threads)
            metrics["sampled_peak_processes"] = max(metrics["sampled_peak_processes"], total_processes)
            if total_rss > memory_limit_mib * 1024:
                raise RuntimeError(f"Source processes exceeded {memory_limit_mib} MiB RSS limit")
            failed = [m for m in finished if active[m][0].returncode != 0]
            for module in finished:
                process, stream, log, command, started, peak = active.pop(module)
                stream.close()
                record = {"module": module, "command": command, "exit_code": process.returncode,
                    "elapsed_seconds": time.monotonic() - started,
                    "sampled_peak_process_tree_high_water_kib": peak,
                    "log": str(log), "log_sha256": sha256(log)}
                records.append(record)
                if process.returncode == 0:
                    after_success(module, record)
                print(json.dumps({"module": module, "exit_code": process.returncode,
                                  "elapsed_seconds": record["elapsed_seconds"]}), flush=True)
            if failed:
                raise RuntimeError("Source build failed: " + ", ".join(failed))
            for module in finished:
                sorter.done(module)
            if active:
                time.sleep(0.05)
        return metrics
    finally:
        if active:
            stop_processes([item[0] for item in active.values()])
            for module, item in active.items():
                process, stream, log, command, started, peak = item
                stream.close()
                records.append({"module": module, "command": command, "exit_code": process.returncode,
                    "cancelled": True, "elapsed_seconds": time.monotonic() - started,
                    "sampled_peak_process_tree_high_water_kib": peak,
                    "log": str(log), "log_sha256": sha256(log)})


def output_directory(lean, requested, prefix):
    if requested is None:
        return Path(tempfile.mkdtemp(prefix=prefix, dir=lean / ".lake"))
    path = requested.absolute()
    if path.resolve().is_relative_to(lean / ".lake/build"):
        raise ValueError("Verification output must be outside the project build directory")
    if path.exists() or path.is_symlink():
        raise ValueError("Output directory must be new; prior results are never resumed")
    path.mkdir(parents=True)
    if path.resolve() != path:
        raise ValueError("Output directory must not be indirect")
    return path


def main(argv=None):
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--lean-dir", type=Path, default=Path(__file__).resolve().parent.parent / "lean")
    parser.add_argument("--root")
    parser.add_argument("--jobs", type=int, choices=range(1, MAX_WORKERS + 1), default=2)
    parser.add_argument("--memory-limit-mib", type=int, default=12288)
    parser.add_argument("--timeout-seconds", type=float, default=21600)
    parser.add_argument("--output-dir", type=Path)
    parser.add_argument("--dry-run", action="store_true")
    parser.add_argument("modules", nargs="*")
    args = parser.parse_args(argv)
    lean = args.lean_dir.resolve()
    repo = lean.parent
    graph, prefixes, external, extra = scope_plan(repo, args.modules, args.root)
    if args.dry_run:
        print(json.dumps({"mode": "candidate" if args.root else "accepted", "root": args.root,
            "jobs": args.jobs, "project_modules": sorted(graph),
            "dependencies": {m: sorted(ds) for m, ds in graph.items()}, "checker_prefixes": prefixes},
            indent=2))
        return 0
    if not Path("/proc/self/status").is_file():
        raise ValueError("Source resource guards require Linux /proc")
    with gate_lock(lean):
        output = output_directory(lean, args.output_dir, "parallel-source-")
        receipt = {"status": "running", "phase": "source", "root": args.root,
            "mode": "candidate" if args.root else "accepted", "jobs": args.jobs,
            "memory_limit_mib": args.memory_limit_mib, "timeout_seconds": args.timeout_seconds,
            "project_modules": sorted(graph), "dependencies": {m: sorted(ds) for m, ds in graph.items()},
            "source_results": [], "prelude": {}, "metrics": {}, "output_directory": str(output),
            "claims_axiom_audit": False, "claims_kernel_replay": False}
        started = time.monotonic()
        try:
            head = git_head(repo)
            inputs = snapshot_inputs(repo, graph, extra)
            receipt.update(git_head=head, input_sha256=inputs)
            lake_name = shutil.which("lake")
            if lake_name is None:
                raise ValueError("Pinned Lake is unavailable")
            # Keep argv[0] intact if PATH contains an elan dispatcher symlink.
            lake = str(Path(lake_name).absolute())
            receipt.update(lake_path=lake, lake_sha256=sha256(lake))
            env = os.environ.copy()
            env["LEAN_NUM_THREADS"] = "1"

            def prelude(label, command, timeout):
                record = {"results": [], "metrics": {}}
                receipt["prelude"][label] = record
                run_dag({label: set()}, lambda _: command, cwd=lean, env=env,
                    output=output, jobs=1, memory_limit_mib=args.memory_limit_mib,
                    timeout_seconds=timeout, records=record["results"], metrics=record["metrics"])
                return (output / (label + ".log")).read_text()

            version = prelude("toolchain", [lake, "env", "lean", "--version"], 60).strip()
            if "version 4.35.0," not in version or LEAN_COMMIT not in version:
                raise ValueError("Lake selected a different Lean toolchain")
            prefix = prelude("toolchain-prefix", [lake, "env", "lean", "--print-prefix"], 60).strip()
            compiler = (Path(prefix) / "bin/lean").resolve()
            direct_file(compiler)
            receipt.update(lean_version=version, compiler_path=str(compiler),
                           compiler_sha256=sha256(compiler))
            targets = sorted(m for m in external if m.split(".", 1)[0]
                             not in {"Init", "Lean", "Std", "Lake"})
            if targets:
                prelude("external-preflight", [lake, "--no-cache", "--no-build", "build",
                    *["+" + m + ":olean" for m in targets]], 300)
            config = tomllib.loads((lean / "lakefile.toml").read_text())
            if config["name"] != "solved_conjectures":
                raise ValueError("Unexpected package name; refusing a package clean")
            build = lean / ".lake/build"
            if build.resolve() != build:
                raise ValueError("Refusing to clean an indirect project build directory")
            # Bare lake clean also deletes dependency builds and is never used.
            prelude("project-clean", [lake, "--no-cache", "clean", "solved_conjectures"], 120)
            objects = build / "lib/lean"
            if any((objects / (m.replace(".", "/") + f)).exists() for m in graph for f in FACETS):
                raise ValueError("Project objects survived the fresh-build clean")
            assert_inputs(repo, inputs, head)
            artifacts = {}

            def before(module):
                name = "lean/" + module.replace(".", "/") + ".lean"
                if sha256(repo / name) != inputs[name]:
                    raise ValueError(f"Source changed before its build: {module}")

            def after(module, record):
                before(module)
                artifacts[module] = object_hashes(lean, objects, module)
                record.update(artifact_sha256=artifacts[module],
                    source_sha256=inputs["lean/" + module.replace(".", "/") + ".lean"])

            run_dag(graph, lambda m: [lake, "--no-cache", "--wfail", "--fail-fast",
                    "build", "+" + m + ":olean"], cwd=lean, env=env, output=output,
                jobs=args.jobs, memory_limit_mib=args.memory_limit_mib,
                timeout_seconds=args.timeout_seconds, records=receipt["source_results"],
                metrics=receipt["metrics"], before_start=before, after_success=after)
            if set(artifacts) != set(graph):
                raise ValueError("Not every project module completed a fresh source build")
            assert_inputs(repo, inputs, head)
            for module, expected in artifacts.items():
                if object_hashes(lean, objects, module) != expected:
                    raise ValueError(f"Project artifacts changed after their build: {module}")
            if sha256(lake) != receipt["lake_sha256"] or sha256(compiler) != receipt["compiler_sha256"]:
                raise ValueError("Lake or the actual Lean compiler changed during source builds")
            receipt.update(status="passed", artifact_sha256=artifacts, all_inputs_unchanged=True,
                           fresh_project_build=True, source_module_count=len(graph))
        except BaseException as error:
            receipt.update(status="failed", error=f"{type(error).__name__}: {error}")
            raise
        finally:
            receipt.update(elapsed_seconds=time.monotonic() - started,
                           child_maxrss_kib=resource.getrusage(resource.RUSAGE_CHILDREN).ru_maxrss)
            write_json(output / "receipt.json", receipt)
            print(json.dumps({"status": receipt["status"], "phase": "source",
                              "receipt": str(output / "receipt.json")}), flush=True)
    return 0


def interrupted(signum, _frame):
    raise KeyboardInterrupt(f"signal {signum}")


if __name__ == "__main__":
    signal.signal(signal.SIGTERM, interrupted)
    try:
        raise SystemExit(main())
    except (OSError, ValueError, RuntimeError, subprocess.SubprocessError) as error:
        print(f"FAIL: {error}", file=sys.stderr)
        raise SystemExit(1) from error
