#!/usr/bin/env python3
"""Strict source builds, all-owned axiom audit, and exact kernel replay."""
import hashlib
import json
import os
from pathlib import Path
import re
import shutil
import subprocess
import tempfile

root = Path(__file__).resolve().parents[2]
target = "Conjectures.MaTangCoreUpperDistinct"
template = Path(__file__).with_name("audit_upper_dyadic.template")
mods = []

def source(module):
    return root / "lean" / (module.replace(".", "/") + ".lean")

def closure(module):
    if module in mods:
        return
    code = source(module).read_text()
    for dep in re.findall(r"^import (Conjectures\.\w+)$", code, re.M):
        closure(dep)
    mods.append(module)

closure(target)
assert "Conjectures.MaTangCoreUpperDyadic" in mods
version = subprocess.check_output(["lean", "--version"], text=True)
assert "version 4.35.0," in version
print(version.strip(), flush=True)
with tempfile.TemporaryDirectory(prefix="ma-tang-upper-") as tmp:
    work = Path(tmp)
    env = {**os.environ, "LEAN_PATH": tmp, "LEAN_NUM_THREADS": "1"}
    for m in mods:
        p = source(m)
        b = p.read_bytes()
        c = re.sub(r"/-.*?-/", "", b.decode(), flags=re.S)
        c = re.sub(r"--[^\n]*", "", c)
        assert not re.search(r"\b(sorry|admit|native_decide|axiom)\b", c), m
        f = work / (m.replace(".", "/") + ".lean")
        f.parent.mkdir(parents=True, exist_ok=True)
        shutil.copyfile(p, f)
        subprocess.run(["lean", "-j1", "-M650", "-DwarningAsError=true",
                        "-o", str(f.with_suffix(".olean")), str(f)],
                       cwd=work, env=env, check=True)
        print("strict", m, hashlib.sha256(b).hexdigest(), flush=True)
    audit = work / "Audit.lean"
    audit.write_text(template.read_text().replace(
        "@@MODULES@@", "#[" + ", ".join(map(json.dumps, mods)) + "]"))
    subprocess.run(["lean", "-j1", "-M850", "-DwarningAsError=true", str(audit)],
                   cwd=work, env=env, check=True)
    for m in mods:
        subprocess.run(["leanchecker", m], cwd=work, env=env, check=True)
        print("stock", m, flush=True)
    print(f"PASS exact {len(mods)}-module closure", flush=True)
