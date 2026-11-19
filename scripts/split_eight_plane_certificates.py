#!/usr/bin/env python3
"""Emit independently checkable root children of an untrusted eight-plane tree.

The original whole-tree files are never modified. The manifest records the
exact recursive checker state for each child. Lean must check every child and
prove the join; this producer makes no formal acceptance claim.
"""
from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path

from generate_eight_plane_certificates import (
    canonical, completion_count, dedup_last, erase_first, lean_expression,
    validate_certificate, write_if_changed,
)


def node_count(node):
    return 1 + sum(node_count(c) for c in node.get('children', []))


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--input', type=Path, required=True)
    parser.add_argument('--out', type=Path, required=True)
    args = parser.parse_args()
    original = args.input.read_bytes()
    payload = json.loads(original)
    assert payload['schema'] == 'eight-plane-prefix-certificate-v1'
    first, second = payload['first'], payload['second']
    certificate = payload['certificate']
    expected = validate_certificate(first, second, certificate)
    assert certificate['kind'] == 'split'
    remaining = canonical(second)
    values = dedup_last(remaining)
    assert len(values) == len(certificate['children'])
    assert payload['fuel'] == 8
    args.out.mkdir(parents=True, exist_ok=True)
    records = []
    for index, (value, child) in enumerate(zip(values, certificate['children'], strict=True)):
        assigned, rest = (value,), erase_first(remaining, value)
        name = f'certificate_{first:02d}_{second:02d}_child_{index}'
        lean = ('namespace Loneliness.EightPlane.Data\n\ndef ' + name +
                ' : Certificate :=\n  ' + lean_expression(child) +
                '\n\nend Loneliness.EightPlane.Data\n')
        path = args.out / (name + '.lean.txt')
        raw = lean.encode()
        write_if_changed(path, raw)
        records.append({
            'index': index, 'definition': name, 'assigned': assigned,
            'remaining': rest, 'fuel': 7, 'first_family': first // 7,
            'first_repeat_index': first % 7, 'nodes': node_count(child),
            'covered_complete_pairs': completion_count(assigned, rest),
            'lean_path': path.name, 'lean_bytes': len(raw),
            'lean_sha256': hashlib.sha256(raw).hexdigest(),
        })
    assert sum(r['covered_complete_pairs'] for r in records) == expected
    assert 1 + sum(r['nodes'] for r in records) == node_count(certificate)
    manifest = {
        'schema': 'eight-plane-root-child-fragments-v1', 'first': first,
        'second': second, 'original_json_sha256': hashlib.sha256(original).hexdigest(),
        'original_tree_nodes': node_count(certificate),
        'covered_complete_pairs': expected, 'formal_acceptance_claimed': False,
        'splitter_sha256': hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
        'records': records,
    }
    path = args.out / f'children_{first:02d}_{second:02d}_manifest.json'
    write_if_changed(path, (json.dumps(manifest, indent=2, sort_keys=True) + '\n').encode())
    print(json.dumps(manifest, sort_keys=True))


if __name__ == '__main__':
    main()
