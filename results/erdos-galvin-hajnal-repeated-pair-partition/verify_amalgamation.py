"""Pull every six-vertex obstruction back to a single putative condition template."""
from collections import Counter
from itertools import combinations, permutations, product

PATTERNS = (((0, 1, 2), (2, 3, 4), (0, 4, 5), (1, 3, 5)),
            ((0, 1, 2), (0, 1, 3), (2, 3, 4), (0, 4, 5)))


def triple(iterable):
    return tuple(sorted(iterable))


forbidden = {frozenset(triple(p[i] for i in e) for e in pattern)
             for pattern in PATTERNS for p in permutations(range(6))}


def block_assignments():
    for blocks in product(range(7), repeat=6):
        seen = list(dict.fromkeys(x for x in blocks if x))
        if len(seen) >= 2 and seen == list(range(1, len(seen) + 1)):
            yield blocks


def template_maps(blocks):
    root = [i for i in range(6) if blocks[i] == 0]
    exterior = [i for i in range(6) if blocks[i]]
    roles = {i: n for n, i in enumerate(root)}
    def start(at, used):
        if at == len(exterior):
            yield dict(roles)
            return
        i = exterior[at]
        for pos in range(len(root), used + 1):
            if any(p == pos and blocks[j] == blocks[i] for j, p in roles.items()):
                continue
            roles[i] = pos
            yield from start(at + 1, max(used, pos + 1))
            del roles[i]
    yield from start(0, len(root))


def consistent_order(edges, root_count, size):
    order = {(x, y) for x in range(root_count) for y in range(root_count, size)}
    for e, f in combinations(edges, 2):
        common = set(e) & set(f)
        if len(common) == 2:
            order.update((x, y) for x in common for y in set(e) ^ set(f))
    remaining = set(range(size))
    while remaining:
        minimal = {v for v in remaining if not any(x in remaining and y == v for x, y in order)}
        if not minimal:
            return False
        remaining -= minimal
    return True


def main():
    counts = Counter()
    for blocks in block_assignments():
        root_count = blocks.count(0)
        for n, pat in enumerate(PATTERNS, 5):
            cross = [e for e in pat if len({blocks[i] for i in e} - {0}) > 1]
            if len(cross) > 1 or (cross and {blocks[i] for i in cross[0]} != {1, 2, 3}):
                continue
            mode = 'new marked triple' if cross else 'free union'
            for roles in template_maps(blocks):
                if cross and len({roles[i] for i in cross[0]}) != 1:
                    continue
                old = frozenset(triple(roles[i] for i in e) for e in pat if e not in cross)
                assert all(len(set(e)) == 3 for e in old)
                size = len(set(roles.values()))
                if not consistent_order(old, root_count, size):
                    reason = 'violates the shared-bottom-pair order'
                elif size == 6 and old in forbidden:
                    reason = 'forbidden template'
                else:
                    raise AssertionError((n, mode, blocks, roles, old))
                counts[n, mode, reason] += 1
    for label, total in sorted(counts.items()):
        print(*label, total, sep=' | ')
    print(sum(counts.values()), 'six-vertex projection cases')


if __name__ == '__main__':
    main()
