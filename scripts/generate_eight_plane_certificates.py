#!/usr/bin/env python3
"""Produce untrusted, explicitly witnessed eight-plane prefix certificates.

The Lean checker proves coverage and cut soundness. This producer is not part
of the proof kernel. Its domains intentionally ignore correlations among the
unassigned coordinates; rejection of that larger box is sufficient.
"""
from __future__ import annotations

import argparse
from collections import Counter
import hashlib
import json
from math import factorial
import os
from pathlib import Path
import time


BASES = ((1, 2, 3, 4, 5, 6, 7), (1, 2, 3, 4, 5, 7, 12),
         (1, 4, 5, 6, 7, 11, 13))


def write_if_changed(path, raw):
    if path.exists() and path.read_bytes() == raw:
        return
    temporary = path.with_name(path.name + '.eight-plane-tmp')
    temporary.write_bytes(raw)
    os.replace(temporary, path)


def canonical(index):
    family, repeated = divmod(index, 7)
    return BASES[family] + (BASES[family][repeated],)


def dedup_last(values):
    # This is List.dedup order, not Python's first-occurrence dictionary order.
    return tuple(x for i, x in enumerate(values) if x not in values[i + 1:])


def erase_first(values, value):
    i = values.index(value)
    return values[:i] + values[i + 1:]


def magnitude_domains(w, assigned, remaining, a, b):
    tail = tuple(s * x for x in remaining for s in (1, -1))
    return tuple(tuple(abs(a * x - b * w[i]) for x in
                       ((assigned[i],) if i < len(assigned) else tail))
                 for i in range(8))


def cut_witness(w, assigned, remaining):
    for i in range(1, len(assigned)):
        for j in range(i):
            for sign in (-1, 1):
                a, b = w[i] - sign * w[j], assigned[i] - sign * assigned[j]
                if a == b == 0:
                    return {'kind': 'cut', 'i': i, 'j': j, 'negative': sign == -1, 'codes': 0}
                domains = magnitude_domains(w, assigned, remaining, a, b)
                if any(0 in domain for domain in domains):
                    continue
                anchor = domains[0][0]
                codes, rejected = 0, True
                for family, base in enumerate(BASES):
                    for anchor_index, c in enumerate(base):
                        if anchor % c:
                            continue
                        scale = anchor // c
                        assert scale > 0
                        allowed = {scale * x for x in base}
                        code = next((k for k, domain in enumerate(domains)
                                     if all(x not in allowed for x in domain)), None)
                        if code is None:
                            code = next((8 + k for k, value in enumerate(base)
                                         if all(scale * value not in domain for domain in domains)), None)
                        if code is None:
                            rejected = False
                            break
                        codes |= code << (4 * (7 * family + anchor_index))
                    if not rejected:
                        break
                if rejected:
                    return {'kind': 'cut', 'i': i, 'j': j, 'negative': sign == -1,
                            'codes': codes}
    return None


def product_form(w, assigned, repeated):
    if len(assigned) != 8:
        return False
    direct = all(w[i] * assigned[0] == w[0] * assigned[i] for i in range(7))
    swapped = list(assigned)
    swapped[repeated], swapped[7] = swapped[7], swapped[repeated]
    indirect = all(w[i] * swapped[0] == w[0] * swapped[i] for i in range(7))
    return direct or indirect


