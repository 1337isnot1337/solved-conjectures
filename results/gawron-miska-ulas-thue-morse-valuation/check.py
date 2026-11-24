"""Exact recurrence and independent factor-product checks."""
from math import comb


def recurrence(m, cap, q=None):
    a = [1] + [0] * cap
    c = [(-1)**j * comb(m, j) for j in range(m + 1)]
    if q is not None:
        c = [x % q for x in c]
    for n in range(1, cap + 1):
        x = sum(c[j] * a[(n-j)//2] for j in range(n%2, min(m, n)+1, 2))
        a[n] = x if q is None else x % q
    return a


def product(m, cap, q=None):
    a = [1] + [0] * cap
    c = [(-1)**j * comb(m, j) for j in range(m + 1)]
    if q is not None:
        c = [x % q for x in c]
    step = 1
    while step <= cap:
        b = [0] * (cap + 1)
        for j in range(min(m, cap//step) + 1):
            coeff = c[j]
            if coeff:
                for n in range(j*step, cap + 1):
                    b[n] += coeff * a[n - j*step]
        a = b if q is None else [x % q for x in b]
        step *= 2
    return a


if __name__ == "__main__":
    a = recurrence(17, 504)
    assert a == product(17, 504)
    assert a[503:] == [-382073745322860227067904, -98392455150140920430592]
    assert [(abs(x) & -abs(x)).bit_length()-1 for x in a[503:]] == [18, 19]
    a = recurrence(2049, 6400, 4096)
    assert a == product(2049, 6400, 4096)
    assert a[6399:] == [2048, 3072]
    print("Both witnesses checked by recurrence and independent product.")
