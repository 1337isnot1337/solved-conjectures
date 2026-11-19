#!/usr/bin/env python3
"""Stage a registration patch only from an actual authenticated complete pass.

The input Git repository and authenticated artifact are read-only. The output
contains proposed files and an unapplied patch. This does not invoke Lean,
download an artifact, publish a commit, or change an accepted registry.
"""
from __future__ import annotations

import argparse
import datetime
import difflib
import hashlib
import json
from pathlib import Path, PurePosixPath
import re
import subprocess
import tempfile
import zipfile

HERE = Path(__file__).resolve().parent
WORKSPACE = HERE.parents[1]
CONTROLS = ['lean/Conjectures.lean', 'scripts/verify_lean.sh', 'lean/ProofAudit.lean']
ALLOWED = ['propext', 'Classical.choice', 'Quot.sound']
LEAN = 'bf8d54e4714cc4b03d3f6bb34c83b7202b87e49c8bfcbff6895c085bb90ceb38'
CHECKER = '12c38901cdbfab178f1bf6145dd30012e9a3b2c11ca695292a5884fa3cbaddb6'
POLICY = {'fresh_project_objects': True, 'linter_override': False, 'warning_as_error': True}
KERNEL_PATTERN = r'(?m)^modules=\(\n([\s\S]*?)^\)'
REQUIRED_PATTERN = r'let required : Array Name := #\[([\s\S]*?)\]\s+for name in required'


def require(ok, message):
    if not ok:
        raise ValueError(message)


def digest(raw):
    return hashlib.sha256(raw).hexdigest()


def file_bytes(path):
    require(path.is_file() and not path.is_symlink(), 'Expected regular file: ' + str(path))
    return path.read_bytes()


def git_bytes(repo, commit, path):
    return subprocess.check_output(['git', 'show', commit + ':' + path], cwd=repo)


def unique_match(pattern, text):
    matches = list(re.finditer(pattern, text))
    require(len(matches) == 1, 'Expected one exact registration array')
    return matches[0]


def names(text):
    return re.findall(r'`([A-Za-z0-9_]+(?:\.[A-Za-z0-9_]+)*)', text)


def registered(old):
    values = {
        'imports': re.findall(r'^import (\S+)\s*$', old[CONTROLS[0]], re.M),
        'targets': unique_match(KERNEL_PATTERN, old[CONTROLS[1]]).group(1).split(),
        'required': names(unique_match(REQUIRED_PATTERN, old[CONTROLS[2]]).group(1)),
    }
    for kind, sequence in values.items():
        require(len(sequence) == len(set(sequence)), 'Duplicate existing ' + kind)
    return values


def control_changes(old, spec):
    prior = registered(old)
    module, required = spec['new_module'], spec['required_theorems']
    require(module not in prior['imports'] and module not in prior['targets'] and
            not (set(required) & set(prior['required'])), 'This component is already partly or fully registered')
    new = dict(old)
    new[CONTROLS[0]] = old[CONTROLS[0]] + ('' if old[CONTROLS[0]].endswith('\n') else '\n') + 'import ' + module + '\n'
    m = unique_match(KERNEL_PATTERN, old[CONTROLS[1]])
    new[CONTROLS[1]] = old[CONTROLS[1]][:m.end(1)] + '  ' + module + '\n' + old[CONTROLS[1]][m.end(1):]
    m = unique_match(REQUIRED_PATTERN, old[CONTROLS[2]])
    separator = '\n' if m.group(1).rstrip().endswith(',') else ',\n'
    body = m.group(1) + separator + ',\n'.join('    `' + n for n in required)
    new[CONTROLS[2]] = old[CONTROLS[2]][:m.start(1)] + body + old[CONTROLS[2]][m.end(1):]
    after = registered(new)
    additions = {'imports': [module], 'targets': [module], 'required': required}
    for kind in prior:
        require(after[kind] == prior[kind] + additions[kind], 'Prior sequence changed: ' + kind)
    return new, prior, after


