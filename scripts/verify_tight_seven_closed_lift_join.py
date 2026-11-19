#!/usr/bin/env python3
"""Authenticate the original seventeen prime certificates and check a repaired join.

The original failed assembly ZIP is only an immutable evidence container. Its
seventeen passed provider receipts retain their original source, control, run,
attempt, object, audit, and stock-replay identities. No failed assembly result
is promoted to a successful proof. This controller freshly checks only the new
aggregate, then audits every imported project declaration and reachable raw
proof variant before replaying the aggregate with the unchanged stock checker.
"""
from __future__ import annotations

import argparse
from collections import Counter
import gc
import hashlib
import json
import os
from pathlib import Path, PurePosixPath
import re
import shutil
import stat
import subprocess
import sys
import time
import urllib.error
import urllib.parse
import urllib.request
import zipfile

import verify_tight_seven_closed_lift_primes as provider

ROOT = Path(__file__).resolve().parents[1]
CONTROLLER = 'scripts/verify_tight_seven_closed_lift_join.py'
MODEL = 'docs/tight-seven-closed-lift-join-sources.json'
WORKFLOW = '.github/workflows/lean-tight-seven-closed-lift-join.yml'
RAW_HELPER = 'scripts/audit_lean_raw_occurrences.py'
TESTS = 'scripts/test_tight_seven_closed_lift_join.py'
SCHEMA = 'tight-seven-closed-lift-join-sources-v1'
RECEIPT_SCHEMA = 'tight-seven-closed-lift-join-receipt-v1'
AGGREGATE = 'Conjectures.LonelinessTightSevenClosedLiftPrimesVerified'
OLD_NAMESPACE = 'Loneliness.Modular.TightSevenClosedLiftPrimes'
NAMESPACE = OLD_NAMESPACE + 'Verified'
REPOSITORY = '1337isnot1337/solved-conjectures'
PROVIDER_COMMIT = '29cf90d3da1bf66596d72de04612fb5e44a70006'
PROVIDER_RUN = 44585626240
PROVIDER_ATTEMPT = 1
FAILED_JOB = 135797046940
ARCHIVE_ID = 14562712923
ARCHIVE_NAME = 'tight-seven-closed-lift-complete-' + PROVIDER_COMMIT
ARCHIVE_BYTES = 363551339
ARCHIVE_SHA256 = 'af070f1a51df895512352bce9b58e881786259f770456a922943f52ecedee990'
FAILED_RECEIPT_SHA256 = 'a58ca380378b74e41f29df65e1801e36dda3bd31bd74708a140bf99fcb9ba185'
PROVIDER_MODEL_SHA256 = '020575719b7349ec207643ee2fabd36cdfbda05c407c41ba7dcd22c2bc00e914'
PROVIDER_CONTROLLER_SHA256 = '680b4eef5264e1085e68ce7150a44f6df125378fe894b1417d77577ed3ebadbc'
PROVIDER_WORKFLOW_SHA256 = '26e392c8b3d2b4343593d4b101a7976c09759258238faf051634fc9241e68bae'
RAW_HELPER_SHA256 = '7c366fa3983ed26b2356c417552b861ff235c5bb34848810191c13b5322c9cea'
REMOTE_REPOSITORY = Path('/home/runner/work/solved-conjectures/solved-conjectures')
REMOTE_BASE = REMOTE_REPOSITORY / '.candidate-artifacts/tight-seven-closed-lift-primes'
REMOTE_PYTHON = '/usr/bin/python3'
ARCHIVE_MEMBERS = 3181
ARCHIVE_UNCOMPRESSED_BYTES = 1698292412
OLD_SIMP = '  simp only [primes, List.mem_cons, List.mem_singleton] at hprime'
NEW_SIMP = '  simp only [primes, List.mem_cons, List.not_mem_nil, or_false] at hprime'
RESOURCES = dict(provider.RESOURCES)
POLICY = {'warning_as_error': True, 'linter_override': False,
          'fresh_aggregate_source': True, 'authenticated_original_provider_objects': True,
          'exact_stock_aggregate_replay': True, 'original_provider_run_and_attempt_preserved': True,
          'complete_raw_occurrence_graph': True, 'raw_variant_kernel_trust_level': 0}
SCOPE = dict(provider.SCOPE)
SCOPE.update({'original_prime_proofs_reused': True, 'failed_assembly_is_evidence_container_only': True,
              'fresh_aggregate': AGGREGATE, 'project_modules': 82})
CONTROLS = tuple(dict.fromkeys((*provider.CONTROLS, provider.MODEL,
                               CONTROLLER, WORKFLOW, RAW_HELPER, TESTS)))
REQUIRED = [name.replace(OLD_NAMESPACE + '.', NAMESPACE + '.')
            for name in provider.AGGREGATE_REQUIRED]
gate = provider.gate
require, encoded, module_path = gate.require, gate.encoded, gate.module_path


def digest(raw):
    return hashlib.sha256(raw).hexdigest()


def sha(path):
    h = hashlib.sha256()
    with Path(path).open('rb') as stream:
        while block := stream.read(8 * 1024 * 1024):
            h.update(block)
    return h.hexdigest()


def write_json(path, value):
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_bytes(encoded(value))


def original_model():
    path = ROOT / provider.MODEL
    require(sha(path) == PROVIDER_MODEL_SHA256
            and sha(ROOT / provider.CONTROLLER) == PROVIDER_CONTROLLER_SHA256
            and sha(ROOT / provider.WORKFLOW) == PROVIDER_WORKFLOW_SHA256,
            'The original provider controls changed')
    model = json.loads(path.read_bytes())
    provider.validate_model(model)
    return model


def original_controls(model):
    return {**model['control_sha256'], provider.MODEL: PROVIDER_MODEL_SHA256}


def original_inputs(model):
    return {**original_controls(model), **{
        'lean/' + m.replace('.', '/') + '.lean': h
        for m, h in provider.source_hashes(model, model['project_modules']).items()}}


def original_ci():
    return {'GITHUB_REPOSITORY': REPOSITORY, 'GITHUB_RUN_ID': str(PROVIDER_RUN),
            'GITHUB_RUN_ATTEMPT': str(PROVIDER_ATTEMPT), 'GITHUB_SHA': PROVIDER_COMMIT,
            'GITHUB_WORKFLOW': 'Lean tight-seven closed-lift primes',
            'GITHUB_WORKFLOW_REF': REPOSITORY + '/' + provider.WORKFLOW + '@refs/heads/main'}


def aggregate_source(specs):
    text = provider.aggregate_source(specs)
    require(text.count(OLD_SIMP) == 1, 'The original aggregate simplification changed')
    text = text.replace(OLD_SIMP, NEW_SIMP)
    text = text.replace(OLD_NAMESPACE, NAMESPACE)
    old_header = 'Generated by scripts/verify_tight_seven_closed_lift_primes.py.'
    require(text.count(old_header) == 1, 'The original aggregate provenance header changed')
    return text.replace(old_header,
        'Generated by scripts/verify_tight_seven_closed_lift_join.py from the pinned original generator.')


