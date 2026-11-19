#!/usr/bin/env python3
"""Emit bounded kernel checks and theorem-based joins for eight-plane trees.

The JSON trees are untrusted witnesses. Each bounded subtree receives an
ordinary `decide +kernel` theorem. Larger nodes use the proved composition
rules and their child theorems, without evaluating child arithmetic again.
No result is accepted merely because this producer finishes.
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


def digest(raw):
    return hashlib.sha256(raw).hexdigest()


def lean_list(values):
    return '[' + ', '.join(map(str, values)) + ']'


def node_count(node):
    return 1 + sum(node_count(child) for child in node.get('children', []))


def generate_module(payload, max_nodes):
    first, second = payload['first'], payload['second']
    assert 0 <= first < 21 and 0 <= second < 21
    assert payload['schema'] == 'eight-plane-prefix-certificate-v1'
    assert payload['fuel'] == 8
    root = payload['certificate']
    expected = validate_certificate(first, second, root)
    family, repeated = divmod(first, 7)
    label = f'{first:02d}_{second:02d}'
    declarations, records = [], []

    def emit(node, assigned, remaining, fuel, path):
        size = node_count(node)
        suffix = 'root' if not path else '_'.join(f'c{x:02d}' for x in path)
        name = f'certificate_{label}_{suffix}'
        theorem = name + '_checked'
        common = f'{fuel} {family} {repeated} {lean_list(assigned)} {lean_list(remaining)}'
        record = {
            'definition': name, 'theorem': theorem, 'path': path,
            'assigned': assigned, 'remaining': remaining, 'fuel': fuel,
            'nodes': size, 'covered_complete_pairs': completion_count(assigned, remaining),
            'tree_sha256': digest(json.dumps(node, sort_keys=True, separators=(',', ':')).encode()),
        }
        if size <= max_nodes:
            record['kind'] = 'numeric'
            declarations.append('def ' + name + ' : Certificate :=\n  ' +
                                lean_expression(node) + '\n')
            declarations.append(f'theorem {theorem} :\n'
                                f'    checkCertificate {common} {name} = true := by\n'
                                '  decide +kernel\n')
        else:
            assert node['kind'] == 'split' and remaining and fuel > 0
            choices = tuple(sign * value for value in dedup_last(remaining)
                            for sign in ((1, -1) if assigned else (1,)))
            assert len(choices) == len(node['children'])
            children, proofs = [], []
            for index, (choice, child) in enumerate(zip(choices, node['children'], strict=True)):
                child_name, proof = emit(child, assigned + (choice,),
                                         erase_first(remaining, abs(choice)), fuel - 1,
                                         path + (index,))
                children.append(child_name)
                proofs.append(proof)
            record.update({'kind': 'join', 'choices': choices, 'children': children})
            declarations.append(f'def {name} : Certificate :=\n  .split {lean_list(children)}\n')
            proof = [
                f'theorem {theorem} :',
                f'    checkCertificate {common} {name} = true := by',
                f'  refine checkCertificate_split {fuel - 1} {family} {repeated}',
                f'    {lean_list(assigned)} {lean_list(remaining)} {lean_list(children)} (by decide) ?_',
                '  change checkBranches',
                f'    (fun z child => checkCertificate {fuel - 1} {family} {repeated}',
                f'      ({lean_list(assigned)} ++ [z]) ({lean_list(remaining)}.erase z.natAbs) child)',
                f'    {lean_list(choices)} {lean_list(children)} = true',
            ]
            for index, child_proof in enumerate(proofs):
                prefix = '  exact ' if index == 0 else '    ' + '  ' * (index - 1) + '('
                proof.append(prefix + 'checkBranches_cons _ _ _ _ _ ' + child_proof)
            proof.append('    ' + '  ' * (len(proofs) - 1) + '(checkBranches_nil _)' +
                         ')' * (len(proofs) - 1))
            declarations.append('\n'.join(proof) + '\n')
        records.append(record)
        return name, theorem

    root_name, root_proof = emit(root, (), canonical(second), 8, ())
    second_family, second_repeat = divmod(second, 7)
    endpoint = f'pattern_checked_{label}'
    declarations.append(
        f'theorem {endpoint} :\n'
        f'    checkCertificate 8 {family} {repeated} []\n'
        f'      (baseList {second_family} ++ [base {second_family} {second_repeat}])\n'
        f'      {root_name} = true := by\n'
        f'  exact {root_proof}\n')
    text = ('import Conjectures.LonelinessEightPlaneCertificateComposition\n\n'
            'set_option maxRecDepth 100000\n\n'
            'namespace Loneliness.EightPlane.Data\n\n' +
            '\n'.join(declarations) + '\nend Loneliness.EightPlane.Data\n')
    frontier = [r for r in records if r['kind'] == 'numeric']
    assert sum(r['covered_complete_pairs'] for r in frontier) == expected
    assert max(r['nodes'] for r in frontier) <= max_nodes
    return text, {
        'first': first, 'second': second, 'max_nodes': max_nodes,
        'original_tree_nodes': node_count(root), 'covered_complete_pairs': expected,
        'numeric_fragments': len(frontier), 'join_nodes': len(records) - len(frontier),
        'largest_fragment': max(r['nodes'] for r in frontier),
        'root_definition': root_name, 'required_endpoint': 'Loneliness.EightPlane.Data.' + endpoint,
        'records': records,
    }


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--input-dir', type=Path, required=True)
    parser.add_argument('--out-dir', type=Path, required=True)
    parser.add_argument('--first', type=int, default=0)
    parser.add_argument('--second', type=int, default=0)
    parser.add_argument('--all', action='store_true')
    parser.add_argument('--max-nodes', type=int, default=700)
    args = parser.parse_args()
    assert args.max_nodes > 0
    assert 0 <= args.first < 21 and 0 <= args.second < 21
    pairs = [(i, j) for i in range(21) for j in range(21)] if args.all else [(args.first, args.second)]
    args.out_dir.mkdir(parents=True, exist_ok=True)
    records = []
    for first, second in pairs:
        source = args.input_dir / f'certificate_{first:02d}_{second:02d}.json'
        raw = source.read_bytes()
        payload = json.loads(raw)
        assert (payload['first'], payload['second']) == (first, second)
        lean, record = generate_module(payload, args.max_nodes)
        name = f'LonelinessEightPlaneData{first:02d}_{second:02d}.lean'
        output = args.out_dir / name
        encoded = lean.encode()
        write_if_changed(output, encoded)
        record.update({'source_json_sha256': digest(raw), 'source_path': name,
                       'lean_sha256': digest(encoded), 'lean_bytes': len(encoded)})
        write_if_changed(args.out_dir / (name + '.json'),
                         (json.dumps(record, indent=2, sort_keys=True) + '\n').encode())
        records.append({k: v for k, v in record.items() if k != 'records'})
    manifest = {
        'schema': 'eight-plane-bounded-lean-data-v1', 'pairs': len(records),
        'max_nodes': args.max_nodes,
        'numeric_fragments': sum(r['numeric_fragments'] for r in records),
        'join_nodes': sum(r['join_nodes'] for r in records),
        'covered_complete_pairs': sum(r['covered_complete_pairs'] for r in records),
        'formal_acceptance_claimed': False,
        'producer_sha256': digest(Path(__file__).read_bytes()), 'records': records,
    }
    if args.all:
        assert manifest['covered_complete_pairs'] == 1137991680
    write_if_changed(args.out_dir / 'bounded-generation-manifest.json',
                     (json.dumps(manifest, indent=2, sort_keys=True) + '\n').encode())
    print(json.dumps({k: v for k, v in manifest.items() if k != 'records'}, sort_keys=True))


if __name__ == '__main__':
    main()
