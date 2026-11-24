"""Strictly rebuild, audit, and replay Hajdu–Sárközy's shifted-products theorem.

Run from lean/ through lake env python3 to use the pinned installation.
All outputs are isolated from Lake. This scoped gate does not claim the
repository-wide gate. Set LEAN_GATE_LOCK to serialize a shared local runner.
"""
from pathlib import Path
import hashlib
import fcntl
import signal
from datetime import datetime, timezone
import json
import os
import subprocess
import shutil
import sys
import time

REPO = Path(__file__).resolve().parents[1]
BASE = REPO / 'lean'
EVIDENCE = REPO / '.candidate-artifacts/hajdu-sarkozy-shifted-products'
OUT = EVIDENCE / 'lib/lean'
EVIDENCE.mkdir(parents=True, exist_ok=True)
OUT.mkdir(parents=True, exist_ok=True)
LEAN_BIN = shutil.which('lean')
CHECKER_BIN = shutil.which('leanchecker')
if not LEAN_BIN or not CHECKER_BIN or not os.environ.get('LEAN_PATH'):
    raise SystemExit('Run from lean/ with lake env python3 ../scripts/verify_hajdu_sarkozy_products.py')
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
    'Conjectures.HajduSarkozyProductsArithmetic',
    'Conjectures.HajduSarkozyProductsCounts',
    'Conjectures.HajduSarkozyProductsSeries',
    'Conjectures.HajduSarkozyProductsTails',
    'Conjectures.HajduSarkozyProductsLimits',
    'Conjectures.HajduSarkozyProductsCommon',
    'Conjectures.HajduSarkozyProductsGrowth',
    'Conjectures.HajduSarkozyProductsFactors',
    'Conjectures.HajduSarkozyProductsBins',
    'Conjectures.HajduSarkozyProductsProduct',
    'Conjectures.HajduSarkozyProductsFamily',
    'Conjectures.HajduSarkozyProductsPowers',
    'Conjectures.HajduSarkozyProducts',
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
required += [prefix + 'Products.' + name for name in ['no_thin_mixed_four_cycle', 'scaled_count_le', 'sum_le_tailMass', 'uniform_tail_isLittleO', 'coefficient_tail_count_le', 'sparse_of_grid', 'not_sparse_of_positive_limsup', 'finite_change_conditions', 'mixedCommon_grid_bound', 'head_common_grid_bound', 'coefficient_tail_grid_le', 'factor_grid_isLittleO', 'factor_binMass_isLittleO', 'thin_bin_edge_card_le', 'large_product_count_le_triangle', 'product_grid_isLittleO', 'family_product_grid_isLittleO', 'retained_product_sparse', 'no_product_summable_family', 'summable_family_total_of_not_sparse', 'indexed_summable_family', 'setCoefficients_summable', 'indexed_set_family_eq', 'summable_family', 'power_coefficients_summable', 'power_family_eq_products', 'shiftedProducts_equal', 'shiftedPowers_not_sparse', 'ordered_shifted_product_perturbations', 'shifted_product_perturbations', 'originalProducts_eq', 'hajdu_sarkozy_shifted_products_conjecture', 'original_finite_modification_not_product']]
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
            REPO / 'scripts/verify_lean.sh', BASE / 'ProofAudit.lean',
            BASE / 'Conjectures.lean', BASE / 'lean-toolchain',
            BASE / 'lake-manifest.json', BASE / 'lakefile.toml']
control_hashes = {str(p.relative_to(REPO)): digest(p) for p in controls}
env = os.environ.copy()
env.update(LEAN_NUM_THREADS='2', UV_USE_IO_URING='0')
project_build = (BASE / '.lake/build/lib/lean').resolve()
dependencies = [Path(p).resolve() for p in env['LEAN_PATH'].split(os.pathsep)
                if p and Path(p).resolve() not in {project_build, BASE.resolve(), OUT.resolve()}]
