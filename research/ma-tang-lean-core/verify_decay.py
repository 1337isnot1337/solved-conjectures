#!/usr/bin/env python3
"""Strict scoped compilation, named-declaration axiom check and replay."""
import hashlib
import os
from pathlib import Path
import re
import shutil
import subprocess
import tempfile

root = Path(__file__).resolve().parents[2]
modules = ["MaTangCoreBalance", "MaTangCoreIndexed", "MaTangCoreMatrix", "MaTangCoreOccupancy", "MaTangCoreSubspace", "MaTangCoreRank", "MaTangCoreGenerator", "MaTangCoreDecay"]
names = []
version = subprocess.check_output(["lean", "--version"], text=True).strip()
print("Lean version:", version, flush=True)
assert "version 4.35.0," in version
with tempfile.TemporaryDirectory(prefix="ma-tang-indexed-") as tmp:
    path = Path(tmp)
    (path / "Conjectures").mkdir()
    env = {**os.environ, "LEAN_PATH": str(path), "LEAN_NUM_THREADS": "1"}
    for module in modules:
        source = root / f"lean/Conjectures/{module}.lean"
        local = path / f"Conjectures/{module}.lean"
        text = source.read_text()
        code = re.sub(r"/-.*?-/", "", text, flags=re.S)
        code = re.sub(r"--[^\n]*", "", code)
        assert not re.search(r"\b(sorry|admit|native_decide)\b", code)
        ds = re.findall(r"^(?:noncomputable )?(?:def|theorem|lemma|abbrev|structure) ([A-Za-z][A-Za-z_0-9]*)\b", text, re.M)
        names.extend(f"{module}.{n}" for n in ds)
        print(module, "SHA256:", hashlib.sha256(source.read_bytes()).hexdigest(), flush=True)
        shutil.copyfile(source, local)
        subprocess.run(["lean", "-j1", "-M600", "-DwarningAsError=true",
                        "-o", str(local.with_suffix(".olean")), str(local)],
                       cwd=path, env=env, check=True)
    assert "MaTangCoreGenerator.goodGenerator_iff_injective" in names
    assert "MaTangCoreGenerator.badGenerator_scaled_bound" in names
    assert "MaTangCoreDecay.occupancy_scaled_decay" in names
    assert "MaTangCoreDecay.targetDimension_dyadic" in names
    assert "MaTangCoreSubspace.exists_encoding" in names
    assert "MaTangCoreRank.encoding_rank_nullity" in names
    assert "MaTangCoreRank.mixed_coverage_actual_kernel" in names
    assert "MaTangCoreOccupancy.successful_word_count_le" in names
    assert "MaTangCoreOccupancy.singleton_union_word_count_le" in names
    assert "MaTangCoreOccupancy.nodup_words" in names
    assert "MaTangCoreMatrix.exists_missing_matrix_pair" in names
    assert "MaTangCoreMatrix.not_covers_of_matrix_kernel" in names
    assert "MaTangCoreIndexed.not_covers_of_type_fibers" in names
    assert "MaTangCoreIndexed.exists_ordered_constant_fiber" in names
    print("PASS: strict source compilation", flush=True)
    audit = path / "Audit.lean"
    audit.write_text("import Conjectures.MaTangCoreDecay\n" +
                     "".join(f"#print axioms {n}\n" for n in names))
    output = subprocess.check_output(["lean", "-j1", "-M600", "-DwarningAsError=true", str(audit)],
                                     cwd=path, env=env, text=True)
    print(output, end="", flush=True)
    allowed = {"propext", "Classical.choice", "Quot.sound"}
    lines = output.splitlines()
    assert len(lines) == len(names)
    for name, line in zip(names, lines):
        assert line.startswith("'" + name + "'"), line
        if "depends on axioms:" in line:
            assert set(re.search(r"\[(.*?)\]", line)[1].split(", ")) <= allowed, line
        else:
            assert "does not depend on any axioms" in line, line
    print(f"PASS: transitive axiom check of all {len(names)} source-named declarations", flush=True)
    for module in modules:
        subprocess.run(["leanchecker", "Conjectures." + module], cwd=path, env=env, check=True)
    print("PASS: stock kernel replay of all eight scoped modules", flush=True)
