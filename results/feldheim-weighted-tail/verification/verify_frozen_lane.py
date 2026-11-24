"""Check the frozen full Feldheim–Feldheim weighted-tail conjecture closure, including every owned declaration."""
from pathlib import Path
import datetime,fcntl,hashlib,json,os,signal,subprocess,sys,time

LANE=Path(__file__).resolve().parent
CHECKPOINT=LANE/'checkpoint-001'
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
            assert dep.startswith('Conjectures.FeldheimWeightedTail'),dep
            visit(dep)
    mods.append(module)
visit('Conjectures.FeldheimWeightedTail')
names=['wright_unit_integral_le','wright_unit_le','wright_chord_le',
       'monotone_wright_chordBoundOn','exists_affine_minorant_of_chord',
       'convexMinorant_convex','convexMinorant_approx','convex_hazard_windows',
       'window_inverse_levels','window_exists_balanced_levels','window_exists_support',
       'monotone_rectangle_windows','rectangle_window_oscillation','weighted_window_estimates',
       'survival_right_continuous','logTail_tendsto_atTop',
       'rectangleBound_of_probability_bound','weightedTail_eq_integral',
       'inverse_survival_integrableOn','tailRatio_lower_integral',
       'limsup_ofReal_eq_top_of_unbounded','real_tail_positive_iff_not_bounded',
       'not_compactly_supported_iff_not_bounded',
       'tailRatio_map','exists_large_tailRatio_of_log_integral',
       'log_tail_increment_le_inverse_tail_integral','tailRatio_arbitrarily_large',
       'tailRatio_limsup_eq_top','independent_tail_limsup','feldheim_feldheim_conjecture']
required=['Conjectures.FeldheimWeightedTail.'+s for s in names]
assert replay_lean.local_closure(BASE,{mods[-1]})==set(mods)
assert mods[-1]=='Conjectures.FeldheimWeightedTail',mods
assert len(mods)==20,mods
mathlib_revision=subprocess.check_output(['git','-C',str(PACKAGES/'mathlib'),'rev-parse','HEAD'],text=True).strip()
assert mathlib_revision=='56a005855ea17e0b0958f73ec801ae140b0a1679'
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
assert sha(TOOLCHAIN/'bin/leanchecker')==CHECKER_SHA256
hashes={m.replace('.','/')+'.lean':sha(BASE/(m.replace('.','/')+'.lean')) for m in mods}
controls={str(p):sha(p) for p in [Path(__file__),REPO/'scripts/audit_lean_all_owned.py',
    REPO/'scripts/replay_lean.py',REPO/'scripts/replay_lean_parallel.py',
    REPO/'lean/lean-toolchain',REPO/'lean/lake-manifest.json',REPO/'lean/lakefile.toml']}
env=os.environ.copy()
env.update(LEAN_SYSROOT=str(TOOLCHAIN),LEAN_NUM_THREADS='2',UV_USE_IO_URING='0')
env['PATH']=str(TOOLCHAIN/'bin')+os.pathsep+env['PATH']
env['LEAN_PATH']=os.pathsep.join(map(str,[OUT,OVERLAY,*sorted(PACKAGES.glob('*/.lake/build/lib/lean'))]))
receipt={'status':'running','started_at':datetime.datetime.now(datetime.timezone.utc).isoformat(),'formalization_status':'full arbitrary-law weighted-tail conjecture candidate','complete_results_counted':0,
    'entry':'results/feldheim-weighted-tail','documented_proof_commit':'2f800fa5191a1d747f126fa20f7e9c2b3730b085',
    'scope':'Original Feldheim–Feldheim Conjecture 1: all independent nonnegative unbounded laws and every real positive weight below one, with literal infinite limsup; no atom-free, moment, iid or density assumption',
    'excluded_supplements':['Higher-dimensional norm consequences','Finite-threshold supplements'],
    'remaining':[], 'mathlib_revision':mathlib_revision,
    'documented_proof_sha256':sha(LANE/'SOURCE_PROOF.md'),
    'primary_source':'https://u.cs.biu.ac.il/~feldhen/Papers/MinMean.pdf',
    'project_modules':mods,'required_theorems':required,'source_sha256':hashes,
    'control_sha256':controls,'lean_sha256':sha(TOOLCHAIN/'bin/lean'),
    'leanchecker_sha256':sha(TOOLCHAIN/'bin/leanchecker'),'repository_wide_gate_claimed':False,'steps':[]}
def save(): (CHECKPOINT/'receipt.json').write_text(json.dumps(receipt,indent=2)+'\n')
def now(): return datetime.datetime.now(datetime.timezone.utc).isoformat()
def run(label,args,timeout=600):
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
        assert 'version 4.35.0,' in receipt['lean_version']
        assert 'eb6cafb7290e8bd5f2937522d8d804f58f02bafc' in receipt['lean_version']
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
        kernel=run('kernel',replay_lean.checker_command(['Conjectures']),timeout=900)
        receipt['exact_kernel_replay_set']=exact_replay_set(kernel,mods)
        assert objects=={str(p.relative_to(OUT)):sha(p) for p in sorted(OUT.rglob('*.olean*'))}
        assert all(sha(BASE/s)==h for s,h in hashes.items())
        assert all(sha(Path(p))==h for p,h in controls.items())
        receipt.update(status='passed',formalization_status='complete original weighted-tail conjecture',complete_results_counted=1,finished_utc=now(),object_sha256=objects,
            audit_source_sha256=sha(auditfile),declaration_inventory_sha256=sha(invfile),audit_summary=inv['summary'],
            kernel_environment={'LEAN_NUM_THREADS':'1','UV_USE_IO_URING':'0'})
        save();print(now(),'PASS complete original weighted-tail conjecture',flush=True)
    except BaseException as error:
        receipt['status']='failed';receipt['error']=str(error);save();raise
    finally:
        fcntl.flock(lock.fileno(),fcntl.LOCK_UN)
        print(now(),'RELEASED lean-gate.lock',flush=True)
