#!/usr/bin/env python3
"""Prepare, audit, or stock-kernel-replay the exact Grochenig source closure.

The default `prepare` mode never starts Lean. All twenty local modules are
owned by this gate: fourteen Grochenig result modules and six reused KVZ
kernel modules. Separate strict source builds remain a prerequisite.
No source, shared registry, documentation, or verification helper is edited.
"""
from __future__ import annotations

import argparse
import ast
import datetime
import hashlib
import json
import os
from pathlib import Path
import re
import shutil
import subprocess
import sys
import time

SCRATCH = Path('/workspace/scratch/17b12d3ee06e')
REPO = SCRATCH / 'solved-conjectures'
LEAN_DIR = REPO / 'lean'
BUILD = LEAN_DIR / '.lake/build/lib/lean'
TOOLCHAIN = SCRATCH / 'toolchains/lean-4.35.0-linux'
ROOT = 'Conjectures.Grochenig'
PREFIX = 'grochenig-complete-'
AUDIT_SOURCE = SCRATCH / 'GrochenigCompleteOwnedAudit.lean'
OBJECT_SUFFIXES = ('.olean', '.olean.private', '.olean.server')
EXPECTED_PIN = 'leanprover/lean4:v4.35.0'
EXPECTED_MATHLIB = '56a005855ea17e0b0958f73ec801ae140b0a1679'
GRAPH_ENDPOINTS = SCRATCH / 'grochenig-owned-required-endpoints.json'
KVZ_INVENTORY_SOURCE = SCRATCH / 'run_kvz_gate.py'

sys.path.insert(0, str(REPO / 'scripts'))
import audit_lean_owned_extension as owned
from plan_accepted_lean import imports_of
from replay_lean import header_tokens, local_closure

RESULT_SUFFIXES = (
    '', 'Blocks', 'BlocksAlgebra', 'Density', 'DensityDefinitions',
    'DensityLocalFiniteness', 'Gaussian', 'GaussianBasic', 'Separation',
    'Series', 'SeriesAnalytic', 'SeriesCoefficients', 'SignPreservation', 'Witness',
)
DEPENDENCY_SUFFIXES = (
    'Density', 'DensityBasic', 'PowerAlgebra', 'Wronskian',
    'WronskianDeterminants', 'WronskianJets',
)
RESULT_MODULES = tuple('Conjectures.Grochenig' + suffix for suffix in RESULT_SUFFIXES)
DEPENDENCY_MODULES = tuple('Conjectures.KVZGamma' + suffix for suffix in DEPENDENCY_SUFFIXES)
MODULES = tuple(sorted((*RESULT_MODULES, *DEPENDENCY_MODULES)))

