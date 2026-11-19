from pathlib import Path, PurePosixPath
import argparse
import hashlib
import json
import re
import sys
import zipfile

parser = argparse.ArgumentParser()
parser.add_argument('--snapshot', type=Path, required=True)
parser.add_argument('--archive', type=Path, required=True)
parser.add_argument('--task', required=True)
parser.add_argument('--head', required=True)
parser.add_argument('--run', type=int, required=True)
parser.add_argument('--job', type=int, required=True)
parser.add_argument('--artifact', type=int, required=True)
parser.add_argument('--zip-sha256', required=True)
parser.add_argument('--receipt-sha256', required=True)
parser.add_argument('--out', type=Path, required=True)
args = parser.parse_args()
sha = lambda b: hashlib.sha256(b).hexdigest()
encoded = lambda o: (json.dumps(o, indent=2, sort_keys=True) + '\n').encode()
assert sha(args.archive.read_bytes()) == args.zip_sha256
z = zipfile.ZipFile(args.archive)
names = z.namelist()
assert len(names) == len(set(names))
assert all(not PurePosixPath(n).is_absolute() and '..' not in PurePosixPath(n).parts for n in names)
raw = z.read('receipt.json')
assert sha(raw) == args.receipt_sha256
receipt = json.loads(raw)
assert receipt['status'] == 'passed' and receipt['git_commit'] == args.head
assert receipt['schema'] == 'six-spectrum-norm-exact-receipt-v1'
assert receipt['all_frozen_hashes_unchanged'] is True
assert receipt['stated_component_scope_checked'] is True
assert receipt['universal_classification_claimed'] is False
assert receipt['accepted_registry_changed'] is False
assert receipt['source_workers'] == receipt['kernel_threads'] == 1
assert receipt['axiom_whitelist'] == ['propext', 'Classical.choice', 'Quot.sound']
packet = json.loads((args.snapshot / 'docs/six-spectrum-norm-exact-sources.json').read_bytes())
model = packet['tasks'][args.task]
assert receipt['source_policy'] == model['source_policy'] == {'warning_as_error': True, 'linter_override': False, 'fresh_project_objects': True}
for key in ['roots', 'scope', 'source_sha256', 'required_theorems']:
    assert receipt[key] == model[key], key
mods = receipt['project_modules']
assert len(mods) == len(set(mods)) == model['project_module_count']
assert set(mods) == set(model['source_sha256'])
assert len(receipt['required_theorems']) == model['required_theorem_count']
for path, digest in receipt['gate_sha256'].items():
    assert sha((args.snapshot/path).read_bytes()) == digest, path
for module, digest in receipt['source_sha256'].items():
    path = module.replace('.', '/') + '.lean'
    assert sha(z.read('src/'+path)) == digest
    assert z.read('src/'+path) == (args.snapshot/'lean'/path).read_bytes()
objects = set()
for module, facets in receipt['artifact_sha256'].items():
    assert module in mods and '.olean' in facets
    assert ('.olean.private' in facets) == ('.olean.server' in facets)
    for ext, digest in facets.items():
        assert ext in {'.olean','.olean.private','.olean.server','.ir','.ir.sig'}
        path = 'lib/lean/'+module.replace('.','/')+ext
        assert sha(z.read(path)) == digest
        objects.add(path)
assert objects == {n for n in names if n.startswith('lib/lean/') and not n.endswith('/')}
assert receipt['toolchain']['lean_sha256'] == 'bf8d54e4714cc4b03d3f6bb34c83b7202b87e49c8bfcbff6895c085bb90ceb38'
assert receipt['toolchain']['checker_sha256'] == '12c38901cdbfab178f1bf6145dd30012e9a3b2c11ca695292a5884fa3cbaddb6'
lean = receipt['toolchain']['lean_path']
checker = receipt['toolchain']['checker_path']
assert set(receipt['source_checks']) == set(receipt['kernel_checks']) == set(mods)
processes = []
for module in mods:
    source = receipt['source_checks'][module]
    stem = module.replace('.','/')
    cmd = source['command']
    assert cmd[:5] == [lean,'-j1','-M4500','-DwarningAsError=true','-o']
    assert len(cmd) == 7 and cmd[5].endswith('/lib/lean/'+stem+'.olean') and cmd[6] == stem+'.lean'
    kernel = receipt['kernel_checks'][module]
    cmd = kernel['command']
    if len(cmd) == 6 and PurePosixPath(cmd[0]).name == 'stdbuf':
        assert cmd[1:3] == ['-oL','-eL']
        cmd = cmd[3:]
    assert cmd == [checker,'-v',module]
    kraw = z.read('logs/'+module+'.kernel.log')
    assert re.findall(r'^replaying (Conjectures\.[A-Za-z0-9_.]+)$', kraw.decode(), re.M) == [module]
    assert kernel['replayed_modules'] == [module] and kernel['exact_singleton_target'] is True
    processes.extend([source,kernel])
