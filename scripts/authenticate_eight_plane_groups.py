"""Authenticate same-run component evidence before finite theorem assembly.

This module does not run Lean. It verifies records from the component jobs and
preserves them unchanged. The caller compiles the new assembly, audits its full
environment, and replays its new module with the stock kernel checker.
"""
from __future__ import annotations

import hashlib
import json
import os
from pathlib import Path, PurePosixPath
import re
import shutil

import audit_lean_all_owned as audit


def require(condition, message):
    if not condition:
        raise RuntimeError(message)


def sha(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()


def authenticated_groups(gate, packet, evidence, stage, modules, controls, head):
    """Return checked source/target records and copy verified project objects."""
    groups = [name for name in gate.ROOTS if name != 'assembly']
    expected_dirs = {'eight-plane-data-' + name for name in groups}
    require(evidence.is_dir() and not evidence.is_symlink(), 'Missing group artifacts')
    require({p.name for p in evidence.iterdir()} == expected_dirs,
            'Downloaded group artifact inventory differs')
    run_id = os.environ.get('GITHUB_RUN_ID')
    repository = os.environ.get('GITHUB_REPOSITORY')
    require(run_id and repository == '1337isnot1337/solved-conjectures',
            'Distributed acceptance requires the originating GitHub Actions run')
    require(os.environ.get('GITHUB_SHA') == head, 'Actions head differs from checkout')
    expected_imports = set(modules) - set(gate.ROOTS['assembly'])
    source_checks, kernel_checks, object_hashes, origins, summaries = {}, {}, {}, {}, {}
    for task in groups:
        original = evidence / ('eight-plane-data-' + task)
        require(original.is_dir() and not original.is_symlink(), 'Unsafe group directory')
        require(all(not p.is_symlink() for p in original.rglob('*')),
                'Group evidence contains a symlink')
        copied = stage / 'group-evidence' / original.name
        shutil.copytree(original, copied)
        receipt_bytes = (copied / 'receipt.json').read_bytes()
        receipt = json.loads(receipt_bytes)
        model = packet['tasks'][task]
        group_modules, required, modern = gate.preflight(model, task)
        require(receipt['schema'] == 'eight-plane-data-exact-receipt-v1'
                and receipt['status'] == 'passed', 'Group did not pass: ' + task)
        require(receipt['execution_mode'] == 'fresh-exact-component'
                and receipt['task'] == task, 'Unexpected component execution mode')
        require(receipt['github_repository'] == repository
                and receipt['github_run_id'] == run_id
                and receipt['git_commit'] == head, 'Artifact origin differs: ' + task)
        require(receipt['all_frozen_hashes_unchanged'] is True
                and receipt['stated_component_scope_checked'] is True
                and receipt['universal_classification_claimed'] is False
                and receipt['finite_candidate_pair_coverage_checked'] is False
                and receipt['mathematical_plane_gap_claimed'] is False
                and receipt['accepted_registry_changed'] is False,
                'Unexpected component acceptance claims')
        require(receipt['source_workers'] == receipt['kernel_threads'] == 1,
                'Unexpected process concurrency')
        require(receipt['axiom_whitelist'] == list(audit.ALLOWED), 'Axiom policy differs')
        require(receipt['project_modules'] == group_modules
                and receipt['modern_modules'] == modern, 'Component closure differs')
        require(receipt['gate_sha256'] == controls, 'Component controls differ')
        for key in ('roots', 'scope', 'source_sha256', 'required_theorems', 'source_policy'):
            require(receipt[key] == model[key], 'Component model field differs: ' + key)
        toolchain = receipt['toolchain']
        require(toolchain['lean_sha256'] == gate.LEAN_SHA256
                and toolchain['checker_sha256'] == gate.CHECKER_SHA256,
                'Component binary hashes differ')
        lean, checker = toolchain['lean_path'], toolchain['checker_path']
        require(set(receipt['source_checks']) == set(receipt['kernel_checks'])
                == set(receipt['artifact_sha256']) == set(group_modules),
                'Incomplete component process or object inventory')
        require(gate.objects(copied, group_modules, modern) == receipt['artifact_sha256'],
                'Component object hashes differ')
        physical_facets = {str(p.relative_to(copied / 'lib/lean'))
                           for p in (copied / 'lib/lean').rglob('*') if p.is_file()}
        recorded_facets = {module.replace('.', '/') + suffix
                           for module, facets in receipt['artifact_sha256'].items()
                           for suffix in facets}
        require(physical_facets == recorded_facets, 'Unrecorded component object facet')

        def process(check, expected_name):
            require(check['exit_code'] == 0 and check['timed_out'] is False,
                    'Unsuccessful recorded process')
            require(PurePosixPath(check['log']).name == expected_name,
                    'Unexpected process log path')
            log = copied / 'logs' / expected_name
            require(sha(log) == check['log_sha256'], 'Process log hash differs')
            progress = json.loads((copied / 'progress' / (expected_name[:-4] + '.json')).read_bytes())
            require(all(check.get(k) == v for k, v in progress.items()),
                    'Original process and progress records differ')
            return {**check, 'log': str(log), 'original_log': check['log'],
                    'evidence_group': task}

        for module in group_modules:
            require(module in expected_imports, 'Unexpected imported project module')
            stem = module.replace('.', '/')
            raw = (copied / 'src' / (stem + '.lean')).read_bytes()
            require(hashlib.sha256(raw).hexdigest() == model['source_sha256'][module]
                    and raw == gate.source(module).read_bytes(), 'Component source differs')
            source_check = receipt['source_checks'][module]
            command = source_check['command']
            require(len(command) == 7
                    and command[:5] == [lean, '-j1', '-M4500', '-DwarningAsError=true', '-o']
                    and command[5].endswith('/lib/lean/' + stem + '.olean')
                    and command[6] == stem + '.lean', 'Strict source command differs')
            source_record = process(source_check, module + '.source.log')
            kernel_check = receipt['kernel_checks'][module]
            command = kernel_check['command']
            if len(command) == 6 and PurePosixPath(command[0]).name == 'stdbuf':
                require(command[1:3] == ['-oL', '-eL'], 'Unexpected buffering flags')
                command = command[3:]
            require(command == [checker, '-v', module], 'Stock replay command differs')
            kernel_record = process(kernel_check, module + '.kernel.log')
            actual = re.findall(r'^replaying (Conjectures\.[A-Za-z0-9_.]+)$',
                                Path(kernel_record['log']).read_text(), re.M)
            require(actual == [module] and kernel_check['replayed_modules'] == [module]
                    and kernel_check['exact_singleton_target'] is True,
                    'Stock replay target differs')
            facets = receipt['artifact_sha256'][module]
            if module in object_hashes:
                require(object_hashes[module] == facets,
                        'Shared dependency object bytes differ: ' + module)
            else:
                object_hashes[module] = facets
                source_checks[module], kernel_checks[module] = source_record, kernel_record
                origins[module] = task
                target_source = stage / 'src' / (stem + '.lean')
                target_source.parent.mkdir(parents=True, exist_ok=True)
                target_source.write_bytes(raw)
                for suffix, digest in facets.items():
                    target = stage / 'lib/lean' / (stem + suffix)
                    target.parent.mkdir(parents=True, exist_ok=True)
                    shutil.copy2(copied / 'lib/lean' / (stem + suffix), target)
                    require(sha(target) == digest, 'Copied proof object differs')
        replay = receipt['kernel_replay']
        require(replay['replayed_modules'] == group_modules
                and replay['exact_project_closure'] is True
                and replay['all_modules_replayed_as_targets'] is True
                and replay['fresh_process_per_module'] is True,
                'Incomplete component replay coverage')
        audit_check = receipt['axiom_audit']
        require(audit_check['command'] == [lean, '-j1', '-M4500', '-DwarningAsError=true',
                                           'EightPlaneDataAudit.lean'], 'Audit command differs')
        require(audit_check['all_owned_declarations_audited'] is True
                and audit_check['exact_raw_private_visibility'] is True
                and audit_check['explicit_import_all'] is True, 'Incomplete ownership audit')
        process(audit_check, 'all-owned-audit.log')
        audit_raw = audit.audit_source(group_modules, required, model['legacy_prefixes']).encode()
        require((copied / 'src/EightPlaneDataAudit.lean').read_bytes() == audit_raw
                and hashlib.sha256(audit_raw).hexdigest() == audit_check['audit_source_sha256'],
                'Reconstructed original audit differs')
        spec = {'modules': group_modules, 'required': required,
                'legacy_prefixes': model['legacy_prefixes']}
        inventory = audit.validate_log((copied / 'logs/all-owned-audit.log').read_text(), spec, modern)
        require(inventory == json.loads((copied / 'declaration-inventory.json').read_bytes())
                and inventory['summary'] == audit_check['summary']
                and sha(copied / 'declaration-inventory.json')
                == audit_check['declaration_inventory_sha256'], 'Declaration audit differs')
        require(all(inventory['declarations'][name]['kind'] == 'theorem' for name in required),
                'A component endpoint is not a theorem')
        require((original / 'receipt.json').read_bytes() == receipt_bytes,
                'Original receipt changed during authentication')
        summaries[task] = {'receipt_sha256': hashlib.sha256(receipt_bytes).hexdigest(),
                           'relative_path': str(copied.relative_to(stage)),
                           'modules': group_modules, 'audit_summary': inventory['summary']}
    require(set(source_checks) == set(kernel_checks) == set(object_hashes) == expected_imports,
            'Distributed evidence does not cover the complete imported closure')
    return source_checks, kernel_checks, origins, summaries