RESULT_ENDPOINTS = {
    'BlocksAlgebra': [
        'coeff_prod_X_sub_C_signed_pos', 'signed_product_range_pos',
        'adjacent_mul_neg_of_signed_pos',
    ],
    'Blocks': [
        'blockPolynomial_eq', 'rawBlockCoeff_eq', 'blockMass_eq', 'blockCoeff_eq',
        'block_eq', 'testPoint_eq', 'blockMargin_eq', 'blockPolynomial_natDegree',
        'blockPolynomial_coeff_signed_pos', 'rawBlockCoeff_signed_pos', 'blockMass_pos',
        'blockCoeff_signed_pos', 'blockCoeff_ne_zero', 'blockCoeff_mul_succ_neg',
        'blockCoeff_eq_zero_of_lt', 'sum_abs_blockCoeff', 'weighted_gaussian_translate',
        'block_factorization', 'blockPolynomial_test_signed_pos', 'block_test_signed_pos',
        'block_test_ne_zero', 'block_test_mul_succ_neg', 'blockMargin_pos',
        'blockMargin_le_test', 'block_bound', 'block_continuous',
        'block_tendsto_atTop', 'block_tendsto_atBot',
    ],
    'SeriesCoefficients': [
        'slotPosition_eq', 'coefficient_eq', 'coefficient_at_slot', 'coefficient_off_range',
        'coefficient_even_support', 'geometric_block_mass_hasSum', 'sigma_block_abs_hasSum',
        'hasSum_abs_coefficient', 'coefficient_abs_summable', 'sum_abs_coefficient',
        'coefficient_summable', 'abs_coefficient_le_one', 'coefficient_bounded',
    ],
    'SeriesAnalytic': [
        'gaussian_shift_summable', 'gaussian_shift_tsum_bound',
        'gaussian_complex_shift_summable', 'differentiable_gaussian_shift_tsum',
        'gaussian_shift_tsum_ofReal', 'continuous_gaussian_shift_tsum',
    ],
    'Series': [
        'seriesValue_eq', 'entireValue_eq', 'seriesValue_hasSum', 'entireValue_hasSum',
        'block_eq_slot_sum', 'grouped_blocks_hasSum', 'grouped_blocks_summable',
        'seriesValue_eq_grouped_blocks', 'seriesValue_eq_prefix_add_block_add_tail',
        'seriesValue_abs_le_one', 'continuous_seriesValue', 'differentiable_entireValue',
        'entireValue_ofReal', 'isBoundedShiftSum_seriesValue', 'inVInfinity_seriesValue',
    ],
    'SignPreservation': [
        'later_series_bound', 'series_error_lt', 'mul_pos_of_abs_sub_lt',
        'exists_zero_between', 'ordered_zero_witnesses',
    ],
    'Witness': [
        'constructed_slot_injective', 'constructed_test_error', 'constructed_test_same_sign',
        'constructed_test_adjacent_neg', 'constructed_nonzero', 'constructed_zero_window',
        'constructed_zero_density', 'coefficient_center_slot', 'coefficient_center_odd_zero',
        'coefficient_slot_sign_change', 'constructed_coefficient_density',
    ],
    '': [
        'constructed_zeros_locallyFinite', 'constructed_density_violation',
        'upper_density_counterexample', 'source_upper_density_disproof',
    ],
}

REPO_CONTROLS = (
    'lean/lean-toolchain', 'lean/lakefile.toml', 'lean/lake-manifest.json',
    'scripts/audit_lean_owned_extension.py', 'scripts/replay_lean.py',
    'scripts/plan_accepted_lean.py',
)


def output_path(label):
    return SCRATCH / (PREFIX + label)


def utc_now():
    return datetime.datetime.now(datetime.timezone.utc).isoformat()


def digest(path):
    h = hashlib.sha256()
    before = path.stat()
    with path.open('rb') as stream:
        for chunk in iter(lambda: stream.read(1024 * 1024), b''):
            h.update(chunk)
    after = path.stat()
    if (before.st_size, before.st_mtime_ns, before.st_ino) != (
            after.st_size, after.st_mtime_ns, after.st_ino):
        raise RuntimeError(f'File changed while hashing: {path}')
    return h.hexdigest()


def write_json(path, value):
    path.write_text(json.dumps(value, indent=2) + '\n', encoding='utf-8')


def source_path(module):
    return LEAN_DIR / (module.replace('.', '/') + '.lean')


def object_paths(module):
    stem = str(BUILD / module.replace('.', '/'))
    return [Path(stem + suffix) for suffix in OBJECT_SUFFIXES]


def requirements():
    # Read the existing KVZ endpoint inventory as data; importing its runner
    # would execute its command-line gate, so only the literal assignment is read.
    tree = ast.parse(KVZ_INVENTORY_SOURCE.read_text(encoding='utf-8'))
    values = [ast.literal_eval(node.value) for node in tree.body
              if isinstance(node, ast.Assign)
              and any(isinstance(target, ast.Name) and target.id == 'names'
                      for target in node.targets)]
    if len(values) != 1:
        raise ValueError('Expected exactly one literal KVZ endpoint inventory')
    kvz_names = values[0]
    result = {
        'Conjectures.KVZGamma' + suffix: ['KVZGamma.' + name for name in kvz_names[suffix]]
        for suffix in DEPENDENCY_SUFFIXES
    }
    graph = json.loads(GRAPH_ENDPOINTS.read_text(encoding='utf-8'))
    expected_graph = {'Conjectures.Grochenig' + suffix for suffix in (
        'GaussianBasic', 'DensityDefinitions', 'DensityLocalFiniteness',
        'Density', 'Gaussian', 'Separation')}
    if set(graph) != expected_graph:
        raise ValueError('The graph-lane endpoint module inventory changed')
    result.update(graph)
    result.update({'Conjectures.Grochenig' + suffix: ['Grochenig.' + name for name in names]
                   for suffix, names in RESULT_ENDPOINTS.items()})
    owned.obligations(MODULES, MODULES, result)
    return {module: result[module] for module in MODULES}