def aggregate_required(model):
    return sorted(REQUIRED + [name for spec in model['primes'] for name in provider.required_for(spec)])


def safe_relative(name):
    return (isinstance(name, str) and bool(name) and '\\' not in name and '\x00' not in name
            and not name.startswith('/') and all(p not in ('', '.', '..') for p in name.split('/')))


class EvidenceZip:
    """Read exact member bytes without extracting the large repeated packets."""
    def __init__(self, path):
        require(path.is_file() and not path.is_symlink() and path.stat().st_size == ARCHIVE_BYTES,
                'Wrong original archive size or file kind')
        require(sha(path) == ARCHIVE_SHA256, 'Original archive SHA256 differs')
        self.path = path
        self.archive = zipfile.ZipFile(path)
        records = self.archive.infolist()
        names = [r.filename for r in records]
        require(len(names) == len(set(names)) == ARCHIVE_MEMBERS
                and sum(r.file_size for r in records) == ARCHIVE_UNCOMPRESSED_BYTES,
                'Original archive member inventory differs')
        require(all(safe_relative(r.filename) and not r.is_dir()
                    and not stat.S_ISLNK(r.external_attr >> 16)
                    and stat.S_IFMT(r.external_attr >> 16) in (0, stat.S_IFREG)
                    and not (r.flag_bits & 1) and 0 <= r.file_size <= 128 * 1024 * 1024
                    for r in records), 'Unsafe original archive member')
        self.members = set(names)
        self.sizes = {r.filename: r.file_size for r in records}
        self.hashes = {}

    def close(self):
        self.archive.close()

    def read(self, name):
        require(name in self.members, 'Missing original archive member: ' + name)
        return self.archive.read(name)

    def json(self, name):
        return json.loads(self.read(name))

    def hash(self, name):
        if name not in self.hashes:
            require(name in self.members, 'Missing original archive member: ' + name)
            h = hashlib.sha256()
            with self.archive.open(name) as stream:
                while block := stream.read(8 * 1024 * 1024):
                    h.update(block)
            self.hashes[name] = h.hexdigest()
        return self.hashes[name]

    def prefix(self, prefix):
        return {name[len(prefix):] for name in self.members if name.startswith(prefix)}

    def copy(self, name, path):
        require(safe_relative(name), 'Unsafe copied archive path')
        path.parent.mkdir(parents=True, exist_ok=True)
        require(not path.is_symlink(), 'Copied evidence path is a symlink')
        if path.exists():
            require(path.is_file() and sha(path) == self.hash(name), 'Existing evidence copy differs')
            return
        with self.archive.open(name) as source, path.open('xb') as target:
            shutil.copyfileobj(source, target, 8 * 1024 * 1024)
        require(sha(path) == self.hash(name), 'Copied evidence digest differs')


def validate_api_metadata(artifacts, jobs, model):
    artifacts = artifacts['artifacts']
    jobs = jobs['jobs']
    require(len(artifacts) == 18 and len({a['id'] for a in artifacts}) == 18,
            'The original artifact inventory differs')
    by_name = {a['name']: a for a in artifacts}
    names = {ARCHIVE_NAME} | {'tight-seven-closed-lift-prime-' + s['id'] for s in model['primes']}
    require(set(by_name) == names, 'Original prime artifact names differ')
    outer = by_name[ARCHIVE_NAME]
    require(outer['id'] == ARCHIVE_ID and outer['size_in_bytes'] == ARCHIVE_BYTES
            and outer['digest'] == 'sha256:' + ARCHIVE_SHA256, 'Original join artifact binding differs')
    for a in artifacts:
        require(a['workflow_run']['id'] == PROVIDER_RUN
                and a['workflow_run']['head_sha'] == PROVIDER_COMMIT
                and a['workflow_run']['head_branch'] == 'main'
                and re.fullmatch(r'sha256:[0-9a-f]{64}', a['digest']) is not None,
                'Original artifact run or commit differs')
    by_job = {j['name']: j for j in jobs}
    require(len(jobs) == len(by_job) == 19
            and set(by_job) == {'plan', 'assemble'} | {'prime ' + str(p) for p in provider.PRIMES},
            'Original job inventory differs')
    for name, job in by_job.items():
        require(job['status'] == 'completed'
                and job['conclusion'] == ('failure' if name == 'assemble' else 'success'),
                'An original prime job did not pass')
        require(job['run_id'] == PROVIDER_RUN
                and job.get('head_sha', PROVIDER_COMMIT) == PROVIDER_COMMIT,
                'Original job provenance differs')
    require(by_job['assemble']['id'] == FAILED_JOB, 'Wrong failed assembly job')
    return by_name, by_job


def check_object_inventory(bundle, prefix, objects, modules, modern):
    require(set(objects) == set(modules), 'Provider object module inventory differs')
    expected = set()
    for module, facets in objects.items():
        needed = set(gate.pilot.FACETS[:3]) if modern[module] else {'.olean'}
        require(needed <= set(facets) <= set(gate.pilot.FACETS)
                and ('.olean.private' in facets) == ('.olean.server' in facets),
                'Provider object facet inventory differs')
        for suffix, h in facets.items():
            relative = 'lib/lean/' + module.replace('.', '/') + suffix
            expected.add(relative)
            require(bundle.hash(prefix + relative) == h, 'Provider object bytes differ: ' + module)
    require({p for p in bundle.prefix(prefix) if p.startswith('lib/lean/')} == expected,
            'Unexpected provider object facet')


def merge_objects(union, objects):
    for module, facets in objects.items():
        require(module not in union or union[module] == facets, 'Shared original object bytes differ')
        union[module] = facets


def verify_source_inventory(stage, modules, generated, audit_name=None):
    expected_source = {m.replace('.', '/') + '.lean' for m in modules}
    if audit_name is not None:
        require(safe_relative(audit_name) and '/' not in audit_name and audit_name.endswith('.lean'),
                'Unexpected authorized audit source name')
        expected_source.add(audit_name)
    for directory, expected in (('src', expected_source),
            ('generated', {m.replace('.', '/') + '.lean' for m in generated})):
        folder = stage / directory
        actual = set()
        for path in folder.rglob('*'):
            require(not path.is_symlink(), 'A staged source path is a symlink')
            if path.is_file():
                actual.add(path.relative_to(folder).as_posix())
        require(actual == expected, 'Exact whole-directory source inventory differs: ' + directory)


def validate_stock_inventory(check, text, target, expected):
    actual = re.findall(r'^replaying (\S+)$', text, re.M)
    require(Counter(actual) == Counter(expected) and len(actual) == len(set(actual))
            and check['replayed_modules'] == actual and check['stock_prefix'] == target
            and check['exact_target_multiset'] is True and check['unchanged_stock_checker'] is True,
            'Stock replay does not cover the complete exact target multiset')


