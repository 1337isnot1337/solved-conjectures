"""Strictly rebuild, audit, and replay the registered Steinerberger proof.

Run from the Lean package through `lake env python3` so the pinned compiler
and dependency search paths are available. Outputs are isolated from Lake.
This scoped gate never substitutes for the full repository gate.
"""
from pathlib import Path
import hashlib
import json
import os
import subprocess
import shutil
import sys
import time

REPO = Path(__file__).resolve().parents[1]
BASE = REPO / 'lean'
EVIDENCE = REPO / '.candidate-artifacts/steinerberger-feldheim'
OUT = EVIDENCE / 'lib/lean'
EVIDENCE.mkdir(parents=True, exist_ok=True)
OUT.mkdir(parents=True, exist_ok=True)
LEAN_BIN = shutil.which('lean')
CHECKER_BIN = shutil.which('leanchecker')
if not LEAN_BIN or not CHECKER_BIN or not os.environ.get('LEAN_PATH'):
    raise SystemExit('Run from lean/ with lake env python3 ../scripts/verify_steinerberger_feldheim.py')
sys.path.insert(0, str(REPO / 'scripts'))
import audit_lean_all_owned as audit
import replay_lean
from replay_lean_parallel import CHECKER_SHA256, exact_replay_set

modules = [
    'Conjectures.SteinerbergerFeldheimAnalysis',
    'Conjectures.SteinerbergerFeldheimLaw',
    'Conjectures.SteinerbergerFeldheimJoint',
    'Conjectures.SteinerbergerFeldheim',
]
prefix = 'Conjectures.SteinerbergerFeldheim.'
required = [prefix + name for name in [
    'tailIntegral_le', 'law_univ', 'law_absolutelyContinuous', 'law_unbounded',
    'law_integrable_id', 'law_mean', 'median_lower_half', 'median_upper_half',
    'eventRatio_eq', 'coordinates_independent', 'coordinates_identically_distributed',
    'law_median_unique', 'law_not_compactly_supported',
    'median_bound_fails_for_every_median', 'mean_bound_fails',
    'medianGuess_false', 'meanGuess_false', 'counterexample',
]]
assert replay_lean.local_closure(BASE, {modules[-1]}) == set(modules)
digest = lambda p: hashlib.sha256(p.read_bytes()).hexdigest()
assert digest(Path(CHECKER_BIN)) == CHECKER_SHA256
source_hashes = {
    str(Path(module.replace('.', '/') + '.lean')):
    digest(BASE / (module.replace('.', '/') + '.lean'))
    for module in modules
}
registered = audit.accepted_spec(REPO)
assert set(modules) <= set(registered['modules'])
assert set(required) <= set(registered['required'])
controls = [Path(__file__), REPO / 'scripts/audit_lean_all_owned.py',
            REPO / 'scripts/replay_lean.py', REPO / 'scripts/replay_lean_parallel.py',
            BASE / 'lean-toolchain', BASE / 'lake-manifest.json', BASE / 'lakefile.toml']
control_hashes = {str(p.relative_to(REPO)): digest(p) for p in controls}
env = os.environ.copy()
env.update(LEAN_NUM_THREADS='1', UV_USE_IO_URING='0')
project_build = (BASE / '.lake/build/lib/lean').resolve()
dependencies = [Path(p).resolve() for p in env['LEAN_PATH'].split(os.pathsep)
                if p and Path(p).resolve() not in {project_build, BASE.resolve(), OUT.resolve()}]
env['LEAN_PATH'] = os.pathsep.join(map(str, [OUT, *dependencies]))
receipt = {
    'scope': 'Both original existential quantitative Feldheim-tail conjectures, one common law',
    'status': 'running',
    'entry': 'results/steinerberger-feldheim-tail/',
    'documented_proof_commit': '6a8c0b0ac8c5a903405782b0a0df03c9ad78cdc6',
    'source_sha256': source_hashes,
    'project_modules': modules,
    'required_theorems': required,
    'lean_sha256': digest(Path(LEAN_BIN)),
    'leanchecker_sha256': digest(Path(CHECKER_BIN)),
    'verification_script_sha256': digest(Path(__file__)),
    'control_sha256': control_hashes,
    'steps': [],
    'repository_wide_gate_claimed': False,
}

