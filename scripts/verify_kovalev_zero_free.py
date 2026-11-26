"""Strictly rebuild, audit, and replay the registered Kovalev zero-free proof.

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
from datetime import datetime, timezone

REPO = Path(__file__).resolve().parents[1]
BASE = REPO / 'lean'
EVIDENCE = REPO / '.candidate-artifacts/kovalev-zero-free'
OUT = EVIDENCE / 'lib/lean'
EVIDENCE.mkdir(parents=True, exist_ok=True)
OUT.mkdir(parents=True, exist_ok=True)
LEAN_BIN = shutil.which('lean')
CHECKER_BIN = shutil.which('leanchecker')
if not LEAN_BIN or not CHECKER_BIN or not os.environ.get('LEAN_PATH'):
    raise SystemExit('Run from lean/ with lake env python3 ../scripts/verify_kovalev_zero_free.py')
sys.path.insert(0, str(REPO / 'scripts'))
import audit_lean_all_owned as audit
import replay_lean
from replay_lean_parallel import CHECKER_SHA256, exact_replay_set

modules = ['Conjectures.KovalevZeroFreeCoefficients', 'Conjectures.KovalevZeroFreeBeta', 'Conjectures.KovalevZeroFreeMobius', 'Conjectures.KovalevZeroFreeEuler', 'Conjectures.KovalevZeroFreeCoupling', 'Conjectures.KovalevZeroFreeTransport', 'Conjectures.KovalevZeroFreeGeometry', 'Conjectures.KovalevZeroFreeKernel', 'Conjectures.KovalevZeroFreeRemainder', 'Conjectures.KovalevZeroFreeComparison', 'Conjectures.KovalevZeroFreeFiniteAlgebra', 'Conjectures.KovalevZeroFreeCorrection', 'Conjectures.KovalevZeroFreeAssembly', 'Conjectures.KovalevZeroFreeNormalization', 'Conjectures.KovalevZeroFreeDerivative', 'Conjectures.KovalevZeroFreeSectionIntegral', 'Conjectures.KovalevZeroFreeTaylorSeries', 'Conjectures.KovalevZeroFreeTaylorAnalytic', 'Conjectures.KovalevZeroFreeTaylorFinite', 'Conjectures.KovalevZeroFreeTaylor', 'Conjectures.KovalevZeroFree']
required = ['Conjectures.KovalevZeroFree.halfCoeff_pos', 'Conjectures.KovalevZeroFree.sum_correction', 'Conjectures.KovalevZeroFree.sum_weighted_correction', 'Conjectures.KovalevZeroFree.correction_budget_lt', 'Conjectures.KovalevZeroFree.section_one_ne_zero', 'Conjectures.KovalevZeroFree.sqrt_inDiameter', 'Conjectures.KovalevZeroFree.inverse_sqrt_comparison', 'Conjectures.KovalevZeroFree.inverse_sqrt_linear_comparison', 'Conjectures.KovalevZeroFree.integral_beta_id', 'Conjectures.KovalevZeroFree.integral_beta_one_sub', 'Conjectures.KovalevZeroFree.remainder_norm_le_one', 'Conjectures.KovalevZeroFree.remainder_norm_lt_one', 'Conjectures.KovalevZeroFree.remainder_one', 'Conjectures.KovalevZeroFree.lintegral_mobius_substitution', 'Conjectures.KovalevZeroFree.lintegral_beta_euler', 'Conjectures.KovalevZeroFree.lintegral_beta_joint_density', 'Conjectures.KovalevZeroFree.map_oddsScale_beta', 'Conjectures.KovalevZeroFree.integral_oddsScale_beta', 'Conjectures.KovalevZeroFree.beta_resolvent_comparison', 'Conjectures.KovalevZeroFree.remainder_comparison', 'Conjectures.KovalevZeroFree.weighted_correction_norm_lt', 'Conjectures.KovalevZeroFree.leadingPart_norm_lower', 'Conjectures.KovalevZeroFree.correctionRemainder_norm_lt', 'Conjectures.KovalevZeroFree.halfCoeff_beta_normalizer', 'Conjectures.KovalevZeroFree.sqrt_mul_invSection_hasDerivAt', 'Conjectures.KovalevZeroFree.invSection_remainder_identity', 'Conjectures.KovalevZeroFree.formalCoeff_eq_iteratedDeriv', 'Conjectures.KovalevZeroFree.sectionPolynomial_eq_taylor', 'Conjectures.KovalevZeroFree.sectionPolynomial_ne_zero', 'Conjectures.KovalevZeroFree.taylorSection_ne_zero', 'Conjectures.KovalevZeroFree.kovalev_conjecture']
assert replay_lean.local_closure(BASE, {'Conjectures.KovalevZeroFree'}) == set(modules)
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
    'scope': 'Original Kovalev Conjecture 1.2: all Taylor degrees and the entire closed unit disk; stronger all-positive-length theorem',
    'status': 'running',
    'started_at': datetime.now(timezone.utc).isoformat(),
    'unformalized_supplements': ['General fractional exponents', 'Sharp arbitrary-segment bounds', 'Adjacent trigonometric Conjecture 1.3'],
    'entry': 'docs/kovalev-fractional-taylor-sections/',
    'documented_proof_commit': '6432592c03b24aed190ed7b3204ed942a40a8da4',
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
        run(module + '.source', [LEAN_BIN, '-j2', '-M3500', '-DwarningAsError=true',
                                '-o', target, source])
        assert digest(BASE / source) == source_hashes[str(source)]
    audit_file = EVIDENCE / 'AllOwnedAudit.lean'
    audit_file.write_text(audit.audit_source(modules, required, []))
    log = run('all-owned-audit', [LEAN_BIN, '-j2', '-M3500', '-DwarningAsError=true', audit_file])
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
    receipt['finished_at'] = datetime.now(timezone.utc).isoformat()
    save()
    print('PASS: strict source rebuild, complete all-owned/private audit, exact stock kernel replay', flush=True)
except BaseException as error:
    receipt['status'] = 'failed'
    receipt['error'] = str(error)
    save()
    raise
