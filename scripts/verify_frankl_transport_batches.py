#!/usr/bin/env python3
"""Generate and gate source-grouped Frankl transport candidates.

The initial job publishes candidate data only after g000 passes a complete
fresh gate. The remaining bounded groups run at that exact publication SHA.
The data-only coverage and all-checked integration roots have separate gates.
"""

from __future__ import annotations

import argparse
import importlib.util
import json
import os
from pathlib import Path
import re
import shutil
import subprocess
import sys
import tempfile
from types import SimpleNamespace

import verify_frankl_orbit_batches as arithmetic


ROOT = arithmetic.ROOT
RESULTS = ROOT / 'results/frankl-generator-families'
PRODUCER = RESULTS / 'generate_small_cyclic_weight_transport_batches.py'
PRODUCER_SHA256 = 'b0f05265b8e1cda4ee2721a178238fe30baa443d3283e9e88be977160117ddb4'
MANIFEST = RESULTS / 'small_cyclic_weight_transport_batches.json'
PREPARATION = ROOT / '.candidate-artifacts/frankl-transport-batches-preparation.json'
ARTIFACT_ROOT = ROOT / '.candidate-artifacts'
INITIAL_GROUP = 'g000'
GATE_INPUTS = tuple(dict.fromkeys((*arithmetic.GATE_INPUTS,
    'scripts/verify_frankl_transport_batches.py',
    '.github/workflows/lean-frankl-transport-batches.yml',
    'results/frankl-generator-families/generate_small_cyclic_weight_transport_batches.py',
    'results/frankl-generator-families/small_cyclic_weight_transport_batches.json',
    'results/frankl-generator-families/literal_ten_weight_orbits.json.gz',
    'results/frankl-generator-families/literal_ten_weight_orbit_batches.json',
)))
INTEGRATION_ROOTS = {
    'Conjectures.FranklSmallCyclicTransportCoverage',
    'Conjectures.FranklSmallCyclicTransportResults',
}
BLOCK_PATTERN = re.compile(r'^Conjectures\.FranklSmallCyclicOrbit(?:7|8|9|10)Block\d{3}$')
PILOT_PATTERN = re.compile(r'^Conjectures\.FranklSmallCyclicWeights[789]Pilot$')
GEN_NAME = re.compile(
    r'^(?:FranklSmallCyclicTransportG\d{3}B\d{3}(?:Data)?|'
    r'FranklSmallCyclicCanonicalWords|FranklSmallCyclicTransportCoverage|'
    r'FranklSmallCyclicTransportResults)\.lean$'
)
digest = arithmetic.digest


def require(condition, message):
    if not condition:
        raise RuntimeError(message)


def read_json(path):
    return json.loads(Path(path).read_text(encoding='utf-8'))


def write_json(path, value):
    path = Path(path)
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(value, indent=2, sort_keys=True) + '\n', encoding='utf-8')


def run(command, **kwargs):
    return subprocess.run(list(map(str, command)), cwd=ROOT, check=True, **kwargs)


def git_text(*arguments):
    return subprocess.check_output(['git', *arguments], cwd=ROOT, text=True).strip()


def git_bytes(commit, path):
    result = subprocess.run(['git', 'show', commit + ':' + path], cwd=ROOT,
                            stdout=subprocess.PIPE, stderr=subprocess.DEVNULL)
    return result.stdout if result.returncode == 0 else None


def load_producer():
    require(digest(PRODUCER) == PRODUCER_SHA256, 'Transport producer bytes differ')
    spec = importlib.util.spec_from_file_location('full_transport_producer', PRODUCER)
    producer = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(producer)
    return producer


def validate_sources():
    producer = load_producer()
    files, expected = producer.produce()
    require(expected['schema'] == 'frankl-small-cyclic-weight-transport-batches-v1',
            'Wrong transport manifest schema')
    require(len(files) == 673 and expected['source_group_count'] == 103
            and expected['block_count'] == 335 and expected['target_count'] == 36352,
            'Transport candidate partition changed')
    require(expected['direct_source_reuse'] == 11020
            and expected['transport_check_count'] == 25332,
            'Source reuse/transport partition changed')
    for name, raw in files.items():
        require(GEN_NAME.fullmatch(name), 'Unexpected generated filename: ' + name)
        path = ROOT / 'lean/Conjectures' / name
        require(path.is_file() and path.read_bytes() == raw, 'Generated source differs: ' + name)
    require(MANIFEST.read_bytes() == producer.encoded(expected), 'Manifest is not the exact reproduction')
    return expected


