#!/usr/bin/env python3
"""Freeze exact source inventories for the finite six-plane verification jobs."""

import hashlib
import json
from pathlib import Path

import verify_six_plane_data_exact as gate
import verify_frankl_orbit_batches as runtime


ROOT = Path(__file__).resolve().parents[1]
HELPERS = [
    'scripts/audit_lean_all_owned.py',
    'scripts/build_lean_parallel.py',
    'scripts/plan_accepted_lean.py',
    'scripts/plan_lean_candidates.py',
    'scripts/replay_lean.py',
    'scripts/verify_frankl_orbit_batches.py',
    'scripts/verify_lean_candidate.py',
]
CONFIGURATION = ['lean/lake-manifest.json', 'lean/lakefile.toml', 'lean/lean-toolchain']


def sha(path):
    return hashlib.sha256((ROOT / path).read_bytes()).hexdigest()


def main():
    tasks = {}
    for task, roots in gate.ROOTS.items():
        modules = runtime.dependency_order(roots)
        if task == 'assembly':
            scope = ('Closed finite CandidatePairsChecked theorem: every canonical first direction '
                     'and every signed coordinate permutation of every canonical second direction '
                     'has a verified dependence, coordinate, line obstruction, or exact critical-plane '
                     'acceptance witness. The proof covers all 1,152,000 distinct vector pairs and '
                     'all 720 index permutations through an independently checked coverage map. '
                     'This finite theorem does not by itself prove the real-plane gap or discharge '
                     'the five-speed classification input.')
        elif task == 'coverage':
            scope = ('All 10 canonical multisets and all 720 coordinate permutations are covered '
                     'by the 360 positive vector rows for that multiset. Bounded rank checks are '
                     'joined by a quotient/remainder proof. Generic pair-check chunk assembly is '
                     'also checked; no complete pair enumeration or real-plane gap is claimed.')
        else:
            first = int(task.split('-')[1])
            scope = (f'All 115,200 finite signed-vector pairs with first canonical pattern {first}: '
                     '10 second patterns, 360 positive vector permutations each, and 32 sign masks. '
                     'Each of the 10 pair-pattern modules proves nine 40-row chunks and their complete '
                     'row assembly. Other first patterns and the final closed theorem are separate jobs.')
        tasks[task] = {
            'schema': 'six-plane-data-exact-v1',
            'roots': roots,
            'scope': scope,
            'finite_pair_coverage_complete': task == 'assembly',
            'accepted_registry_changed': False,
            'legacy_prefixes': ['Loneliness.'],
            'source_policy': {'warning_as_error': True, 'linter_override': False,
                              'fresh_project_objects': True},
            'source_sha256': {module: sha('lean/' + module.replace('.', '/') + '.lean')
                              for module in modules},
            'project_module_count': len(modules),
            'required_theorems': gate.REQUIRED[task],
            'required_theorem_count': len(gate.REQUIRED[task]),
            'helper_sha256': {path: sha(path) for path in HELPERS},
            'configuration_sha256': {path: sha(path) for path in CONFIGURATION},
        }
    packet = {'schema': 'six-plane-data-exact-model-v1', 'tasks': tasks}
    (ROOT / gate.MODEL).write_text(json.dumps(packet, indent=2, sort_keys=True) + '\n')
    print(json.dumps({task: {'modules': item['project_module_count'],
                            'required': item['required_theorem_count']}
                      for task, item in tasks.items()}))


if __name__ == '__main__':
    main()
