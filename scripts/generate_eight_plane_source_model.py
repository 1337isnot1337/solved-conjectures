#!/usr/bin/env python3
"""Freeze exact source inventories for the finite eight-plane verification jobs."""

import hashlib
import json
from pathlib import Path

import verify_eight_plane_data_exact as gate
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
            scope = ('Closed finite CandidatePairsChecked theorem: for every one of the 21 first '
                     'canonical directions and 21 second canonical multisets, every signed second '
                     'vector with positive initial coordinate and the required absolute multiset '
                     'permutation satisfies productCheck whenever all RepeatTests hold. The '
                     'recursive certificate soundness theorem covers all 1,137,991,680 pairs; '
                     'the numerical table uses 760 bounded kernel checks and 52 proved joins. '
                     'This does not by itself prove the real eight-plane classification, its '
                     'normalization hypotheses, or the complete eight-speed spectrum.')
        else:
            first = int(task.split('-')[1])
            scope = (f'All 21 checked prefix certificates for first canonical pattern {first}, '
                     'one for each second canonical multiset. Each covers 2,580,480 signed '
                     'coordinate vectors with positive initial coordinate. Generic cut soundness, '
                     'recursive permutation coverage, and composition theorems are independently '
                     'checked in every group. Other first patterns and the closed finite theorem '
                     'are separate jobs; no mathematical plane classification is claimed.')
        tasks[task] = {
            'schema': 'eight-plane-data-exact-v1',
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
    packet = {'schema': 'eight-plane-data-exact-model-v1', 'tasks': tasks}
    (ROOT / gate.MODEL).write_text(json.dumps(packet, indent=2, sort_keys=True) + '\n')
    print(json.dumps({task: {'modules': item['project_module_count'],
                            'required': item['required_theorem_count']}
                      for task, item in tasks.items()}))


if __name__ == '__main__':
    main()