def private_nodes(modules):
    result = []
    for module in modules:
        raw = arithmetic.source(module).read_text(encoding='utf-8')
        names = re.findall(r'^private theorem (checked\d+)\b', raw, re.M)
        if not names:
            continue
        namespaces = re.findall(r'^namespace ([A-Za-z0-9_.]+)\s*$', raw, re.M)
        require(len(namespaces) == 1 and len(names) == len(set(names)),
                'Unsupported private proof layout: ' + module)
        result += [namespaces[0] + '.' + name for name in names]
    require(len(result) == len(set(result)), 'Duplicate logical private endpoint')
    return sorted(result)


def source_required(source):
    if source['kind'] == 'pilot':
        return [source['namespace'] + '.checked', source['namespace'] + '.each_checked']
    filename = ('small_cyclic_weight_orbit_batches.json' if source['kind'] == 'short'
                else 'literal_ten_weight_orbit_batches.json')
    manifest = read_json(RESULTS / filename)
    blocks = {block['id']: block for block in manifest['blocks']}
    block = blocks[source['block_id']]
    require(block['module'] == source['module'] and block['namespace'] == source['namespace'],
            'Arithmetic source interface changed')
    return block['required_endpoints']


def group_spec(manifest, name):
    by_name = {group['id']: group for group in manifest['groups']}
    require(name in by_name, 'Unknown transport group: ' + name)
    group = dict(by_name[name])
    blocks = [manifest['blocks'][index] for index in group['block_ids']]
    require(1 <= len(blocks) <= 8 and 0 < group['rows'] <= 1024,
            'Source group exceeds the reviewed bound')
    require(all(block['group_index'] == group['index'] for block in blocks),
            'A leaf belongs to the wrong source group')
    require([block['module'] for block in blocks] == group['modules'],
            'Group root list differs from its leaves')
    modules = arithmetic.dependency_order(group['modules'])
    require(not (set(modules) & INTEGRATION_ROOTS), 'Bounded group imported a complete-table root')
    require(not any('Vaughan' in module or 'Matching' in module for module in modules),
            'Transport group imported unrelated heavy certificate data')
    source = group['source']
    actual_blocks = {module for module in modules if BLOCK_PATTERN.fullmatch(module)}
    actual_pilots = {module for module in modules if PILOT_PATTERN.fullmatch(module)}
    if source['kind'] == 'pilot':
        require(not actual_blocks and actual_pilots == {source['module']},
                'Pilot group imported extra source arithmetic')
        common = [name for name in arithmetic.SHARED_ENDPOINTS
                  if name.startswith('FranklSmallCyclic.Weights.')
                  or name.startswith('FranklSmallCyclic.MaskWindows.')]
    else:
        require(actual_blocks == {source['module']} and not actual_pilots,
                'Group imported more than its one source arithmetic block')
        common = arithmetic.SHARED_ENDPOINTS
    private = private_nodes(modules)
    require(private == sorted(group['private_endpoints']),
            'Exact source/private-pilot/target proof inventory mismatch')
    expected_target_private = [endpoint for block in blocks for endpoint in block['private_endpoints']]
    require(len(expected_target_private) == group['rows'],
            'A target lacks its own checked theorem')
    for block in blocks:
        raw = arithmetic.source(block['module']).read_text(encoding='utf-8')
        actual = re.findall(r'^private theorem (checked\d+)\b', raw, re.M)
        require(actual == ['checked' + str(i) for i in range(block['rows'])],
                'Private target layout changed: ' + block['module'])
    required = sorted(set(common + source_required(source) + group['required_endpoints'] + [
        'FranklSmallCyclic.MaskTransport.maskTransportCheck_sound',
        'FranklSmallCyclic.MaskTransport.maskTransportCheck_entryCheck',
    ]))
    group.update(roots=group['modules'], private_chunks=len(private),
                 target_private_endpoints=expected_target_private)
    return group, modules, required, private


