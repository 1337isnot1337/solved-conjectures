#!/usr/bin/env python3
"""Authenticate the original complete prime-filtering Actions artifact."""
from pathlib import Path
import hashlib
import json
import re
import shutil
import subprocess
import sys
import zipfile

SOURCE_REPO = Path('/workspace/scratch/9d6f8c81feea/solved-conjectures')
ROOT = Path('/workspace/scratch/9d6f8c81feea/prime-filtering/four-hosted44601096014/frozen')
BASE = Path('/workspace/scratch/9d6f8c81feea/prime-filtering/four-hosted44601096014')
STAGE = BASE / 'artifact'
COMMIT = '8d1933b7b568515fe5bf7e8b474fe22e284521e8'
ZIP_SHA = '35b10512afd9074fba2bb8d32e05f64e4219ed29d5169cf07aa7e54fd0508492'
RUN, JOB, ARTIFACT = 44601096014, 135832394504, 14570031426

def sha(data):
    return hashlib.sha256(data).hexdigest()

def digest(path):
    return sha(path.read_bytes())

def git_bytes(path):
    return subprocess.check_output(['git', 'show', COMMIT + ':' + path], cwd=SOURCE_REPO)

def save(path, data):
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(data, indent=2, sort_keys=True) + '\n')

def main():
    assert digest(BASE / 'artifact.zip') == ZIP_SHA
    receipt = json.loads((STAGE / 'receipt.json').read_text())
    assert receipt['schema'] == 'prime-filtering-four-exact-receipt-v1'
    assert receipt['status'] == 'passed' and receipt['git_commit'] == COMMIT
    assert digest(STAGE / 'receipt.json') == 'b1a3227b6ae4ebdad68c24553133ff781082593126f7b25ff86a4051700ceb10'
    assert receipt['all_frozen_hashes_unchanged'] is True
    assert receipt['accepted_registry_changed'] is False
    assert receipt['full_six_speed_bound_claimed'] is False
    assert receipt['literal_four_input_filter_and_folded_bound_scope_checked'] is True
    assert receipt['source_failures'] == receipt['blocked_sources'] == {}
    assert receipt['source_policy'] == dict(fresh_project_objects=True, linter_override=False, warning_as_error=True)
    assert receipt['axiom_whitelist'] == ['propext', 'Classical.choice', 'Quot.sound']
    run = json.loads((BASE / 'run.json').read_text())
    job = json.loads((BASE / 'job.json').read_text())
    artifacts = json.loads((BASE / 'artifacts.json').read_text())
    assert run['id'] == RUN and job['id'] == JOB and job['run_id'] == RUN
    assert run['head_sha'] == COMMIT
    assert run['conclusion'] == job['conclusion'] == 'success'
    artifact = next(a for a in artifacts['artifacts'] if a['id'] == ARTIFACT)
    assert artifact['workflow_run']['head_sha'] == COMMIT and artifact['workflow_run']['id'] == RUN
    assert artifact['digest'] == 'sha256:' + ZIP_SHA and artifact['expired'] is False
    assert (BASE / 'artifact.zip').stat().st_size == artifact['size_in_bytes']

    for path, expected in receipt['gate_sha256'].items():
        data = git_bytes(path)
        assert sha(data) == expected, path
        assert (ROOT / path).read_bytes() == data, ('current control differs', path)
    sys.path.insert(0, str(ROOT / 'scripts'))
    import verify_prime_filtering_four_exact as gate
    import audit_lean_all_owned as audit
    import audit_lean_raw_occurrences as raw
    from replay_lean import imports_of, project_namespace
    model = json.loads(git_bytes('docs/prime-filtering-four-exact-sources.json'))
    modules, required, modern = gate.preflight(model)
    assert modules == receipt['project_modules'] and len(modules) == 20
    assert required == receipt['required_theorems'] and len(required) == 7
    assert modern == receipt['modern_modules']
    assert model['source_sha256'] == receipt['source_sha256']
    assert receipt['roots'] == model['roots']
    assert set(receipt['source_checks']) == set(receipt['kernel_checks']) == set(modules)
    assert receipt['source_workers'] == 1 and receipt['kernel_threads'] == 1
    assert isinstance(receipt['external_lean_path'], list)
    assert all('/.lake/packages/' in p or p.endswith('/lib/lean') and '/.elan/toolchains/' in p
               for p in receipt['external_lean_path'])
    toolchain = receipt['toolchain']
    assert toolchain['lean_sha256'] == gate.LEAN_SHA256
    assert toolchain['checker_sha256'] == gate.CHECKER_SHA256

    def process(check, stem, expected_command, empty=False):
        assert check['exit_code'] == 0 and check['timed_out'] is False
        assert check['command'] == expected_command, stem
        log = STAGE / 'logs' / (stem + '.log')
        progress = STAGE / 'progress' / (stem + '.json')
        assert digest(log) == check['log_sha256'] and digest(progress) == check['progress_sha256']
        if empty:
            assert log.read_bytes() == b''
        for key, value in json.loads(progress.read_text()).items():
            assert check[key] == value, (stem, key)
        return log.read_text()

    objects = {}
    strict = [toolchain['lean_path'], '-j1', '-M4500', '-DwarningAsError=true']
    for module in modules:
        stem = module.replace('.', '/')
        path = STAGE / 'src' / (stem + '.lean')
        assert path.read_bytes() == git_bytes('lean/' + stem + '.lean')
        assert digest(path) == receipt['source_sha256'][module]
        check = receipt['source_checks'][module]
        assert check['source_sha256'] == digest(path)
        output = check['command'][5]
        assert output.endswith('/lib/lean/' + stem + '.olean')
        process(check, module + '.source', strict + ['-o', output, stem + '.lean'], empty=True)
        actual = gate.module_objects(STAGE, module, modern)
        assert actual == check['artifact_sha256'] == receipt['artifact_sha256'][module]
        direct = {m for m in imports_of(path) if project_namespace(m) is not None}
        assert direct == set(check['direct_project_imports'])
        for dep, record in check['direct_project_imports'].items():
            assert dep in objects
            assert record['source_sha256'] == receipt['source_sha256'][dep]
            assert record['artifact_sha256'] == objects[dep]
        objects[module] = actual
    assert gate.objects(STAGE, modules, modern) == objects == receipt['artifact_sha256']
    actual_objects = {str(p.relative_to(STAGE / 'lib/lean')).removesuffix('.olean').replace('/', '.') for p in (STAGE / 'lib/lean').rglob('*.olean')}
    assert actual_objects == set(modules)

    statements = STAGE / 'src/PrimeFilteringFourExactStatements.lean'
    assert statements.read_text() == gate.STATEMENTS
    assert digest(statements) == receipt['literal_statements_sha256'] == model['literal_statements_sha256']
    assert len(re.findall(r'^example\b', gate.STATEMENTS, re.M)) == model['literal_contract_count'] == 4
    process(receipt['literal_statements'], 'literal-statements', strict + [statements.name], empty=True)
    audit_path = STAGE / 'src/PrimeFilteringFourExactAudit.lean'
    assert audit_path.read_text() == raw.augment_source(audit.audit_source(modules, required, model['legacy_prefixes']), modules, modern, flavor='all_owned', legacy_prefixes=model['legacy_prefixes'])
    ac = receipt['axiom_audit']
    assert digest(audit_path) == ac['audit_source_sha256']
    audit_log = process(ac, 'all-owned-audit', strict + ['-t0', audit_path.name])
    spec = dict(modules=modules, required=required, legacy_prefixes=model['legacy_prefixes'])
    inventory = raw.validate_all_owned_log(audit_log, spec, modern)
    assert (json.dumps(inventory, indent=2, sort_keys=True) + '\n').encode() == (STAGE / 'declaration-inventory.json').read_bytes()
    assert inventory['raw_occurrence_graph']['summary'] == ac['raw_occurrence_summary']
    assert ac['all_reachable_raw_variants_audited'] is True
    assert digest(STAGE / 'declaration-inventory.json') == ac['declaration_inventory_sha256']
    assert inventory['summary'] == ac['summary']
    assert all(inventory['declarations'][name]['kind'] == 'theorem' for name in required)
    assert ac['all_owned_declarations_audited'] and ac['exact_raw_private_visibility'] and ac['explicit_import_all']
    replayed = []
    for module in modules:
        check = receipt['kernel_checks'][module]
        command = ['/usr/bin/stdbuf', '-oL', '-eL', toolchain['checker_path'], '-v', module]
        log = process(check, module + '.kernel', command)
        actual = re.findall(r'^replaying (Conjectures\.[A-Za-z0-9_.]+)$', log, re.M)
        assert actual == [module] == check['replayed_modules'] and check['exact_singleton_target'] is True
        gate.exact_singleton(modules, module)
        replayed.extend(actual)
    assert replayed == receipt['kernel_replay']['replayed_modules'] == modules
    assert all(receipt['kernel_replay'][k] is True for k in ['exact_project_closure', 'all_modules_replayed_as_targets', 'fresh_process_per_module'])

    members = {}
    member_names = set()
    with zipfile.ZipFile(BASE / 'artifact.zip') as archive:
        for info in archive.infolist():
            p = Path(info.filename)
            assert info.filename not in member_names
            member_names.add(info.filename)
            assert not p.is_absolute() and '..' not in p.parts
            assert (info.external_attr >> 16) & 0o170000 != 0o120000
            if info.is_dir():
                continue
            raw = archive.read(info.filename)
            assert (STAGE / p).read_bytes() == raw
            members[info.filename] = dict(bytes=len(raw), sha256=sha(raw))
    save(BASE / 'archive-members.json', members)
    out = dict(status='authenticated complete hosted pass', source_commit=COMMIT,
        workflow_run=RUN, job_id=JOB, artifact_id=ARTIFACT, archive_sha256=ZIP_SHA,
        receipt_sha256=digest(STAGE / 'receipt.json'), archive_member_count=len(members),
        project_modules=20, required_theorems=7, literal_contracts=4,
        audit_summary=inventory['summary'], raw_occurrence_summary=inventory['raw_occurrence_graph']['summary'], source_object_log_progress_and_import_hashes_validated=True,
        source_and_controls_match_exact_published_commit=True, literal_source_matches_pinned_gate=True,
        generated_audit_and_parsed_inventory_match=True, exact_singleton_kernel_replays=20,
        compiler_and_checker_hashes_match_pinned_release=True, accepted_registry_changed=False,
        full_six_speed_bound_claimed=False, authentication_script_sha256=digest(Path(__file__)))
    save(BASE / 'authentication.json', out)
    print(json.dumps(out, indent=2))

if __name__ == '__main__':
    main()