assert receipt['kernel_replay']['replayed_modules'] == mods
assert receipt['kernel_replay']['all_modules_replayed_as_targets'] is True
assert receipt['kernel_replay']['fresh_process_per_module'] is True
audit_check = receipt['axiom_audit']
assert audit_check['command'] == [lean,'-j1','-M4500','-DwarningAsError=true','SixSpectrumNormAudit.lean']
assert audit_check['all_owned_declarations_audited'] and audit_check['exact_raw_private_visibility'] and audit_check['explicit_import_all']
processes.append(audit_check)
for process in processes:
    assert process['exit_code'] == 0 and process['timed_out'] is False
    name = PurePosixPath(process['log']).name
    log = z.read('logs/'+name)
    assert sha(log) == process['log_sha256']
    progress = json.loads(z.read('progress/'+name[:-4]+'.json'))
    assert all(process[k] == value for k,value in progress.items())
sys.path.insert(0,str(args.snapshot/'scripts'))
import audit_lean_all_owned as audit
audit_source = audit.audit_source(mods,receipt['required_theorems'],model['legacy_prefixes']).encode()
assert audit_source == z.read('src/SixSpectrumNormAudit.lean')
assert sha(audit_source) == audit_check['audit_source_sha256']
spec = {'modules':mods,'required':receipt['required_theorems'],'legacy_prefixes':model['legacy_prefixes']}
inventory = audit.validate_log(z.read('logs/all-owned-audit.log').decode(),spec,receipt['modern_modules'])
assert inventory == json.loads(z.read('declaration-inventory.json'))
assert sha(z.read('declaration-inventory.json')) == audit_check['declaration_inventory_sha256']
assert all(inventory['declarations'][n]['kind']=='theorem' for n in receipt['required_theorems'])
assert inventory['summary'] == audit_check['summary']
args.out.mkdir(parents=True,exist_ok=True)
manifest = {n:{'bytes':len(z.read(n)),'sha256':sha(z.read(n))} for n in names if not n.endswith('/')}
keep = ['receipt.json','declaration-inventory.json','src/SixSpectrumNormAudit.lean']
keep += [n for n in names if n.startswith(('logs/','progress/')) and not n.endswith('/')]
for name in keep:
    p = args.out/name
    p.parent.mkdir(parents=True,exist_ok=True)
    p.write_bytes(z.read(name))
(args.out/'archive-members.json').write_bytes(encoded(manifest))
record = {'schema':'six-spectrum-norm-original-evidence-preservation-v1','source_commit':args.head,'run_id':args.run,'job_id':args.job,'artifact_id':args.artifact,'archive_sha256':args.zip_sha256,'archive_bytes':args.archive.stat().st_size,'raw_receipt_sha256':args.receipt_sha256,'task':args.task,'checked_archive_files':len(manifest),'preserved_files':keep,'all_archived_source_and_object_hashes_checked':True,'all_process_records_and_logs_checked':True,'original_audit_reconstructed_and_validated':True,'new_lean_execution_performed':False,'universal_classification_claimed':False,'validator_path':'scripts/validate_six_spectrum_norm_archive.py','validator_sha256':sha(Path(__file__).read_bytes())}
(args.out/'preservation.json').write_bytes(encoded(record))
print(json.dumps({'status':'authenticated','module_count':len(mods),'summary':inventory['summary'],'out':str(args.out)}))