def source_graph():
    closure = local_closure(LEAN_DIR, {ROOT})
    if closure != set(MODULES):
        raise ValueError(f'Exact closure mismatch: missing={sorted(set(MODULES) - closure)}, '
                         f'extra={sorted(closure - set(MODULES))}')
    graph = {}
    for module in MODULES:
        source = source_path(module)
        if next(header_tokens(source.read_text(encoding='utf-8')), None) != 'module':
            raise ValueError(f'Expected modern module mode: {module}')
        # Use the unchanged strict source-aware header parser as well as the
        # stock replay helper's source-derived closure.
        graph[module] = [name for name in imports_of(source) if name in closure]
    return graph


def topological_order(graph):
    complete, active, order = set(), set(), []

    def visit(module):
        if module in active:
            raise ValueError(f'Project import cycle at {module}')
        if module in complete:
            return
        active.add(module)
        for imported in graph[module]:
            visit(imported)
        active.remove(module)
        complete.add(module)
        order.append(module)

    visit(ROOT)
    if complete != set(MODULES):
        raise ValueError('Topological inventory omits an owned module')
    return order


def pins():
    pin = (LEAN_DIR / 'lean-toolchain').read_text().strip()
    manifest = json.loads((LEAN_DIR / 'lake-manifest.json').read_text())
    mathlib = [p for p in manifest['packages'] if p['name'] == 'mathlib']
    if pin != EXPECTED_PIN or len(mathlib) != 1 or mathlib[0]['rev'] != EXPECTED_MATHLIB:
        raise ValueError('The pinned toolchain or Mathlib revision changed')
    return {'lean_toolchain': pin, 'mathlib_revision': mathlib[0]['rev']}


def registered_modules():
    text = (REPO / 'scripts/verify_lean.sh').read_text(encoding='utf-8')
    matches = re.findall(r'^modules=\(\n([\s\S]*?)^\)$', text, re.MULTILINE)
    if len(matches) != 1:
        raise ValueError('Expected one explicit accepted module registry')
    modules = matches[0].split()
    if len(modules) != len(set(modules)):
        raise ValueError('Duplicate accepted module registry entry')
    return set(modules)


def prepare():
    required = requirements()
    graph = source_graph()
    current_registered = sorted(set(MODULES) & registered_modules())
    objects = {module: [{'path': str(path.relative_to(REPO)), 'exists': path.is_file(),
                         'sha256': digest(path) if path.is_file() else None}
                        for path in object_paths(module)] for module in MODULES}
    inventory = {
        'status': 'prepared only; no proof acceptance or gate execution claimed',
        'prepared_utc': utc_now(), 'root': ROOT, 'pins': pins(),
        'imported_modules': list(MODULES), 'owned_modules': list(MODULES),
        'new_result_modules': list(RESULT_MODULES),
        'reused_dependency_modules': list(DEPENDENCY_MODULES),
        'imported_module_count': len(MODULES), 'owned_module_count': len(MODULES),
        'new_result_module_count': len(RESULT_MODULES),
        'reused_dependency_module_count': len(DEPENDENCY_MODULES),
        'all_project_dependencies_audited_as_owned': True,
        'registered_modules_at_prepare': current_registered,
        'all_twenty_unregistered_at_prepare': not current_registered,
        'source_parser': 'unchanged plan_accepted_lean.imports_of',
        'closure_parser': 'unchanged replay_lean.local_closure',
        'local_import_graph': graph, 'topological_order': topological_order(graph),
        'source_sha256': {module: digest(source_path(module)) for module in MODULES},
        'object_snapshot': objects,
        'all_object_parts_present': all(row['exists'] for rows in objects.values() for row in rows),
        'required_by_module': required,
        'required_endpoint_count': sum(map(len, required.values())),
        'dependency_required_endpoints_origin': {
            'path': str(KVZ_INVENTORY_SOURCE), 'sha256': digest(KVZ_INVENTORY_SOURCE),
            'method': 'ast.literal_eval of the existing names assignment; selected six modules',
        },
        'graph_required_endpoints_origin': {
            'path': str(GRAPH_ENDPOINTS), 'sha256': digest(GRAPH_ENDPOINTS),
        },
        'strict_source_gate': 'separate prerequisite; not run by this preparation/audit/replay runner',
        'audit_command': ['lean', '-j1', '-M2200', '-DwarningAsError=true', str(AUDIT_SOURCE)],
        'kernel_command': ['python3', '../scripts/replay_lean.py', '--root', ROOT],
        'accepted_registry_changed': False,
    }
    write_json(output_path('obligations.json'), required)
    AUDIT_SOURCE.write_text(owned.audit_source(MODULES, MODULES, required), encoding='utf-8')
    write_json(output_path('inventory.json'), inventory)
    return inventory


