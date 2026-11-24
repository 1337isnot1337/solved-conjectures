from pathlib import Path
import os,subprocess,sys,json,hashlib,datetime,shutil
repo=Path('/tmp/cinna-lean-162051/repo')
root=Path('/tmp/cinna-lean-162051/fan/checkpoint-004')
root.mkdir(exist_ok=True)
modules=['Conjectures.FanTringaliBasic','Conjectures.FanTringaliGadget','Conjectures.FanTringaliSlices','Conjectures.FanTringaliProducts','Conjectures.FanTringaliCoordinates','Conjectures.FanTringaliStack','Conjectures.FanTringaliGraph','Conjectures.FanTringaliFactorizations','Conjectures.FanTringaliGraphLengths','Conjectures.FanTringaliBlocks','Conjectures.FanTringaliRadix','Conjectures.FanTringaliRadixTransfer','Conjectures.FanTringaliNatural','Conjectures.FanTringaliNaturalSystem','Conjectures.FanTringaliMonoidBasic','Conjectures.FanTringaliMonoidNormalization','Conjectures.FanTringaliMonoidTransfer','Conjectures.FanTringaliMonoid']
required=['FanTringali.factors_of_box','FanTringali.atomic_factorization_box_length','FanTringali.Gadget.square_impossible','FanTringali.slab_uniqueQuotient','FanTringali.slab_no_quotient_both','FanTringali.uniqueQuotient_stack','FanTringali.graph_box_divisor_iff','FanTringali.graph_uniqueQuotient','FanTringali.layered_atomic_factorization','FanTringali.layered_lengths','FanTringali.graph_lengths','FanTringali.finite_spectrum_lattice','FanTringali.radix_divisors_lift','FanTringali.radix_atom_iff','FanTringali.radix_lengths','FanTringali.finite_spectrum_nat','FanTringali.natural_length_system','FanTringali.pow_injective_of_infinitePowers','FanTringali.finset_isUnit_iff','FanTringali.restrictedAtom_iff','FanTringali.restrictedLengths_eq_powerLengths','FanTringali.normalize_two','FanTringali.normalize_atom_list','FanTringali.normalize_factorization','FanTringali.powerAtom_powerImage_iff','FanTringali.powerLengths_powerImage','FanTringali.restrictedLengths_powerImage','FanTringali.finite_spectrum_power_monoids']
base=Path('/workspace/scratch/e963d2f60a75/repo/lean/.lake/packages')
paths=[str(p/'.lake/build/lib/lean') for p in sorted(base.iterdir()) if (p/'.lake/build/lib/lean').is_dir()]
compiler='/workspace/scratch/e963d2f60a75/toolchain/lean-4.35.0-linux/bin/lean'
checker='/workspace/scratch/e963d2f60a75/toolchain/lean-4.35.0-linux/bin/leanchecker'
env=os.environ.copy();env['PATH']=str(Path(compiler).parent)+':'+env.get('PATH','');env['LEAN_NUM_THREADS']='2';env['LEAN_PATH']=':'.join([str(root/'oleans'),'/tmp/cinna-lean-162051/dependency-overlay']+paths)
hashes={}; builds={}; kernels={}
for m in modules:
 rel=Path(*m.split('.')).with_suffix('.lean'); src=repo/'lean'/rel; dst=root/'lean'/rel
 dst.parent.mkdir(parents=True,exist_ok=True); shutil.copyfile(src,dst)
 hashes[str(Path('lean')/rel)]=hashlib.sha256(dst.read_bytes()).hexdigest()
 out=(root/'oleans'/rel).with_suffix('.olean');out.parent.mkdir(parents=True,exist_ok=True)
 cmd=[compiler,'-j2','-M3500','-DwarningAsError=true','-o',str(out),str(rel)]
 r=subprocess.run(cmd,cwd=root/'lean',env=env,text=True,capture_output=True,timeout=180)
 (root/(m+'.build.log')).write_text('command='+json.dumps(cmd)+'\n'+r.stdout+r.stderr+'\nexit='+str(r.returncode)+'\n')
 builds[m]=r.returncode
 print('build',m,r.returncode,flush=True)
 if r.returncode:print(r.stdout+r.stderr);sys.exit(r.returncode)
sys.path.insert(0,str(repo/'scripts'))
from audit_lean_all_owned import audit_source,validate_log
spec={'modules':modules,'required':required,'legacy_prefixes':['FanTringali.']}
audit=root/'AllOwnedAudit.lean';audit.write_text(audit_source(modules,required,['FanTringali.']))
r=subprocess.run([compiler,'-j2','-M3500','-DwarningAsError=true',str(audit)],cwd=root/'lean',env=env,text=True,capture_output=True,timeout=180)
log=r.stdout+r.stderr;(root/'all-owned.log').write_text(log)
if r.returncode:print(log);sys.exit(r.returncode)
parsed=validate_log(log,spec,{m:False for m in modules});(root/'all-owned.json').write_text(json.dumps(parsed,indent=2)+'\n')
print('audit',parsed['summary'],flush=True)
for m in modules:
 cmd=[checker,'-v',m]
 r=subprocess.run(cmd,cwd=root/'lean',env=env,text=True,capture_output=True,timeout=180)
 (root/(m+'.kernel.log')).write_text('command='+json.dumps(cmd)+'\n'+r.stdout+r.stderr+'\nexit='+str(r.returncode)+'\n')
 kernels[m]=r.returncode
 print('kernel',m,r.returncode,flush=True)
 if r.returncode:print(r.stdout+r.stderr);sys.exit(r.returncode)
receipt={'time_utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),'modules':modules,'required':required,'source_sha256':hashes,'compiler_flags':['-j2','-M3500','-DwarningAsError=true'],'LEAN_NUM_THREADS':'2','audit_summary':parsed['summary'],'strict_build_exits':builds,'kernel_replay_exits':kernels,'complete_conjecture':True,'scope':'Original Fan–Tringali2018 §5 conjecture for ordinary and restricted finitary power monoids of every Dedekind-finite monoid with infinitely many positive powers; exact natural-number length system also proved','remaining':None,'unformalized_supplements':['Survey2026 irreducible formulation without Dedekind-finiteness','Prescribed unordered factorization multiplicities','Relative cancellativity']}
(root/'receipt.json').write_text(json.dumps(receipt,indent=2)+'\n')
print('RECEIPT',root/'receipt.json',flush=True)
