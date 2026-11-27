"""Check both chronological roles and the first free coordinate for finite disjoint types."""
from itertools import combinations


def merge(zeros, ones):
    assert not set(zeros).intersection(ones)
    return tuple(role for _, role in sorted([(v, 0) for v in zeros] + [(v, 1) for v in ones]))


def stretches(word):
    zeros = [i for i, digit in enumerate(word) if digit == 0]
    ones = [i for i, digit in enumerate(word) if digit == 1]
    depth = sum(i < zeros[-1] for i in ones)
    fixed_ones = ones[:depth]
    n = len(zeros)
    if depth:
        assert fixed_ones[-1] < zeros[-1]
        assert all(point < ones[-1] for point in zeros[:depth])
    assert all(point < ones[-1] for point in zeros)
    for threshold in (0, 7, 31, 256):
        start = max(zeros[-1], threshold) + 1
        early = fixed_ones + list(range(start, start + n - depth + 1))
        assert early[depth] > threshold and early[n] > threshold
        assert merge(zeros, early[:n]) == word
        assert merge(early[:n], zeros) == tuple(1 - digit for digit in word)
    return depth


def main():
    words = 0
    separated = 0
    for n in range(1, 10):
        for positions in combinations(range(2*n-1), n):
            zeros = set(positions)
            word = tuple(int(i not in zeros) for i in range(2*n))
            depth = stretches(word)
            words += 1
            separated += depth == 0
    print(f'Checked {words:,} normalized words through width 9, both chronological orders and four tail thresholds.')
    print(f'Covered {separated} separated words with depth zero.')


if __name__ == '__main__':
    main()