def validate_provider_evidence(bundle, prefix, prior):
    receipt_raw = bundle.read(prefix + 'receipt.json')
    receipt = json.loads(receipt_raw)
    receipt_sha = digest(receipt_raw)
    require(receipt_sha == prior['receipt_sha256']
            and bundle.read(prefix + 'receipt.sha256') == (receipt_sha + '\n').encode(),
            'Original provider receipt seal differs: ' + prefix)
    evidence = receipt['evidence_sha256']
    require(bundle.prefix(prefix) == set(evidence) | {'receipt.json', 'receipt.sha256'},
            'Original provider evidence inventory differs: ' + prefix)
    for relative, h in evidence.items():
        require(safe_relative(relative) and bundle.hash(prefix + relative) == h,
                'Original provider evidence digest differs: ' + prefix + relative)
    require(digest(encoded(evidence)) == prior['evidence_inventory_sha256'],
            'Original preserved inventory digest differs')
    return receipt, receipt_sha, evidence


def validate_provider_header(receipt, receipt_sha, prior, spec, model, controls, inputs, modern, toolchain):
    key = spec['id']
    require(receipt['schema'] == provider.RECEIPT_SCHEMA and receipt['kind'] == 'prime'
            and receipt['status'] == 'passed' and receipt['prime'] == spec['prime']
            and receipt['git_commit'] == PROVIDER_COMMIT and receipt['ci'] == original_ci()
            and receipt['ci_job'] == 'primes', 'Original provider identity differs')
    require(receipt['proof_scope'] == provider.SCOPE and receipt['source_policy'] == provider.POLICY
            and receipt['resources'] == provider.RESOURCES and receipt['gate_sha256'] == controls
            and receipt['commit_input_sha256'] == inputs and receipt['toolchain'] == toolchain
            and receipt['axiom_whitelist'] == list(gate.audit.ALLOWED),
            'Original provider controls, runtime or input provenance differs')
    require(receipt['artifact_root'] == str(REMOTE_BASE / key)
            and receipt['repository_root'] == str(REMOTE_REPOSITORY)
            and receipt['python_executable'] == REMOTE_PYTHON,
            'Original provider command environment differs')
    for flag in ('all_frozen_hashes_unchanged', 'all_project_sources_fresh',
                 'all_project_modules_replayed', 'complete_ordered_binary_traces_verified'):
        require(receipt[flag] is True, 'Original provider gate incomplete')
    for flag in ('all_original_primes_verified', 'initial_support_coverage_verified',
                 'six_speed_bound_discharged', 'complete_seven_speed_classification',
                 'accepted_registry_changed'):
        require(receipt[flag] is False, 'An original receipt overstates its scope')
    require(all(receipt['axiom_audit'][flag] is True for flag in (
            'all_owned_declarations_audited', 'exact_raw_private_visibility', 'complete_serialized_private_import'))
            and receipt['kernel_replay']['exact_target_multiset'] is True
            and receipt['kernel_replay']['unchanged_stock_checker'] is True,
            'An original provider audit or stock replay is incomplete')
    modules, required = spec['project_modules'], provider.required_for(spec)
    generated = provider.generated_for(spec)
    hashes = provider.source_hashes(model, modules)
    modes = {m: modern[m] for m in modules}
    require(receipt['roots'] == [spec['root']] and receipt['project_modules'] == modules
            and receipt['required_theorems'] == required and receipt['generated_modules'] == sorted(generated)
            and receipt['source_sha256'] == hashes and receipt['modern_modules'] == modes,
            'Original provider source/endpoint inventory differs')
    require(receipt['ordered_root_lists'] == spec['ordered_root_lists']
            and receipt['root_source_indices'] == spec['root_source_indices']
            and receipt['checked_root_indices'] == list(range(spec['root_count']))
            and receipt['checked_root_count'] == spec['root_count']
            and receipt['trace_nodes'] == spec['census']['nodes']
            and receipt['full_boolean_branch_nodes'] == spec['census']['kinds']['branch']
            and receipt['maximum_binary_depth'] == spec['census']['maximum_depth'],
            'Original root or trace coverage differs')
    require(prior == {'artifact_name': 'tight-seven-closed-lift-prime-' + key,
            'prime': spec['prime'], 'receipt_sha256': receipt_sha,
            'evidence_inventory_sha256': digest(encoded(receipt['evidence_sha256'])),
            'project_modules': modules, 'checked_root_indices': list(range(spec['root_count'])),
            'ordered_root_lists': spec['ordered_root_lists']}, 'Preserved original join binding differs')
    return modules, required, generated, hashes, modes


