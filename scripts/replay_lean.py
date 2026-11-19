#!/usr/bin/env python3
"""Run the pinned leanchecker on exactly the accepted project modules.

The checker scans its whole search path once per target. Stage the accepted
objects under the two project namespaces so two prefix targets suffice. The
checker executable and its proof-replay implementation are unchanged.
"""

from pathlib import Path
import os
import re
import subprocess
import sys
import tempfile


def main():
    lean = Path(__file__).resolve().parent.parent / "lean"
    build = lean / ".lake/build/lib/lean"
    modules = sys.argv[1:]
    if not modules or len(modules) != len(set(modules)):
        raise SystemExit("Expected a nonempty list of distinct accepted modules")
    if any(not re.fullmatch(r"(?:Solitaire|Conjectures)\.[A-Za-z0-9_.]+", m)
           for m in modules):
        raise SystemExit("Unexpected accepted module name")

    # A missing replay-list entry must fail, even if its object is cached.
    closure = set()

    def visit(module):
        source = lean / (module.replace(".", "/") + ".lean")
        if module in closure or not source.is_file():
            return
        closure.add(module)
        for line in source.read_text().splitlines():
            if line.startswith("import "):
                for imported in line.split()[1:]:
                    visit(imported)

    roots = {"Solitaire", "Conjectures"}
    for root in roots:
        visit(root)
    expected = closure - roots
    if set(modules) != expected:
        missing = sorted(expected - set(modules))
        extra = sorted(set(modules) - expected)
        raise SystemExit(f"Replay/import mismatch: missing={missing}; extra={extra}")

    search_path = os.environ.get("LEAN_PATH", "").split(os.pathsep)
    project_entries = [i for i, path in enumerate(search_path)
                       if path and Path(path).resolve() == build.resolve()]
    if not project_entries:
        raise SystemExit("Run this helper through lake env from the Lean package")

    with tempfile.TemporaryDirectory(prefix="accepted-replay-", dir=lean / ".lake/build") as tmp:
        staged = Path(tmp)
        for module in sorted(closure):
            stem = module.replace(".", "/")
            for suffix in (".olean", ".olean.server", ".olean.private"):
                source = build / (stem + suffix)
                target = staged / (stem + suffix)
                if not source.is_file():
                    if suffix == ".olean":
                        raise SystemExit(f"Missing accepted object: {source}")
                    continue
                target.parent.mkdir(parents=True, exist_ok=True)
                os.link(source, target)
        for i in project_entries:
            search_path[i] = str(staged)
        environment = os.environ.copy()
        environment["LEAN_PATH"] = os.pathsep.join(search_path)
        environment["LEAN_NUM_THREADS"] = "1"
        print(f"Replaying {len(modules)} accepted proof modules and {len(roots)} roots", flush=True)
        result = subprocess.run(["leanchecker", "-v", "Solitaire", "Conjectures"],
                                cwd=lean, env=environment, check=False)
        if result.returncode:
            raise SystemExit(result.returncode)
        print("PASS: every accepted module completed the pinned kernel replay", flush=True)


if __name__ == "__main__":
    main()
