"""Replay the finite interval partition and palette product from the club proof."""

from itertools import combinations


def interval_indices(order, cuts):
    indices = [0]
    for index in range(order - 1):
        indices.append(indices[-1] + ((cuts >> index) & 1))
    return indices


def decompose_and_color(adjacency, indices, reverse_slots):
    blocks = [[] for _ in range(indices[-1] + 1)]
    for vertex, block in enumerate(indices):
        blocks[block].append(vertex)

    # Absent slots at an interval index are the isolated padding vertices.
    width = max(map(len, blocks))
    slots = [[None] * len(blocks) for _ in range(width)]
    for block, members in enumerate(blocks):
        ordered = reversed(members) if reverse_slots and block % 2 else members
        for slot, vertex in enumerate(ordered):
            slots[slot][block] = vertex
    colors = {}
    for slot, representatives in enumerate(slots):
        palette = []
        for vertex in representatives:
            if vertex is None:
                continue
            blocked = {color for old, color in palette if old in adjacency[vertex]}
            color = next(c for c in range(len(blocks) + 1) if c not in blocked)
            assert vertex not in colors
            colors[vertex] = (slot, color)
            palette.append((vertex, color))
    assert len(colors) == len(adjacency)
    assert all(colors[u] != colors[v] for u, neighbors in enumerate(adjacency) for v in neighbors)
    return slots


def exhaustive_replay():
    cases = 0
    for order in range(1, 6):
        pairs = list(combinations(range(order), 2))
        for edges in range(1 << len(pairs)):
            neighbors = [set() for _ in range(order)]
            for bit, (u, v) in enumerate(pairs):
                if edges & (1 << bit):
                    neighbors[u].add(v)
                    neighbors[v].add(u)
            for cuts in range(1 << (order - 1)):
                indices = interval_indices(order, cuts)
                for reverse_slots in (False, True):
                    decompose_and_color(neighbors, indices, reverse_slots)
                    cases += 1
    return cases


def predecessor_interval():
    for width in (2, 3, 8, 32):
        center = width
        adjacency = [{center} for _ in range(width)] + [set(range(width))]
        slots = decompose_and_color(adjacency, [0] * width + [1], False)
        own_slot = next(slot for slot in slots if center in slot)
        assert len(adjacency[center]) == width
        assert sum(v in adjacency[center] for v in own_slot) == 1


if __name__ == '__main__':
    cases = exhaustive_replay()
    predecessor_interval()
    print(f'{cases} graph, interval partition, and slot-order cases passed.')
    print('Four predecessor intervals contribute one neighbor to the center within its slot.')