def actual_repeat_tests(w, assigned):
    """Independent complete-vector checks, used only at emitted product leaves."""
    if not any(w[i] * assigned[j] != w[j] * assigned[i]
               for i in range(8) for j in range(i)):
        return False
    for i in range(8):
        for j in range(i):
            for sign in (-1, 1):
                a, b = w[i] - sign * w[j], assigned[i] - sign * assigned[j]
                if a == b == 0:
                    return False
                q = tuple(abs(a * z - b * x) for x, z in zip(w, assigned))
                scale = min(q)
                if scale and (any(x % scale for x in q)
                              or {x // scale for x in q} not in [set(base) for base in BASES]):
                    return False
    return True


def completion_count(assigned, remaining):
    count = factorial(len(remaining))
    for multiplicity in Counter(remaining).values():
        count //= factorial(multiplicity)
    return count * 2 ** (len(remaining) if assigned else max(0, len(remaining) - 1))


def generate(first, second):
    w = canonical(first)
    repeated = first % 7
    stats = {'visits': [0] * 9, 'cuts': [0] * 9, 'products': 0,
             'coordinate_cuts': 0, 'line_cuts': 0, 'covered_complete_pairs': 0}
    survivors = []

    def visit(assigned, remaining):
        stats['visits'][len(assigned)] += 1
        cut = cut_witness(w, assigned, remaining)
        if cut is not None:
            stats['cuts'][len(assigned)] += 1
            sign = -1 if cut['negative'] else 1
            equality = (w[cut['i']] == sign * w[cut['j']]
                        and assigned[cut['i']] == sign * assigned[cut['j']])
            stats['coordinate_cuts' if equality else 'line_cuts'] += 1
            stats['covered_complete_pairs'] += completion_count(assigned, remaining)
            return cut
        if len(assigned) == 8:
            assert not remaining
            assert actual_repeat_tests(w, assigned), ('unexpected admitted vector', first, second, assigned)
            assert product_form(w, assigned, repeated), ('nonproduct survivor', first, second, assigned)
            stats['products'] += 1
            stats['covered_complete_pairs'] += 1
            survivors.append(assigned)
            return {'kind': 'product'}
        children = []
        for value in dedup_last(remaining):
            tail = erase_first(remaining, value)
            children.append(visit(assigned + (value,), tail))
            if assigned:
                children.append(visit(assigned + (-value,), tail))
        return {'kind': 'split', 'children': children}

    certificate = visit((), canonical(second))
    expected = factorial(8) // 2 * 2 ** 7
    assert stats['covered_complete_pairs'] == expected
    stats['nodes'] = sum(stats['visits'])
    stats['expected_complete_pairs'] = expected
    return certificate, stats, survivors


def validate_certificate(first, second, certificate):
    """Replay only supplied witnesses and exact child order, without cut search."""
    w, repeated = canonical(first), first % 7

    def check(assigned, remaining, node):
        kind = node['kind']
        if kind == 'product':
            assert not remaining and product_form(w, assigned, repeated)
            return 1
        if kind == 'cut':
            i, j = node['i'], node['j']
            assert 0 <= j < i < len(assigned) <= 8
            sign = -1 if node['negative'] else 1
            a, b = w[i] - sign * w[j], assigned[i] - sign * assigned[j]
            if a == b == 0:
                return completion_count(assigned, remaining)
            domains = magnitude_domains(w, assigned, remaining, a, b)
            assert all(0 not in choices for choices in domains)
            anchor = domains[0][0]
            for family, base in enumerate(BASES):
                for k, divisor in enumerate(base):
                    if anchor % divisor:
                        continue
                    scale = anchor // divisor
                    code = (node['codes'] >> (4 * (7 * family + k))) & 15
                    if code < 8:
                        assert all(x != scale * c for x in domains[code] for c in base)
                    elif code < 15:
                        assert all(scale * base[code - 8] not in choices for choices in domains)
                    else:
                        raise AssertionError('reserved obstruction code')
            return completion_count(assigned, remaining)
        assert kind == 'split' and remaining
        index, total = 0, 0
        for value in dedup_last(remaining):
            tail = erase_first(remaining, value)
            for sign in ((1, -1) if assigned else (1,)):
                total += check(assigned + (sign * value,), tail, node['children'][index])
                index += 1
        assert index == len(node['children'])
        assert total == completion_count(assigned, remaining)
        return total

    return check((), canonical(second), certificate)


def lean_expression(node, depth=0):
    if node['kind'] == 'product':
        return '.product'
    if node['kind'] == 'cut':
        negative = 'true' if node['negative'] else 'false'
        return f"(.cut {node['i']} {node['j']} {negative} {node['codes']})"
    indentation = '  ' * (depth + 1)
    children = (lean_expression(child, depth + 1) for child in node['children'])
    return '(.split [\n' + indentation + (',\n' + indentation).join(children) + '\n' + '  ' * depth + '])'


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--first', type=int, default=0)
    parser.add_argument('--second', type=int, default=0)
    parser.add_argument('--all', action='store_true')
    parser.add_argument('--out', type=Path, required=True)
    args = parser.parse_args()
    assert 0 <= args.first < 21 and 0 <= args.second < 21
    args.out.mkdir(parents=True, exist_ok=True)
    pairs = [(i, j) for i in range(21) for j in range(21)] if args.all else [(args.first, args.second)]
    records = []
    started = time.monotonic()
    producer_sha = hashlib.sha256(Path(__file__).read_bytes()).hexdigest()
    for first, second in pairs:
        certificate, stats, survivors = generate(first, second)
        assert validate_certificate(first, second, certificate) == stats['expected_complete_pairs']
        label = f'{first:02d}_{second:02d}'
        name = 'pilotCertificate' if (first, second) == (0, 0) else 'certificate_' + label
        lean = 'namespace Loneliness.EightPlane.Data\n\ndef ' + name + ' : Certificate :=\n  '
        lean += lean_expression(certificate) + '\n\nend Loneliness.EightPlane.Data\n'
        lean_path = args.out / ('certificate_' + label + '.lean.txt')
        write_if_changed(lean_path, lean.encode())
        payload = {'schema': 'eight-plane-prefix-certificate-v1', 'first': first, 'second': second,
                   'first_family': first // 7, 'first_repeat_index': first % 7,
                   'first_direction': canonical(first), 'second_multiset': canonical(second),
                   'fuel': 8, 'branch_order': 'List.dedup-last, positive then negative, root positive only',
                   'certificate': certificate, 'stats': stats, 'survivors': survivors,
                   'producer_sha256': producer_sha, 'formal_acceptance_claimed': False}
        raw = (json.dumps(payload, sort_keys=True, separators=(',', ':')) + '\n').encode()
        write_if_changed(args.out / ('certificate_' + label + '.json'), raw)
        record = {'first': first, 'second': second, **stats, 'json_sha256': hashlib.sha256(raw).hexdigest(),
                  'lean_sha256': hashlib.sha256(lean.encode()).hexdigest(), 'lean_bytes': len(lean.encode()),
                  'seconds_total': round(time.monotonic() - started, 3)}
        records.append(record)
        print(json.dumps(record), flush=True)
    summary = {'schema': 'eight-plane-certificate-generation-v1', 'pairs': len(pairs),
               'nodes': sum(r['nodes'] for r in records), 'products': sum(r['products'] for r in records),
               'covered_complete_pairs': sum(r['covered_complete_pairs'] for r in records),
               'producer_sha256': producer_sha, 'formal_acceptance_claimed': False, 'records': records}
    if args.all:
        assert summary['products'] == 546
        assert summary['covered_complete_pairs'] == 1137991680
    write_if_changed(args.out / 'generation-manifest.json',
                     (json.dumps(summary, indent=2, sort_keys=True) + '\n').encode())


if __name__ == '__main__':
    main()