def prepare():
    load_producer()
    run([sys.executable, '-m', 'py_compile', PRODUCER, Path(__file__)])
    run([sys.executable, PRODUCER])
    run([sys.executable, PRODUCER, '--check'])
    with tempfile.TemporaryDirectory(prefix='frankl-transport-reproduction-') as directory:
        temporary = Path(directory)
        run([sys.executable, PRODUCER, '--output', temporary / 'sources',
             '--manifest', temporary / 'manifest.json'],
            env={**os.environ, 'PYTHONHASHSEED': '17'})
        require(MANIFEST.read_bytes() == (temporary / 'manifest.json').read_bytes(),
                'Hash-seed-dependent transport manifest')
        manifest = read_json(MANIFEST)
        for name in manifest['source_sha256']:
            require((ROOT / 'lean/Conjectures' / name).read_bytes()
                    == (temporary / 'sources' / name).read_bytes(),
                    'Hash-seed-dependent source: ' + name)
    manifest = validate_sources()
    group_spec(manifest, INITIAL_GROUP)
    publish_paths = ['lean/Conjectures/' + name for name in sorted(manifest['source_sha256'])]
    publish_paths.append(str(MANIFEST.relative_to(ROOT)))
    # Freeze every eventual import as a publication input. No Lean build of
    # the integration root occurs here.
    full_modules = arithmetic.dependency_order([manifest['separate_integration_gate']['root']])
    frozen_paths = set(GATE_INPUTS) | set(publish_paths)
    frozen_paths.update('lean/' + module.replace('.', '/') + '.lean' for module in full_modules)
    write_json(PREPARATION, {
        'base_commit': git_text('rev-parse', 'HEAD'),
        'publish_paths': publish_paths,
        'frozen': {path: digest(ROOT / path) for path in sorted(frozen_paths)},
        'manifest_sha256': digest(MANIFEST),
        'target_count': manifest['target_count'],
        'initial_group': INITIAL_GROUP,
        'status': 'deterministic candidate sources; fresh g000 gate pending',
        'numeric_integration_checked': False,
        'canonical_graph_coverage_checked': False,
    })
    print(json.dumps({
        'prepared_files': len(manifest['source_sha256']),
        'source_groups': len(manifest['groups']), 'initial_group': INITIAL_GROUP,
        'manifest_sha256': digest(MANIFEST),
        'coverage_root': manifest['separate_coverage_gate']['root'],
        'integration_root': manifest['separate_integration_gate']['root'],
    }, indent=2), flush=True)


def verify(name, jobs):
    manifest = validate_sources()
    group, modules, required, private = group_spec(manifest, name)
    stage = ARTIFACT_ROOT / ('frankl-transport-' + name)
    scope = ('Only transport source group ' + name + ', covering ' + str(group['rows']) +
             ' literal row/period targets. All source arithmetic and private pilot premises '
             'are included in the exact checked closure. Other groups, complete row coverage, '
             'the integration root and the span-four assembly remain separate obligations.')
    arithmetic.group_spec = lambda _manifest, _name: (group, modules, required, private)
    arithmetic.GATE_INPUTS = GATE_INPUTS
    previous_write = arithmetic.write_receipt

    def write_receipt(destination, receipt):
        receipt['scope'] = scope
        receipt['transport_manifest_sha256'] = digest(MANIFEST)
        receipt['target_count'] = group['rows']
        receipt['direct_source_reuse'] = group['direct_source_reuse']
        receipt['transport_check_count'] = group['transport_checks']
        receipt['target_private_endpoints'] = group['target_private_endpoints']
        receipt['integration_root_checked'] = False
        receipt['canonical_graph_coverage_checked'] = False
        previous_write(destination, receipt)

    arithmetic.write_receipt = write_receipt
    arithmetic.run_group(SimpleNamespace(group=name, artifact_dir=stage, runtime=None, jobs=jobs), manifest)


