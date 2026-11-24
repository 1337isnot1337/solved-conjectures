#!/usr/bin/env python3
"""Replay the checked, Init-only Ma–Tang grouped-fiber component.

This is a scoped verification, not a verification of the full conjecture,
the uncompiled Mathlib drafts, or the repository-wide accepted proof set.
Run with the repository's pinned Lean 4.35.0 and leanchecker on PATH.
"""
import hashlib
import os
from pathlib import Path
import re
import shutil
import subprocess
import tempfile

root = Path(__file__).resolve().parents[2]
source = root / "lean/Conjectures/MaTangCoreBalance.lean"
module = "Conjectures.MaTangCoreBalance"
names = re.findall(
    r"^(?:noncomputable )?(?:def|theorem|lemma|abbrev) ([A-Za-z][A-Za-z_0-9]*)\b",
    source.read_text(), re.M,
)
assert "exists_grouped_constant_fiber" in names
assert "decorate_balanced" in names
print("Lean version:", subprocess.check_output(["lean", "--version"], text=True).strip(), flush=True)
assert "version 4.35.0," in subprocess.check_output(["lean", "--version"], text=True)
print("Source SHA256:", hashlib.sha256(source.read_bytes()).hexdigest(), flush=True)
with tempfile.TemporaryDirectory(prefix="ma-tang-core-") as tmp:
    path = Path(tmp)
    local = path / "Conjectures/MaTangCoreBalance.lean"
    local.parent.mkdir()
    shutil.copyfile(source, local)
    env = {**os.environ, "LEAN_PATH": str(path), "LEAN_NUM_THREADS": "1"}
    subprocess.run(
        ["lean", "-j1", "-M600", "-DwarningAsError=true", "-o",
         str(local.with_suffix(".olean")), str(local)],
        cwd=path, env=env, check=True,
    )
    print("PASS: strict source compilation", flush=True)
    audit = path / "Audit.lean"
    audit.write_text(
        "import " + module + "\n" +
        "".join("#print axioms MaTangCoreBalance." + n + "\n" for n in names)
    )
    output = subprocess.check_output(
        ["lean", "-j1", "-M600", "-DwarningAsError=true", str(audit)],
        cwd=path, env=env, text=True,
    )
    print(output, end="", flush=True)
    allowed = {"propext", "Classical.choice", "Quot.sound"}
    lines = output.splitlines()
    assert len(lines) == len(names), (len(lines), len(names))
    for name, line in zip(names, lines):
        assert line.startswith("'MaTangCoreBalance." + name + "'"), line
        if "depends on axioms:" in line:
            axioms = set(re.search(r"\[(.*?)\]", line)[1].split(", "))
            assert axioms <= allowed, line
        else:
            assert "does not depend on any axioms" in line, line
    print(f"PASS: transitive axiom check of all {len(names)} source-named declarations", flush=True)
    subprocess.run(["leanchecker", module], cwd=path, env=env, check=True)
    print("PASS: stock kernel replay of the scoped module", flush=True)