def repo_frozen_paths():
    return ([source_path(module) for module in MODULES]
            + [path for module in MODULES for path in object_paths(module)]
            + [REPO / path for path in REPO_CONTROLS])


def additional_controls():
    return [Path(__file__).resolve(), output_path('obligations.json'),
            output_path('inventory.json'), AUDIT_SOURCE,
            TOOLCHAIN / 'bin/lean', TOOLCHAIN / 'bin/leanchecker',
            TOOLCHAIN / 'lib/lean/libleanshared.so', GRAPH_ENDPOINTS, KVZ_INVENTORY_SOURCE]


def freeze():
    inventory = json.loads(output_path('inventory.json').read_text())
    required = requirements()
    if (inventory['required_by_module'] != required
            or json.loads(output_path('obligations.json').read_text()) != required
            or AUDIT_SOURCE.read_text() != owned.audit_source(MODULES, MODULES, required)):
        raise ValueError('Generated audit inventory changed after preparation')
    if inventory['source_sha256'] != {module: digest(source_path(module)) for module in MODULES}:
        raise ValueError('A source changed after preparation and before freezing')
    for module, rows in inventory['object_snapshot'].items():
        for row, path in zip(rows, object_paths(module)):
            if not row['exists'] or not path.is_file() or row['sha256'] != digest(path):
                raise ValueError(f'Object missing or changed after preparation: {path}')
    paths = repo_frozen_paths()
    missing = [str(path) for path in (*paths, *additional_controls()) if not path.is_file()]
    if missing:
        raise ValueError('Cannot run the gate before every modern object part exists: '
                         + ', '.join(missing))
    write_json(output_path('frozen-sha256.json'),
               {str(path.relative_to(REPO)): digest(path) for path in paths})
    write_json(output_path('control-sha256.json'),
               {str(path): digest(path) for path in additional_controls()})


def verify_frozen():
    source_graph()
    snapshots = ((output_path('frozen-sha256.json'), REPO,
                  {str(path.relative_to(REPO)) for path in repo_frozen_paths()}),
                 (output_path('control-sha256.json'), Path('/'),
                  {str(path) for path in additional_controls()}))
    for manifest, base, expected in snapshots:
        frozen = json.loads(manifest.read_text())
        if set(frozen) != expected:
            raise ValueError(f'Frozen inventory differs from the exact gate inputs: {manifest}')
        for name, expected_digest in frozen.items():
            path = base / name
            if not path.is_file() or digest(path) != expected_digest:
                raise ValueError(f'Frozen gate input changed: {path}')


def check_execution_environment():
    for name in ('lean', 'leanchecker'):
        found = shutil.which(name)
        if found is None or Path(found).resolve() != (TOOLCHAIN / 'bin' / name).resolve():
            raise ValueError(f'Run through the pinned lean-env.sh; unexpected {name}: {found}')
    packages = json.loads((LEAN_DIR / 'lake-manifest.json').read_text())['packages']
    expected = [BUILD] + [LEAN_DIR / '.lake/packages' / name / '.lake/build/lib/lean'
                         for name in sorted(p['name'] for p in packages if p['name'] != 'Cli')]
    if not all(path.is_dir() for path in expected):
        raise ValueError('A pinned project/dependency object directory is missing')
    actual = [str(Path(p).resolve()) for p in os.environ.get('LEAN_PATH', '').split(os.pathsep) if p]
    if [str(path.resolve()) for path in expected] != actual:
        raise ValueError('LEAN_PATH differs from the exact project-first pinned package paths')


