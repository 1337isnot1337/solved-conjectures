#!/usr/bin/env python3
"""Exact examples of both four-edge-cut splices and their budget checks."""

from collections import Counter
from itertools import product


def edge(left, right):
    return tuple(sorted((left, right)))


def edges(path):
    return [edge(left, right) for left, right in zip(path, path[1:])]


def bound(weight):
    return (weight - 1) // 2


def check_partition(vertices, graph, cycles):
    used = Counter()
    for cycle in cycles:
        assert len(cycle) >= 3 and cycle[0] == cycle[-1], cycle
        assert len(set(cycle[:-1])) == len(cycle) - 1, cycle
        used.update(edges(cycle))
    assert used == Counter(graph), (used, graph)
    assert {vertex for pair in graph for vertex in pair} <= set(vertices)
    weight = len(vertices) + len(graph) - len(used)
    assert len(cycles) <= bound(weight), (weight, cycles)


def check_distinct_pairings():
    # X labels are x,a,x,b and Y labels are u,u,v,w.
    left = edges("ab")
    right = edges("vzw")
    cut = list(map(edge, "xaxb", "uuvw"))
    check_partition("xabh", left + list(map(edge, "hhhh", "xaxb")), ["hxh", "habh"])

    # Both artificial edges occur in one cycle on each completion.
    check_partition("uvzw", right + [edge("u", "v"), edge("u", "w")], ["uvzwu"])
    check_partition("xab", left + [edge("x", "a"), edge("x", "b")], ["xabx"])
    check_partition("xabuvzw", left + right + cut, ["xuabwzvx"])


def check_same_pairing():
    # The initial pairing joins x to itself and a to c on X.
    left = edges("abc") + edges("xdbx")
    right = [edge("p", "q"), edge("r", "s")] + edges("przp")
    cut = list(map(edge, "xxac", "pqrs"))
    check_partition(
        "xabcdh", left + list(map(edge, "hhhh", "xxac")), ["hxh", "habch", "xdbx"]
    )

    # Reserve pq and add a parallel rs edge, creating the two-edge cycle.
    trial = right.copy()
    trial.remove(edge("p", "q"))
    trial.append(edge("r", "s"))
    check_partition("pqrsz", trial, ["rsr", "przp"])
    cycles = ["xpqx", "abcsra", "xdbx", "przp"]
    check_partition("xabcdpqrsz", left + right + cut, cycles)
    assert len(cycles) == bound(10)


def check_parity():
    # Each budget inequality is affine in the half-weights at fixed parities.
    for left_parity, right_parity in product(range(2), repeat=2):
        left_weight = 4 + left_parity
        right_weight = 4 + right_parity
        left_half = left_weight // 2
        right_half = right_weight // 2
        target = bound(left_weight + right_weight)
        assert left_half + left_parity + right_half - 1 <= target
        assert left_half + bound(right_weight) <= target


if __name__ == "__main__":
    check_distinct_pairings()
    check_same_pairing()
    check_parity()
    print("Hajós four-edge cut: both splices and all four budget parities passed")
