#!/usr/bin/env python3
"""Authenticate the successful Li44 raw-body supplement and original ZIP backup."""
from pathlib import Path
import hashlib
import json
import os
import stat
import subprocess
import sys
import zipfile

SESSION = Path('/workspace/scratch/9d6f8c81feea')
BASE = SESSION / 'li-verification/raw-hosted44606051622'
STAGE = BASE / 'artifact'
BACKUP = BASE / 'baseline-backup'
ORIGINAL = SESSION / 'li-verification/hosted44599210697/authenticated/original'
REPO = SESSION / 'solved-conjectures'
COMMIT = '26ef845d1ec4adb15e0c87c9264905baeb69491f'
RAW_ZIP = '7ea288555021d503775aa3886fc59edc65ae9a096ca26bb9add7e9950b1e1489'
BACKUP_ZIP = 'dfbb03a7571256df786f9c28f45b306cb924f89403ba403d81063072e6f1eb2f'
RECEIPT = '8cb7e81896bc67b3c68ed976f256e6894b6c52318063ab0894360fed1d0a8b46'
RAW_HELPER = '7c366fa3983ed26b2356c417552b861ff235c5bb34848810191c13b5322c9cea'
RUNNER = '779eeaed3c041704789aed0ca6f738a6e4e6bb87d5a8318540f50ab4e57c701e'
AUTHENTICATOR = '8dd2d36c204285551fd148dcc8f7e5f334bc855c1fa91d2fc70e19b61a5f1e79'
WORKFLOW = '2c6a30f0bf76072a40fe61ad01f93735eea3f78c361be509c6bf49f28ae00c9c'