def authenticate_archive(path, artifacts, jobs, inspection):
    """Revalidate all original provider gates; run no new Lean command."""
    model = original_model()
    api_artifacts, api_jobs = validate_api_metadata(artifacts, jobs, model)
    controls = original_controls(model)
    inputs = original_inputs(model)
    bundle = EvidenceZip(path)
    try:
        require(bundle.hash('receipt.json') == FAILED_RECEIPT_SHA256,
                'Original failed receipt digest differs')
        failed = bundle.json('receipt.json')
        require(failed['schema'] == provider.RECEIPT_SCHEMA and failed['kind'] == 'assembly'
                and failed['status'] == 'failed' and failed['ci_job'] == 'assemble'
                and failed['git_commit'] == PROVIDER_COMMIT and failed['ci'] == original_ci()
                and failed['source_checks'] == {}, 'Original failed assembly identity differs')
        require(failed['gate_sha256'] == controls and failed['commit_input_sha256'] == inputs
                and failed['proof_scope'] == provider.SCOPE and failed['source_policy'] == provider.POLICY
                and failed['resources'] == provider.RESOURCES
                and failed['project_modules'] == model['project_modules']
                and failed['required_theorems'] == model['required_theorems'],
                'Original failed assembly scope or input bindings differ')
        require(failed['artifact_root'] == str(REMOTE_BASE / 'complete')
                and failed['repository_root'] == str(REMOTE_REPOSITORY)
                and failed['python_executable'] == REMOTE_PYTHON,
                'Original assembly path identity differs')
        for flag in ('all_original_primes_verified', 'complete_ordered_binary_traces_verified',
                     'initial_support_coverage_verified', 'six_speed_bound_discharged',
                     'complete_seven_speed_classification', 'accepted_registry_changed'):
            require(failed[flag] is False, 'The original failed assembly overstates its scope')
        original_sources = provider.source_hashes(model, model['project_modules'])
        require(failed['source_sha256'] == original_sources, 'Original full source inventory differs')
        modern = {}
        outer_files = {'receipt.json'}
        for name, h in controls.items():
            relative = 'controls/' + name
            outer_files.add(relative)
            require(bundle.hash(relative) == h, 'Original assembly control differs')
        for module, h in original_sources.items():
            relative = 'src/' + module.replace('.', '/') + '.lean'
            outer_files.add(relative)
            require(bundle.hash(relative) == h, 'Original assembly source differs')
            modern[module] = next(gate.pilot.header_tokens(bundle.read(relative).decode()), None) == 'module'
            if module in model['generated_source_sha256']:
                relative = 'generated/' + module.replace('.', '/') + '.lean'
                outer_files.add(relative)
                require(bundle.hash(relative) == h, 'Original generated assembly source differs')
        require(failed['modern_modules'] == modern
                and failed['generated_modules'] == sorted(model['generated_source_sha256']),
                'Original assembly module-mode inventory differs')
        failure_label = provider.AGGREGATE + '.source'
        failure_log = 'logs/' + failure_label + '.log'
        failure_profile = 'progress/' + failure_label + '.json'
        outer_files |= {failure_log, failure_profile}
        profile = bundle.json(failure_profile)
        require(profile['exit_code'] == 1 and profile['timed_out'] is False
                and 'p = 349' in bundle.read(failure_log).decode()
                and 'List.mem_singleton' in bundle.read(failure_log).decode(),
                'The preserved aggregate failure is not the reached simplification failure')
        toolchain = failed['toolchain']
        require(toolchain['lean_sha256'] == gate.pilot.LEAN_SHA256
                and toolchain['checker_sha256'] == gate.pilot.CHECKER_SHA256,
                'Original runtime differs')
        expected_failure_command = [toolchain['lean_path'], '-j1', '-M4500', '-DwarningAsError=true',
            '-o', str(REMOTE_BASE / 'complete/lib/lean' / (provider.AGGREGATE.replace('.', '/') + '.olean')),
            provider.AGGREGATE.replace('.', '/') + '.lean']
        require(profile['command'] == expected_failure_command, 'Original failed source command differs')
        require(set(failed['upstream']) == {s['id'] for s in model['primes']},
                'An original provider is missing')
        union, reports, expected_members = {}, {}, set(outer_files)
        for spec in model['primes']:
            key = spec['id']
            prefix = 'upstream/' + key + '/'
            prior = failed['upstream'][key]
            receipt, receipt_sha, evidence = validate_provider_evidence(bundle, prefix, prior)
            expected_members |= {prefix + name for name in set(evidence) | {'receipt.json', 'receipt.sha256'}}
            modules, required, generated, hashes, modes = validate_provider_header(
                receipt, receipt_sha, prior, spec, model, controls, inputs, modern, toolchain)
            require(receipt['external_lean_path'] == failed['external_lean_path'],
                    'Original provider external dependency paths differ')
            for module, h in hashes.items():
                require(bundle.hash(prefix + 'src/' + module.replace('.', '/') + '.lean') == h,
                        'Original provider source differs')
                if module in generated:
                    require(bundle.hash(prefix + 'generated/' + module.replace('.', '/') + '.lean') == h,
                            'Original provider generated source differs')
            for name, h in controls.items():
                require(bundle.hash(prefix + 'controls/' + name) == h, 'Original provider control differs')
            packets = provider.expected_packet_hashes(spec)
            require(receipt['producer_data_sha256'] == packets, 'Original packet inventory differs')
            for name, h in packets.items():
                require(bundle.hash(prefix + name) == h, 'Original numerical packet differs')
            require(bundle.hash(prefix + 'reproduced/initial.json') == spec['initial_packet_sha256'],
                    'Original independent initial reproduction differs')
            # These small copies permit the unchanged profile/audit/stock validators
            # to run locally; all omitted large bytes remain authenticated in the ZIP.
            inspected = inspection / key
            for relative in set(evidence) | {'receipt.json', 'receipt.sha256'}:
                if not relative.startswith(('lib/lean/', 'producer-data/', 'reproduced/')):
                    bundle.copy(prefix + relative, inspected / relative)
            verify_source_inventory(inspected, modules, generated, 'SixSpeedBatchAudit.lean')
            parent = bundle.json(prefix + 'producer-data/initial.json')
            data = bundle.json(prefix + 'producer-data/closed-lifts.json')
            require(receipt['untrusted_closed_lift_summary'] == provider.producer.summary(data),
                    'Original closed trace summary differs')
            generated_text = {m: bundle.read(prefix + 'generated/' + m.replace('.', '/') + '.lean').decode()
                              for m in generated}
            reproduced_text = provider.producer.files(data)
            require(reproduced_text == generated_text, 'Original binary source reproduction differs')
            commands = provider.producer_commands(spec, REMOTE_BASE / key, parent, data, generated_text,
                                                  repository=REMOTE_REPOSITORY, python=REMOTE_PYTHON)
            require(set(receipt['producer_reproductions']) == {label for label, _, _ in commands},
                    'Original producer check inventory differs')
            for label, command, expected in commands:
                check = receipt['producer_reproductions'][label]
                gate.check_profile(inspected, check, command, label)
                require(json.loads((inspected / check['log_relative']).read_bytes())
                        == json.loads(encoded(expected)), 'Original producer summary differs')
            del parent, data, reproduced_text, generated_text
            gc.collect()
            objects = receipt['artifact_sha256']
            check_object_inventory(bundle, prefix, objects, modules, modes)
            gate.validate_checks(inspected, receipt, modules, required, modes, modules)
            validate_stock_inventory(receipt['kernel_replay'],
                (inspected / receipt['kernel_replay']['log_relative']).read_text(), 'Conjectures', modules)
            merge_objects(union, objects)
            artifact = api_artifacts[prior['artifact_name']]
            job = api_jobs['prime ' + str(spec['prime'])]
            reports[key] = {'prime': spec['prime'], 'job_id': job['id'], 'artifact_id': artifact['id'],
                'artifact_sha256': artifact['digest'][len('sha256:'):], 'artifact_bytes': artifact['size_in_bytes'],
                'receipt_sha256': receipt_sha, 'evidence_inventory_sha256': digest(encoded(evidence)),
                'sealed_files': len(evidence), 'modules': len(modules), 'required': len(required),
                'checked_root_indices': receipt['checked_root_indices'],
                'ordered_root_lists': receipt['ordered_root_lists'], 'audit_summary': receipt['axiom_audit']['summary']}
            print(json.dumps({'provider_authenticated': key, 'checked_roots': spec['root_count']}), flush=True)
        dependencies = [m for m in model['project_modules'] if m != provider.AGGREGATE]
        require(set(union) == set(dependencies) and len(union) == 81
                and failed['authenticated_dependency_sha256'] == union,
                'The original object dependency union is not exact')
        check_object_inventory(bundle, '', union, dependencies, modern)
        expected_members |= {'lib/lean/' + m.replace('.', '/') + suffix
                             for m, facets in union.items() for suffix in facets}
        require(bundle.members == expected_members, 'Unexpected original bundle member')
        expected_roots = Counter((s['prime'], i) for s in model['primes'] for i in range(s['root_count']))
        actual_roots = Counter((r['prime'], i) for r in reports.values() for i in r['checked_root_indices'])
        require(actual_roots == expected_roots and sum(actual_roots.values()) == 206,
                'The original providers do not cover every ordered root exactly once')
        for name in sorted(expected_members):
            bundle.hash(name)
        require(len(bundle.hashes) == ARCHIVE_MEMBERS, 'Not every original byte stream was authenticated')
        bundle.copy('receipt.json', inspection / 'failed-assembly-receipt.json')
        bundle.copy(failure_log, inspection / 'failed-assembly-source.log')
        bundle.copy(failure_profile, inspection / 'failed-assembly-source-profile.json')
        report = {'schema': 'tight-seven-original-provider-authentication-v1', 'status': 'passed',
            'original_commit': PROVIDER_COMMIT, 'original_run': PROVIDER_RUN, 'original_attempt': PROVIDER_ATTEMPT,
            'failed_assembly_job': FAILED_JOB, 'archive_id': ARCHIVE_ID, 'archive_sha256': ARCHIVE_SHA256,
            'archive_bytes': ARCHIVE_BYTES, 'archive_members': ARCHIVE_MEMBERS,
            'archive_uncompressed_bytes': ARCHIVE_UNCOMPRESSED_BYTES,
            'failed_receipt_sha256': FAILED_RECEIPT_SHA256, 'providers': reports,
            'authenticated_dependency_sha256': union, 'checked_root_count': 206,
            'original_prime_gates_authenticated': True, 'new_aggregate_verified': False,
            'complete_raw_body_coverage': False, 'additional_raw_family_audit': 'pending',
            'initial_support_coverage_verified': False, 'six_speed_bound_discharged': False,
            'complete_seven_speed_classification': False, 'accepted_registry_changed': False}
        write_json(inspection / 'authentication.json', report)
        write_json(inspection / 'archive-file-inventory.json', bundle.hashes)
        return report
    finally:
        bundle.close()


