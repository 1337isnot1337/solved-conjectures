"""Compute the three counterexample ranks for McNamara--Steingrimsson 9.4."""

from math import comb


def convolve(left, right):
    result = [0] * (len(left) + len(right) - 1)
    for i, a in enumerate(left):
        for j, b in enumerate(right):
            result[i + j] += a * b
    return result


def add_shifted(target, source, shift, factor=1):
    for index, coefficient in enumerate(source, start=shift):
        target[index] += factor * coefficient


def uniform_layer_downset(num_layers):
    # A word of l layers, s of size 2, has weight l+s.
    result = [0] * (2 * num_layers + 1)
    for length in range(num_layers + 1):
        for twos in range(length + 1):
            result[length + twos] += comb(length, twos)
    return result


def periodic_layer_downset(periods):
    # Host (1,1,1,2)^periods followed by a 1. If r twos are selected
    # and the last matches at position 4a, the r preceding runs of
    # ones have quotients summing to a-r when divided by 4.
    num_layers = 4 * periods + 1
    result = [0] * (num_layers + periods + 1)
    add_shifted(result, [1] * (num_layers + 1), 0)
    residues = [1]
    for twos in range(1, periods + 1):
        residues = convolve(residues, [1, 1, 1, 1])
        for last in range(twos, periods + 1):
            trailing_ones = [1] * (num_layers - 4 * last + 1)
            term = convolve(residues, trailing_ones)
            add_shifted(result, term, 4 * last - 2 * twos, comb(last - 1, twos - 1))
    return result


def with_leading_maximum(layered_downset):
    # Overlap occurs at the decreasing patterns of lengths 1 and 2.
    result = convolve(layered_downset, [1, 1])
    result[1] -= 1
    result[2] -= 1
    return result


def main():
    num_layers = 33
    num_periods = 8
    copies = 1628
    f_pi = with_leading_maximum(uniform_layer_downset(num_layers))
    f_alpha = with_leading_maximum(periodic_layer_downset(num_periods))
    free_layers = num_layers - num_periods
    g = convolve(f_alpha[:-1], [comb(free_layers, j) for j in range(free_layers + 1)])

    assert len(f_pi) - 1 == 67 and f_pi[-1] == 1
    assert len(f_alpha) - 1 == 42 and f_alpha[-1] == 1
    assert len(g) == 67

    ranks = (44, 45, 46)
    values = tuple(copies * f_pi[r] + g[r] for r in ranks)
    print("rank       F_pi[r]                 G[r]                  interval rank size")
    for r, value in zip(ranks, values):
        print(f"{r:>4} {f_pi[r]:>17} {g[r]:>22} {value:>28}")

    assert values == (8598793292661, 8598464986146, 8599053474845)
    assert values[0] > values[1] < values[2]


if __name__ == "__main__":
    main()