def validate_pass(args, packet, spec, commit, old):
    base = args.evidence
    receipt_raw = file_bytes(base / 'artifact/receipt.json')
    receipt = json.loads(receipt_raw)
    run = json.loads(file_bytes(base / 'run.json'))
    job = json.loads(file_bytes(base / 'job.json'))
    artifacts = json.loads(file_bytes(base / 'artifacts.json'))['artifacts']
    auth_raw = file_bytes(base / 'authentication.json')
    auth = json.loads(auth_raw)
    review_raw = file_bytes(base / 'full-review.json')
    review = json.loads(review_raw)
    candidate_path = WORKSPACE / spec['candidate_review']
    candidate_raw = file_bytes(candidate_path)
    require(digest(candidate_raw) == spec['candidate_review_sha256'], 'Candidate control review changed')
    candidate = json.loads(candidate_raw)
    require(run['id'] == spec['run_id'] and run['head_sha'] == spec['head_sha'] and
            run['repository']['full_name'] == packet['repository'] and run['path'] == spec['workflow'], 'Wrong GitHub run')
    require(run['status'] == 'completed' and run['conclusion'] == 'success', 'GitHub run has not succeeded')
    require(job['id'] == spec['job_id'] and job['run_id'] == run['id'] and
            job['status'] == 'completed' and job['conclusion'] == 'success', 'Wrong or unsuccessful job')
    for name in ['Validate exact source and control inventory',
                 'Fresh strict sources, all-owned audit and exact stock replay', 'Run actions/upload-artifact@v4']:
        steps = [s for s in job['steps'] if s['name'] == name]
        require(len(steps) == 1 and steps[0]['status'] == 'completed' and steps[0]['conclusion'] == 'success', 'Incomplete job step')
    selected = [a for a in artifacts if a['name'] == spec['artifact_name']]
    require(len(selected) == 1, 'Expected one named artifact')
    artifact = selected[0]
    require(artifact['expired'] is False and artifact['workflow_run']['id'] == run['id'] and
            artifact['workflow_run']['head_sha'] == run['head_sha'] and
            artifact['workflow_run']['repository_id'] == run['repository']['id'], 'Artifact run/repository mismatch')
    archive_raw = file_bytes(base / 'artifact.zip')
    archive_sha = digest(archive_raw)
    require(artifact['digest'] == 'sha256:' + archive_sha and artifact['size_in_bytes'] == len(archive_raw), 'Archive differs from GitHub metadata')
    require(auth['conclusion'] == 'complete_exact_component_gate_passed_and_artifact_authenticated' and
            auth['kind'] == spec['kind'] and auth['run_id'] == run['id'] and auth['job_id'] == job['id'] and
            auth['artifact_id'] == artifact['id'] and auth['head_sha'] == run['head_sha'] and
            auth['workflow'] == spec['workflow'] and auth['repository'] == packet['repository'], 'Authentication identity mismatch')
    require(auth['authenticator_sha256'] == packet['authenticator_sha256'] and
            auth['archive_sha256'] == archive_sha and auth['archive_bytes'] == len(archive_raw) and
            auth['receipt_sha256'] == digest(receipt_raw) and auth['full_review_sha256'] == digest(review_raw) and
            auth['candidate_control_review_sha256'] == digest(candidate_raw), 'Authentication input digest mismatch')
    for rel in ['run.json', 'job.json', 'artifacts.json']:
        require(digest(file_bytes(base / rel)) == auth['api_metadata_sha256'][rel], 'API metadata changed')
    require(digest(file_bytes(base / 'job.log')) == auth['job_log_sha256'] and
            auth['job_log_final_summary_matches_receipt'] is True, 'Job log changed')
    require(review['status'] == 'evidence_review_passed' and review['kind'] == spec['kind'] and
            review['run_id'] == run['id'] and review['artifact_id'] == artifact['id'] and
            review['head_sha'] == run['head_sha'] and review['archive_sha256'] == archive_sha and
            review['receipt_sha256'] == digest(receipt_raw) and
            review['reviewer_sha256'] == packet['reviewer_sha256'], 'Full evidence review identity mismatch')
    for field in ['source_control_object_log_progress_bytes_match', 'raw_private_declaration_inventory_match',
                  'all_required_endpoints_are_theorems', 'stock_replay_targets_match_exact_closure']:
        require(review[field] is True, 'Missing complete evidence review: ' + field)
    require(review['standard_axiom_whitelist'] == ALLOWED, 'Review axiom policy changed')
    require(receipt['status'] == 'passed' and receipt['git_commit'] == run['head_sha'] and
            receipt['all_frozen_hashes_unchanged'] is True and receipt['stated_component_scope_checked'] is True and
            receipt['universal_classification_claimed'] is False and receipt['accepted_registry_changed'] is False,
            'Receipt does not state an unchanged complete component pass')
    require(receipt['toolchain']['lean_sha256'] == LEAN and receipt['toolchain']['checker_sha256'] == CHECKER,
            'Pinned compiler/checker mismatch')
    require(receipt['source_policy'] == POLICY and receipt['axiom_whitelist'] == ALLOWED and
            receipt['source_workers'] == receipt['kernel_threads'] == 1, 'Strict verification policy changed')
    model_path = 'docs/' + spec['slug'] + '-exact-sources.json'
    model = json.loads(git_bytes(args.repo, run['head_sha'], model_path))['tasks'][spec['task']]
    require(model['roots'] == [spec['new_module']] and model['required_theorems'] == spec['required_theorems'], 'Static root/endpoint scope differs')
    require(receipt['roots'] == model['roots'] and receipt['required_theorems'] == model['required_theorems'] and
            receipt['source_sha256'] == model['source_sha256'], 'Receipt/source model differs')
    modules = receipt['project_modules']
    required = spec['required_theorems']
    require(len(modules) == len(set(modules)) == spec['modules'] == model['project_module_count'] == review['project_modules'], 'Closure count differs')
    require(len(required) == len(set(required)) == spec['required'] == model['required_theorem_count'] == review['required_theorems'], 'Endpoint count differs')
    prior = registered(old)
    require(set(modules) - set(prior['targets']) == {spec['new_module']}, 'A closure dependency is not already accepted')
    require(set(receipt['source_checks']) == set(receipt['kernel_checks']) == set(receipt['source_sha256']) == set(modules), 'Incomplete process/source inventory')
    require(not receipt.get('source_failures') and not receipt.get('blocked_sources'), 'Failed/blocked sources remain')
    for module in modules:
        source = receipt['source_checks'][module]
        kernel = receipt['kernel_checks'][module]
        for record in [source, kernel]:
            require(record['exit_code'] == 0 and record['timed_out'] is False, 'A required process did not pass: ' + module)
        require(source['command'][:4] == [receipt['toolchain']['lean_path'], '-j1', '-M4500', '-DwarningAsError=true'], 'Source options changed')
        require(kernel['exact_singleton_target'] is True and kernel['replayed_modules'] == [module], 'Wrong stock replay target')
        path = 'lean/' + module.replace('.', '/') + '.lean'
        expected = receipt['source_sha256'][module]
        require(digest(git_bytes(args.repo, run['head_sha'], path)) == expected, 'Passing source changed: ' + path)
        require(digest(git_bytes(args.repo, commit, path)) == expected, 'Fresh main source differs: ' + path)
    expected_controls = {**model['configuration_sha256'], **model['helper_sha256']}
    for rel in [model_path, spec['workflow'], 'scripts/verify_' + spec['slug'].replace('-', '_') + '_exact.py']:
        expected_controls[rel] = digest(git_bytes(args.repo, run['head_sha'], rel))
    require(receipt['gate_sha256'] == expected_controls, 'Gate control inventory mismatch')
    for rel, expected in expected_controls.items():
        require(digest(git_bytes(args.repo, run['head_sha'], rel)) == expected and
                digest(git_bytes(args.repo, commit, rel)) == expected, 'Checked gate input changed: ' + rel)
    publication = candidate['candidate_path_sha256']
    require(isinstance(publication, dict) and len(publication) == 4, 'Missing reviewed publication paths')
    for rel, expected in publication.items():
        require(digest(git_bytes(args.repo, run['head_sha'], rel)) == expected, 'Published candidate differs from review: ' + rel)
    audit = receipt['axiom_audit']
    require(audit['exit_code'] == 0 and audit['timed_out'] is False and
            audit['all_owned_declarations_audited'] is True and audit['exact_raw_private_visibility'] is True and
            audit['explicit_import_all'] is True and audit['summary'] == review['audit_summary'] == auth['audit_summary'], 'Incomplete all-owned/private audit')
    require(audit['summary']['modules'] == spec['modules'] and audit['summary']['required'] == len(required), 'Audit scope mismatch')
    inventory = json.loads(file_bytes(base / 'artifact/declaration-inventory.json'))
    require(digest(file_bytes(base / 'artifact/declaration-inventory.json')) == audit['declaration_inventory_sha256'], 'Audit inventory digest mismatch')
    require(inventory['summary'] == audit['summary'] and inventory['all_owned_declarations_audited'] is True and
            inventory['exact_raw_private_visibility'] is True and set(inventory['required']) == set(required), 'Audit inventory is incomplete')
    require(all(inventory['declarations'][n]['kind'] == 'theorem' for n in required), 'A required endpoint is not a theorem')
    require(all(set(d['axioms']) <= set(ALLOWED) and (d['kind'] != 'axiom' or n in ALLOWED)
                for n, d in inventory['declarations'].items()), 'Unapproved project axiom')
    replay = receipt['kernel_replay']
    require(replay['replayed_modules'] == modules and all(replay[k] is True for k in
            ['exact_project_closure', 'all_modules_replayed_as_targets', 'fresh_process_per_module']), 'Incomplete exact stock replay')
    summaries = []
    for line in file_bytes(base / 'job.log').decode().splitlines():
        start = line.find('{')
        if start >= 0:
            try:
                row = json.loads(line[start:])
            except ValueError:
                continue
            if isinstance(row, dict) and 'receipt_sha256' in row:
                summaries.append(row)
    require(summaries == [{'status': 'passed', 'project_modules': spec['modules'],
                          'required_theorems': len(required), 'audit_summary': audit['summary'],
                          'receipt_sha256': digest(receipt_raw)}], 'Final job log summary mismatch')
    for rel, expected in [('pr-review/review_exact_success_quotient.py', packet['reviewer_sha256']),
                          ('pr-review/authenticate_quotient_success.py', packet['authenticator_sha256']),
                          ('pr-review/rational-lattice-quotient-review.json', packet['scope_peer_review_sha256'])]:
        require(digest(file_bytes(WORKSPACE / rel)) == expected, 'Reviewed helper/scope source changed: ' + rel)
    members = {}
    preserved = {}
    extracted = base / 'artifact'
    require(not any(p.is_symlink() for p in extracted.rglob('*')), 'Symlink in authenticated extraction')
    with zipfile.ZipFile(base / 'artifact.zip') as z:
        archive_names = z.namelist()
        require(len(archive_names) == len(set(archive_names)), 'Duplicate archive member')
        for info in z.infolist():
            if info.is_dir():
                continue
            rel = PurePosixPath(info.filename)
            require(not rel.is_absolute() and '..' not in rel.parts and str(rel) == info.filename, 'Unsafe archive member')
            raw = z.read(info)
            require(file_bytes(extracted / str(rel)) == raw, 'Extracted artifact differs from ZIP: ' + str(rel))
            members[str(rel)] = {'sha256': digest(raw), 'bytes': len(raw)}
            if not str(rel).startswith('lib/'):
                preserved[str(rel)] = (raw, 'unchanged authenticated archive member ' + str(rel))
    require({p.relative_to(extracted).as_posix() for p in extracted.rglob('*') if p.is_file()} == set(members), 'Extraction inventory differs from ZIP')
    return receipt, run, job, artifact, auth, review, members, preserved