def run(label, command):
    log = output_path(label + '.log')
    started, begin = utc_now(), time.monotonic()
    print('START', label, flush=True)
    write_json(output_path(label + '-metrics.json'),
               dict(command=command, cwd=str(LEAN_DIR), started_utc=started,
                    status='running', returncode=None))
    with log.open('wb') as stream:
        child = subprocess.Popen(command, cwd=LEAN_DIR, stdout=stream, stderr=subprocess.STDOUT)
        try:
            _, status, usage = os.wait4(child.pid, 0)
            child.returncode = os.waitstatus_to_exitcode(status)
        except BaseException:
            child.terminate()
            child.wait()
            raise
    metrics = dict(command=command, cwd=str(LEAN_DIR), started_utc=started,
                   elapsed_seconds=time.monotonic() - begin, returncode=child.returncode,
                   user_seconds=usage.ru_utime, system_seconds=usage.ru_stime,
                   maxrss_kib=usage.ru_maxrss, log_bytes=log.stat().st_size,
                   status='passed' if child.returncode == 0 else 'failed',
                   log_sha256=digest(log))
    write_json(output_path(label + '-metrics.json'), metrics)
    print('FINISH', label, json.dumps(metrics), flush=True)
    if child.returncode:
        print(log.read_text()[-18000:], flush=True)
        raise SystemExit(child.returncode)
    return log


def main(argv=None):
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('mode', nargs='?', default='prepare', choices=('prepare', 'audit', 'kernel'))
    args = parser.parse_args(argv)
    if args.mode == 'prepare':
        inventory = prepare()
        print(json.dumps({key: inventory[key] for key in (
            'status', 'imported_module_count', 'owned_module_count',
            'new_result_module_count', 'reused_dependency_module_count',
            'all_twenty_unregistered_at_prepare', 'all_object_parts_present',
            'required_endpoint_count')}, indent=2))
        return
    check_execution_environment()
    if args.mode == 'audit':
        inventory = prepare()
        freeze()
        log = run('audit', inventory['audit_command'])
        validated = owned.validate_log(log.read_text(), MODULES, MODULES,
                                       inventory['required_by_module'])
        verify_frozen()
        write_json(output_path('audit-validated.json'), validated)
        print('AXIOM AUDIT PASS', json.dumps(validated['summary']), flush=True)
    else:
        verify_frozen()
        inventory = json.loads(output_path('inventory.json').read_text())
        audit_metrics = json.loads(output_path('audit-metrics.json').read_text())
        if type(audit_metrics.get('returncode')) is not int or audit_metrics['returncode'] != 0:
            raise ValueError('The current audit process did not exit successfully')
        if (audit_metrics.get('command') != inventory['audit_command']
                or audit_metrics.get('cwd') != str(LEAN_DIR)
                or audit_metrics.get('log_bytes') != output_path('audit.log').stat().st_size
                or audit_metrics.get('log_sha256') != digest(output_path('audit.log'))):
            raise ValueError('Current audit process metadata differs from the frozen gate inputs')
        if (datetime.datetime.fromisoformat(audit_metrics['started_utc'])
                < datetime.datetime.fromisoformat(inventory['prepared_utc'])):
            raise ValueError('The current audit metrics predate this frozen inventory')
        required = json.loads(output_path('obligations.json').read_text())
        validated = owned.validate_log(output_path('audit.log').read_text(), MODULES, MODULES, required)
        if validated != json.loads(output_path('audit-validated.json').read_text()):
            raise ValueError('Saved complete audit validation differs from its raw log')
        run('kernel', ['python3', '../scripts/replay_lean.py', '--root', ROOT])
        verify_frozen()
        print('KERNEL PASS: exact twenty-module closure and frozen inputs unchanged', flush=True)


if __name__ == '__main__':
    main()
