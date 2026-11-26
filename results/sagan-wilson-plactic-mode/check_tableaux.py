"""Cross-check the length-ten plactic counterexample by RSK row insertion."""
from bisect import bisect_right
from collections import Counter
from itertools import product

from check import binomial_coeffs, counts


def tableau(word):
    rows = []
    for letter in word:
        for row in rows:
            position = bisect_right(row, letter)
            if position == len(row):
                row.append(letter)
                break
            row[position], letter = letter, row[position]
        else:
            rows.append([letter])
    return rows


def step(state, letter):
    if letter == 1:
        return state[1:]
    position = bisect_right(state, letter)
    return state[:position] + (letter,) + state[position + 1:]


def centralizer_counts(m, length):
    layer = Counter({(): 1})
    result = [1]
    for _ in range(length):
        following = Counter()
        for state, multiplicity in layer.items():
            for letter in range(1, m + 1):
                following[step(state, letter)] += multiplicity
        layer = following
        result.append(layer[()])
    return result


def main():
    words_checked = 0
    for m in range(1, 5):
        actual = centralizer_counts(m, 6)
        for n in range(7):
            count = 0
            for word in product(range(1, m + 1), repeat=n):
                state = ()
                for letter in word:
                    state = step(state, letter)
                commutes = tableau((1,) + word) == tableau(word + (1,))
                assert commutes == (not state), (word, state)
                count += commutes
                words_checked += 1
            assert count == actual[n]
    samples = [0] + [centralizer_counts(m, 10)[10] for m in range(1, 11)]
    assert samples == counts(10)
    coefficients = binomial_coeffs(samples)
    assert coefficients == [0, 1, 250, 4917, 29648, 75095, 88704, 43414, 4861, 1, 0]
    print(f"{words_checked:,} words checked by full tableau insertion; all ten alphabet counts and the binomial row agree")
    print(samples[1:])
    print(coefficients[1:-1])


if __name__ == "__main__":
    main()
