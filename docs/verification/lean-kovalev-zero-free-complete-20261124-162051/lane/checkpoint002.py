"""Check the frozen full Kovalev square-root conjecture closure, including every owned declaration."""
from pathlib import Path
import datetime,fcntl,hashlib,json,os,signal,subprocess,sys,time

LANE=Path(__file__).resolve().parent
CHECKPOINT=LANE/'checkpoint-002'
BASE=CHECKPOINT/'lean'
OUT=CHECKPOINT/'lib/lean'
OUT.mkdir(parents=True,exist_ok=True)
REPO=Path('/tmp/cinna-lean-162051/repo')
TOOLCHAIN=Path('/workspace/scratch/e963d2f60a75/toolchain/lean-4.35.0-linux')
PACKAGES=Path('/workspace/scratch/e963d2f60a75/repo/lean/.lake/packages')
OVERLAY=Path('/tmp/cinna-lean-162051/dependency-overlay')
sys.path.insert(0,str(REPO/'scripts'))
import audit_lean_all_owned as audit
import replay_lean
from replay_lean_parallel import CHECKER_SHA256,exact_replay_set

mods=[]
seen=set()
def visit(module):
    if module in seen: return
    seen.add(module)
    source=BASE/(module.replace('.','/')+'.lean')
    assert source.is_file(),source
    for dep in replay_lean.imports_of(source):
        if dep.startswith('Conjectures.'):
            assert dep.startswith('Conjectures.KovalevZeroFree'),dep
            visit(dep)
    mods.append(module)
visit('Conjectures.KovalevZeroFree')
names=['halfCoeff_pos','sum_correction','sum_weighted_correction','correction_budget_lt',
       'section_one_ne_zero','sqrt_inDiameter','inverse_sqrt_comparison',
       'inverse_sqrt_linear_comparison','integral_beta_id','integral_beta_one_sub',
       'remainder_norm_le_one','remainder_norm_lt_one','remainder_one',
       'lintegral_mobius_substitution','lintegral_beta_euler','lintegral_beta_joint_density',
       'map_oddsScale_beta','integral_oddsScale_beta','beta_resolvent_comparison',
       'remainder_comparison','weighted_correction_norm_lt','leadingPart_norm_lower',
       'correctionRemainder_norm_lt','halfCoeff_beta_normalizer',
       'sqrt_mul_invSection_hasDerivAt','invSection_remainder_identity',
       'formalCoeff_eq_iteratedDeriv','sectionPolynomial_eq_taylor',
       'sectionPolynomial_ne_zero','taylorSection_ne_zero','kovalev_conjecture']
required=['Conjectures.KovalevZeroFree.'+s for s in names]
assert replay_lean.local_closure(BASE,{mods[-1]})==set(mods)
assert len(mods)==21,mods
mathlib_revision=subprocess.check_output(['git','-C',str(PACKAGES/'mathlib'),'rev-parse','HEAD'],text=True).strip()
assert mathlib_revision=='56a005855ea17e0b0958f73ec801ae140b0a1679'
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
assert sha(TOOLCHAIN/'bin/leanchecker')==CHECKER_SHA256
hashes={m.replace('.','/')+'.lean':sha(BASE/(m.replace('.','/')+'.lean')) for m in mods}
controls={str(p):sha(p) for p in [Path(__file__),REPO/'scripts/audit_lean_all_owned.py',
    REPO/'scripts/replay_lean.py',REPO/'scripts/replay_lean_parallel.py']}
env=os.environ.copy()
env.update(LEAN_SYSROOT=str(TOOLCHAIN),LEAN_NUM_THREADS='2',UV_USE_IO_URING='0')
env['PATH']=str(TOOLCHAIN/'bin')+os.pathsep+env['PATH']
env['LEAN_PATH']=os.pathsep.join(map(str,[OUT,OVERLAY,*sorted(PACKAGES.glob('*/.lake/build/lib/lean'))]))
receipt={'status':'running','formalization_status':'full square-root conjecture candidate','complete_results_counted':0,
    'entry':'results/kovalev-zero-free','documented_proof_commit':'6432592c03b24aed190ed7b3204ed942a40a8da4',
    'scope':'Original Kovalev Conjecture 1.2: every Taylor section of the normalized square root of the geometric polynomial is nonzero on the closed unit disk; stronger all-positive-length theorem included',
    'excluded_supplements':['general exponent 0 < alpha <= 1/2','sharp bounds for arbitrary segments','adjacent trigonometric Conjecture 1.3'],
    'remaining':[], 'mathlib_revision':mathlib_revision,
    'project_modules':mods,'required_theorems':required,'source_sha256':hashes,
    'control_sha256':controls,'lean_sha256':sha(TOOLCHAIN/'bin/lean'),
    'leanchecker_sha256':sha(TOOLCHAIN/'bin/leanchecker'),'repository_wide_gate_claimed':False,'steps':[]}
