"""Strictly rebuild, audit, and replay the registered Fan–Tringali proof.

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
EVIDENCE = REPO / '.candidate-artifacts/fan-tringali'
OUT = EVIDENCE / 'lib/lean'
EVIDENCE.mkdir(parents=True, exist_ok=True)
OUT.mkdir(parents=True, exist_ok=True)
LEAN_BIN = shutil.which('lean')
CHECKER_BIN = shutil.which('leanchecker')
if not LEAN_BIN or not CHECKER_BIN or not os.environ.get('LEAN_PATH'):
    raise SystemExit('Run from lean/ with lake env python3 ../scripts/verify_fan_tringali.py')
sys.path.insert(0, str(REPO / 'scripts'))
import audit_lean_all_owned as audit
import replay_lean
from replay_lean_parallel import CHECKER_SHA256, exact_replay_set

modules = ['Conjectures.FanTringaliBasic', 'Conjectures.FanTringaliGadget', 'Conjectures.FanTringaliSlices', 'Conjectures.FanTringaliProducts', 'Conjectures.FanTringaliCoordinates', 'Conjectures.FanTringaliStack', 'Conjectures.FanTringaliGraph', 'Conjectures.FanTringaliFactorizations', 'Conjectures.FanTringaliGraphLengths', 'Conjectures.FanTringaliBlocks', 'Conjectures.FanTringaliRadix', 'Conjectures.FanTringaliRadixTransfer', 'Conjectures.FanTringaliNatural', 'Conjectures.FanTringaliNaturalSystem', 'Conjectures.FanTringaliMonoidBasic', 'Conjectures.FanTringaliMonoidNormalization', 'Conjectures.FanTringaliMonoidTransfer', 'Conjectures.FanTringaliMonoid']
required = ['FanTringali.factors_of_box', 'FanTringali.atomic_factorization_box_length', 'FanTringali.Gadget.square_impossible', 'FanTringali.slab_uniqueQuotient', 'FanTringali.slab_no_quotient_both', 'FanTringali.uniqueQuotient_stack', 'FanTringali.graph_box_divisor_iff', 'FanTringali.graph_uniqueQuotient', 'FanTringali.layered_atomic_factorization', 'FanTringali.layered_lengths', 'FanTringali.graph_lengths', 'FanTringali.finite_spectrum_lattice', 'FanTringali.radix_divisors_lift', 'FanTringali.radix_atom_iff', 'FanTringali.radix_lengths', 'FanTringali.finite_spectrum_nat', 'FanTringali.natural_length_system', 'FanTringali.pow_injective_of_infinitePowers', 'FanTringali.finset_isUnit_iff', 'FanTringali.restrictedAtom_iff', 'FanTringali.restrictedLengths_eq_powerLengths', 'FanTringali.normalize_two', 'FanTringali.normalize_atom_list', 'FanTringali.normalize_factorization', 'FanTringali.powerAtom_powerImage_iff', 'FanTringali.powerLengths_powerImage', 'FanTringali.restrictedLengths_powerImage', 'FanTringali.finite_spectrum_power_monoids']
assert replay_lean.local_closure(BASE, {'Conjectures.FanTringaliMonoid', 'Conjectures.FanTringaliNaturalSystem'}) == set(modules)
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
    'scope': 'Original 2018 ordinary and restricted power-monoid conjecture; exact reduced natural-number length system',
    'status': 'running',
    'started_at': datetime.now(timezone.utc).isoformat(),
    'unformalized_supplements': ['Survey 2026 irreducibles without Dedekind-finiteness',
                                'Prescribed unordered factorization multiplicities',
                                'Relative cancellativity'],
    'entry': 'results/fan-tringali-power-monoid-lengths/',
    'documented_proof_commit': '0d5b985640ecc020f8b99b6e3b1ebc2d8a7fbbe4',
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
    audit_file.write_text(audit.audit_source(modules, required, ['FanTringali.']))
    log = run('all-owned-audit', [LEAN_BIN, '-j2', '-M3500', '-DwarningAsError=true', audit_file])
    spec = {'modules': modules, 'required': required, 'legacy_prefixes': ['FanTringali.']}
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
