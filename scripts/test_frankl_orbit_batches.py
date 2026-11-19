"""Regression checks for bounded selection and complete arithmetic partition."""

from collections import Counter
import gzip
import json
from pathlib import Path
import tempfile
import unittest

import verify_frankl_orbit_batches as gate


class OrbitBatchGateTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.producer = gate.load_producer()
        cls.packet = cls.producer.load_packet()
        cls.manifest = gate.validate_layout()

    def test_complete_unique_period_partition(self):
        pending = {r['id']: r for r in self.packet['representatives'] if not r['pilot']}
        lookup = self.manifest['lookup']
        self.assertEqual(len(lookup), 9406)
        self.assertEqual([x[0] for x in lookup], sorted(pending))
        self.assertEqual(Counter(x[1] for x in lookup), {7: 3288, 8: 3421, 9: 2697})
        for representative, period, block_id, local_index in lookup:
            block = self.manifest['blocks'][block_id]
            self.assertEqual(block['period'], period)
            self.assertEqual(block['representative_ids'][local_index], representative)
            self.assertEqual(block['source_rows'][local_index], pending[representative]['source_row'])
            self.assertLessEqual(block['rows'], 128)

    def test_bounded_group_partition(self):
        groups = self.manifest['groups']
        self.assertEqual(len(groups), 19)
        self.assertEqual([i for g in groups for i in g['block_ids']], list(range(75)))
        self.assertTrue(all(1 <= len(g['block_ids']) <= 4 for g in groups))
        self.assertEqual(sum(g['rows'] for g in groups), 9406)
        self.assertEqual(sum(g['private_chunks'] for g in groups), 4704)
        first = groups[0]
        self.assertEqual((first['id'], first['rows'], first['private_chunks']), ('g00', 512, 256))
        self.assertTrue(all(self.manifest['blocks'][i]['period'] == 7 for i in first['block_ids']))

    def test_leaf_change_selects_only_its_group(self):
        block = self.manifest['blocks'][6]
        for key in ('module', 'data_module'):
            changed = {'lean/' + block[key].replace('.', '/') + '.lean'}
            self.assertEqual(gate.ci_plan(changed, self.manifest)['groups'], ['g01'])

    def test_shared_dependency_and_gate_changes_select_all(self):
        expected = [g['id'] for g in self.manifest['groups']]
        for path in ('lean/Conjectures/FranklFCBitCode.lean',
                     'lean/Conjectures/FranklLocalMaskCached.lean',
                     'scripts/test_frankl_orbit_batches.py'):
            self.assertEqual(gate.ci_plan({path}, self.manifest)['groups'], expected)

    def test_unrelated_matching_change_selects_no_group(self):
        changed = {'lean/Conjectures/FranklVaughanMatching.lean'}
        self.assertEqual(gate.ci_plan(changed, self.manifest)['groups'], [])

    def test_manual_subset_and_invalid_group(self):
        self.assertEqual(gate.ci_plan(None, self.manifest, 'g00,g18')['groups'], ['g00', 'g18'])
        with self.assertRaises(ValueError):
            gate.ci_plan(None, self.manifest, 'g99')

    def test_every_block_endpoint_and_private_chunk_is_required(self):
        group, modules, required, private = gate.group_spec(self.manifest, 'g00')
        self.assertEqual(len(modules), 30)
        self.assertEqual(len(private), 256)
        for block_id in group['block_ids']:
            block = self.manifest['blocks'][block_id]
            self.assertTrue(set(block['required_endpoints']) <= set(required))
            self.assertTrue(set(block['private_endpoints']) <= set(private))
        audit = gate.audit_source(modules, required, private)
        self.assertTrue(all('import all ' + module in audit for module in modules))
        self.assertTrue(all('`' + name in audit for name in private))

    def test_packet_tampering_is_rejected(self):
        with tempfile.TemporaryDirectory() as directory:
            path = Path(directory) / 'orbits.json.gz'
            packet = dict(self.packet)
            packet['schema'] = 'changed'
            path.write_bytes(gzip.compress(json.dumps(packet).encode(), mtime=0))
            with self.assertRaisesRegex(ValueError, 'checksum mismatch'):
                self.producer.load_packet(path)

    def test_renderer_accepts_separate_packet_provenance(self):
        record = next(r for r in self.packet['representatives'] if not r['pilot'])
        files, block = self.producer.emit_block(10, 0, 0, [record], packet_sha256='other-packet')
        data = files['FranklSmallCyclicOrbit10Block000Data.lean'].decode()
        self.assertIn('Orbit packet SHA256: other-packet', data)
        self.assertEqual(block['period'], 10)
        self.assertEqual(block['rows'], 1)


if __name__ == '__main__':
    unittest.main()