def provider_reference(report):
    keys = ('original_commit', 'original_run', 'original_attempt', 'failed_assembly_job',
            'archive_id', 'archive_sha256', 'archive_bytes', 'archive_members',
            'archive_uncompressed_bytes', 'failed_receipt_sha256', 'providers',
            'authenticated_dependency_sha256', 'checked_root_count')
    require(report['status'] == 'passed' and report['original_prime_gates_authenticated'] is True
            and report['new_aggregate_verified'] is False and report['complete_raw_body_coverage'] is False,
            'The authoring report is not an authenticated original-provider report')
    return {key: report[key] for key in keys}


def make_model(report):
    old = original_model()
    base = provider.source_hashes(old, [m for m in old['project_modules'] if m != provider.AGGREGATE])
    generated = {AGGREGATE: digest(aggregate_source(old['primes']).encode())}
    return {'schema': SCHEMA, 'proof_scope': SCOPE, 'source_policy': POLICY, 'resources': RESOURCES,
            'provider': provider_reference(report), 'aggregate': AGGREGATE,
            'project_modules': gate.source_order([AGGREGATE], ROOT / 'lean'),
            'base_source_sha256': base, 'generated_source_sha256': generated,
            'required_theorems': aggregate_required(old),
            'control_sha256': {path: sha(ROOT / path) for path in CONTROLS},
            'runtime_sha256': old['runtime_sha256']}


def source_hashes(model):
    return {**model['base_source_sha256'], **model['generated_source_sha256']}


def validate_model(model):
    old = original_model()
    require(model['schema'] == SCHEMA and model['proof_scope'] == SCOPE
            and model['source_policy'] == POLICY and model['resources'] == RESOURCES,
            'Reviewed follow-up scope or resource policy differs')
    require(sha(ROOT / RAW_HELPER) == RAW_HELPER_SHA256,
            'The real-fixture-checked raw occurrence helper differs')
    require(tuple(gate.audit.ALLOWED) == ('propext', 'Classical.choice', 'Quot.sound')
            and model['runtime_sha256'] == old['runtime_sha256'], 'Pinned runtime or axioms differ')
    require(len(CONTROLS) == len(set(CONTROLS)) and set(model['control_sha256']) == set(CONTROLS),
            'Follow-up control inventory differs')
    for path, h in model['control_sha256'].items():
        p = ROOT / path
        require(p.is_file() and not p.is_symlink() and sha(p) == h, 'Frozen follow-up control differs: ' + path)
    base = provider.source_hashes(old, [m for m in old['project_modules'] if m != provider.AGGREGATE])
    require(model['base_source_sha256'] == base and len(base) == 81,
            'Original dependency source union differs')
    rendered = aggregate_source(old['primes'])
    require(model['aggregate'] == AGGREGATE
            and model['generated_source_sha256'] == {AGGREGATE: digest(rendered.encode())}
            and module_path(ROOT / 'lean', AGGREGATE).read_text() == rendered,
            'The repaired aggregate differs from the exact repaired generator')
    modules = gate.source_order([AGGREGATE], ROOT / 'lean')
    require(model['project_modules'] == modules and len(modules) == 82
            and set(modules) == set(base) | {AGGREGATE}
            and provider.AGGREGATE not in modules, 'Repaired aggregate dependency closure differs')
    required = aggregate_required(old)
    require(model['required_theorems'] == required and len(required) == len(set(required)) == 280,
            'Repaired aggregate theorem inventory differs')
    for module, h in source_hashes(model).items():
        p = module_path(ROOT / 'lean', module)
        require(p.is_file() and not p.is_symlink() and sha(p) == h, 'Pinned proof source differs')
    reference = model['provider']
    require(reference['original_commit'] == PROVIDER_COMMIT
            and reference['original_run'] == PROVIDER_RUN and reference['original_attempt'] == PROVIDER_ATTEMPT
            and reference['failed_assembly_job'] == FAILED_JOB and reference['archive_id'] == ARCHIVE_ID
            and reference['archive_sha256'] == ARCHIVE_SHA256 and reference['archive_bytes'] == ARCHIVE_BYTES
            and reference['archive_members'] == ARCHIVE_MEMBERS
            and reference['archive_uncompressed_bytes'] == ARCHIVE_UNCOMPRESSED_BYTES
            and reference['failed_receipt_sha256'] == FAILED_RECEIPT_SHA256
            and reference['checked_root_count'] == 206, 'Original provider container binding differs')
    require(set(reference['providers']) == {s['id'] for s in old['primes']}
            and set(reference['authenticated_dependency_sha256']) == set(base),
            'Original provider receipt or object union differs')
    for spec in old['primes']:
        row = reference['providers'][spec['id']]
        require(row['prime'] == spec['prime'] and row['modules'] == 33
                and row['required'] == len(provider.required_for(spec))
                and row['checked_root_indices'] == list(range(spec['root_count']))
                and row['ordered_root_lists'] == spec['ordered_root_lists'],
                'A frozen original provider omits an ordered root')
    watches = re.findall(r"^      - '([^']+)'$", (ROOT / WORKFLOW).read_text(), re.M)
    expected = set(original_inputs(old)) | set(CONTROLS) | {MODEL,
        'lean/' + AGGREGATE.replace('.', '/') + '.lean'}
    require(len(watches) == len(set(watches)) and set(watches) == expected,
            'The follow-up workflow must watch every exact input')
    return modules


class NoRedirect(urllib.request.HTTPRedirectHandler):
    def redirect_request(self, request, fp, code, message, headers, newurl):
        return None


