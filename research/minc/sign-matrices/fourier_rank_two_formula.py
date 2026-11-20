"""Exact permanent of n I - J - w w*, w the full n-th root vector.

This is a structural identity, not a resolution of Chollet's conjecture.
"""
from math import comb, factorial


def permanent_fourier_complement_two(n):
    if n < 2:
        raise ValueError("n must be at least two")
    ans = 0
    for k in range(n // 2 + 1):
        c = n * comb(n-k, k) // (n-k)
        m = n - 2*k
        inner = sum(
            (-1)**h * n**(m-h) * factorial(m)//factorial(m-h)
            * factorial(k)**2 * comb(h+2*k+1, 2*k+1)
            for h in range(m+1)
        )
        ans += (-1)**k * c * inner
    return ans


if __name__ == "__main__":
    for n in range(3,31):
        print(n, permanent_fourier_complement_two(n))