def main():
    packet = json.loads(file_bytes(HERE / 'specs.json'))
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('kind', choices=sorted(packet['profiles']))
    parser.add_argument('--repo', type=Path, required=True)
    parser.add_argument('--ref', required=True)
    parser.add_argument('--evidence', type=Path, required=True)
    parser.add_argument('--output', type=Path, required=True)
    args = parser.parse_args()
    args.repo, args.evidence, args.output = args.repo.resolve(), args.evidence.resolve(), args.output.resolve()
    require(not args.output.exists(), 'Choose a new immutable output path')
    require(args.output != args.repo and args.repo not in args.output.parents and
            args.output != args.evidence and args.evidence not in args.output.parents, 'Output must be outside repository and authenticated evidence')
    spec = packet['profiles'][args.kind]
    commit = subprocess.check_output(['git', 'rev-parse', '--verify', args.ref + '^{commit}'], cwd=args.repo, text=True).strip()
    docs = ['docs/lean-status.md', 'docs/formalization.md', spec['result_readme'], 'CONTENTS.md', 'HISTORY.md']
    old = {rel: git_bytes(args.repo, commit, rel).decode() for rel in CONTROLS + docs}
    checked = validate_pass(args, packet, spec, commit, old)
    receipt, run, job, artifact, auth, review, members, preserved = checked
    new, before, after = control_changes(old, spec)
    evidence_ref = 'docs/verification/' + spec['slug'] + '-exact-' + str(run['id'])
    require(not subprocess.check_output(['git', 'ls-tree', '-r', '--name-only', commit, '--', evidence_ref], cwd=args.repo), 'Evidence directory already exists in base')
    section = spec['section']
    require(all(section not in old[rel] for rel in docs[:-2]), 'This documentation section already exists')
    run_link = run['html_url'] + '/job/' + str(job['id'])
    summary = review['audit_summary']
    evidence_text = (f'The complete {spec["modules"]}-module hosted gate passed at `{run["head_sha"]}` '
        f'([run and job]({run_link})). It checked all fresh strict sources, selected declaration values and types '
        f'for {summary["declarations"]} owned names including {summary["private_declarations"]} private names, all '
        f'{len(spec["required_theorems"])} required theorem endpoints, and one exact stock-kernel target per module. '
        'The audit includes raw/private-name visibility; it is not a separate audit of every duplicate theorem body occurrence. '
        'The permitted axioms were only '
        '`propext`, `Classical.choice`, and `Quot.sound`. The unchanged raw receipt has SHA-256 '
        f'`{auth["receipt_sha256"]}`. A merged accepted-package source, audit and kernel pass remains a separate obligation.')
    for rel in ['docs/lean-status.md', 'docs/formalization.md']:
        new[rel] = old[rel].rstrip() + '\n\n## ' + section + '\n\n' + spec['scope'] + '\n\n' + evidence_text + '\n\n[Preserved receipt](' + evidence_ref.removeprefix('docs/') + '/receipt.json).\n'
    slug = re.sub(r'[^a-z0-9 -]', '', section.lower()).replace(' ', '-')
    rel = spec['result_readme']
    new[rel] = old[rel].rstrip() + '\n\n### ' + section + '\n\n' + spec['scope'] + '\n\n[Exact scope and evidence](../../docs/lean-status.md#' + slug + ').\n'
    rows = [r for r in old['CONTENTS.md'].splitlines() if r.startswith('| [' + spec['catalogue_title'] + ']')]
    require(len(rows) == 1, 'Expected one target catalogue row')
    row = rows[0]
    cells = row.split(' | ')
    require(len(cells) == 4 and cells[2] == spec['partial_marker'], 'Catalogue status is not the expected partial marker')
    previous_cells = list(cells)
    if spec['catalogue_replace']:
        src, dst = spec['catalogue_replace']
        require(cells[1].count(src) == 1, 'Four-speed catalogue scope anchor changed')
        cells[1] = cells[1].replace(src, dst)
    if spec['catalogue_append']:
        require(spec['catalogue_append'] not in cells[1], 'Catalogue already contains this component')
        cells[1] += ' ' + spec['catalogue_append']
    require(cells[0] == previous_cells[0] and cells[2:] == previous_cells[2:], 'Catalogue title, status, or links changed')
    new['CONTENTS.md'] = old['CONTENTS.md'].replace(row, ' | '.join(cells))
    new['HISTORY.md'] = old['HISTORY.md'].rstrip() + '\n\n## ' + run['created_at'][:10] + ': ' + section + '\n\n' + (
        f'Registered `{spec["new_module"]}` and its {len(spec["required_theorems"])} theorem endpoints after the complete '
        f'{spec["modules"]}-module hosted source, selected-declaration axiom audit with raw/private visibility, and stock-kernel gate passed. '
        'The result status remains partial; the retained hypotheses are stated in the status report.\n')
    for rel, expected in receipt['gate_sha256'].items():
        raw = git_bytes(args.repo, run['head_sha'], rel)
        require(digest(raw) == expected, 'Gate control changed during staging')
        preserved['controls/' + rel] = (raw, 'unchanged passing Git input ' + run['head_sha'] + ':' + rel)
    for rel in ['run.json', 'job.json', 'artifacts.json', 'job.log', 'authentication.json', 'full-review.json']:
        preserved[rel] = (file_bytes(args.evidence / rel), 'unchanged authenticated review input ' + rel)
    preserved['candidate-control-review.json'] = (file_bytes(WORKSPACE / spec['candidate_review']), 'unchanged reviewed candidate source/control report')
    for name, path in [('review_exact_success_quotient.py', WORKSPACE / 'pr-review/review_exact_success_quotient.py'),
                       ('authenticate_quotient_success.py', WORKSPACE / 'pr-review/authenticate_quotient_success.py'),
                       ('prepare_registration.py', Path(__file__).resolve()), ('registration-specs.json', HERE / 'specs.json'),
                       ('quotient-scope-review.json', WORKSPACE / 'pr-review/rational-lattice-quotient-review.json')]:
        preserved['review-tools/' + name] = (file_bytes(path), 'exact reviewed evidence/registration helper ' + name)
    archive_manifest = {'artifact_id': artifact['id'], 'archive_sha256': auth['archive_sha256'], 'files': members}
    preserved['archive-members.json'] = ((json.dumps(archive_manifest, indent=2, sort_keys=True) + '\n').encode(), 'all authenticated ZIP members independently rehashed')
    readme = '# ' + section + '\n\n' + spec['scope'] + '\n\n' + evidence_text + '\n\n' + (
        f'The authenticated archive SHA-256 is `{auth["archive_sha256"]}`. `archive-members.json` records every member, including compiled object hashes. '
        'The unchanged source, audit and kernel logs, process profiles, declaration inventory, source snapshots, passing controls, and real GitHub metadata are preserved here. '
        'Compiled objects remain in the authenticated archive and are not duplicated in Git.\n')
    preserved['README.md'] = (readme.encode(), 'generated scope and evidence index')
    preservation = {
        'schema': 'component-exact-evidence-preservation-v1', 'kind': args.kind,
        'source_commit': run['head_sha'], 'fresh_main_checked': commit,
        'run_id': run['id'], 'job_id': job['id'], 'artifact_id': artifact['id'],
        'archive_sha256': auth['archive_sha256'], 'archive_bytes': auth['archive_bytes'],
        'raw_receipt_sha256': auth['receipt_sha256'], 'audit_summary': summary,
        'archive_member_count': len(members),
        'all_nonobject_archive_members_preserved_unchanged': True,
        'compiled_objects_not_duplicated_in_git': True,
        'new_lean_execution_performed': False, 'accepted_registry_changed': False,
        'scope_limit': spec['scope'],
        'preserved_files': {rel: {'sha256': digest(raw), 'bytes': len(raw), 'origin': origin}
                            for rel, (raw, origin) in sorted(preserved.items())},
    }
    preserved['preservation.json'] = ((json.dumps(preservation, indent=2, sort_keys=True) + '\n').encode(), 'preservation manifest')
    proposed = {rel: text.encode() for rel, text in new.items() if text != old[rel]}
    require(set(proposed) == set(CONTROLS + docs) - {'CONTENTS.md'}, 'Unexpected changed control/document scope')
    require(new['CONTENTS.md'] == old['CONTENTS.md'], 'Catalogue must remain byte-identical')
    proposed.update({evidence_ref + '/' + rel: raw for rel, (raw, _) in preserved.items()})
    args.output.mkdir(parents=True)
    for rel, raw in proposed.items():
        p = args.output / 'proposed' / rel
        p.parent.mkdir(parents=True, exist_ok=True)
        p.write_bytes(raw)
    patch = ''.join(''.join(difflib.unified_diff(
        old.get(rel, '').splitlines(True), raw.decode().splitlines(True),
        fromfile='a/' + rel if rel in old else '/dev/null', tofile='b/' + rel))
        for rel, raw in proposed.items())
    (args.output / 'registration.patch').write_text(patch)
    with tempfile.TemporaryDirectory(prefix='component-registration-check-') as tmp:
        for rel, raw in old.items():
            p = Path(tmp) / rel
            p.parent.mkdir(parents=True, exist_ok=True)
            p.write_text(raw)
        subprocess.run(['git', 'apply', '--check', str(args.output / 'registration.patch')], cwd=tmp, check=True, capture_output=True)
    plan = {
        'schema': 'component-exact-registration-plan-v1', 'status': 'unapplied reviewed-input registration candidate',
        'generated_at_utc': datetime.datetime.now(datetime.timezone.utc).isoformat(),
        'kind': args.kind, 'base_commit': commit, 'passing_source_commit': run['head_sha'],
        'run_id': run['id'], 'job_id': job['id'], 'artifact_id': artifact['id'],
        'generator_sha256': digest(file_bytes(Path(__file__).resolve())),
        'specs_sha256': digest(file_bytes(HERE / 'specs.json')),
        'receipt_sha256': auth['receipt_sha256'], 'archive_sha256': auth['archive_sha256'],
        'authentication_sha256': digest(file_bytes(args.evidence / 'authentication.json')),
        'full_review_sha256': digest(file_bytes(args.evidence / 'full-review.json')),
        'patch_sha256': digest(file_bytes(args.output / 'registration.patch')),
        'preservation_sha256': digest(preserved['preservation.json'][0]),
        'evidence_reference': evidence_ref + '/receipt.json',
        'control_document_paths': CONTROLS + [rel for rel in docs if rel != 'CONTENTS.md'],
        'catalogue_bytes_preserved': True,
        'agents_sha256_read_at_fresh_base': digest(git_bytes(args.repo, commit, 'AGENTS.md')),
        'evidence_file_count': len(preserved), 'changed_paths': list(proposed),
        'before_sha256': {rel: digest(text.encode()) for rel, text in old.items()},
        'after_sha256': {rel: digest(raw) for rel, raw in proposed.items()},
        'registration_counts': {k: {'before': len(before[k]), 'added': len(after[k]) - len(before[k]), 'after': len(after[k])} for k in before},
        'registered_modules_added': [spec['new_module']], 'required_theorems_added': spec['required_theorems'],
        'prior_import_kernel_and_required_sequences_preserved': True,
        'all_other_closure_dependencies_already_accepted': True,
        'current_sources_controls_and_toolchain_unchanged_from_pass': True,
        'catalogue_status_preserved': spec['partial_marker'],
        'root_readme_sha256_unchanged': digest(git_bytes(args.repo, commit, 'README.md')),
        'exact_base_git_apply_check_passed': True,
        'input_repository_modified': False, 'authenticated_artifact_modified': False,
        'new_lean_processes': 0,
        'publication_condition': 'Review the concrete patch and evidence; refresh the base guard before publication. The complete merged accepted-package gate remains separate.'
    }
    (args.output / 'plan.json').write_text(json.dumps(plan, indent=2, sort_keys=True) + '\n')
    print(json.dumps({'output': str(args.output), 'base_commit': commit, 'patch_sha256': plan['patch_sha256'],
                      'plan_sha256': digest(file_bytes(args.output / 'plan.json')), 'evidence_files': len(preserved),
                      'registration_counts': plan['registration_counts'], 'input_repository_modified': False}, indent=2))


if __name__ == '__main__':
    main()
