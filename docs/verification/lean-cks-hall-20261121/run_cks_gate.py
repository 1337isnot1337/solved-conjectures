from pathlib import Path
import datetime
import hashlib
import importlib.util
import json
import os
import shutil
import subprocess
import sys
import time

scratch = Path('/workspace/scratch/17b12d3ee06e')
repo = scratch/'solved-conjectures'
sys.path.insert(0,str(repo/'scripts'))
import audit_lean_owned_extension as modern_audit
import audit_lean_all_owned as full_audit
from build_lean_parallel import scope_plan
from replay_lean import local_closure

names = {
    'Data': ['partition_complete','dominates_index','hallWeight_exact','hallWeight_positive',
             'parts_sorted'],
    'Transition': ['transition_inverse','evaluation_inverse'],
    'Gram': ['gram_from_power'],
    'Dual': ['gram_macdonald','dual_upper','dual_diagonal_positive'],
    'Family': ['macdonald_monic','macdonald_triangular','macdonald_dual'],
    'Core': ['real_inverse_transition','gram_factorization','hall_power_coordinates',
             'powerCoordinates_power','hall_power_basis','macdonald_source_family',
             'source_family_unique','source_family_exists_unique'],
    'Orbits': ['orbitListCertificate_nodup','orbitSix_certificate','monomialSix_eq_list'],
    'Power': ['power_expansion'],
    'Evaluation': ['evaluation_matrix_exact'],
    'Polynomial': ['power_coordinates_polynomial','literal_polynomial_injective',
                   'hall_polynomial_well_defined'],
}
required_by_module = {
    'Conjectures.ChenKhareSahiOrthogonality'+suffix:
        ['ChenKhareSahi.Orthogonality.'+name for name in endpoints]
    for suffix,endpoints in names.items()}
required_by_module['Conjectures.ChenKhareSahiHallConvention'] = [
    'ChenKhareSahi.HallConvention.'+name for name in
    ['realize_injective','sourceOneRow_half_three','sourceOneRow_half_two_one',
     'finiteHall_source_pairing','source_formulas_not_finiteHall_orthogonal']]
owned_modules = list(required_by_module)
final_module = 'Conjectures.ChenKhareSahiOrthogonality'
final_required = ['ChenKhareSahi.Orthogonality.'+name for name in
    ['dominates_iff_all_prefixes','monomial_specialize','stable_hall_specialization',
     'stable_hall_normalization_positive','standard_macdonald_counterexample',
     'stable_hall_counterexample_witness']]

toolchain = scratch/'toolchains/lean-4.35.0-linux'
old_modules = ['Conjectures.ChenKhareSahi'+suffix
               for suffix in ['', 'Covers','Real','Cone','Products','Graded','Mixed']]
all_expected_modules = sorted(owned_modules+[final_module]+old_modules)
repo_controls = ['lean/lean-toolchain','lean/lakefile.toml','lean/lake-manifest.json',
    'scripts/audit_lean_owned_extension.py','scripts/audit_lean_all_owned.py',
    'scripts/replay_lean.py','scripts/build_lean_parallel.py','scripts/plan_accepted_lean.py']
modern_source = scratch/'CKSModernOwnedAudit.lean'
full_source = scratch/'CKSCompleteAllOwnedAudit.lean'