def api_request(path):
    require(path.startswith('/repos/' + REPOSITORY + '/') and '\\' not in path,
            'Unreviewed GitHub API path')
    token = os.environ.get('GITHUB_TOKEN')
    require(bool(token), 'The read-only artifact token is missing')
    request = urllib.request.Request('https://api.github.com' + path, headers={
        'Accept': 'application/vnd.github+json', 'Authorization': 'Bearer ' + token,
        'X-GitHub-Api-Version': '2022-11-28', 'User-Agent': 'tight-seven-authenticated-join'})
    opener = urllib.request.build_opener(NoRedirect)
    try:
        return opener.open(request, timeout=120)
    except urllib.error.HTTPError as error:
        if error.code in (301, 302, 303, 307, 308):
            return error
        raise RuntimeError('GitHub API request failed with status ' + str(error.code)) from None
    except (urllib.error.URLError, TimeoutError):
        raise RuntimeError('GitHub API request failed before a response') from None


def api_json(path):
    with api_request(path) as response:
        require(response.status == 200, 'Unexpected redirect for GitHub metadata')
        raw = response.read(16 * 1024 * 1024 + 1)
    require(len(raw) <= 16 * 1024 * 1024, 'GitHub metadata exceeded the bound')
    return json.loads(raw)


def download_original(stage):
    artifacts = api_json('/repos/' + REPOSITORY + '/actions/runs/' + str(PROVIDER_RUN)
                         + '/artifacts?per_page=100')
    jobs = api_json('/repos/' + REPOSITORY + '/actions/runs/' + str(PROVIDER_RUN)
                   + '/attempts/' + str(PROVIDER_ATTEMPT) + '/jobs?per_page=100')
    validate_api_metadata(artifacts, jobs, original_model())
    write_json(stage / 'provider-api/artifacts.json', artifacts)
    write_json(stage / 'provider-api/jobs.json', jobs)
    target = stage / 'upstream/original-failed-join.zip'
    target.parent.mkdir(parents=True, exist_ok=True)
    require(not target.exists(), 'Use a fresh original archive destination')
    with api_request('/repos/' + REPOSITORY + '/actions/artifacts/' + str(ARCHIVE_ID) + '/zip') as response:
        require(response.status in (302, 303, 307, 308), 'Artifact API did not return a download redirect')
        location = response.headers.get('Location', '')
    parsed = urllib.parse.urlparse(location)
    hostname = parsed.hostname or ''
    allowed = ('.blob.core.windows.net', '.actions.githubusercontent.com', '.githubusercontent.com',
               '.s3.amazonaws.com')
    require(parsed.scheme == 'https' and parsed.port in (None, 443)
            and parsed.username is None and parsed.password is None
            and any(hostname.endswith(suffix) for suffix in allowed), 'Unexpected artifact redirect host')
    # The new request carries no API authorization and cannot follow another redirect.
    request = urllib.request.Request(location, headers={'User-Agent': 'tight-seven-authenticated-join'})
    h, size = hashlib.sha256(), 0
    try:
        with urllib.request.build_opener(NoRedirect).open(request, timeout=120) as response, target.open('xb') as out:
            require(response.status == 200, 'Artifact download returned an unexpected status')
            while block := response.read(8 * 1024 * 1024):
                size += len(block)
                require(size <= ARCHIVE_BYTES, 'Artifact download exceeded the pinned size')
                h.update(block)
                out.write(block)
    except (urllib.error.HTTPError, urllib.error.URLError, TimeoutError):
        raise RuntimeError('Artifact body download failed') from None
    require(size == ARCHIVE_BYTES and h.hexdigest() == ARCHIVE_SHA256,
            'Downloaded original archive digest or size differs')
    return target, artifacts, jobs


def current_ci():
    require(os.environ.get('GITHUB_ACTIONS') == 'true', 'Hosted verification requires GitHub Actions')
    fields = ('GITHUB_REPOSITORY', 'GITHUB_RUN_ID', 'GITHUB_RUN_ATTEMPT', 'GITHUB_SHA',
              'GITHUB_WORKFLOW', 'GITHUB_WORKFLOW_REF')
    ci = {field: os.environ.get(field, '') for field in fields}
    require(all(ci.values()) and ci['GITHUB_REPOSITORY'] == REPOSITORY
            and ci['GITHUB_RUN_ID'].isdigit() and ci['GITHUB_RUN_ATTEMPT'].isdigit()
            and ci['GITHUB_WORKFLOW_REF'].startswith(REPOSITORY + '/' + WORKFLOW + '@'),
            'Follow-up workflow identity differs')
    return ci


def current_inputs(model, model_digest, commit):
    controls = {**model['control_sha256'], MODEL: model_digest}
    inputs = {**original_inputs(original_model()), **controls,
              'lean/' + AGGREGATE.replace('.', '/') + '.lean': model['generated_source_sha256'][AGGREGATE]}
    for relative, h in inputs.items():
        p = ROOT / relative
        require(p.is_file() and not p.is_symlink() and sha(p) == h, 'Frozen current input differs')
        require(digest(subprocess.check_output(['git', 'show', commit + ':' + relative], cwd=ROOT)) == h,
                'Current input differs from its recorded Git commit')
    return inputs, controls


def audit_source(modules, required, modern):
    import audit_lean_raw_occurrences as raw
    return raw.augment_source(gate.audit.audit_source(modules, required, ['Loneliness.']),
                              modules, modern, flavor='all_owned', legacy_prefixes=['Loneliness.'])


def validate_raw_audit(text, modules, required, modern):
    import audit_lean_raw_occurrences as raw
    spec = {'modules': modules, 'required': required, 'legacy_prefixes': ['Loneliness.']}
    inventory = raw.validate_all_owned_log(text, spec, modern)
    require(all(inventory['declarations'][name]['kind'] == 'theorem' for name in required),
            'A required endpoint is not a theorem')
    graph = inventory['raw_occurrence_graph']
    flags = ('all_serialized_occurrences_audited', 'all_reachable_raw_variants_audited',
             'all_nonidentical_raw_theorems_kernel_checked',
             'all_mixed_family_selected_theorems_kernel_checked', 'foreign_raw_variants_included',
             'axiom_cache_bypassed', 'checked_kernel_negative_control_rejected')
    require(inventory['all_serialized_occurrences_audited'] is True
            and all(graph[flag] is True for flag in flags)
            and type(graph['summary']['trust_level']) is int and graph['summary']['trust_level'] == 0
            and type(graph['summary']['pending']) is int and graph['summary']['pending'] == 0
            and graph['summary']['audit_root_modern'] is False,
            'The complete raw-family audit did not finish at trust zero')
    return inventory


def raw_audit(modules, required, modern, compiler, stage, env, deadline):
    path = stage / 'src/TightSevenClosedLiftJoinAudit.lean'
    path.write_text(audit_source(modules, required, modern))
    command = [str(compiler / 'bin/lean'), '-j1', '-M4500', '-DwarningAsError=true', '-t0', path.name]
    check = gate.run_profile(command, stage, env, 'all-owned-raw-audit',
                             RESOURCES['audit_timeout_seconds'], deadline)
    inventory = validate_raw_audit((stage / check['log_relative']).read_text(), modules, required, modern)
    write_json(stage / 'declaration-inventory.json', inventory)
    check.update({'all_owned_declarations_audited': True, 'complete_raw_body_coverage': True,
                  'audit_source_sha256': sha(path),
                  'declaration_inventory_sha256': sha(stage / 'declaration-inventory.json'),
                  'summary': inventory['summary'], 'raw_summary': inventory['raw_occurrence_graph']['summary']})
    return check


