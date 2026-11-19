#!/usr/bin/env python3
"""Adversarial protocol checks derived from the authenticated original receipt.

These are controller tests, not fabricated Lean results. Positive cases use the
actual source/profile/audit/stock receipt and its authenticated archive digest
inventory. Negative cases deliberately mutate one protocol component at a time.
"""
from __future__ import annotations

import argparse
from copy import deepcopy
import json
from pathlib import Path
import tempfile

import verify_tight_seven_closed_lift_join as join


def run_raw_inventory_tests(inventory):
    """Exercise exact bytes using a real, already validated raw-helper graph."""
    graph = inventory['raw_occurrence_graph']
    join.require(graph['nodes'] and all(type(k) is int for k in graph['nodes'])
                 and all(type(k) is int for k in graph['variant_index']),
                 'The real raw graph does not exercise integer-key serialization')
    payload = join.encoded(inventory)
    expected_sha256 = join.digest(payload)
    decoded = json.loads(payload)
    results = []

    def accept(name, action):
        action()
        results.append({'name': name, 'expected': 'accept', 'passed': True})

    def reject(name, value, expected_hash=expected_sha256):
        try:
            join.validate_inventory_payload(value, inventory, expected_hash)
        except RuntimeError:
            results.append({'name': name, 'expected': 'reject', 'passed': True})
        else:
            raise RuntimeError('Raw inventory guard accepted corruption: ' + name)

    accept('exact real inventory bytes', lambda: join.validate_inventory_payload(
        payload, inventory, expected_sha256))
    accept('round trip preserves every indexed node and variant', lambda: join.require(
        decoded != inventory and all(decoded['raw_occurrence_graph'][key] ==
            {str(k): v for k, v in graph[key].items()} for key in ('nodes', 'variant_index')),
        'Integer-key round trip changed graph contents'))
    reject('incorrect inventory digest', payload, '0' * 64)
    reject('additional serialized whitespace', payload + b'\n')
    changed = deepcopy(decoded)
    changed['raw_occurrence_graph']['nodes'].pop(next(iter(changed['raw_occurrence_graph']['nodes'])))
    reject('omitted raw graph node', join.encoded(changed))
    changed = deepcopy(decoded)
    changed['raw_occurrence_graph']['variant_index']['unexpected'] = {}
    reject('extra raw variant', join.encoded(changed))
    changed = deepcopy(decoded)
    changed.pop('raw_occurrence_graph')
    reject('omitted complete raw graph', join.encoded(changed))
    join.require(len(results) == 7 and len({r['name'] for r in results}) == 7,
                 'Raw inventory regression coverage differs')
    return {'schema': 'tight-seven-join-raw-inventory-tests-v1', 'status': 'passed',
            'input_inventory_sha256': expected_sha256, 'positive_checks': 2, 'negative_checks': 5,
            'raw_nodes': len(graph['nodes']), 'indexed_variants': len(graph['variant_index']),
            'checks': results, 'lean_verified_by_tests': False}


class DigestView:
    def __init__(self, hashes, payload):
        self.hashes, self.payload = dict(hashes), dict(payload)

    def hash(self, name):
        return self.hashes[name]

    def read(self, name):
        return self.payload[name]

    def prefix(self, prefix):
        return {name[len(prefix):] for name in self.hashes if name.startswith(prefix)}