def digest(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()

def save(path, value):
    temporary = path.with_suffix(path.suffix+'.tmp')
    temporary.write_text(json.dumps(value,indent=2)+'\n')
    temporary.replace(path)

def expected_paths():
    paths = [repo/'lean'/(m.replace('.','/')+'.lean') for m in all_expected_modules]
    for module in all_expected_modules:
        suffixes = ['.olean','.olean.private','.olean.server'] if module in owned_modules else ['.olean']
        if module not in owned_modules:
            for suffix in ['.olean.private','.olean.server']:
                assert not (repo/'lean/.lake/build/lib/lean'/(module.replace('.','/')+suffix)).exists(), (module,suffix)
        paths += [repo/'lean/.lake/build/lib/lean'/(module.replace('.','/')+suffix)
                  for suffix in suffixes]
    return paths + [repo/p for p in repo_controls]

def extra_controls():
    return [Path(__file__).resolve(), modern_source, full_source,
        scratch/'cks-complete-obligations.json', toolchain/'bin/lean',
        toolchain/'bin/leanchecker', toolchain/'lib/lean/libleanshared.so']

def validate_environment():
    for name in ['lean','leanchecker']:
        assert Path(shutil.which(name) or '/missing').resolve() == (toolchain/'bin'/name).resolve(), name
    assert (repo/'lean/lean-toolchain').read_text().strip() == 'leanprover/lean4:v4.35.0'
    packages = json.loads((repo/'lean/lake-manifest.json').read_text())['packages']
    assert [p['rev'] for p in packages if p['name'] == 'mathlib'] == ['56a005855ea17e0b0958f73ec801ae140b0a1679']
    expected = [repo/'lean/.lake/build/lib/lean'] + [
        repo/'lean/.lake/packages'/name/'.lake/build/lib/lean' for name in sorted(p['name'] for p in packages if p['name'] != 'Cli')]
    assert all(path.is_dir() for path in expected)
    assert [str(path.resolve()) for path in expected] == [
        str(Path(p).resolve()) for p in os.environ.get('LEAN_PATH','').split(os.pathsep) if p]

def run(label,command):
    log = scratch/('cks-complete-'+label+'.log')
    started = datetime.datetime.now(datetime.timezone.utc).isoformat()
    begin = time.monotonic()
    print('START',label,flush=True)
    save(scratch/('cks-complete-'+label+'-metrics.json'),
         dict(command=command,cwd=str(repo/'lean'),started_utc=started,
              status='running',returncode=None))
    with log.open('wb') as stream:
        child = subprocess.Popen(command,cwd=repo/'lean',stdout=stream,
                                 stderr=subprocess.STDOUT)
        try:
            _,status,usage = os.wait4(child.pid,0)
            child.returncode = os.waitstatus_to_exitcode(status)
        except BaseException:
            child.terminate()
            child.wait()
            raise
    metrics = dict(command=command,cwd=str(repo/'lean'),started_utc=started,
        elapsed_seconds=time.monotonic()-begin,returncode=child.returncode,
        user_seconds=usage.ru_utime,system_seconds=usage.ru_stime,maxrss_kib=usage.ru_maxrss,
        status='passed' if child.returncode == 0 else 'failed',
        log_bytes=log.stat().st_size,log_sha256=digest(log))
    save(scratch/('cks-complete-'+label+'-metrics.json'),metrics)
    print('FINISH',label,json.dumps(metrics),flush=True)
    if child.returncode:
        print(log.read_text()[-18000:],flush=True)
        raise SystemExit(child.returncode)
    return log

def verify_frozen():
    frozen = json.loads((scratch/'cks-complete-frozen-sha256.json').read_text())
    assert set(frozen) == {str(path.relative_to(repo)) for path in expected_paths()}
    for path,sha in frozen.items():
        assert digest(repo/path) == sha,path
    controls = json.loads((scratch/'cks-complete-control-sha256.json').read_text())
    assert set(controls) == {str(path) for path in extra_controls()}
    for path,sha in controls.items():
        assert digest(Path(path)) == sha,path
    graph,_,_,_ = scope_plan(repo,[],root=final_module)
    assert set(graph) == set(all_expected_modules)
    obligations = json.loads((scratch/'cks-complete-obligations.json').read_text())
    assert obligations['imported_modules'] == all_expected_modules
    assert modern_source.read_text() == modern_audit.audit_source(
        sorted(owned_modules),owned_modules,required_by_module)
    assert full_source.read_text() == full_audit.audit_source(
        all_expected_modules,obligations['required'],['ChenKhareSahi.'])

def validate_current_audits():
    obligations = json.loads((scratch/'cks-complete-obligations.json').read_text())
    commands = {
        'modern-audit':['lean','-j1','-M2200','-DwarningAsError=true',str(modern_source)],
        'full-audit':['lean','-j1','-M3000','-DwarningAsError=true',str(full_source)]}
    for label,command in commands.items():
        metrics = json.loads((scratch/('cks-complete-'+label+'-metrics.json')).read_text())
        log = scratch/('cks-complete-'+label+'.log')
        assert type(metrics.get('returncode')) is int and metrics['returncode'] == 0
        assert metrics.get('status') == 'passed' and metrics['command'] == command
        assert metrics['cwd'] == str(repo/'lean')
        assert metrics['log_bytes'] == log.stat().st_size and metrics['log_sha256'] == digest(log)
        assert datetime.datetime.fromisoformat(metrics['started_utc']) >= datetime.datetime.fromisoformat(obligations['prepared_utc'])
        if label == 'modern-audit':
            validated = modern_audit.validate_log(log.read_text(),sorted(owned_modules),
                                                  owned_modules,required_by_module)
        else:
            spec = dict(modules=all_expected_modules,required=obligations['required'],
                        legacy_prefixes=['ChenKhareSahi.'])
            flags = {module:module in owned_modules for module in all_expected_modules}
            validated = full_audit.validate_log(log.read_text(),spec,flags)
        assert validated == json.loads((scratch/('cks-complete-'+label+'-validated.json')).read_text())

validate_environment()
if sys.argv[1] == 'audit':
    graph,_,_,_ = scope_plan(repo,[],root=final_module)
    all_modules = sorted(graph)
    assert set(all_modules) == set(owned_modules+[final_module]+old_modules),all_modules
    modern_imports = sorted(local_closure(repo/'lean',set(owned_modules)))
    assert set(modern_imports) == set(owned_modules),modern_imports
    required = [name for module in owned_modules for name in required_by_module[module]]
    required += final_required+['ChenKhareSahi.FullSemiring.excludes_counterexample']
    obligations = dict(imported_modules=all_modules,modern_owned_modules=owned_modules,
        modern_required_by_module=required_by_module,legacy_assembly=final_module,
        required=required,legacy_dependency_modules=old_modules,legacy_prefixes=['ChenKhareSahi.'],
        prepared_utc=datetime.datetime.now(datetime.timezone.utc).isoformat())
    (scratch/'cks-complete-obligations.json').write_text(json.dumps(obligations,indent=2)+'\n')
    modern_source.write_text(modern_audit.audit_source(modern_imports,owned_modules,required_by_module))
    full_source.write_text(full_audit.audit_source(all_modules,required,['ChenKhareSahi.']))
    paths = expected_paths()
    for path in paths+extra_controls():
        assert path.is_file(),path
    frozen = {str(path.relative_to(repo)):digest(path) for path in paths}
    (scratch/'cks-complete-frozen-sha256.json').write_text(json.dumps(frozen,indent=2)+'\n')
    save(scratch/'cks-complete-control-sha256.json',{str(path):digest(path) for path in extra_controls()})
    modern_log = run('modern-audit',['lean','-j1','-M2200','-DwarningAsError=true',str(modern_source)])
    modern_validated = modern_audit.validate_log(modern_log.read_text(),modern_imports,
                                                owned_modules,required_by_module)
    (scratch/'cks-complete-modern-audit-validated.json').write_text(
        json.dumps(modern_validated,indent=2)+'\n')
    print('MODERN OWNED AUDIT PASS',json.dumps(modern_validated['summary']),flush=True)
    full_log = run('full-audit',['lean','-j1','-M3000','-DwarningAsError=true',str(full_source)])
    full_spec = dict(modules=all_modules,required=required,legacy_prefixes=['ChenKhareSahi.'])
    modern_flags = {module:module in owned_modules for module in all_modules}
    full_validated = full_audit.validate_log(full_log.read_text(),full_spec,modern_flags)
    (scratch/'cks-complete-full-audit-validated.json').write_text(json.dumps(full_validated,indent=2)+'\n')
    verify_frozen()
    validate_current_audits()
    print('FULL OWNED AUDIT PASS',json.dumps(full_validated['summary']),flush=True)
elif sys.argv[1] == 'kernel':
    verify_frozen()
    validate_current_audits()
    run('kernel',['python3','../scripts/replay_lean.py','--root',final_module])
    verify_frozen()
    print('KERNEL PASS: exact 19-module closure and frozen inventory unchanged',flush=True)
else:
    raise SystemExit('Expected audit or kernel')
