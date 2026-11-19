#!/usr/bin/env python3
"""Independently reauthenticate the completed Li44 raw supplement read-only."""
from pathlib import Path
import contextlib
import hashlib
import io
import json
import os
import runpy
import sys

sys.dont_write_bytecode = True
ROOT = Path('/workspace/scratch/9d6f8c81feea')
BASE = ROOT / 'li-verification/raw-hosted44606051622'
ORIGINAL = ROOT / 'li-verification/hosted44599210697/authenticated/original'
AUTH = ROOT / 'li-verification/authenticate_li_raw_hosted.py'
OUT = Path(__file__).resolve().parent

def sha(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()

def read(path):
    return json.loads(Path(path).read_text())

def main():
    assert sha(AUTH) == 'd97c8354e24c979a36b0aa55d9ccf7910f75a81a0a5f53fc907df53e52e1f4a1'
    assert sha(BASE / 'authentication.json') == '6abda54c54c591fef864220fd7624374ad25af865a94989204969305eecb0610'
    immutable = {}
    for directory in [ORIGINAL, BASE / 'artifact', BASE / 'baseline-backup', BASE / 'frozen']:
        for path in directory.rglob('*'):
            if path.is_file():
                immutable[str(path)] = sha(path)
    for path in [AUTH, BASE / 'artifact.zip', BASE / 'baseline-backup.zip',
                 BASE / 'authentication.json', BASE / 'run.json', BASE / 'job.json',
                 BASE / 'artifacts.json', BASE / 'job.log']:
        immutable[str(path)] = sha(path)

    fresh = read(OUT / 'fresh-github-metadata.json')
    run = fresh['run']
    job = next(j for j in fresh['jobs']['jobs'] if j['id'] == 135849912826)
    assert run['id'] == job['run_id'] == 44606051622
    assert run['head_sha'] == '26ef845d1ec4adb15e0c87c9264905baeb69491f'
    # The connector's jobs wrapper omits head_sha. Its exact run_id binds this
    # completed job to the freshly fetched run and its pinned commit.
    assert run['status'] == job['status'] == 'completed'
    assert run['conclusion'] == job['conclusion'] == 'success'
    assert all(s['conclusion'] == 'success' for s in job['steps'])
    for ident, name, expected_size in [(14569498196, 'artifact.zip', 22105120),
                                      (14569584489, 'baseline-backup.zip', 19370685)]:
        artifact = next(a for a in fresh['artifacts']['artifacts'] if a['id'] == ident)
        assert artifact['workflow_run']['head_sha'] == run['head_sha']
        assert artifact['workflow_run']['id'] == run['id']
        assert artifact['digest'] == 'sha256:' + sha(BASE / name)
        assert artifact['size_in_bytes'] == (BASE / name).stat().st_size == expected_size
        assert artifact['expired'] is False

    # All source and control snapshots already exist. Suppress every possible
    # materialization and compare the authenticator's output with its original.
    namespace = runpy.run_path(str(AUTH))
    write_bytes, mkdir, link = Path.write_bytes, Path.mkdir, os.link
    compared_outputs = []
    def compare_write(path, data):
        assert path.is_file() and path.read_bytes() == data, str(path)
        compared_outputs.append(str(path))
        return len(data)
    def check_directory(path, *args, **kwargs):
        assert path.is_dir(), str(path)
    def reject_link(*args, **kwargs):
        raise AssertionError('Independent review must not materialize files')
    try:
        Path.write_bytes = compare_write
        Path.mkdir = check_directory
        os.link = reject_link
        with contextlib.redirect_stdout(io.StringIO()):
            namespace['main']()
    finally:
        Path.write_bytes, Path.mkdir, os.link = write_bytes, mkdir, link
    assert compared_outputs == [str(BASE / 'authentication.json')]

    receipt = read(BASE / 'artifact/receipt.json')
    auth = read(BASE / 'authentication.json')
    assert auth['original272_member_baseline_preserved_and_reauthenticated'] is True
    assert auth['original44_source_and44_stock_replays_authenticated'] is True
    assert len(receipt['project_modules']) == 44 and len(receipt['required_theorems']) == 71
    assert sum(line.startswith('example') for line in
        (BASE / 'artifact/src/LiHosted44Statements.lean').read_text().splitlines()) == 25
    graph = auth['raw_occurrence_summary']
    assert graph['roots'] == graph['owned_occurrences'] == 1247
    assert graph['nodes'] == 17647 and graph['edges'] == 316338
    assert graph['indexed_variants'] == 22 and auth['reachable_differing_families'] == 0
    assert graph['kernel_checks'] == graph['selected_kernel_checks'] == 0
    assert graph['axioms'] == ['propext', 'Classical.choice', 'Quot.sound']
    assert graph['trust_level'] == graph['pending'] == 0
    inventory = read(BASE / 'artifact/declaration-inventory.json')
    assert inventory['raw_occurrence_graph']['checked_kernel_negative_control_rejected'] is True
    assert receipt['checks']['literal-statements']['seconds'] == 2.757
    assert receipt['checks']['raw-all-owned-audit']['seconds'] == 77.718
    for path, expected in immutable.items():
        assert sha(path) == expected, ('changed during independent review', path)

    report = dict(
        status='passed independent read-only Li44 baseline and raw-supplement evidence review',
        review_script_sha256=sha(__file__),
        fresh_metadata_sha256=sha(OUT / 'fresh-github-metadata.json'),
        authentication_script_sha256=sha(AUTH),
        authentication_sha256=sha(BASE / 'authentication.json'),
        original_authenticator_assertions_reexecuted_without_writes=True,
        fresh_github_run_job_artifact_metadata_matches=True,
        source_candidate_commit='20e0e95eb421cf8ea728d34aa29a6d0eb1137789',
        supplement_commit=run['head_sha'], run_id=run['id'], job_id=job['id'],
        artifact_id=14569498196, archive_sha256=sha(BASE / 'artifact.zip'),
        backup_artifact_id=14569584489, backup_archive_sha256=sha(BASE / 'baseline-backup.zip'),
        baseline_receipt_sha256=sha(ORIGINAL / 'receipt.json'),
        raw_receipt_sha256=sha(BASE / 'artifact/receipt.json'),
        hosted_baseline_authentication_sha256=sha(BASE / 'artifact/baseline-authentication.json'),
        literal_contracts=25, original_strict_source_passes=44,
        original_exact_singleton_stock_replays=44, required_endpoints=71,
        original_archive_members=272, raw_archive_members=115, backup_archive_members=6,
        all_controls_match_frozen_public_commit=True,
        all_sources_objects_and_direct_import_bindings_match_original_baseline=True,
        generated_audit_source_and_canonical_inventory_bytes_match=True,
        all_process_commands_log_profile_hashes_match=True,
        all_reviewed_inputs_unchanged=True, reviewed_immutable_file_count=len(immutable),
        audit_summary=auth['audit_summary'], raw_occurrence_summary=graph,
        checked_kernel_negative_control_rejected=True,
        interpretation='The scan indexes 22 differing theorem bodies globally, but none is reachable from the 1,247 owned roots. All reachable serialized occurrences are covered; zero additional alias checks were necessary. The trust-zero negative control was rejected.',
        all_required_verification_evidence_complete=True,
        source_or_proof_checks_reexecuted_by_this_review=False,
        accepted_registry_changed=False, pr35_merged_by_this_review=False,
        registration_decision='Evidence complete for the exact44-module scope; parent owns final registry merge preserving original PR35 ancestry.')
    path = OUT / 'independent-review.json'
    assert not path.exists()
    path.write_text(json.dumps(report, indent=2, sort_keys=True) + '\n')
    print(json.dumps({'status':report['status'], 'path':str(path), 'sha256':sha(path)}))

if __name__ == '__main__':
    main()
