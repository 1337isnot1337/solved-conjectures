#!/usr/bin/env python3
"""Small adversarial checks for the new counter gate; no Lean is run."""
import copy
import hashlib
import json
import os
from pathlib import Path
import tempfile
import unittest
from unittest.mock import patch

import verify_modular_cover_swar_counts as gate


class CounterGateTests(unittest.TestCase):
    def test_complete_replay_lines_include_every_namespace(self):
        target = 'Conjectures.Counter'
        self.assertEqual(gate.replay_names('replaying ' + target + '\n'), [target])
        for extra in ['Other.Counter', 'Conjectures', target + '.Child', target]:
            self.assertNotEqual(gate.replay_names('replaying ' + target + '\nreplaying ' + extra + '\n'), [target])

    def test_whole_source_tree_rejects_extra_files(self):
        with tempfile.TemporaryDirectory() as directory:
            stage = Path(directory)
            root = stage / 'src'
            (root / 'Conjectures').mkdir(parents=True)
            (root / 'Conjectures/Counter.lean').write_text('')
            gate.source_inventory(stage, ['Conjectures.Counter'])
            for extra in ['Other/X.lean', 'Conjectures.lean', 'unrecorded.txt']:
                p = root / extra
                p.parent.mkdir(parents=True, exist_ok=True)
                p.write_text('')
                with self.assertRaises(RuntimeError):
                    gate.source_inventory(stage, ['Conjectures.Counter'])
                p.unlink()

    def test_whole_source_tree_rejects_links(self):
        with tempfile.TemporaryDirectory() as directory:
            stage = Path(directory)
            (stage / 'src').mkdir()
            (stage / 'real.lean').write_text('')
            (stage / 'src/Counter.lean').symlink_to(stage / 'real.lean')
            with self.assertRaises(RuntimeError):
                gate.source_inventory(stage, ['Counter'])

    def test_object_tree_rejects_extra_namespace(self):
        with tempfile.TemporaryDirectory() as directory:
            stage = Path(directory)
            root = stage / 'lib/lean'
            (root / 'Conjectures').mkdir(parents=True)
            (root / 'Conjectures/Counter.olean').write_bytes(b'fixture')
            gate.checked_objects(stage, ['Conjectures.Counter'], {'Conjectures.Counter': False})
            (root / 'Untracked.olean').write_bytes(b'extra')
            with self.assertRaises(RuntimeError):
                gate.checked_objects(stage, ['Conjectures.Counter'], {'Conjectures.Counter': False})

    def test_integer_graph_keys_use_exact_canonical_bytes(self):
        inventory = {'raw_occurrence_graph': {'nodes': {0: {'name': 'A'}}}}
        payload = gate.encoded(inventory)
        digest = hashlib.sha256(payload).hexdigest()
        gate.inventory_bytes(payload, inventory, digest)
        self.assertNotEqual(json.loads(payload), inventory)
        for altered, expected in [(payload + b'\n', digest), (payload, '0' * 64),
                                  (gate.encoded({'raw_occurrence_graph': {'nodes': {}}}), digest)]:
            with self.assertRaises(RuntimeError):
                gate.inventory_bytes(altered, inventory, expected)

    def inventory(self):
        graph = {key: True for key in ('all_reachable_raw_variants_audited',
            'all_nonidentical_raw_theorems_kernel_checked', 'all_mixed_family_selected_theorems_kernel_checked',
            'foreign_raw_variants_included', 'axiom_cache_bypassed', 'checked_kernel_negative_control_rejected')}
        graph['summary'] = {'trust_level': 0, 'pending': 0, 'audit_root_modern': False}
        return {'all_owned_declarations_audited': True, 'all_serialized_occurrences_audited': True,
            'exact_raw_private_visibility': True, 'raw_occurrence_graph': graph,
            'declarations': {'Example.endpoint': {'kind': 'theorem'}}}

    def validate_inventory(self, inventory):
        with patch.object(gate.raw_audit, 'validate_all_owned_log', return_value=inventory):
            return gate.validate_audit('', {'required': ['Example.endpoint']}, {})

    def test_every_raw_coverage_flag_is_required(self):
        base = self.inventory()
        self.validate_inventory(base)
        for key in ('all_owned_declarations_audited', 'all_serialized_occurrences_audited', 'exact_raw_private_visibility'):
            bad = copy.deepcopy(base)
            bad[key] = False
            with self.assertRaises(RuntimeError):
                self.validate_inventory(bad)
        for key in base['raw_occurrence_graph']:
            if key == 'summary':
                continue
            bad = copy.deepcopy(base)
            bad['raw_occurrence_graph'][key] = False
            with self.assertRaises(RuntimeError):
                self.validate_inventory(bad)

    def test_raw_summary_and_theorem_kind_cannot_be_relaxed(self):
        base = self.inventory()
        for key, value in [('trust_level', 1), ('pending', 1), ('audit_root_modern', True)]:
            bad = copy.deepcopy(base)
            bad['raw_occurrence_graph']['summary'][key] = value
            with self.assertRaises(RuntimeError):
                self.validate_inventory(bad)
        bad = copy.deepcopy(base)
        bad['declarations']['Example.endpoint']['kind'] = 'axiom'
        with self.assertRaises(RuntimeError):
            self.validate_inventory(bad)

    def test_hosted_identity_rejects_wrong_or_missing_fields(self):
        ci = {'GITHUB_ACTIONS': 'true', 'GITHUB_REPOSITORY': '1337isnot1337/solved-conjectures',
              'GITHUB_RUN_ID': '123', 'GITHUB_RUN_ATTEMPT': '1', 'GITHUB_SHA': 'a' * 40,
              'GITHUB_WORKFLOW': 'Lean SWAR counter equivalence', 'GITHUB_JOB': 'verify',
              'GITHUB_WORKFLOW_REF': '1337isnot1337/solved-conjectures/' + gate.WORKFLOW + '@refs/heads/main'}
        with patch.dict(os.environ, ci, clear=True):
            gate.hosted_identity()
        for key, value in [('GITHUB_REPOSITORY', 'other/repo'), ('GITHUB_RUN_ID', ''),
                           ('GITHUB_SHA', 'wrong'), ('GITHUB_WORKFLOW_REF', 'other/path'), ('GITHUB_JOB', '')]:
            with patch.dict(os.environ, {**ci, key: value}, clear=True):
                with self.assertRaises(RuntimeError):
                    gate.hosted_identity()


if __name__ == '__main__':
    unittest.main()
