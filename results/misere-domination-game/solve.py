#!/usr/bin/env python3
"""Exact misère domination outcomes for paths, cycles, and sums of bordered runs."""
import argparse


def heap_previous_wins(heaps):
    """Return True for a P-position in impartial misère octal 0.337."""
    total = weight = count = largest = 0
    for h in heaps:
        if h < 0:
            raise ValueError("heap lengths must be nonnegative")
        total += h
        if h in (0, 1, 4, 5):
            continue
        c = 1 if h <= 3 else h // 2 - 2
        t = 5 if h % 2 else 3
        score = 2*c-t
        largest = max(largest, score) if count else score
        count += 1
        weight += c
    if total % 2:
        return count == 0
    if count == 0:
        return False
    if count == 1 or weight % 2:
        return weight % 2 == 1 and largest >= weight
    return largest <= weight-3


def path_first_wins(n):
    if n < 1:
        raise ValueError("a nonempty path has at least one vertex")
    return n not in (1, 5) and n % 4 != 2


def cycle_first_wins(n):
    if n < 3:
        raise ValueError("a simple cycle has at least three vertices")
    return n in (4, 8) or (n >= 13 and n % 4 == 1)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("kind", choices=("path", "cycle", "heaps"))
    parser.add_argument("sizes", nargs="*", type=int)
    args = parser.parse_args()
    if args.kind == "heaps":
        first = not heap_previous_wins(args.sizes)
    else:
        if len(args.sizes) != 1:
            parser.error("give one order for a path or cycle")
        first = (path_first_wins if args.kind == "path" else cycle_first_wins)(args.sizes[0])
    print("first player wins" if first else "second player wins")


if __name__ == "__main__":
    main()
