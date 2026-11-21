"""Determine all rational dependencies among three distinct 12-letter factors."""
from itertools import combinations

RULE = {"1": "12", "2": "23", "3": "14", "4": "32"}


def image(word):
    return "".join(RULE[c] for c in word)


def factors(length):
    pairs = set(RULE.values())
    while True:
        next_pairs = pairs | {RULE[x][-1] + RULE[y][0] for x, y in pairs}
        if next_pairs == pairs:
            break
        pairs = next_pairs
    words = pairs
    while min(map(len, words)) < 2*length:
        words = {image(word) for word in words}
    return sorted({tuple(map(int, word[k:k+length]))
                   for word in words for k in range(len(word)-length+1)})


def main():
    short = factors(12)
    assert len(short) == 77 and all(set(u) == {1, 2, 3, 4} for u in short)
    exceptions = []
    for u, v, w in combinations(short, 3):
        j = next(j for j in range(1, 12) if u[0]*v[j] != u[j]*v[0])
        a = w[0]*v[j] - w[j]*v[0]
        b = u[0]*w[j] - u[j]*w[0]
        d = u[0]*v[j] - u[j]*v[0]
        if all(a*x + b*y == d*z for x, y, z in zip(u, v, w)):
            exceptions.append((u, v, w))
            assert u[2:] == v[2:] == w[2:]
    assert len(exceptions) == 4
    for triple in exceptions:
        print(*( "".join(map(str, word)) for word in triple))


if __name__ == "__main__":
    main()