def run(inspection, api_dir):
    model = join.original_model()
    failed = json.loads((inspection / 'failed-assembly-receipt.json').read_bytes())
    spec = model['primes'][0]
    key, prefix = spec['id'], 'upstream/' + spec['id'] + '/'
    folder = inspection / key
    raw_receipt = (folder / 'receipt.json').read_bytes()
    receipt = json.loads(raw_receipt)
    prior = failed['upstream'][key]
    artifacts = json.loads((api_dir / 'artifacts.json').read_bytes())
    jobs = json.loads((api_dir / 'jobs.json').read_bytes())
    hashes = json.loads((inspection / 'archive-file-inventory.json').read_bytes())
    payload = {prefix + 'receipt.json': raw_receipt,
               prefix + 'receipt.sha256': (folder / 'receipt.sha256').read_bytes()}
    controls, inputs = join.original_controls(model), join.original_inputs(model)
    modes, modules = receipt['modern_modules'], receipt['project_modules']
    generated = receipt['generated_modules']
    results = []

    def accept(name, action):
        action()
        results.append({'name': name, 'expected': 'accept', 'passed': True})

    def reject(name, action):
        try:
            action()
        except (RuntimeError, KeyError):
            results.append({'name': name, 'expected': 'reject', 'passed': True})
        else:
            raise RuntimeError('Protocol accepted the deliberate corruption: ' + name)

    def header(value):
        return join.validate_provider_header(value, join.digest(raw_receipt), prior, spec, model,
            controls, inputs, failed['modern_modules'], failed['toolchain'])

    accept('actual provider header', lambda: header(receipt))
    accept('actual provider seal', lambda: join.validate_provider_evidence(DigestView(hashes, payload), prefix, prior))
    accept('actual API metadata', lambda: join.validate_api_metadata(artifacts, jobs, model))
    accept('actual provider object inventory', lambda: join.check_object_inventory(
        DigestView(hashes, payload), prefix, receipt['artifact_sha256'], modules, modes))
    accept('actual full provider source inventory', lambda: join.verify_source_inventory(
        folder, modules, generated, 'SixSpeedBatchAudit.lean'))
    accept('actual strict source audit and stock profiles', lambda: join.gate.validate_checks(
        folder, receipt, modules, receipt['required_theorems'], modes, modules))
    stock = receipt['kernel_replay']
    stock_text = (folder / stock['log_relative']).read_text()
    accept('actual complete stock target inventory', lambda: join.validate_stock_inventory(stock, stock_text, 'Conjectures', modules))
    accept('identical shared object reuse', lambda: join.merge_objects(
        deepcopy(receipt['artifact_sha256']), deepcopy(receipt['artifact_sha256'])))

    header_mutations = [
        ('provider status', lambda x: x.update(status='failed')),
        ('provider commit', lambda x: x.update(git_commit='0' * 40)),
        ('provider run', lambda x: x['ci'].update(GITHUB_RUN_ID='1')),
        ('provider attempt', lambda x: x['ci'].update(GITHUB_RUN_ATTEMPT='2')),
        ('provider workflow', lambda x: x['ci'].update(GITHUB_WORKFLOW_REF='wrong')),
        ('provider job', lambda x: x.update(ci_job='assemble')),
        ('provider source freshness', lambda x: x.update(all_project_sources_fresh=False)),
        ('provider source policy', lambda x: x['source_policy'].update(warning_as_error=False)),
        ('provider memory bound', lambda x: x['resources'].update(lean_memory_mib=8192)),
        ('provider control hash', lambda x: x['gate_sha256'].update({next(iter(x['gate_sha256'])): '0' * 64})),
        ('provider Git source binding', lambda x: x['commit_input_sha256'].update({next(iter(x['commit_input_sha256'])): '0' * 64})),
        ('provider source hash', lambda x: x['source_sha256'].update({modules[0]: '0' * 64})),
        ('provider missing module', lambda x: x['project_modules'].pop()),
        ('provider extra module', lambda x: x['project_modules'].append('Solitaire.Injected')),
        ('provider duplicate module', lambda x: x['project_modules'].append(modules[0])),
        ('provider missing endpoint', lambda x: x['required_theorems'].pop()),
        ('provider extra endpoint', lambda x: x['required_theorems'].append('Injected.theorem')),
        ('provider missing generated source', lambda x: x['generated_modules'].pop()),
        ('provider missing root', lambda x: x['checked_root_indices'].pop()),
        ('provider duplicate root', lambda x: x['checked_root_indices'].append(0)),
        ('provider row omission', lambda x: x['ordered_root_lists'].pop()),
        ('provider unproved initial coverage', lambda x: x.update(initial_support_coverage_verified=True)),
        ('provider axiom audit absent', lambda x: x['axiom_audit'].update(all_owned_declarations_audited=False)),
        ('provider stock replay absent', lambda x: x['kernel_replay'].update(unchanged_stock_checker=False)),
    ]
    for name, mutate in header_mutations:
        value = deepcopy(receipt)
        mutate(value)
        reject(name, lambda value=value: header(value))

    value = dict(payload)
    changed = deepcopy(receipt)
    changed['ci_job'] = 'injected'
    value[prefix + 'receipt.json'] = join.encoded(changed)
    reject('receipt bytes mutated', lambda: join.validate_provider_evidence(DigestView(hashes, value), prefix, prior))
    value = dict(payload)
    value[prefix + 'receipt.sha256'] = b'0' * 64 + b'\n'
    reject('receipt sidecar mutated', lambda: join.validate_provider_evidence(DigestView(hashes, value), prefix, prior))
    for name, operation in [
            ('evidence digest mutated', lambda h: h.update({prefix + stock['log_relative']: '0' * 64})),
            ('evidence member missing', lambda h: h.pop(prefix + stock['log_relative'])),
            ('evidence member extra', lambda h: h.update({prefix + 'unexpected.txt': '0' * 64}))]:
        value = dict(hashes)
        operation(value)
        reject(name, lambda value=value: join.validate_provider_evidence(DigestView(value, payload), prefix, prior))

    for name, mutate in [
            ('API original artifact run', lambda a: a['artifacts'][0]['workflow_run'].update(id=1)),
            ('API original artifact commit', lambda a: a['artifacts'][0]['workflow_run'].update(head_sha='0' * 40)),
            ('API missing artifact', lambda a: a['artifacts'].pop()),
            ('API extra artifact', lambda a: a['artifacts'].append(deepcopy(a['artifacts'][0])))]:
        value = deepcopy(artifacts)
        mutate(value)
        reject(name, lambda value=value: join.validate_api_metadata(value, jobs, model))
    for name, field, value in [('API original join digest', 'digest', 'sha256:' + '0' * 64),
                               ('API original join size', 'size_in_bytes', join.ARCHIVE_BYTES + 1),
                               ('API original join identity', 'id', 1)]:
        changed = deepcopy(artifacts)
        next(a for a in changed['artifacts'] if a['name'] == join.ARCHIVE_NAME)[field] = value
        reject(name, lambda changed=changed: join.validate_api_metadata(changed, jobs, model))
    for name, mutate in [
            ('API wrong prime run', lambda j: next(x for x in j['jobs'] if x['name'].startswith('prime ')).update(run_id=1)),
            ('API failed prime job', lambda j: next(x for x in j['jobs'] if x['name'].startswith('prime ')).update(conclusion='failure')),
            ('API missing job', lambda j: j['jobs'].pop()),
            ('API extra job', lambda j: j['jobs'].append(deepcopy(j['jobs'][0])))]:
        value = deepcopy(jobs)
        mutate(value)
        reject(name, lambda value=value: join.validate_api_metadata(artifacts, value, model))

    objects = receipt['artifact_sha256']
    for name, mutate in [
            ('object module missing', lambda x: x.pop(modules[0])),
            ('object module extra', lambda x: x.update({'Solitaire.Injected': {'.olean': '0' * 64}})),
            ('object bytes substituted', lambda x: x[modules[0]].update({'.olean': '0' * 64})),
            ('object facet missing', lambda x: x[modules[0]].pop('.olean')),
            ('object partial private facet', lambda x: x[modules[0]].update({'.olean.private': '0' * 64}))]:
        value = deepcopy(objects)
        mutate(value)
        reject(name, lambda value=value: join.check_object_inventory(DigestView(hashes, payload), prefix, value, modules, modes))
    value = dict(hashes)
    value[prefix + 'lib/lean/Solitaire/Injected.olean'] = '0' * 64
    reject('object file outside Conjectures', lambda: join.check_object_inventory(DigestView(value, payload), prefix, objects, modules, modes))
    changed = deepcopy(objects)
    changed[modules[0]]['.olean'] = '0' * 64
    reject('inconsistent shared object identity', lambda: join.merge_objects(deepcopy(objects), changed))

    with tempfile.TemporaryDirectory(prefix='tight-seven-join-inventory-') as directory:
        stage = Path(directory)
        for module in modules:
            p = join.module_path(stage / 'src', module)
            p.parent.mkdir(parents=True, exist_ok=True)
            p.write_bytes(b'')
        for module in generated:
            p = join.module_path(stage / 'generated', module)
            p.parent.mkdir(parents=True, exist_ok=True)
            p.write_bytes(b'')
        (stage / 'src/SixSpeedBatchAudit.lean').write_bytes(b'')
        for name, relative in [('extra Solitaire source', 'src/Solitaire/Injected.lean'),
                              ('bare Conjectures root source', 'src/Conjectures.lean'),
                              ('unexpected audit source', 'src/UnexpectedAudit.lean'),
                              ('extra generated foreign source', 'generated/Solitaire/Injected.lean')]:
            p = stage / relative
            p.parent.mkdir(parents=True, exist_ok=True)
            p.write_bytes(b'')
            reject(name, lambda: join.verify_source_inventory(stage, modules, generated, 'SixSpeedBatchAudit.lean'))
            p.unlink()
        p = join.module_path(stage / 'src', modules[0])
        p.unlink()
        reject('source file missing', lambda: join.verify_source_inventory(stage, modules, generated, 'SixSpeedBatchAudit.lean'))
        p.symlink_to(stage / 'src/SixSpeedBatchAudit.lean')
        reject('source path symlink', lambda: join.verify_source_inventory(stage, modules, generated, 'SixSpeedBatchAudit.lean'))

    first = next(line for line in stock_text.splitlines() if line.startswith('replaying '))
    for name, text in [('stock foreign target substitution', stock_text + '\nreplaying Mathlib.Injected\n'),
                       ('stock bare root substitution', stock_text.replace(first, 'replaying Conjectures', 1)),
                       ('stock missing target', stock_text.replace(first + '\n', '', 1)),
                       ('stock duplicated target', stock_text + '\n' + first + '\n')]:
        reject(name, lambda text=text: join.validate_stock_inventory(stock, text, 'Conjectures', modules))
    changed = deepcopy(stock)
    changed['stock_prefix'] = 'Solitaire'
    reject('stock prefix substitution', lambda: join.validate_stock_inventory(changed, stock_text, 'Conjectures', modules))

    original = join.provider.aggregate_source(model['primes'])
    repaired = join.aggregate_source(model['primes'])
    reverse = repaired.replace(join.NEW_SIMP, join.OLD_SIMP).replace(join.NAMESPACE, join.OLD_NAMESPACE)
    reverse = reverse.replace('Generated by scripts/verify_tight_seven_closed_lift_join.py from the pinned original generator.',
                              'Generated by scripts/verify_tight_seven_closed_lift_primes.py.')
    accept('exact generator-only mathematical correspondence', lambda: join.require(reverse == original, 'Unexpected aggregate change'))
    join.require(len({item['name'] for item in results}) == len(results), 'Duplicate protocol case')
    return {'schema': 'tight-seven-closed-lift-join-protocol-tests-v1', 'status': 'passed',
            'positive_checks': sum(r['expected'] == 'accept' for r in results),
            'negative_checks': sum(r['expected'] == 'reject' for r in results),
            'checks': results, 'lean_verified': False}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--inspection-dir', type=Path, required=True)
    parser.add_argument('--api-dir', type=Path, required=True)
    parser.add_argument('--report', type=Path, required=True)
    args = parser.parse_args()
    report = run(args.inspection_dir.resolve(), args.api_dir.resolve())
    join.write_json(args.report.resolve(), report)
    print(json.dumps(report, sort_keys=True))


if __name__ == '__main__':
    main()
