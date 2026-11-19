"""Controller tests with fake compiler processes; no mathematical verification claims."""
from contextlib import ExitStack, redirect_stdout
import io
import json
from pathlib import Path
import sys
import tempfile
import unittest
from unittest.mock import patch

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "scripts"))
import verify_li_exact as gate


class SourceControllerTest(unittest.TestCase):
    def exercise(self, dependencies, failures=(), corrupt_source=None, corrupt_dependency=None):
        workspace = tempfile.TemporaryDirectory()
        self.addCleanup(workspace.cleanup)
        root = Path(workspace.name)
        modules = list(dependencies)
        for module, imports in dependencies.items():
            path = root / 'lean' / (module.replace('.', '/') + '.lean')
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(''.join('import ' + dep + '\n' for dep in imports)
                            + '-- Source-controller fixture.\n')
        compiler = root / 'toolchain'
        (compiler / 'bin').mkdir(parents=True)
        for name in ['lean', 'leanchecker']:
            (compiler / 'bin' / name).write_text('mock ' + name)
        lean_hash = gate.sha(compiler / 'bin/lean')
        checker_hash = gate.sha(compiler / 'bin/leanchecker')
        toolchain = {'lean_sha256': lean_hash, 'checker_sha256': checker_hash}
        model = {
            'scope': 'controller test', 'roots': modules,
            'source_sha256': {m: gate.sha(root / 'lean' / (m.replace('.', '/') + '.lean'))
                              for m in modules},
            'configuration_sha256': {}, 'helper_sha256': {}, 'legacy_prefixes': [],
            'source_policy': {'fresh_project_objects': True, 'linter_override': False,
                              'warning_as_error': True},
            'contribution': {'note': 'test fixture'},
        }
        calls = []
        stage = root / 'stage'
        original_imports_of = gate.imports_of

        def imports_of(path):
            if path.name == 'Dependent.lean' and corrupt_dependency:
                if corrupt_dependency == 'object':
                    (stage / 'lib/lean/Conjectures/Provider.olean').write_text('replaced object')
                elif corrupt_dependency == 'source':
                    (stage / 'src/Conjectures/Provider.lean').write_text('-- replaced source\n')
                else:
                    raise AssertionError(corrupt_dependency)
            return original_imports_of(path)

        def profile(command, cwd, environment, log, progress, timeout):
            phase = log.name.removesuffix('.log')
            calls.append((phase, command))
            failed = False
            text = ''
            if phase.endswith('.source'):
                module = phase.removesuffix('.source')
                failed = module in failures
                # Even a failed compiler may leave an output. Its descendants must stay blocked.
                output = Path(command[command.index('-o') + 1])
                output.write_text(('failed ' if failed else 'checked ') + module)
                if failed:
                    text = 'fixture compiler failure: ' + module + '\n'
                if module == corrupt_source:
                    (cwd / command[-1]).write_text('-- changed during compilation\n')
            elif phase.endswith('.kernel'):
                text = 'replaying ' + phase.removesuffix('.kernel') + '\n'
            log.write_text(text)
            record = {
                'command': command, 'exit_code': 1 if failed else 0, 'timed_out': False,
                'seconds': 0.01, 'peak_rss_kib': 1, 'log': str(log),
                'log_sha256': gate.sha(log),
            }
            progress.write_bytes(gate.encoded(record))
            return {**record, 'progress': str(progress), 'progress_sha256': gate.sha(progress)}

        inventory = {'declarations': {}, 'summary': {'fixture': True}}
        error = None
        with ExitStack() as stack:
            for name, value in [('ROOT', root), ('OWN_INPUTS', ()), ('LEAN_SHA256', lean_hash),
                                ('CHECKER_SHA256', checker_hash), ('profile', profile),
                                ('imports_of', imports_of)]:
                stack.enter_context(patch.object(gate, name, value))
            stack.enter_context(patch.object(gate.runtime, 'resolve_runtime',
                                              return_value=(compiler, [], toolchain)))
            stack.enter_context(patch.object(gate.subprocess, 'check_output', return_value='fixture-head\n'))
            source_audit = stack.enter_context(patch.object(gate.audit, 'audit_source', return_value='-- fixture audit\n'))
            validate_audit = stack.enter_context(patch.object(gate.audit, 'validate_log', return_value=inventory))
            stack.enter_context(redirect_stdout(io.StringIO()))
            try:
                gate.verify(model, modules, [], {m: False for m in modules}, stage, None)
            except RuntimeError as caught:
                error = str(caught)
            audit_calls = (source_audit.call_count, validate_audit.call_count)
        return json.loads((stage / 'receipt.json').read_text()), calls, error, audit_calls

    def test_failure_blocks_descendants_but_keeps_independent_sources(self):
        dependencies = {
            'Conjectures.Provider': [],
            'Conjectures.Dependent': ['Conjectures.Provider'],
            'Conjectures.Transitive': ['Conjectures.Dependent'],
            'Conjectures.Independent': [],
            'Conjectures.OtherFailure': [],
        }
        receipt, calls, error, audit_calls = self.exercise(
            dependencies, failures=['Conjectures.Provider', 'Conjectures.OtherFailure'])
        self.assertEqual([phase for phase, _ in calls], [
            'Conjectures.Provider.source', 'Conjectures.Independent.source',
            'Conjectures.OtherFailure.source'])
        self.assertEqual(set(receipt['source_failures']),
                         {'Conjectures.Provider', 'Conjectures.OtherFailure'})
        self.assertEqual(receipt['blocked_sources']['Conjectures.Dependent']['blocked_by'],
                         ['Conjectures.Provider'])
        self.assertEqual(receipt['blocked_sources']['Conjectures.Transitive']['blocked_by'],
                         ['Conjectures.Dependent'])
        self.assertEqual(receipt['source_checks']['Conjectures.Independent']['exit_code'], 0)
        self.assertEqual(receipt['status'], 'failed')
        self.assertIn('Conjectures.OtherFailure', error)
        self.assertEqual(audit_calls, (0, 0))
        self.assertNotIn('literal_statements', receipt)
        self.assertEqual(receipt['kernel_checks'], {})

    def test_all_pass_retains_full_literal_audit_and_exact_replay_order(self):
        dependencies = {
            'Conjectures.Provider': [],
            'Conjectures.Dependent': ['Conjectures.Provider'],
            'Conjectures.Independent': [],
        }
        receipt, calls, error, audit_calls = self.exercise(dependencies)
        modules = list(dependencies)
        self.assertIsNone(error)
        self.assertEqual([phase for phase, _ in calls],
                         [m + '.source' for m in modules]
                         + ['literal-statements', 'all-owned-audit']
                         + [m + '.kernel' for m in modules])
        for phase, command in calls:
            if not phase.endswith('.kernel'):
                self.assertEqual(command[1:4], ['-j1', '-M4500', '-DwarningAsError=true'])
        self.assertEqual(receipt['source_failures'], {})
        self.assertEqual(receipt['blocked_sources'], {})
        self.assertEqual(receipt['status'], 'passed')
        self.assertEqual(audit_calls, (1, 1))
        self.assertTrue(receipt['all_frozen_hashes_unchanged'])
        self.assertEqual(receipt['kernel_replay']['replayed_modules'], modules)
        provider = receipt['source_checks']['Conjectures.Provider']
        dependent = receipt['source_checks']['Conjectures.Dependent']
        self.assertEqual(dependent['direct_project_imports']['Conjectures.Provider'], {
            'source_sha256': provider['source_sha256'],
            'artifact_sha256': provider['artifact_sha256'],
        })

    def test_source_integrity_failure_still_stops_immediately(self):
        receipt, calls, error, audit_calls = self.exercise({
            'Conjectures.Provider': [], 'Conjectures.Independent': [],
        }, corrupt_source='Conjectures.Provider')
        self.assertEqual([phase for phase, _ in calls], ['Conjectures.Provider.source'])
        self.assertIn('Proof source changed during compilation', error)
        self.assertEqual(receipt['status'], 'failed')
        self.assertEqual(audit_calls, (0, 0))
        self.assertEqual(receipt['kernel_checks'], {})

    def test_dependency_replacement_stops_before_the_importer(self):
        for kind in ['object', 'source']:
            with self.subTest(replaced=kind):
                receipt, calls, error, audit_calls = self.exercise({
                    'Conjectures.Provider': [],
                    'Conjectures.Dependent': ['Conjectures.Provider'],
                    'Conjectures.Independent': [],
                }, corrupt_dependency=kind)
                self.assertEqual([phase for phase, _ in calls], ['Conjectures.Provider.source'])
                self.assertIn('Imported project ' + kind + ' changed before compilation', error)
                self.assertEqual(receipt['status'], 'failed')
                self.assertNotIn('Conjectures.Dependent', receipt['source_checks'])
                self.assertEqual(audit_calls, (0, 0))
                self.assertEqual(receipt['kernel_checks'], {})


if __name__ == '__main__':
    unittest.main()