def publish():
    manifest = validate_sources()
    preparation = read_json(PREPARATION)
    group, modules, required, private = group_spec(manifest, INITIAL_GROUP)
    receipt_path = ARTIFACT_ROOT / ('frankl-transport-' + INITIAL_GROUP) / 'receipt.json'
    receipt = read_json(receipt_path)
    require(receipt['status'] == 'passed' and receipt['all_frozen_hashes_unchanged'],
            'Fresh complete g000 gate required before candidate publication')
    require(receipt['project_modules'] == modules and receipt['required_endpoints'] == required
            and receipt['required_private_endpoints'] == private,
            'g000 receipt inventory differs from the current source group')
    require(receipt['group'] == group and receipt['transport_manifest_sha256'] == digest(MANIFEST),
            'g000 receipt belongs to different candidate data')
    require(receipt['git_commit'] == preparation['base_commit'], 'g000 source commit mismatch')
    require(receipt['kernel_replay']['exact_project_closure']
            and receipt['axiom_audit']['all_declarations_audited']
            and receipt['axiom_audit']['explicit_import_all'],
            'Complete exact kernel and all-owned declaration audit required')
    require(set(receipt['source_checks']) == set(modules)
            and all(check['exit_code'] == 0 and check['timed_out'] is False
                    for check in receipt['source_checks'].values()),
            'Missing successful fresh source check')
    require(sorted(receipt['kernel_replay']['replayed_modules']) == sorted(modules)
            and len(set(receipt['kernel_replay']['replayed_modules'])) == len(modules),
            'Stock replay did not cover exactly the source closure')
    require(receipt['toolchain']['checker_sha256'] == arithmetic.CHECKER_SHA256,
            'Wrong stock checker')
    require(receipt['axiom_audit']['exit_code'] == 0
            and receipt['axiom_audit']['timed_out'] is False
            and receipt['kernel_replay']['exit_code'] == 0
            and receipt['kernel_replay']['timed_out'] is False,
            'Audit or replay did not finish successfully')
    require(receipt['axiom_whitelist'] == ['propext', 'Classical.choice', 'Quot.sound'],
            'Axiom whitelist changed')
    stage = ARTIFACT_ROOT / ('frankl-transport-' + INITIAL_GROUP)
    require(arithmetic.artifact_hashes(stage, modules) == receipt['artifact_sha256'],
            'Checked object facets changed before publication')
    require(digest(receipt['toolchain']['lean_path']) == receipt['toolchain']['lean_sha256']
            and digest(receipt['toolchain']['checker_path']) == arithmetic.CHECKER_SHA256,
            'Compiler or checker changed before publication')
    frozen = dict(preparation['frozen'])
    frozen.update({'lean/' + module.replace('.', '/') + '.lean': expected
                   for module, expected in receipt['source_sha256'].items()})
    frozen.update(receipt['gate_sha256'])
    for path, expected in frozen.items():
        require(digest(ROOT / path) == expected, 'Frozen input changed: ' + path)
    run_id, attempt = os.environ.get('GITHUB_RUN_ID'), os.environ.get('GITHUB_RUN_ATTEMPT')
    require(run_id and run_id.isdigit() and attempt and attempt.isdigit(),
            'Publication requires an identified hosted workflow attempt')
    receipt_dir = 'docs/verification/frankl-transport-batches-' + run_id + '-attempt-' + attempt
    receipt_target = receipt_dir + '/g000.json'
    note_target = receipt_dir + '/publication.json'
    (ROOT / receipt_target).parent.mkdir(parents=True, exist_ok=True)
    shutil.copyfile(receipt_path, ROOT / receipt_target)
    remaining = [item['id'] for item in manifest['groups'] if item['id'] != INITIAL_GROUP]
    write_json(ROOT / note_target, {
        'schema': 'frankl-transport-candidate-publication-v1',
        'status': 'candidate packet published after the bounded g000 proof gate',
        'base_commit': preparation['base_commit'], 'manifest_sha256': digest(MANIFEST),
        'receipt_sha256': digest(receipt_path), 'passed_groups': [INITIAL_GROUP],
        'groups_pending_fresh_gates': remaining,
        'candidate_targets': manifest['target_count'], 'checked_targets': group['rows'],
        'source_sha256': manifest['source_sha256'],
        'accepted_registry_changed': False, 'coverage_root_checked': False,
        'integration_root_checked': False, 'canonical_graph_coverage_checked': False,
    })
    paths = preparation['publish_paths'] + [receipt_target, note_target]
    require(all(not path.startswith('.github/') for path in paths),
            'Generated publication must not modify workflows')
    require(len(paths) == len(set(paths)), 'Repeated publication target')
    frozen_targets = set(preparation['publish_paths'])
    published = None
    # Each attempt creates a normal fast-forward child of the freshly read
    # main head. A branch move causes rejection, followed by complete guards.
    for attempt_index in range(3):
        run(['git', 'fetch', 'origin', 'main'])
        latest = git_text('rev-parse', 'FETCH_HEAD')
        for path, expected in frozen.items():
            if path in frozen_targets:
                continue
            current = git_bytes(latest, path)
            require(current is not None and arithmetic.hashlib.sha256(current).hexdigest() == expected,
                    'Concurrent input change: ' + path)
        for path in paths:
            before = git_bytes(preparation['base_commit'], path)
            current = git_bytes(latest, path)
            raw = (ROOT / path).read_bytes()
            require(current is None or current == before or current == raw,
                    'Concurrent publication-path collision: ' + path)
            if path in (receipt_target, note_target):
                require(current is None or current == raw, 'Historical receipt already has different bytes')
        if all(git_bytes(latest, path) == (ROOT / path).read_bytes() for path in paths):
            published = latest
            break
        with tempfile.TemporaryDirectory(prefix='frankl-transport-publication-index-') as directory:
            environment = {**os.environ, 'GIT_INDEX_FILE': str(Path(directory) / 'index'),
                'GIT_AUTHOR_NAME': 'github-actions[bot]', 'GIT_COMMITTER_NAME': 'github-actions[bot]',
                'GIT_AUTHOR_EMAIL': '41898282+github-actions[bot]@users.noreply.github.com',
                'GIT_COMMITTER_EMAIL': '41898282+github-actions[bot]@users.noreply.github.com'}
            run(['git', 'read-tree', latest], env=environment)
            for path in paths:
                blob = subprocess.check_output(['git', 'hash-object', '-w', '--stdin'],
                    cwd=ROOT, input=(ROOT / path).read_bytes()).decode().strip()
                run(['git', 'update-index', '--add', '--cacheinfo', '100644', blob, path],
                    env=environment)
            tree = subprocess.check_output(['git', 'write-tree'], cwd=ROOT,
                                           env=environment, text=True).strip()
            message = ('Publish grouped Frankl transport candidates after the first exact proof gate\n\n'
                       'Preserve original row indices and transported weights. Record the complete '
                       'fresh g000 receipt and leave all remaining groups, coverage and integration '
                       'claims pending their own gates. Do not change accepted registries.\n')
            commit = subprocess.check_output(['git', 'commit-tree', tree, '-p', latest],
                cwd=ROOT, env=environment, text=True, input=message).strip()
            print(json.dumps({'candidate_commit': commit, 'parent': latest,
                              'publication_files': len(paths), 'attempt': attempt_index + 1}), flush=True)
            pushed = subprocess.run(['git', 'push', 'origin', commit + ':refs/heads/main'], cwd=ROOT)
            if pushed.returncode == 0:
                published = commit
                break
    require(published is not None, 'Publication lost three fast-forward races; preserve the passed receipt')
    output_path = os.environ.get('GITHUB_OUTPUT')
    require(output_path, 'Missing workflow output path')
    with Path(output_path).open('a', encoding='utf-8') as stream:
        stream.write('published_sha=' + published + '\n')
        stream.write('remaining_groups=' + json.dumps(remaining, separators=(',', ':')) + '\n')
    print(json.dumps({'published_sha': published, 'remaining_groups': remaining,
                      'initial_receipt': receipt_target, 'manifest_sha256': digest(MANIFEST)},
                     indent=2), flush=True)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('mode', choices=('prepare', 'verify', 'publish'))
    parser.add_argument('--group', default=INITIAL_GROUP)
    parser.add_argument('--jobs', type=int, default=4, choices=range(1, 5))
    args = parser.parse_args()
    if args.mode == 'prepare':
        prepare()
    elif args.mode == 'verify':
        verify(args.group, args.jobs)
    else:
        require(args.group == INITIAL_GROUP, 'Only the initial gate publishes the candidate packet')
        publish()


if __name__ == '__main__':
    main()
