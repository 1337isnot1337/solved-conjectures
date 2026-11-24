"""Strict source rebuild, repository all-owned audit, and pinned kernel replay.

This checks the connected, explicitly incomplete complete-minus-edge prefix.
Repository-wide registration, documentation checks and publication are separate.
The exact local import closure is frozen before waiting for the shared gate.
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
import shutil

LANE = Path(__file__).resolve().parent
REPO = Path('/tmp/cinna-lean-162051/repo')
TOOLCHAIN = Path('/workspace/scratch/e963d2f60a75/toolchain/lean-4.35.0-linux')
PACKAGES = Path('/workspace/scratch/e963d2f60a75/repo/lean/.lake/packages')
OVERLAY = Path('/tmp/cinna-lean-162051/dependency-overlay')
EVIDENCE = LANE / ('checkpoint-' + datetime.now(timezone.utc).strftime('%Y%m%dT%H%M%S'))
BASE = EVIDENCE / 'frozen'
OUT = EVIDENCE / 'lib/lean'
EVIDENCE.mkdir()
BASE.mkdir()
OUT.mkdir(parents=True, exist_ok=True)
sys.path.insert(0, str(REPO / 'scripts'))
import audit_lean_all_owned as audit
import replay_lean
from replay_lean_parallel import CHECKER_SHA256, exact_replay_set

ROOT_MODULE = sys.argv[1] if len(sys.argv) > 1 else 'Conjectures.CircularCompleteMinusEdgeSpecial'
assert ROOT_MODULE in {'Conjectures.CircularCompleteMinusEdgeOrder',
    'Conjectures.CircularCompleteMinusEdgeSpecial'}
modules = []
visited = set()
def visit(module):
    if module in visited:
        return
    visited.add(module)
    source = LANE / (module.replace('.', '/') + '.lean')
    if not source.is_file():
        if replay_lean.project_namespace(module) is not None:
            raise RuntimeError(f'Missing local source {source}')
        return
    for imported in replay_lean.imports_of(source):
        visit(imported)
    modules.append(module)
visit(ROOT_MODULE)
for module in modules:
    relative = Path(module.replace('.', '/') + '.lean')
    target = BASE / relative
    target.parent.mkdir(parents=True, exist_ok=True)
    shutil.copyfile(LANE / relative, target)
prefix = 'CircularCompleteMinusEdge.'
required = [prefix + name for name in [
    'floorColoring_wellFounded', 'graph_edge_card_parameter',
    'circularChromaticIndex_le_card', 'matching_transversal',
    'ProperColoring.exists_deficient_class', 'exists_normalized_coloring',
    'ProperColoring.source_unique', 'ProperColoring.sink_unique',
    'PathMatching.level_lt_of_relation', 'exists_pathMatching',
    'exists_linearEdgeOrder', 'real_coloring_gives_linear_order',
    'exists_vertex_color_equiv', 'vertex_position_gap_mod',
    'gaps_of_runCount_eq', 'EdgeSequence.sum_runs',
    'EdgeSequence.runs_eq_sequence', 'linear_order_runStructure',
    'previous_run_end', 'next_run_start',
    'EdgeSequence.exists_unique_new_at', 'EdgeSequence.exists_unique_lost_at',
    'RunStructure.special_add_iff', 'RunStructure.special_mod_iff',
]]
if ROOT_MODULE.endswith('Order'):
    required = required[:12]
assert replay_lean.local_closure(BASE, {ROOT_MODULE}) == set(modules)
digest = lambda p: hashlib.sha256(p.read_bytes()).hexdigest()
assert digest(TOOLCHAIN / 'bin/leanchecker') == CHECKER_SHA256
control_paths = [REPO/'scripts/audit_lean_all_owned.py', REPO/'scripts/replay_lean.py',
    REPO/'scripts/replay_lean_parallel.py', REPO/'lean/lean-toolchain',
    REPO/'lean/lake-manifest.json', REPO/'lean/lakefile.toml']
control_hashes = {str(p.relative_to(REPO)): digest(p) for p in control_paths}
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
    'scope': ('INCOMPLETE: actual real circular coloring reduction and Hall spanning edge order. '
        'The full all-even-degree conjecture remains unfinished.' if ROOT_MODULE.endswith('Order')
        else 'INCOMPLETE: actual real circular coloring reduction, Hall spanning edge order, '
        'actual run saturation, and special-position closure under a whole row. '
        'The full all-even-degree conjecture remains unfinished.'),
    'root_module': ROOT_MODULE,
    'complete_result_count': 0,
    'status': 'running',
    'entry': 'results/circular-index-complete-minus-edge/',
    'documented_proof_sha256': digest(LANE / 'SOURCE_PROOF.md'),
    'source_sha256': source_hashes,
    'control_sha256': control_hashes,
    'project_modules': modules,
    'required_theorems': required,
    'lean_sha256': digest(TOOLCHAIN / 'bin/lean'),
    'leanchecker_sha256': digest(TOOLCHAIN / 'bin/leanchecker'),
    'verification_script_sha256': digest(Path(__file__)),
    'steps': [],
    'repository_wide_gate_claimed': False,
    'remaining_obligations': ['Full special-column count and paired starts', 'Actual interval table and boundary row bijections', 'Table separation and junction arguments', 'Two-normal-vertex contradiction', 'Full circular chromatic-index equality for every even d>=6'],
    'started_at': datetime.now(timezone.utc).isoformat(),
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
        command = ['bwrap', '--ro-bind', '/', '/', '--dev-bind', '/dev', '/dev',
            '--bind', str(EVIDENCE), str(EVIDENCE), '--die-with-parent', '--', *map(str, command)]
        process = subprocess.Popen(command, cwd=BASE, env=env,
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
                    limit = 900 if label == 'kernel' else 180
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
    assert control_hashes == {str(p.relative_to(REPO)): digest(p) for p in control_paths}
    receipt['finished_at'] = utc()
    receipt['status'] = 'passed'
    save()
    print('PASS: verified INCOMPLETE connected prefix; complete-result count remains 0', flush=True)
except BaseException as error:
    receipt['status'] = 'failed'
    receipt['error'] = str(error)
    save()
    raise
finally:
    fcntl.flock(lock_file.fileno(), fcntl.LOCK_UN)
    lock_file.close()
    print(utc() + ' RELEASED lean-gate.lock', flush=True)