env['LEAN_PATH'] = os.pathsep.join(map(str, [OUT, *dependencies]))
receipt = {
    'scope': 'Full summable-family theorem with positive real-threshold retained limsup; every exponent pair k,l≥2, every nonzero integral shift, every o(X^(1/min(k,l))) symmetric-difference perturbation, and every finite modification; original positive-root convention included',
    'status': 'running',
    'started_at': datetime.now(timezone.utc).isoformat(),
    'unformalized_supplements': ['Arbitrary finite products with more than two variables'],
    'control_sha256': control_hashes,
    'entry': 'results/hajdu-sarkozy-shifted-products/',
    'documented_proof_commit': '83c325ae559864ec0b5e916d90a342b50a81de7f',
    'source_sha256': source_hashes,
    'project_modules': modules,
    'required_theorems': required,
    'lean_sha256': digest(Path(LEAN_BIN)),
    'leanchecker_sha256': digest(Path(CHECKER_BIN)),
    'verification_script_sha256': digest(Path(__file__)),
    'steps': [],
    'repository_wide_gate_claimed': False,
}

# A metadata-only publication can bind a previously completed exact-source
# proof receipt without calling an unrun rebuild a pass. This preflight
# checks the same closure, registrations, pinned checker and source hashes.
if '--preflight' in sys.argv:
    print(json.dumps({'status': 'preflight-passed',
        'project_modules': modules, 'required_theorems': required,
        'source_sha256': source_hashes, 'control_sha256': control_hashes,
        'leanchecker_sha256': digest(Path(CHECKER_BIN)),
        'source_build_claimed': False, 'axiom_audit_claimed': False,
        'kernel_replay_claimed': False}, indent=2))
    raise SystemExit(0)


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
                    limit = 900
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
lock_file = None
if os.environ.get('LEAN_GATE_LOCK'):
    lock_file = Path(os.environ['LEAN_GATE_LOCK']).open('a')
    print(utc() + ' WAIT ' + str(lock_file.name), flush=True)
    fcntl.flock(lock_file.fileno(), fcntl.LOCK_EX)
    receipt['lock_acquired_utc'] = utc()
    print(receipt['lock_acquired_utc'] + ' ACQUIRED ' + str(lock_file.name), flush=True)

try:
    save()
    receipt['lean_version'] = run('version', [LEAN_BIN, '--version']).strip()
    assert 'version 4.35.0,' in receipt['lean_version']
    for module in modules:
        source = Path(module.replace('.', '/') + '.lean')
        target = OUT / source.with_suffix('.olean')
        target.parent.mkdir(parents=True, exist_ok=True)
        run(module + '.source', [LEAN_BIN, '-j2', '-M4500', '-DwarningAsError=true',
                                '-o', target, source])
        assert digest(BASE / source) == source_hashes[str(source)]
    audit_file = EVIDENCE / 'AllOwnedAudit.lean'
    audit_file.write_text(audit.audit_source(modules, required, []))
    log = run('all-owned-audit', [LEAN_BIN, '-j2', '-M4500', '-DwarningAsError=true', audit_file])
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
    assert control_hashes == {str(p.relative_to(REPO)): digest(p) for p in controls}
    receipt['object_sha256'] = frozen_objects
    receipt['audit_source_sha256'] = digest(audit_file)
    receipt['declaration_inventory_sha256'] = digest(inventory_file)
    receipt['audit_summary'] = inventory['summary']
    receipt['status'] = 'passed'
    receipt['finished_at'] = utc()
    save()
    print('PASS: strict source rebuild, complete all-owned/private audit, exact stock kernel replay', flush=True)
except BaseException as error:
    receipt['status'] = 'failed'
    receipt['error'] = str(error)
    save()
    raise
finally:
    if lock_file is not None:
        fcntl.flock(lock_file.fileno(), fcntl.LOCK_UN)
        lock_file.close()
        print(utc() + ' RELEASED ' + str(lock_file.name), flush=True)