def validate_new_checks(stage, receipt, model):
    modules, required = model['project_modules'], model['required_theorems']
    modern = receipt['modern_modules']
    original_stage = Path(receipt['artifact_root'])
    compiler = receipt['toolchain']['lean_path']
    protocol = receipt['protocol_tests']
    command = [receipt['python_executable'], str(Path(receipt['repository_root']) / TESTS),
               '--inspection-dir', str(original_stage / 'provider-inspection'),
               '--api-dir', str(original_stage / 'provider-api'),
               '--report', str(original_stage / 'protocol-test-results.json')]
    gate.check_profile(stage, protocol, command, 'protocol-tests')
    test_result = json.loads((stage / 'protocol-test-results.json').read_bytes())
    validate_protocol_result(test_result)
    require(test_result == json.loads((stage / protocol['log_relative']).read_bytes())
            and sha(stage / 'protocol-test-results.json') == protocol['report_sha256'],
            'Preserved protocol-test evidence differs')
    require(set(receipt['source_checks']) == {AGGREGATE}, 'Fresh aggregate source inventory differs')
    command = [compiler, '-j1', '-M4500', '-DwarningAsError=true', '-o',
               str(original_stage / 'lib/lean' / (AGGREGATE.replace('.', '/') + '.olean')),
               AGGREGATE.replace('.', '/') + '.lean']
    gate.check_profile(stage, receipt['source_checks'][AGGREGATE], command, AGGREGATE + '.source')
    check = receipt['axiom_audit']
    command = [compiler, '-j1', '-M4500', '-DwarningAsError=true', '-t0', 'TightSevenClosedLiftJoinAudit.lean']
    gate.check_profile(stage, check, command, 'all-owned-raw-audit')
    path = stage / 'src/TightSevenClosedLiftJoinAudit.lean'
    require(path.read_text() == audit_source(modules, required, modern)
            and sha(path) == check['audit_source_sha256'], 'Preserved raw audit source differs')
    inventory = validate_raw_audit((stage / check['log_relative']).read_text(), modules, required, modern)
    require(json.loads((stage / 'declaration-inventory.json').read_bytes()) == inventory
            and sha(stage / 'declaration-inventory.json') == check['declaration_inventory_sha256']
            and check['summary'] == inventory['summary']
            and check['raw_summary'] == inventory['raw_occurrence_graph']['summary']
            and check['all_owned_declarations_audited'] is True
            and check['complete_raw_body_coverage'] is True, 'Preserved raw audit inventory differs')
    check = receipt['kernel_replay']
    command = check['command']
    bare = [receipt['toolchain']['checker_path'], '-v', AGGREGATE]
    require(command == bare or (len(command) == 6 and Path(command[0]).name == 'stdbuf'
            and command[1:3] == ['-oL', '-eL'] and command[3:] == bare), 'Stock checker command differs')
    gate.check_profile(stage, check, command, 'kernel-replay')
    validate_stock_inventory(check, (stage / check['log_relative']).read_text(), AGGREGATE, [AGGREGATE])


def validate_protocol_result(result):
    require(result['schema'] == 'tight-seven-closed-lift-join-protocol-tests-v1'
            and result['status'] == 'passed' and result['lean_verified'] is False,
            'Adversarial protocol tests did not pass')
    checks = result['checks']
    require(len(checks) == len({r['name'] for r in checks}) == 67
            and all(r['passed'] is True and r['expected'] in ('accept', 'reject') for r in checks)
            and sum(r['expected'] == 'accept' for r in checks) == result['positive_checks'] == 9
            and sum(r['expected'] == 'reject' for r in checks) == result['negative_checks'] == 58,
            'Adversarial protocol coverage differs')


