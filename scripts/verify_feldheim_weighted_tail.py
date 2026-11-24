"""Strictly rebuild, audit, and replay Feldheim–Feldheim's weighted-tail conjecture.

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
EVIDENCE = REPO / '.candidate-artifacts/feldheim-weighted-tail'
OUT = EVIDENCE / 'lib/lean'
EVIDENCE.mkdir(parents=True, exist_ok=True)
OUT.mkdir(parents=True, exist_ok=True)
LEAN_BIN = shutil.which('lean')
CHECKER_BIN = shutil.which('leanchecker')
if not LEAN_BIN or not CHECKER_BIN or not os.environ.get('LEAN_PATH'):
    raise SystemExit('Run from lean/ with lake env python3 ../scripts/verify_feldheim_weighted_tail.py')
sys.path.insert(0, str(REPO / 'scripts'))
import audit_lean_all_owned as audit
import replay_lean
from replay_lean_parallel import CHECKER_SHA256, exact_replay_set

modules = [
    'Conjectures.FeldheimWeightedTailBasic',
    'Conjectures.FeldheimWeightedTailWrightIntegral',
    'Conjectures.FeldheimWeightedTailWrightUnit',
    'Conjectures.FeldheimWeightedTailWrightChord',
    'Conjectures.FeldheimWeightedTailConvex',
    'Conjectures.FeldheimWeightedTailAverage',
    'Conjectures.FeldheimWeightedTailWindowsSequence',
    'Conjectures.FeldheimWeightedTailWindowsConvex',
    'Conjectures.FeldheimWeightedTailWindowsInverse',
    'Conjectures.FeldheimWeightedTailWindows',
    'Conjectures.FeldheimWeightedTailOscillation',
    'Conjectures.FeldheimWeightedTailAnalysis',
    'Conjectures.FeldheimWeightedTailLaw',
    'Conjectures.FeldheimWeightedTailProbability',
    'Conjectures.FeldheimWeightedTailReduction',
    'Conjectures.FeldheimWeightedTailLimits',
    'Conjectures.FeldheimWeightedTailStieltjesGrid',
    'Conjectures.FeldheimWeightedTailStieltjesLimit',
    'Conjectures.FeldheimWeightedTailStieltjes',
    'Conjectures.FeldheimWeightedTail',
]
required = [
    'Conjectures.FeldheimWeightedTail.wright_unit_integral_le',
    'Conjectures.FeldheimWeightedTail.wright_unit_le',
    'Conjectures.FeldheimWeightedTail.wright_chord_le',
    'Conjectures.FeldheimWeightedTail.monotone_wright_chordBoundOn',
    'Conjectures.FeldheimWeightedTail.exists_affine_minorant_of_chord',
    'Conjectures.FeldheimWeightedTail.convexMinorant_convex',
    'Conjectures.FeldheimWeightedTail.convexMinorant_approx',
    'Conjectures.FeldheimWeightedTail.convex_hazard_windows',
    'Conjectures.FeldheimWeightedTail.window_inverse_levels',
    'Conjectures.FeldheimWeightedTail.window_exists_balanced_levels',
    'Conjectures.FeldheimWeightedTail.window_exists_support',
    'Conjectures.FeldheimWeightedTail.monotone_rectangle_windows',
    'Conjectures.FeldheimWeightedTail.rectangle_window_oscillation',
    'Conjectures.FeldheimWeightedTail.weighted_window_estimates',
    'Conjectures.FeldheimWeightedTail.survival_right_continuous',
    'Conjectures.FeldheimWeightedTail.logTail_tendsto_atTop',
    'Conjectures.FeldheimWeightedTail.rectangleBound_of_probability_bound',
    'Conjectures.FeldheimWeightedTail.weightedTail_eq_integral',
    'Conjectures.FeldheimWeightedTail.inverse_survival_integrableOn',
    'Conjectures.FeldheimWeightedTail.tailRatio_lower_integral',
    'Conjectures.FeldheimWeightedTail.limsup_ofReal_eq_top_of_unbounded',
    'Conjectures.FeldheimWeightedTail.real_tail_positive_iff_not_bounded',
    'Conjectures.FeldheimWeightedTail.not_compactly_supported_iff_not_bounded',
    'Conjectures.FeldheimWeightedTail.tailRatio_map',
    'Conjectures.FeldheimWeightedTail.exists_large_tailRatio_of_log_integral',
    'Conjectures.FeldheimWeightedTail.log_tail_increment_le_inverse_tail_integral',
    'Conjectures.FeldheimWeightedTail.tailRatio_arbitrarily_large',
    'Conjectures.FeldheimWeightedTail.tailRatio_limsup_eq_top',
    'Conjectures.FeldheimWeightedTail.independent_tail_limsup',
    'Conjectures.FeldheimWeightedTail.feldheim_feldheim_conjecture',
]
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
    'scope': 'Original Conjecture 1: arbitrary independent nonnegative random variables without compact almost-sure support and every weight 0 < t < 1; literal infinite limsup; arbitrary distinct laws, atoms and singular laws included',
    'status': 'running',
    'started_at': datetime.now(timezone.utc).isoformat(),
    'unformalized_supplements': ['Higher-dimensional norm consequences', 'Finite-threshold supplements'],
    'control_sha256': control_hashes,
    'entry': 'results/feldheim-weighted-tail/',
    'documented_proof_commit': '2f800fa5191a1d747f126fa20f7e9c2b3730b085',
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
    assert 'eb6cafb7290e8bd5f2937522d8d804f58f02bafc' in receipt['lean_version']
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