def save(): (CHECKPOINT/'receipt.json').write_text(json.dumps(receipt,indent=2)+'\n')
def now(): return datetime.datetime.now(datetime.timezone.utc).isoformat()
def run(label,args,timeout=180):
    log=CHECKPOINT/(label+'.log');start=time.monotonic();started=now()
    print(started,'START',label,flush=True)
    timedout=False
    with log.open('w') as stream:
        p=subprocess.Popen(list(map(str,args)),cwd=BASE,env=env,stdout=stream,stderr=subprocess.STDOUT,start_new_session=True)
        try:
            while True:
                try: code=p.wait(timeout=10);break
                except subprocess.TimeoutExpired:
                    elapsed=time.monotonic()-start
                    print(now(),label,round(elapsed,1),'seconds',flush=True)
                    if elapsed>=timeout:
                        timedout=True;os.killpg(p.pid,signal.SIGTERM)
                        try:p.wait(timeout=5)
                        except subprocess.TimeoutExpired:os.killpg(p.pid,signal.SIGKILL);p.wait()
                        code=124;break
        finally:
            if p.poll() is None:
                os.killpg(p.pid,signal.SIGTERM)
                try:p.wait(timeout=5)
                except subprocess.TimeoutExpired:os.killpg(p.pid,signal.SIGKILL);p.wait()
    receipt['steps'].append({'label':label,'command':list(map(str,args)),'exit_code':code,
       'started_utc':started,'finished_utc':now(),'seconds':round(time.monotonic()-start,3),
       'timed_out':timedout,'log_sha256':sha(log)})
    save()
    if code:
        print(log.read_text()[-10000:],flush=True)
        raise RuntimeError(f'{label} failed with {code}')
    print(now(),'PASS',label,flush=True)
    return log.read_text()

with Path('/tmp/cinna-lean-162051/lean-gate.lock').open('a') as lock:
    print(now(),'WAIT lean-gate.lock',flush=True)
    fcntl.flock(lock.fileno(),fcntl.LOCK_EX)
    receipt['lock_acquired_utc']=now()
    try:
        save()
        receipt['lean_version']=run('version',['lean','--version']).strip()
        for m in mods:
            source=Path(m.replace('.','/')+'.lean');target=OUT/source.with_suffix('.olean')
            target.parent.mkdir(parents=True,exist_ok=True)
            run(m+'.source',['lean','-j2','-M4000','-DwarningAsError=true','-o',target,source])
            assert sha(BASE/source)==hashes[str(source)]
        auditfile=CHECKPOINT/'AllOwnedAudit.lean'
        auditfile.write_text(audit.audit_source(mods,required,[]))
        log=run('all-owned-audit',['lean','-j2','-M4000','-DwarningAsError=true',auditfile])
        inv=audit.validate_log(log,{'modules':mods,'required':required,'legacy_prefixes':[]},{m:False for m in mods})
        invfile=CHECKPOINT/'declaration-inventory.json';invfile.write_text(json.dumps(inv,indent=2)+'\n')
        objects={str(p.relative_to(OUT)):sha(p) for p in sorted(OUT.rglob('*.olean*'))}
        env['LEAN_NUM_THREADS']='1'
        kernel=run('kernel',replay_lean.checker_command(['Conjectures']),timeout=600)
        receipt['exact_kernel_replay_set']=exact_replay_set(kernel,mods)
        assert objects=={str(p.relative_to(OUT)):sha(p) for p in sorted(OUT.rglob('*.olean*'))}
        assert all(sha(BASE/s)==h for s,h in hashes.items())
        assert all(sha(Path(p))==h for p,h in controls.items())
        receipt.update(status='passed',formalization_status='complete original square-root conjecture',complete_results_counted=1,finished_utc=now(),object_sha256=objects,
            audit_source_sha256=sha(auditfile),declaration_inventory_sha256=sha(invfile),audit_summary=inv['summary'],
            kernel_environment={'LEAN_NUM_THREADS':'1','UV_USE_IO_URING':'0'})
        save();print(now(),'PASS complete original square-root conjecture',flush=True)
    except BaseException as error:
        receipt['status']='failed';receipt['error']=str(error);save();raise
    finally:
        fcntl.flock(lock.fileno(),fcntl.LOCK_UN)
        print(now(),'RELEASED lean-gate.lock',flush=True)
