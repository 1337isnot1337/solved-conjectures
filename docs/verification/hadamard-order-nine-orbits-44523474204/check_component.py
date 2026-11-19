from pathlib import Path
import hashlib
import json
import os
import subprocess
import sys
import time

BASE = Path(__file__).resolve().parent
REPO = BASE.parent / 'solved-conjectures'
LEAN = REPO / 'lean'
RUNTIME = Path('/workspace/scratch/8e8ad11772bd/lean-public-runtime')
OUT = BASE / 'build/lib/lean'
OUT.mkdir(parents=True, exist_ok=True)
sys.path.insert(0, str(REPO / 'scripts'))
import audit_lean_all_owned as audit
import replay_lean

hosted = json.loads((BASE / 'hosted-receipt.json').read_text())
modules = hosted['project_modules']
required = hosted['required_theorems']
assert replay_lean.local_closure(LEAN, {hosted['target']}) == set(modules)
digest = lambda p: hashlib.sha256(p.read_bytes()).hexdigest()
for name, expected in hosted['source_sha256'].items():
    assert digest(REPO / name) == expected, name

env = os.environ.copy()
env.update(LEAN_NUM_THREADS='1', UV_USE_IO_URING='0',
           LEAN_SYSROOT=str(RUNTIME / 'toolchain'))
env['LEAN_PATH'] = os.pathsep.join(map(str, [OUT, *sorted(
    (RUNTIME / 'packages').glob('*/.lake/build/lib/lean'))]))
env['PATH'] = str(RUNTIME / 'toolchain/bin') + os.pathsep + env['PATH']
receipt = {
    'scope': 'Four unchanged Hadamard order-nine auxiliary modules',
    'upstream_commit': hosted['commit'],
    'upstream_run_id': 44523474204,
    'upstream_job_id': 135557905916,
    'upstream_artifact_id': 14529746143,
    'upstream_artifact_sha256': digest(BASE / 'hosted-receipt.zip'),
    'source_sha256': hosted['source_sha256'],
    'project_modules': modules,
    'required_theorems': required,
    'lean_sha256': digest(RUNTIME / 'toolchain/bin/lean'),
    'leanchecker_sha256': digest(RUNTIME / 'toolchain/bin/leanchecker'),
    'steps': [],
    'status': 'running',
}

def save():
    (BASE / 'local-receipt.json').write_text(json.dumps(receipt, indent=2) + '\n')

def run(label, command):
    start = time.monotonic()
    log = BASE / (label + '.log')
    print('+ ' + ' '.join(map(str, command)), flush=True)
    with log.open('w') as output:
        process = subprocess.Popen(list(map(str, command)), cwd=LEAN, env=env,
                                   stdout=output, stderr=subprocess.STDOUT)
        while True:
            try:
                code = process.wait(timeout=30)
                break
            except subprocess.TimeoutExpired:
                elapsed = time.monotonic() - start
                print(f'{label}: {elapsed:.1f}s elapsed', flush=True)
                if elapsed >= 600:
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
    print(f'PASS {label}: {time.monotonic()-start:.1f}s', flush=True)
    return log.read_text()

try:
    save()
    for module in modules:
        source = LEAN / (module.replace('.', '/') + '.lean')
        target = OUT / (module.replace('.', '/') + '.olean')
        target.parent.mkdir(parents=True, exist_ok=True)
        before = digest(source)
        run(module + '.source', ['lean', '-j1', '-M4500',
            '-DwarningAsError=true', '-o', target, source.relative_to(LEAN)])
        assert digest(source) == before, f'Source changed while building: {module}'
    audit_file = BASE / 'AllOwnedAudit.lean'
    audit_file.write_text(audit.audit_source(modules, required, []))
    text = run('all-owned-audit', ['lean', '-j1', '-M4500',
        '-DwarningAsError=true', audit_file])
    spec = {'modules': modules, 'required': required, 'legacy_prefixes': []}
    inventory = audit.validate_log(text, spec, {m: False for m in modules})
    (BASE / 'declaration-inventory.json').write_text(json.dumps(inventory, indent=2) + '\n')
    run('kernel', ['leanchecker', '-v', 'Conjectures'])
    for name, expected in hosted['source_sha256'].items():
        assert digest(REPO / name) == expected, name
    receipt['object_sha256'] = {str(p.relative_to(OUT)): digest(p)
        for p in sorted(OUT.rglob('*.olean*'))}
    receipt['audit_source_sha256'] = digest(audit_file)
    receipt['declaration_inventory_sha256'] = digest(BASE / 'declaration-inventory.json')
    receipt['status'] = 'passed'
    save()
    print('PASS: strict sources, all-owned/private axiom audit, and stock kernel replay', flush=True)
except BaseException as error:
    receipt['status'] = 'failed'
    receipt['error'] = str(error)
    save()
    raise
