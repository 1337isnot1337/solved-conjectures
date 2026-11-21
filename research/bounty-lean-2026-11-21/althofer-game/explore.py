"""Finite strategy certificates for Althofer's 3n+-1 game.

Unknown successors outside the explored interval stay unknown.  Every W/P
label produced here has a finite winning-strategy certificate in the infinite
game.  The unlabelled states are NOT certified draws.
"""

from argparse import ArgumentParser
from collections import Counter, deque
import json


def odd_part(x):
    return x // (x & -x)


def successors(n):
    return odd_part(3 * n - 1), odd_part(3 * n + 1)


def certify(bound):
    size = (bound + 1) // 2
    parents = [[] for _ in range(size)]
    children = [None] * size
    for i in range(1, size):
        cs = successors(2 * i + 1)
        children[i] = cs
        for m in cs:
            if m <= bound:
                parents[m // 2].append(i)
    state = bytearray(size)  # 0 unknown, 1 P, 2 W
    rank = [-1] * size
    winning_children = bytearray(size)
    state[0], rank[0] = 1, 0
    queue = deque([0])
    while queue:
        i = queue.popleft()
        for p in parents[i]:
            if state[p]:
                continue
            if state[i] == 1:
                state[p] = 2
                rank[p] = rank[i] + 1
                queue.append(p)
            else:
                winning_children[p] += 1
                if winning_children[p] == 2:
                    state[p] = 1
                    rank[p] = 1 + max(rank[m // 2] for m in children[p])
                    queue.append(p)
    # Replay each certificate using only strictly smaller ranks.
    for i in range(1, size):
        if not state[i]:
            continue
        cs = children[i]
        if state[i] == 2:
            assert any(m <= bound and state[m // 2] == 1
                       and rank[m // 2] < rank[i] for m in cs)
        else:
            assert all(m <= bound and state[m // 2] == 2
                       and rank[m // 2] < rank[i] for m in cs)
    return state, rank


def main():
    parser = ArgumentParser()
    parser.add_argument('--bound', type=int, default=200001)
    parser.add_argument('--dump', action='store_true')
    args = parser.parse_args()
    state, rank = certify(args.bound)
    unknown = [2 * i + 1 for i, s in enumerate(state) if not s]
    result = {
        'bound': args.bound,
        'certified_losing': state.count(1),
        'certified_winning': state.count(2),
        'unresolved': len(unknown),
        'first_unresolved': unknown[:20],
        'max_certificate_rank': max(rank),
        'losing_positions_below_201': [2 * i + 1 for i, s in enumerate(state[:100]) if s == 1],
        'rank_distribution': sorted(Counter(rank).items()),
        'all_claims_replayed': True,
        'full_conjecture_solved': False,
    }
    if args.dump:
        result['certificates'] = [{'n': 2 * i + 1, 'outcome': 'P' if s == 1 else 'W',
                                   'rank': rank[i]} for i, s in enumerate(state) if s]
    print(json.dumps(result, indent=2))


if __name__ == '__main__':
    main()
