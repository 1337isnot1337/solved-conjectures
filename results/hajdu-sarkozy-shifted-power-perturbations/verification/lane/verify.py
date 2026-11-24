"""Strict source rebuild, repository all-owned audit, and pinned kernel replay.

This checks the eleven-module Hajdu–Sárközy lane. Repository-wide registration,
documentation checks, and publication are separate integration obligations.
"""
from pathlib import Path
import hashlib
import fcntl
import signal
from datetime import datetime, timezone
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
    'Conjectures.HajduSarkozyArithmetic',
    'Conjectures.HajduSarkozyIncidence',
    'Conjectures.HajduSarkozyAsymptotics',
    'Conjectures.HajduSarkozyCounts',
    'Conjectures.HajduSarkozyBins',
    'Conjectures.HajduSarkozyMatrix',
    'Conjectures.HajduSarkozyProduct',
    'Conjectures.HajduSarkozyCommon',
    'Conjectures.HajduSarkozyDensity',
    'Conjectures.HajduSarkozyFactors',
    'Conjectures.HajduSarkozy',
]
prefix = 'Conjectures.HajduSarkozy.'
required = [prefix + name for name in [
    'no_thin_four_cycle', 'edge_card_le', 'filter_product_card_le',
    'doublePrefix_isLittleO', 'half_square_isLittleO', 'mem_realPrefix',
    'sparse_finite', 'product_bin_indices', 'thin_bin_edge_card_le',
    'triangleSum_isLittleO', 'large_product_count_le_triangle',
    'product_grid_isLittleO', 'commonPowers_grid_bound', 'factor_count_bound',
    'factor_binMass_isLittleO', 'shiftedPowers_not_grid_isLittleO',
    'no_product_of_sparse_error', 'shiftedPowerPerturbations',
    'original_shifted_finite_difference', 'hajdu_sarkozy_conjecture',
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
    'scope': 'Every exponent k≥2, every nonzero integral shift, every o(X^(1/k)) symmetric-difference perturbation, and every finite modification; original root-zero convention included',
    'status': 'running',
    'entry': 'results/hajdu-sarkozy-shifted-power-perturbations/',
    'documented_proof_commit': '83c325ae559864ec0b5e916d90a342b50a81de7f',
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

def utc():
    return datetime.now(timezone.utc).isoformat()

def stop(process):
    if process.poll() is not None:
        return
    os.killpg(process.pid, signal.SIGTERM)
    try:
        process.wait(timeout=5)
    except subprocess.TimeoutExpired:
        os.killpg(process.pid, signal.SIGKILL)
        process.wait()

def run(label, command):
    start = time.monotonic()
    started = utc()
    log = EVIDENCE / (label + '.log')
    print(started + ' START ' + label, flush=True)
    print('+ ' + ' '.join(map(str, command)), flush=True)
    error = None
    timed_out = False
    with log.open('w') as output:
        process = subprocess.Popen(list(map(str, command)), cwd=BASE, env=env,
            stdout=output, stderr=subprocess.STDOUT, close_fds=True, start_new_session=True)
        try:
            while True:
                try:
                    code = process.wait(timeout=10)
                    break
                except subprocess.TimeoutExpired:
                    elapsed = time.monotonic() - start
                    detail = ''
                    try:
                        st = Path(f'/proc/{process.pid}/stat').read_text().split()
                        cpu = (int(st[13]) + int(st[14])) / os.sysconf('SC_CLK_TCK')
                        status = Path(f'/proc/{process.pid}/status').read_text().splitlines()
                        rss = next((line for line in status if line.startswith('VmRSS:')), 'VmRSS: unknown')
                        detail = f' cpu={cpu:.1f}s {rss}'
                    except (FileNotFoundError, ProcessLookupError, PermissionError):
                        pass
                    print(f'{utc()} {label}: {elapsed:.1f}s elapsed{detail}', flush=True)
                    limit = 600 if label == 'kernel' else 180
                    if elapsed >= limit:
                        timed_out = True
                        stop(process)
                        code = 124
                        break
        except BaseException as caught:
            error = caught
            stop(process)
            code = process.returncode
        finally:
            stop(process)
    receipt['steps'].append({'label': label, 'command': list(map(str, command)),
        'exit_code': code, 'seconds': round(time.monotonic() - start, 3),
        'started_utc': started, 'finished_utc': utc(), 'timed_out': timed_out,
        'interrupted': error is not None, 'log_sha256': digest(log)})
    save()
    if error is not None:
        raise error
    if code:
        print(log.read_text()[-12000:], flush=True)
        raise RuntimeError(f'{label} failed: {code}')
    print(f'{utc()} PASS {label}: {time.monotonic() - start:.1f}s', flush=True)
    return log.read_text()

def signal_error(signum, frame):
    raise RuntimeError(f'verification interrupted by signal {signum}')

signal.signal(signal.SIGTERM, signal_error)
lock_file = Path('/tmp/cinna-lean-162051/lean-gate.lock').open('a')
print(utc() + ' WAIT lean-gate.lock', flush=True)
fcntl.flock(lock_file.fileno(), fcntl.LOCK_EX)
receipt['lock_acquired_utc'] = utc()
print(receipt['lock_acquired_utc'] + ' ACQUIRED lean-gate.lock', flush=True)

try:
    save()
    receipt['lean_version'] = run('version', ['lean', '--version']).strip()
    for module in modules:
        source = Path(module.replace('.', '/') + '.lean')
        target = OUT / source.with_suffix('.olean')
        target.parent.mkdir(parents=True, exist_ok=True)
        run(module + '.source', ['lean', '-j2', '-M4500', '-DwarningAsError=true',
                                '-o', target, source])
        assert digest(BASE / source) == source_hashes[str(source)]
    audit_file = EVIDENCE / 'AllOwnedAudit.lean'
    audit_file.write_text(audit.audit_source(modules, required, []))
    log = run('all-owned-audit', ['lean', '-j2', '-M4500', '-DwarningAsError=true', audit_file])
    spec = {'modules': modules, 'required': required, 'legacy_prefixes': []}
    inventory = audit.validate_log(log, spec, {m: False for m in modules})
    inventory_file = EVIDENCE / 'declaration-inventory.json'
    inventory_file.write_text(json.dumps(inventory, indent=2) + '\n')
    frozen_objects = {str(p.relative_to(OUT)): digest(p) for p in sorted(OUT.rglob('*.olean*'))}
    env['LEAN_NUM_THREADS'] = '1'
    receipt['kernel_environment'] = {'LEAN_NUM_THREADS': '1', 'UV_USE_IO_URING': '0'}
    kernel_log = run('kernel', replay_lean.checker_command(['Conjectures']))
    receipt['exact_kernel_replay_set'] = exact_replay_set(kernel_log, modules)
    assert frozen_objects == {str(p.relative_to(OUT)): digest(p) for p in sorted(OUT.rglob('*.olean*'))}
    for source, expected in source_hashes.items():
        assert digest(BASE / source) == expected
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
finally:
    fcntl.flock(lock_file.fileno(), fcntl.LOCK_UN)
    lock_file.close()
    print(utc() + ' RELEASED lean-gate.lock', flush=True)