def save():
    (EVIDENCE / 'receipt.json').write_text(json.dumps(receipt, indent=2) + '\n')

def run(label, command):
    start = time.monotonic()
    log = EVIDENCE / (label + '.log')
    print('+ ' + ' '.join(map(str, command)), flush=True)
    with log.open('w') as output:
        process = subprocess.Popen(list(map(str, command)), cwd=BASE, env=env,
                                   stdout=output, stderr=subprocess.STDOUT)
        while True:
            try:
                code = process.wait(timeout=30)
                break
            except subprocess.TimeoutExpired:
                elapsed = time.monotonic() - start
                print(f'{label}: {elapsed:.1f}s elapsed', flush=True)
                if elapsed >= 900:
                    process.terminate()
                    try:
                        process.wait(timeout=5)
                    except subprocess.TimeoutExpired:
                        process.kill()
                        process.wait()
                    code = 124
                    break
    receipt['steps'].append({'label': label, 'command': list(map(str, command)),
        'exit_code': code, 'seconds': round(time.monotonic() - start, 3),
        'log_sha256': digest(log)})
    save()
    if code:
        print(log.read_text()[-12000:], flush=True)
        raise RuntimeError(f'{label} failed: {code}')
    print(f'PASS {label}: {time.monotonic() - start:.1f}s', flush=True)
    return log.read_text()

try:
    save()
    receipt['lean_version'] = run('version', [LEAN_BIN, '--version']).strip()
    assert 'version 4.35.0,' in receipt['lean_version']
    for module in modules:
        source = Path(module.replace('.', '/') + '.lean')
        target = OUT / source.with_suffix('.olean')
        target.parent.mkdir(parents=True, exist_ok=True)
        run(module + '.source', [LEAN_BIN, '-j1', '-M4500', '-DwarningAsError=true',
                                '-o', target, source])
        assert digest(BASE / source) == source_hashes[str(source)]
    audit_file = EVIDENCE / 'AllOwnedAudit.lean'
    audit_file.write_text(audit.audit_source(modules, required, []))
    log = run('all-owned-audit', [LEAN_BIN, '-j1', '-M4500', '-DwarningAsError=true', audit_file])
    spec = {'modules': modules, 'required': required, 'legacy_prefixes': []}
    inventory = audit.validate_log(log, spec, {m: False for m in modules})
    inventory_file = EVIDENCE / 'declaration-inventory.json'
    inventory_file.write_text(json.dumps(inventory, indent=2) + '\n')
    frozen_objects = {str(p.relative_to(OUT)): digest(p) for p in sorted(OUT.rglob('*.olean*'))}
    kernel_log = run('kernel', replay_lean.checker_command(['Conjectures']))
    receipt['exact_kernel_replay_set'] = exact_replay_set(kernel_log, modules)
    assert frozen_objects == {str(p.relative_to(OUT)): digest(p) for p in sorted(OUT.rglob('*.olean*'))}
    for source, expected in source_hashes.items():
        assert digest(BASE / source) == expected
    assert control_hashes == {str(p.relative_to(REPO)): digest(p) for p in controls}
    receipt['object_sha256'] = frozen_objects
    receipt['audit_source_sha256'] = digest(audit_file)
    receipt['declaration_inventory_sha256'] = digest(inventory_file)
    receipt['audit_summary'] = inventory['summary']
    receipt['status'] = 'passed'
    save()
    print('PASS: strict source rebuild, complete all-owned/private audit, exact stock kernel replay', flush=True)
except BaseException as error:
    receipt['status'] = 'failed'
    receipt['error'] = str(error)
    save()
    raise
