#!/usr/bin/env python3
"""Bind saved GitHub metadata, job log, ZIP and an exact hosted evidence review."""
from pathlib import Path
import argparse, datetime, hashlib, json, subprocess

B = Path('/workspace/scratch/e35d3265a0e0')

def require(ok, message):
    if not ok:
        raise ValueError(message)

def sha(raw):
    return hashlib.sha256(raw).hexdigest()

p = argparse.ArgumentParser(description=__doc__)
p.add_argument('kind')
p.add_argument('evidence_base', type=Path)
args = p.parse_args()
base = args.evidence_base.resolve()
targets = json.loads((B / 'pr-review/assigned-hosted-reviews.json').read_text())
matches = [t for t in targets['targets'] if t['kind'] == args.kind]
require(len(matches) == 1, 'Expected one assigned target')
t = matches[0]
run = json.loads((base / 'run.json').read_text())
job = json.loads((base / 'job.json').read_text())
rows = json.loads((base / 'artifacts.json').read_text())['artifacts']
require(run['id'] == t['run_id'] and run['status'] == 'completed' and
        run['conclusion'] == 'success', 'Run is not the assigned successful run')
require(run['repository']['full_name'] == targets['repository'] and
        run['head_sha'] == t['head_sha'] and run['path'] == t['workflow'], 'Run identity differs')
require(job['id'] == t['job_id'] and job['run_id'] == run['id'] and
        job['status'] == 'completed' and job['conclusion'] == 'success', 'Job identity/success differs')
expected_steps = ['Validate exact source and control inventory',
                  'Fresh strict sources, all-owned audit and exact stock replay',
                  'Run actions/upload-artifact@v4']
for name in expected_steps:
    found = [s for s in job['steps'] if s['name'] == name]
    require(len(found) == 1 and found[0]['status'] == 'completed' and
            found[0]['conclusion'] == 'success', 'Job step is not successful: ' + name)
artifacts = [a for a in rows if a['name'] == t['artifact_name']]
require(len(artifacts) == 1, 'Expected one named artifact')
artifact = artifacts[0]
require(artifact['expired'] is False and artifact['workflow_run']['id'] == t['run_id'] and
        artifact['workflow_run']['head_sha'] == t['head_sha'] and
        artifact['workflow_run']['repository_id'] == run['repository']['id'], 'Artifact identity differs')
archive = (base / 'artifact.zip').read_bytes()
digest = sha(archive)
require('sha256:' + digest == artifact['digest'] and len(archive) == artifact['size_in_bytes'],
        'ZIP bytes differ from GitHub artifact metadata')
candidate_path = B / t['candidate_review']
require(sha(candidate_path.read_bytes()) == t['candidate_review_sha256'], 'Candidate review changed')
candidate = json.loads(candidate_path.read_text())
paths = candidate.get('paths_sha256', candidate.get('source_control_sha256'))
require(isinstance(paths, dict) and len(paths) == 4, 'Missing reviewed publication inventory')
for rel, expected in paths.items():
    raw = subprocess.check_output(['git', 'show', t['head_sha'] + ':' + rel], cwd=B / 'repo')
    require(sha(raw) == expected, 'Published input differs from candidate review: ' + rel)
review = base / 'full-review.json'
require(not review.exists(), 'Do not replace a previous full review')
cmd = ['python3', str(B / 'pr-review/review_exact_success.py'), str(base / 'artifact'),
       '--kind', t['kind'], '--git-store', str(B / 'repo'), '--head-sha', t['head_sha'],
       '--archive-sha256', digest, '--run-id', str(t['run_id']),
       '--artifact-id', str(artifact['id']), '--output', str(review)]
subprocess.run(cmd, check=True, capture_output=True, text=True)
review_result = json.loads(review.read_text())
require(review_result['project_modules'] == t['modules'] and
        review_result['required_theorems'] == t['required'], 'Reviewed scope differs from assignment')
receipt = json.loads((base / 'artifact/receipt.json').read_text())
summaries = []
for line in (base / 'job.log').read_text().splitlines():
    start = line.find('{')
    if start >= 0:
        try:
            row = json.loads(line[start:])
        except ValueError:
            continue
        if isinstance(row, dict) and 'receipt_sha256' in row:
            summaries.append(row)
require(summaries == [{'status': 'passed', 'project_modules': t['modules'],
                       'required_theorems': t['required'],
                       'audit_summary': review_result['audit_summary'],
                       'receipt_sha256': review_result['receipt_sha256']}],
        'Final job log summary does not uniquely match authenticated receipt')
scope = candidate.get('semantic_scope', candidate.get('scope'))
auth = {
    'schema': 'assigned-hosted-complete-authentication-v1',
    'authenticated_at_utc': datetime.datetime.now(datetime.timezone.utc).isoformat(),
    'authenticator_sha256': sha(Path(__file__).read_bytes()),
    'conclusion': 'complete_exact_component_gate_passed_and_artifact_authenticated',
    'kind': t['kind'], 'repository': targets['repository'], 'workflow': t['workflow'],
    'head_sha': t['head_sha'], 'run_id': t['run_id'], 'job_id': t['job_id'],
    'run_url': run['html_url'],
    'job_url': run['html_url'] + '/job/' + str(t['job_id']),
    'run_status': 'completed', 'run_conclusion': 'success', 'job_conclusion': 'success',
    'artifact_id': artifact['id'], 'artifact_name': artifact['name'],
    'archive_bytes': len(archive), 'archive_sha256': digest,
    'api_metadata_sha256': {n: sha((base / n).read_bytes()) for n in ['run.json', 'job.json', 'artifacts.json']},
    'job_log_sha256': sha((base / 'job.log').read_bytes()),
    'job_log_final_summary_matches_receipt': True,
    'receipt_sha256': review_result['receipt_sha256'],
    'full_review_sha256': sha(review.read_bytes()),
    'candidate_control_review_sha256': t['candidate_review_sha256'],
    'project_modules': t['modules'], 'required_theorems': t['required'],
    'audit_summary': review_result['audit_summary'],
    'exact_stock_replay_targets': t['modules'],
    'all_frozen_source_and_control_bytes_match_published_commit': True,
    'required_endpoints_are_theorems': True,
    'axiom_whitelist': receipt['axiom_whitelist'], 'source_policy': receipt['source_policy'],
    'scope_limit': scope, 'accepted_registry_changed_by_review': False,
    'registration_condition': 'Regenerate and review the guarded registration against fresh main with unchanged checked source/control inputs and preserve this exact evidence. A merged-package gate remains separate.'
}
path = base / 'authentication.json'
require(not path.exists(), 'Do not replace a previous authentication')
path.write_text(json.dumps(auth, indent=2, sort_keys=True) + '\n')
print(json.dumps({'authentication': str(path), 'authentication_sha256': sha(path.read_bytes()),
                  'full_review_sha256': sha(review.read_bytes()), 'receipt_sha256': auth['receipt_sha256'],
                  'audit_summary': auth['audit_summary'], 'conclusion': auth['conclusion']}, indent=2))
