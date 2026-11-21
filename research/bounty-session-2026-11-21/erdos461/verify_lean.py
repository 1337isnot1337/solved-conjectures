#!/usr/bin/env python3
"""Check the auxiliary arithmetic file using an existing local Lean/Mathlib build."""
from __future__ import annotations
import argparse
import hashlib
import json
import os
from pathlib import Path
import subprocess

parser = argparse.ArgumentParser()
parser.add_argument('--lean-binary', type=Path, required=True)
parser.add_argument('--lean-project', type=Path, required=True)
args = parser.parse_args()
folder = Path(__file__).resolve().parent
source = folder / 'ResidueReduction.lean'
packages = args.lean_project.resolve() / '.lake' / 'packages'
lean_paths = sorted(str(p / '.lake' / 'build' / 'lib' / 'lean') for p in packages.iterdir() if p.is_dir())
if not lean_paths:
    raise SystemExit('No built dependency directories found.')
env = os.environ.copy()
env['LEAN_PATH'] = ':'.join(lean_paths)
command = [str(args.lean_binary.resolve()), str(source)]
version = subprocess.run([command[0], '--version'], check=True, capture_output=True, text=True).stdout.strip()
run = subprocess.run(command, env=env, text=True, capture_output=True, timeout=120)
log = run.stdout + run.stderr
(folder / 'lean-output.txt').write_text(log)
record = {
    'exit_code': run.returncode,
    'toolchain': version,
    'scope': 'auxiliary prime-power profile/gcd equivalence, admissible factorial modulus and profile periodicity; not the bounty target',
    'source_sha256': hashlib.sha256(source.read_bytes()).hexdigest(),
    'sorry_ax_present': 'sorryAx' in log,
    'command': command,
    'lean_path': env['LEAN_PATH'],
}
(folder / 'lean-check.json').write_text(json.dumps(record, indent=2) + '\n')
print(log, end='')
if run.returncode != 0 or record['sorry_ax_present']:
    raise SystemExit(1)
