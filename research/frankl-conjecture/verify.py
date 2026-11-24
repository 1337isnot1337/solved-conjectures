"""Replay the deleted-family witnesses and the two-block augmentation obstruction."""

from itertools import combinations


def union_closed(family):
    return all((a | b) in family for a, b in combinations(family, 2))


def incidences(sets, n):
    return tuple(sum(bool(s & (1 << i)) for s in sets) for i in range(n))


def check_order(ambient, order):
    remaining = set(ambient)
    assert union_closed(remaining)
    for member in order:
        remaining.remove(member)
        assert union_closed(remaining), (order, member)
    return remaining


def check_example(point, initial, pair, final, ideal, original, shortened, failure):
    a = set(range(1, 8))
    bit = 1 << point
    assert pair[0] & bit == final[0] & bit == 0
    assert pair[1] & bit and final[1] & bit
    assert [bool(s & bit) for s in initial] == sorted(bool(s & bit) for s in initial)
    assert [bool(s & bit) for s in ideal] == sorted(bool(s & bit) for s in ideal)
    assert check_order(a, initial + pair + final) == check_order(a, ideal + final)
    assert incidences(initial + pair + final, 3) == original
    assert original[point] == min(original)
    assert incidences(initial + final, 3) == shortened
    if failure == "minimum":
        check_order(a, initial + final)
        assert shortened[point] > min(shortened)
    else:
        assert shortened[point] == min(shortened)
        after = check_order(a, initial + final[:1]) - {final[1]}
        assert 2 in after and 4 in after and (2 | 4) not in after


def main():
    check_example(0, (2, 1), (4, 5), (6, 3), (2, 4, 1, 5), (3, 3, 3), (2, 3, 1), "minimum")
    check_example(2, (1,), (2, 4), (3, 6), (1, 2, 4), (2, 3, 2), (2, 2, 1), "closure")
    prior = check_order(range(1, 8), (1,))
    assert not union_closed(prior - {6})
    for width in (3, 4):
        low, full = (1 << width) - 1, (1 << (2 * width)) - 1
        family = {0, low, full ^ low, full}
        assert union_closed(family)
        assert all(
            a & b or not union_closed(family | {a, b})
            for a, b in combinations(set(range(full + 1)) - family, 2)
        )
    print("Both quasiminimality failures and the two-block obstruction replayed exactly.")


if __name__ == "__main__":
    main()