def sha(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()

def read(path):
    return json.loads(Path(path).read_text())

def encoded(value):
    return (json.dumps(value, indent=2, sort_keys=True) + '\n').encode()

def authenticate_archive(name, directory, digest, count, expanded):
    archive_path = BASE / name
    assert sha(archive_path) == digest
    members = {}
    with zipfile.ZipFile(archive_path) as archive:
        infos = archive.infolist()
        assert len(infos) == count and sum(i.file_size for i in infos) == expanded
        assert len({i.filename for i in infos}) == count
        for info in infos:
            p = Path(info.filename)
            assert not p.is_absolute() and p.as_posix() == info.filename
            assert '..' not in p.parts and '\\' not in info.filename
            assert not info.is_dir() and stat.S_IFMT(info.external_attr >> 16) in (0, stat.S_IFREG)
            assert not (info.flag_bits & 1)
            data = archive.read(info)
            actual = directory / p
            assert actual.is_file() and not actual.is_symlink() and actual.read_bytes() == data
            members[info.filename] = {'bytes': len(data), 'sha256': hashlib.sha256(data).hexdigest()}
    assert {p.relative_to(directory).as_posix() for p in directory.rglob('*') if p.is_file()} == set(members)
    return members

def main():
    assert sha(STAGE / 'receipt.json') == RECEIPT
    receipt = read(STAGE / 'receipt.json')
    assert receipt['schema'] == 'li-hosted44-raw-supplement-v1'
    assert receipt['status'] == 'passed' and receipt['git_commit'] == COMMIT
    assert receipt['all_frozen_hashes_unchanged'] and receipt['all_reachable_raw_variants_audited']
    assert receipt['baseline_verification_authenticated'] and receipt['workflow_present']
    for name in ['proof_sources_recompiled', 'stock_replay_performed_by_this_supplement', 'accepted_registry_changed']:
        assert receipt[name] is False
    run, job, artifacts = (read(BASE / name) for name in ['run.json', 'job.json', 'artifacts.json'])
    assert run['id'] == job['run_id'] == 44606051622 and job['id'] == 135849912826
    assert run['head_sha'] == COMMIT and run['conclusion'] == job['conclusion'] == 'success'
    assert run['status'] == job['status'] == 'completed'
    log = (BASE / 'job.log').read_text()
    for ident, name, digest in [(14569498196, 'artifact.zip', RAW_ZIP), (14569584489, 'baseline-backup.zip', BACKUP_ZIP)]:
        artifact = next(a for a in artifacts['artifacts'] if a['id'] == ident)
        assert artifact['workflow_run']['head_sha'] == COMMIT and artifact['workflow_run']['id'] == run['id']
        assert artifact['digest'] == 'sha256:' + digest and artifact['size_in_bytes'] == (BASE / name).stat().st_size
        assert artifact['expired'] is False and digest in log and ('Artifact ID ' + str(ident)) in log
    raw_members = authenticate_archive('artifact.zip', STAGE, RAW_ZIP, 115, 99595133)
    backup_members = authenticate_archive('baseline-backup.zip', BACKUP, BACKUP_ZIP, 6, 19942331)
    assert sha(BACKUP / 'artifact.zip') == '281b57fd87cf7d6123cdcabff4a5803f3d426116dbb4a9aa01370318b2a138ed'
    assert (BACKUP / 'artifact.zip').read_bytes() == (ORIGINAL.parent.parent / 'artifact.zip').read_bytes()
    original_run, original_job, original_artifact = (read(BACKUP / name) for name in ['run.json', 'job.json', 'artifact.json'])
    assert original_run['id'] == original_job['run_id'] == original_artifact['workflow_run']['id'] == 44599210697
    assert original_job['id'] == 135825706963 and original_artifact['id'] == 14568527194
    assert original_run['head_sha'] == original_job['head_sha'] == original_artifact['workflow_run']['head_sha'] == '20e0e95eb421cf8ea728d34aa29a6d0eb1137789'
    assert original_run['conclusion'] == original_job['conclusion'] == 'success'
    assert original_artifact['digest'] == 'sha256:' + sha(BACKUP / 'artifact.zip')
    assert original_artifact['size_in_bytes'] == (BACKUP / 'artifact.zip').stat().st_size
    hosted_auth = read(STAGE / 'baseline-authentication.json')
    local_auth = read(ORIGINAL.parent / 'authentication.json')
    assert (STAGE / 'baseline-authentication.json').read_bytes() == (BACKUP / 'authenticated/authentication.json').read_bytes()
    assert sha(STAGE / 'baseline-authentication.json') == receipt['authentication_sha256']
    for key in ['archive_path', 'artifact_dir', 'frozen_repository_dir']:
        del hosted_auth[key]; del local_auth[key]
    assert hosted_auth == local_auth
    assert read(BACKUP / 'authenticated/archive-members.json') == read(ORIGINAL.parent / 'archive-members.json')
    assert (STAGE / 'baseline-receipt.json').read_bytes() == (ORIGINAL / 'receipt.json').read_bytes()

    controls = receipt['control_sha256']
    assert controls['scripts/audit_lean_raw_occurrences.py'] == RAW_HELPER
    assert controls['scripts/authenticate_li_hosted44.py'] == AUTHENTICATOR
    assert controls['scripts/verify_li_hosted44_raw.py'] == RUNNER
    assert controls['.github/workflows/lean-li-hosted44-raw.yml'] == WORKFLOW
    frozen = BASE / 'frozen'
    for path, expected in controls.items():
        data = subprocess.check_output(['git', 'show', COMMIT + ':' + path], cwd=REPO)
        assert hashlib.sha256(data).hexdigest() == expected
        assert (STAGE / 'controls' / path).read_bytes() == data
        target = frozen / path
        target.parent.mkdir(parents=True, exist_ok=True)
        if target.exists():
            assert target.read_bytes() == data
        else:
            target.write_bytes(data)
    for module, expected in receipt['source_sha256'].items():
        stem = module.replace('.', '/') + '.lean'
        source = ORIGINAL / 'src' / stem
        assert sha(source) == sha(STAGE / 'src' / stem) == expected
        target = frozen / 'lean' / stem
        target.parent.mkdir(parents=True, exist_ok=True)
        if target.exists():
            assert sha(target) == expected
        else:
            os.link(source, target)
    sys.dont_write_bytecode = True
    sys.path.insert(0, str(frozen / 'scripts'))
    import verify_li_hosted44_raw as runner
    model, checked_controls = runner.freeze_controls()
    assert checked_controls == controls
    baseline, owned, raw, _runtime = runner.load_helpers(checked_controls)
    inputs = runner.authenticate_inputs(ORIGINAL, STAGE / 'baseline-authentication.json', model, baseline)
    assert inputs['files'] == receipt['baseline_artifact_files_sha256']
    assert inputs['modules'] == receipt['project_modules'] and len(inputs['modules']) == 44
    assert inputs['required'] == receipt['required_theorems'] and len(inputs['required']) == 71
    assert inputs['modern'] == receipt['modern_modules']
    assert baseline.objects(STAGE, inputs['modules'], inputs['modern']) == inputs['objects'] == receipt['artifact_sha256']
    assert receipt['toolchain'] == inputs['receipt']['toolchain']
    assert receipt['baseline_metadata'] == runner.BASELINE_METADATA
    assert receipt['baseline_archive_sha256'] == runner.ARCHIVE_SHA256
    assert receipt['baseline_receipt_sha256'] == runner.BASELINE_RECEIPT_SHA256
    assert receipt['raw_helper_sha256'] == RAW_HELPER

    expected_files = {'receipt.json', 'declaration-inventory.json', 'baseline-authentication.json', 'baseline-receipt.json'}
    expected_files |= {'controls/' + path for path in controls}
    for module in inputs['modules']:
        stem = module.replace('.', '/')
        expected_files.add('src/' + stem + '.lean')
        expected_files |= {'lib/lean/' + stem + suffix for suffix in inputs['objects'][module]}
    expected_files |= {'src/LiHosted44Statements.lean', 'src/LiHosted44RawAudit.lean'}
    assert set(receipt['checks']) == {'literal-statements', 'raw-all-owned-audit'}
    for label, check in receipt['checks'].items():
        source_name = 'LiHosted44Statements.lean' if label == 'literal-statements' else 'LiHosted44RawAudit.lean'
        command = [receipt['toolchain']['lean_path'], '-j1', '-M4500', '-DwarningAsError=true']
        if label == 'raw-all-owned-audit': command += ['-t0']
        assert check['command'] == command + [source_name]
        assert check['exit_code'] == 0 and check['timed_out'] is False
        assert sha(STAGE / 'src' / source_name) == check['source_sha256']
        for field, folder in [('log', 'logs'), ('progress', 'progress')]:
            name = folder + '/' + label + ('.log' if field == 'log' else '.json')
            expected_files.add(name)
            assert check[field].endswith('/li-hosted44-raw/' + name)
            assert sha(STAGE / name) == check[field + '_sha256']
        for key, value in read(STAGE / 'progress' / (label + '.json')).items():
            assert check[key] == value
    assert expected_files == set(raw_members)
    assert (STAGE / 'logs/literal-statements.log').read_bytes() == b''
    assert (STAGE / 'src/LiHosted44Statements.lean').read_text() == baseline.STATEMENTS
    assert sha(STAGE / 'src/LiHosted44Statements.lean') == receipt['literal_statements_sha256'] == model['literal_statements_sha256']
    spec = {'modules': inputs['modules'], 'required': inputs['required'], 'legacy_prefixes': model['legacy_prefixes']}
    generated = raw.augment_source(owned.audit_source(spec['modules'], spec['required'], spec['legacy_prefixes']),
        spec['modules'], inputs['modern'], flavor='all_owned', legacy_prefixes=spec['legacy_prefixes'])
    assert (STAGE / 'src/LiHosted44RawAudit.lean').read_text() == generated
    assert sha(STAGE / 'src/LiHosted44RawAudit.lean') == receipt['audit_source_sha256']
    inventory = raw.validate_all_owned_log((STAGE / 'logs/raw-all-owned-audit.log').read_text(), spec, inputs['modern'])
    assert encoded(inventory) == (STAGE / 'declaration-inventory.json').read_bytes()
    assert sha(STAGE / 'declaration-inventory.json') == receipt['declaration_inventory_sha256']
    assert inventory['summary'] == receipt['audit_summary'] == inputs['receipt']['axiom_audit']['summary']
    graph = inventory['raw_occurrence_graph']
    assert graph['summary'] == receipt['raw_occurrence_summary']
    assert not any(node['variants'] for node in graph['nodes'].values())
    for key in ['all_serialized_occurrences_audited', 'all_reachable_raw_variants_audited',
                'all_nonidentical_raw_theorems_kernel_checked', 'all_mixed_family_selected_theorems_kernel_checked',
                'foreign_raw_variants_included', 'axiom_cache_bypassed', 'checked_kernel_negative_control_rejected']:
        assert graph[key] is True
    assert graph['summary']['pending'] == 0 and graph['summary']['trust_level'] == 0
    for name, record in raw_members.items():
        assert sha(STAGE / name) == record['sha256']
    for name, record in backup_members.items():
        assert sha(BACKUP / name) == record['sha256']
    result = {'status': 'authenticated complete hosted raw supplement', 'run_id': 44606051622,
        'job_id': 135849912826, 'head_sha': COMMIT, 'artifact_id': 14569498196,
        'archive_sha256': RAW_ZIP, 'original_receipt_sha256': RECEIPT,
        'backup_artifact_id': 14569584489, 'backup_archive_sha256': BACKUP_ZIP,
        'raw_archive_members': len(raw_members), 'backup_archive_members': len(backup_members),
        'original272_member_baseline_preserved_and_reauthenticated': True,
        'original44_source_and44_stock_replays_authenticated': True,
        'all_controls_match_exact_public_commit': True, 'exact44_source_and_object_closure_matches_original': True,
        'both_literal_and_raw_process_logs_profiles_commands_checked': True,
        'generated_audit_and_canonical_inventory_bytes_checked': True,
        'audit_summary': inventory['summary'], 'raw_occurrence_summary': graph['summary'],
        'reachable_differing_families': 0, 'all_reachable_raw_variants_audited': True,
        'proof_sources_recompiled_by_supplement': False, 'stock_replay_repeated_by_supplement': False,
        'accepted_registry_changed': False, 'authentication_script_sha256': sha(Path(__file__))}
    (BASE / 'authentication.json').write_bytes(encoded(result))
    print(json.dumps(result, indent=2))

if __name__ == '__main__':
    main()
