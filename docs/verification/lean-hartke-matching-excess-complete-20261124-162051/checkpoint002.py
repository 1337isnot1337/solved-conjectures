from pathlib import Path
from datetime import datetime, timezone
import hashlib
import json
import os
import signal
import subprocess
import sys
import time

REPO = Path('/tmp/cinna-lean-162051/repo')
OUT = Path('/tmp/cinna-lean-162051/hartke/checkpoint-002')
CONFIG = json.loads(Path('/workspace/scratch/ae41555c502c/lean_env.json').read_text())
FROZEN = json.loads(Path('/tmp/cinna-lean-162051/hartke/frozen-sources.json').read_text())
MODULES = FROZEN['modules']
REQUIRED = FROZEN['required']
OUT.mkdir(parents=True, exist_ok=True)
BASE = OUT / 'lean'
BUILD = BASE / '.lake/build/lib/lean'
BUILD.mkdir(parents=True, exist_ok=True)
digest = lambda p: hashlib.sha256(p.read_bytes()).hexdigest()
for module in MODULES:
    rel = Path(module.replace('.', '/') + '.lean')
    source = REPO / 'lean' / rel
    assert digest(source) == FROZEN['source_sha256'][module]
    target = BASE / rel
    target.parent.mkdir(parents=True, exist_ok=True)
    target.write_bytes(source.read_bytes())
env = os.environ.copy()
env['PATH'] = CONFIG['PATH_add'] + ':' + env['PATH']
env['LEAN_PATH'] = str(BUILD) + ':' + ':'.join(CONFIG['LEAN_PATH'].split(':')[1:])
env['LEAN_NUM_THREADS'] = '1'
env['UV_USE_IO_URING'] = '0'
toolchain = Path(CONFIG['PATH_add'])
sys.path.insert(0, str(REPO / 'scripts'))
from audit_lean_all_owned import audit_source, validate_log
from replay_lean import local_closure
from replay_lean_parallel import CHECKER_SHA256, exact_replay_set
assert digest(toolchain / 'leanchecker') == CHECKER_SHA256
assert local_closure(BASE, {MODULES[-1]}) == set(MODULES)
controls = [REPO/'scripts'/name for name in ['audit_lean_all_owned.py','replay_lean.py','replay_lean_parallel.py']]
controls += [REPO/'lean'/name for name in ['lean-toolchain','lake-manifest.json','lakefile.toml']]
control_hashes = {str(p.relative_to(REPO)):digest(p) for p in controls}
for p in controls:
    target = OUT/'control-snapshot'/p.relative_to(REPO)
    target.parent.mkdir(parents=True,exist_ok=True)
    target.write_bytes(p.read_bytes())
receipt = {
    'scope': FROZEN['scope'],
    'status':'running',
    'started_utc':datetime.now(timezone.utc).isoformat(),
    'documented_proof_commit':FROZEN['documented_proof_commit'],
    'modules':MODULES,'required':REQUIRED,
    'source_sha256':FROZEN['source_sha256'],
    'control_sha256':control_hashes,
    'lean_sha256':digest(toolchain/'lean'),
    'leanchecker_sha256':digest(toolchain/'leanchecker'),
    'verification_script_sha256':digest(Path(__file__)),
    'allowed_axioms':['propext','Classical.choice','Quot.sound'],
    'repository_wide_gate_claimed':False,
    'independent_review':'separate pending receipt',
    'steps':[]}
def save():
    (OUT/'receipt.json').write_text(json.dumps(receipt,indent=2)+'\n')
def run(name, command, timeout=900):
    began = datetime.now(timezone.utc).isoformat()
    start = time.monotonic()
    print('START',name,began,flush=True)
    log = OUT/(name+'.log')
    with log.open('w') as stream:
        process = subprocess.Popen(command,cwd=BASE,env=env,close_fds=True,
            start_new_session=True,stdout=stream,stderr=subprocess.STDOUT)
        try:
            while True:
                try:
                    code=process.wait(timeout=30)
                    break
                except subprocess.TimeoutExpired:
                    elapsed=time.monotonic()-start
                    print(name,'elapsed',round(elapsed,1),flush=True)
                    if elapsed>=timeout:
                        code=124
                        break
        finally:
            if process.poll() is None:
                os.killpg(process.pid,signal.SIGTERM)
                try: process.wait(timeout=5)
                except subprocess.TimeoutExpired:
                    os.killpg(process.pid,signal.SIGKILL)
                    process.wait()
    receipt['steps'].append({'name':name,'command':command,'started_utc':began,
        'elapsed_seconds':round(time.monotonic()-start,3),'exit_code':code,'log_sha256':digest(log)})
    save()
    print('END',name,code,receipt['steps'][-1]['elapsed_seconds'],flush=True)
    if code:
        print(log.read_text()[-18000:],flush=True)
        raise RuntimeError(name+' failed: '+str(code))
    return log.read_text()
try:
    save()
    receipt['lean_version']=run('lean-version',[str(toolchain/'lean'),'--version']).strip()
    for module in MODULES:
        target=BUILD/(module.replace('.','/')+'.olean')
        target.parent.mkdir(parents=True,exist_ok=True)
        run(module,[str(toolchain/'lean'),'-j1','-M4000','-DwarningAsError=true',
            '-o',str(target),str(BASE/(module.replace('.','/')+'.lean'))])
    spec={'modules':MODULES,'required':REQUIRED,'legacy_prefixes':['HartkeMatchingExcess.']}
    audit=OUT/'AllOwnedAudit.lean'
    audit.write_text(audit_source(MODULES,REQUIRED,spec['legacy_prefixes']))
    output=run('all-owned-audit',[str(toolchain/'lean'),'-j1','-M4000',
        '-DwarningAsError=true',str(audit)])
    inventory=validate_log(output,spec,{m:False for m in MODULES})
    invfile=OUT/'declaration-inventory.json'
    invfile.write_text(json.dumps(inventory,indent=2)+'\n')
    receipt['audit_summary']=inventory['summary']
    receipt['audit_source_sha256']=digest(audit)
    receipt['declaration_inventory_sha256']=digest(invfile)
    objects={str(p.relative_to(BUILD)):digest(p) for p in sorted(BUILD.rglob('*.olean*'))}
    replay=run('stock-kernel-replay',[sys.executable,str(REPO/'scripts/replay_lean.py'),
        '--lean-dir',str(BASE),'--root',MODULES[-1]])
    receipt['exact_kernel_replay_set']=exact_replay_set(replay,MODULES)
    assert objects=={str(p.relative_to(BUILD)):digest(p) for p in sorted(BUILD.rglob('*.olean*'))}
    assert control_hashes=={str(p.relative_to(REPO)):digest(p) for p in controls}
    assert all(digest(REPO/'lean'/(m.replace('.','/')+'.lean'))==h for m,h in FROZEN['source_sha256'].items())
    receipt['object_sha256']=objects
    receipt['root_sources_still_match']=True
    receipt['status']='passed'
    receipt['finished_utc']=datetime.now(timezone.utc).isoformat()
    save()
    print(json.dumps({k:v for k,v in receipt.items() if k not in ['steps','source_sha256','object_sha256','control_sha256']}),flush=True)
except BaseException as error:
    receipt['status']='failed'
    receipt['error']=str(error)
    save()
    raise