def run_join(model, model_digest, stage, runtime_path):
    deadline = time.monotonic() + RESOURCES['controller_timeout_seconds']
    gate.fresh_stage(stage)
    commit, ci = gate.git_commit(), current_ci()
    require(ci['GITHUB_SHA'] == commit, 'Current checkout differs from workflow commit')
    inputs, controls = current_inputs(model, model_digest, commit)
    for relative, h in controls.items():
        target = stage / 'controls' / relative
        target.parent.mkdir(parents=True, exist_ok=True)
        shutil.copyfile(ROOT / relative, target)
        require(sha(target) == h, 'Copied current control differs')
    compiler, external, identity = gate.runtime.resolve_runtime(runtime_path)
    require(identity['lean_sha256'] == gate.pilot.LEAN_SHA256
            and identity['checker_sha256'] == gate.pilot.CHECKER_SHA256, 'Current runtime differs')
    env = gate.environment(compiler, external, stage)
    receipt = {'schema': RECEIPT_SCHEMA, 'status': 'running', 'kind': 'authenticated-follow-up-join',
        'git_commit': commit, 'ci': ci, 'ci_job': os.environ.get('GITHUB_JOB', ''),
        'artifact_root': str(stage), 'repository_root': str(ROOT), 'python_executable': sys.executable,
        'toolchain': identity, 'external_lean_path': external, 'axiom_whitelist': list(gate.audit.ALLOWED),
        'gate_sha256': controls, 'commit_input_sha256': inputs, 'proof_scope': SCOPE,
        'source_policy': POLICY, 'resources': RESOURCES, 'source_checks': {},
        'all_original_prime_providers_authenticated': False, 'all_original_primes_verified': False,
        'new_aggregate_verified': False, 'complete_raw_body_coverage': False,
        'initial_support_coverage_verified': False, 'six_speed_bound_discharged': False,
        'complete_seven_speed_classification': False, 'accepted_registry_changed': False}
    gate.save_receipt(stage, receipt)
    try:
        archive_path, api_artifacts, api_jobs = download_original(stage)
        authentication = authenticate_archive(archive_path, api_artifacts, api_jobs, stage / 'provider-inspection')
        require(provider_reference(authentication) == model['provider'], 'Authenticated original provider reference differs')
        snapshot = gate.file_inventory(stage / 'provider-inspection')
        api_snapshot = gate.file_inventory(stage / 'provider-api')
        receipt.update({'all_original_prime_providers_authenticated': True,
            'provider_authentication_sha256': sha(stage / 'provider-inspection/authentication.json'),
            'provider_inspection_sha256': snapshot, 'provider_api_sha256': api_snapshot,
            'original_archive_sha256': ARCHIVE_SHA256, 'original_failed_receipt_sha256': FAILED_RECEIPT_SHA256,
            'original_provider_reference': model['provider']})
        command = [sys.executable, str(ROOT / TESTS), '--inspection-dir', str(stage / 'provider-inspection'),
                   '--api-dir', str(stage / 'provider-api'), '--report', str(stage / 'protocol-test-results.json')]
        protocol = gate.run_profile(command, stage, env, 'protocol-tests',
                                    RESOURCES['producer_timeout_seconds'], deadline)
        test_result = json.loads((stage / 'protocol-test-results.json').read_bytes())
        validate_protocol_result(test_result)
        require(test_result == json.loads((stage / protocol['log_relative']).read_bytes()),
                'Protocol-test report differs from its output')
        protocol['report_sha256'] = sha(stage / 'protocol-test-results.json')
        receipt['protocol_tests'] = protocol
        modules, required, hashes = model['project_modules'], model['required_theorems'], source_hashes(model)
        generated = {AGGREGATE: aggregate_source(original_model()['primes'])}
        modern = {}
        for module, h in hashes.items():
            target = module_path(stage / 'src', module)
            target.parent.mkdir(parents=True, exist_ok=True)
            shutil.copyfile(module_path(ROOT / 'lean', module), target)
            require(sha(target) == h, 'Staged aggregate dependency source differs')
            modern[module] = next(gate.pilot.header_tokens(target.read_text()), None) == 'module'
        target = module_path(stage / 'generated', AGGREGATE)
        target.parent.mkdir(parents=True, exist_ok=True)
        target.write_text(generated[AGGREGATE])
        require(sha(target) == hashes[AGGREGATE], 'Repaired aggregate reproduction differs')
        require(gate.source_order([AGGREGATE], stage / 'src') == modules, 'Staged aggregate closure differs')
        verify_source_inventory(stage, modules, generated)
        union = authentication['authenticated_dependency_sha256']
        with zipfile.ZipFile(archive_path) as archive:
            for module, facets in union.items():
                for suffix, h in facets.items():
                    relative = 'lib/lean/' + module.replace('.', '/') + suffix
                    target = stage / relative
                    require(not target.exists(), 'A dependency object existed before authenticated import')
                    target.parent.mkdir(parents=True, exist_ok=True)
                    with archive.open(relative) as source, target.open('xb') as out:
                        shutil.copyfileobj(source, out, 8 * 1024 * 1024)
                    require(sha(target) == h, 'Imported original object differs')
        require(gate.object_hashes(stage, list(union), modern) == union,
                'Imported original object union differs')
        receipt.update({'roots': [AGGREGATE], 'project_modules': modules, 'required_theorems': required,
                        'source_sha256': hashes, 'modern_modules': modern,
                        'generated_modules': [AGGREGATE], 'authenticated_dependency_sha256': union})
        gate.save_receipt(stage, receipt)
        receipt['source_checks'][AGGREGATE] = gate.compile_source(AGGREGATE, compiler, stage, env, deadline)
        objects = gate.object_hashes(stage, modules, modern)
        require({m: objects[m] for m in union} == union, 'Aggregate compilation changed original dependency objects')
        receipt['artifact_sha256'] = objects
        gate.save_receipt(stage, receipt)
        receipt['axiom_audit'] = raw_audit(modules, required, modern, compiler, stage, env, deadline)
        require(gate.object_hashes(stage, modules, modern) == objects, 'Raw audit changed project objects')
        gate.save_receipt(stage, receipt)
        require([m for m in modules if m == AGGREGATE or m.startswith(AGGREGATE + '.')] == [AGGREGATE],
                'Aggregate stock prefix is not a singleton')
        receipt['kernel_replay'] = gate.replay(AGGREGATE, [AGGREGATE], compiler, stage, env, deadline)
        gate.recheck_inputs(inputs, controls, model, commit, compiler, stage, hashes,
                            generated, modules, modern, objects)
        verify_source_inventory(stage, modules, generated, 'TightSevenClosedLiftJoinAudit.lean')
        validate_new_checks(stage, receipt, model)
        require(sha(archive_path) == ARCHIVE_SHA256
                and gate.file_inventory(stage / 'provider-inspection') == snapshot
                and gate.file_inventory(stage / 'provider-api') == api_snapshot,
                'Original provider evidence changed during repaired assembly')
        receipt.update({'status': 'passed', 'all_frozen_hashes_unchanged': True,
            'all_original_primes_verified': True, 'new_aggregate_verified': True,
            'complete_ordered_binary_traces_verified': True, 'complete_raw_body_coverage': True,
            'all_reachable_raw_variants_audited': True, 'checked_primes': provider.PRIMES,
            'checked_root_count': 206, 'trace_nodes': 21582,
            'every_dependency_has_fresh_source_and_exact_stock_replay': True,
            'authenticated_exact_dependency_union': True,
            'new_source_modules_checked': [AGGREGATE], 'new_kernel_modules_replayed': [AGGREGATE]})
    except BaseException as error:
        receipt.update({'status': 'failed', 'error': str(error)})
        raise
    finally:
        gate.save_receipt(stage, receipt, seal=receipt['status'] == 'passed')
    print(json.dumps({'status': 'passed', 'modules': 82, 'required_theorems': 280,
        'checked_root_count': 206, 'complete_raw_body_coverage': True,
        'initial_support_coverage_verified': False, 'six_speed_bound_discharged': False,
        'complete_seven_speed_classification': False, 'receipt_sha256': sha(stage / 'receipt.json')}), flush=True)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    actions = parser.add_mutually_exclusive_group(required=True)
    actions.add_argument('--authenticate-existing', type=Path)
    actions.add_argument('--make-model', type=Path, metavar='AUTHENTICATION_JSON')
    actions.add_argument('--preflight', action='store_true')
    actions.add_argument('--verify', action='store_true')
    parser.add_argument('--artifact-metadata', type=Path)
    parser.add_argument('--job-metadata', type=Path)
    parser.add_argument('--inspection-dir', type=Path)
    parser.add_argument('--artifact-dir', type=Path)
    parser.add_argument('--runtime-json', type=Path)
    args = parser.parse_args()
    if args.authenticate_existing:
        require(args.artifact_metadata is not None and args.job_metadata is not None
                and args.inspection_dir is not None, 'Original API metadata and inspection destination are required')
        report = authenticate_archive(args.authenticate_existing.resolve(),
            json.loads(args.artifact_metadata.read_bytes()), json.loads(args.job_metadata.read_bytes()),
            args.inspection_dir.resolve())
        print(json.dumps({'status': 'original_providers_authenticated', 'providers': len(report['providers']),
                          'modules': len(report['authenticated_dependency_sha256']), 'checked_roots': 206,
                          'new_aggregate_verified': False, 'additional_raw_family_audit': 'pending'}), flush=True)
        return
    if args.make_model:
        model = make_model(json.loads(args.make_model.read_bytes()))
        write_json(ROOT / MODEL, model)
        print(json.dumps({'status': 'model_written', 'model_sha256': sha(ROOT / MODEL), 'lean_verified': False}))
        return
    raw = (ROOT / MODEL).read_bytes()
    model, model_digest = json.loads(raw), digest(raw)
    modules = validate_model(model)
    if args.preflight:
        print(json.dumps({'status': 'preflight_passed', 'modules': len(modules),
                          'required_theorems': len(model['required_theorems']), 'original_providers': 17,
                          'ordered_roots': 206, 'new_aggregate_verified': False, 'source_model_sha256': model_digest}))
        return
    stage = (args.artifact_dir or ROOT / '.candidate-artifacts/tight-seven-closed-lift-join').resolve()
    run_join(model, model_digest, stage, args.runtime_json)


if __name__ == '__main__':
    main()
