"""Strict source rebuild, repository all-owned audit, and pinned kernel replay.

This checks the four-module Steinerberger lane. Repository-wide registration,
documentation checks, and publication are separate integration obligations.
"""
from pathlib import Path
import hashlib
import json
import os
import subprocess
import sys
import time

BASE = Path(__file__).resolve().parent
REPO = Path('/tmp/cinna-lean-162051/repo')
TOOLCHAIN = Path('/workspace/scratch/e963d2f60a75/toolchain/lean-4.35.0-linux')
PACKAGES = Path('/workspace/scratch/e963d2f60a75/repo/lean/.lake/packages')
OVERLAY = Path('/tmp/cinna-lean-162051/dependency-overlay')
EVIDENCE = BASE / 'verification'
OUT = EVIDENCE / 'lib/lean'
EVIDENCE.mkdir(exist_ok=True)
OUT.mkdir(parents=True, exist_ok=True)
sys.path.insert(0, str(REPO / 'scripts'))
import audit_lean_all_owned as audit
import replay_lean
from replay_lean_parallel import CHECKER_SHA256, exact_replay_set

modules = [
    'Conjectures.SteinerbergerGreedySequence',
    'Conjectures.SteinerbergerGreedyFourier',
    'Conjectures.SteinerbergerGreedyGrowth',
    'Conjectures.SteinerbergerGreedy',
]
prefix = 'Conjectures.SteinerbergerGreedy.'
required = [prefix + name for name in [
    'kernel_pair', 'vdc_mem', 'vdc_minimizes', 'vdc_isGreedy',
    'rotatedSum_norm', 'rotatedSum_alternating', 'fourierSum_alternating_norm',
    'oddHarmonic_lower', 'frequency_injective', 'frequency_mem',
    'weightedSum_quadratic_lower', 'weightedSum_violates',
    'vdc_not_isBigO', 'conjecture_false', 'counterexample',
]]
assert replay_lean.local_closure(BASE, {modules[-1]}) == set(modules)
digest = lambda p: hashlib.sha256(p.read_bytes()).hexdigest()
assert digest(TOOLCHAIN / 'bin/leanchecker') == CHECKER_SHA256
source_hashes = {
    str(Path(module.replace('.', '/') + '.lean')):
    digest(BASE / (module.replace('.', '/') + '.lean'))
    for module in modules
}
env = os.environ.copy()
env.update(LEAN_NUM_THREADS='2', UV_USE_IO_URING='0', LEAN_SYSROOT=str(TOOLCHAIN))
env['PATH'] = str(TOOLCHAIN / 'bin') + os.pathsep + env['PATH']
env['LEAN_PATH'] = os.pathsep.join(map(str, [OUT, OVERLAY, *sorted(
    PACKAGES.glob('*/.lake/build/lib/lean'))]))
receipt = {
    'scope': 'Original universal greedy-energy O(log n) Fourier conjecture: actual infinite van der Corput counterexample',
    'status': 'running',
    'entry': 'results/steinerberger-greedy-fourier/',
    'documented_proof_commit': '34862f40d7a8b4ee923a5a9ea1f8a9de9a895e43',
    'source_sha256': source_hashes,
    'project_modules': modules,
    'required_theorems': required,
    'lean_sha256': digest(TOOLCHAIN / 'bin/lean'),
    'leanchecker_sha256': digest(TOOLCHAIN / 'bin/leanchecker'),
    'verification_script_sha256': digest(Path(__file__)),
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
    receipt = json.loads((EVIDENCE / 'receipt.json').read_text())
    (EVIDENCE / 'receipt-first-replay-attempt.json').write_text(json.dumps(receipt, indent=2) + '\n')
    receipt['status'] = 'running'
    receipt.pop('error', None)
    source_hashes = receipt['source_sha256']
    for source, expected in source_hashes.items():
        assert digest(BASE / source) == expected
    frozen_objects = {str(p.relative_to(OUT)): digest(p) for p in sorted(OUT.rglob('*.olean*'))}
    audit_file = EVIDENCE / 'AllOwnedAudit.lean'
    inventory_file = EVIDENCE / 'declaration-inventory.json'
    inventory = json.loads(inventory_file.read_text())
    kernel_log = run('kernel-retry', replay_lean.checker_command(['Conjectures']))
    receipt['exact_kernel_replay_set'] = exact_replay_set(kernel_log, modules)
    assert frozen_objects == {str(p.relative_to(OUT)): digest(p) for p in sorted(OUT.rglob('*.olean*'))}
    for source, expected in source_hashes.items():
        assert digest(BASE / source) == expected
    receipt['object_sha256'] = frozen_objects
    receipt['audit_source_sha256'] = digest(audit_file)
    receipt['declaration_inventory_sha256'] = digest(inventory_file)
    receipt['audit_summary'] = inventory['summary']
    receipt['retry_script_sha256'] = digest(Path(__file__))
    receipt['status'] = 'passed'
    save()
    print('PASS: refreshed citation source and exact stock kernel replay', flush=True)
except BaseException as error:
    receipt['status'] = 'failed'
    receipt['error'] = str(error)
    save()
    raise
