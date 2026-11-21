"""Exact checks for partial_diagonal_nonbarycentric.md; not a substitute for proof."""

from math import comb, factorial


def avoiding(n, k):
    return sum((-1) ** r * comb(k, r) * factorial(n-r)
               for r in range(k+1))


def permanent(a):
    n = len(a)
    dp = [0] * (1 << n)
    dp[0] = 1
    for mask in range(1 << n):
        row = mask.bit_count()
        if row == n or not dp[mask]:
            continue
        for col in range(n):
            if not (mask >> col) & 1 and a[row][col]:
                dp[mask | (1 << col)] += dp[mask] * a[row][col]
    return dp[-1]


def cofactor(a, i, j):
    return permanent([[x for c, x in enumerate(row) if c != j]
                      for r, row in enumerate(a) if r != i])


def main():
    count = 0
    for n in range(2, 51):
        for j in range(n-1):
            delta = avoiding(n, j)*avoiding(n, j+2) - avoiding(n, j+1)**2
            assert delta != 0
            assert (delta < 0) == (n == 3 and j == 1)
            if j == 0:
                assert delta == (n-1)*factorial(n-2)**2
            elif j == 1:
                assert delta == (n-2)*(n*n-5*n+5)*factorial(n-3)**2
            else:
                s = n-j
                for t in (s-2, s-1, s):
                    assert avoiding(n, n-t) == sum(
                        comb(t, r)*avoiding(n-r, n-r) for r in range(t+1))
            count += 1
    print(f"Checked {count} exact determinants through N=50; only negative case (3,1).")

    count = 0
    for n in range(3, 11):
        for k in range(2, n):
            a = [[int(i != j or i >= k) for j in range(n)] for i in range(n)]
            m = avoiding(n, k)
            assert permanent(a) == m
            aa, bb, cc = [avoiding(n-1, q) for q in (k-2, k-1, k)]
            assert cofactor(a, 0, 1) == aa
            assert cofactor(a, 0, k) == bb
            assert cofactor(a, k, k) == cc
            h = [[0 if i == j and i < k else
                  aa if i < k and j < k else
                  bb if (i < k) != (j < k) else cc
                  for j in range(n)] for i in range(n)]
            assert all(sum(row) == m for row in h)
            assert all(sum(h[i][j] for i in range(n)) == m for j in range(n))
            # A supported square with rows 0,k and columns 1,k is feasible
            # in both directions at the barycenter. Its exact derivative is
            # nonzero in these checked examples, independently of the proof.
            gradient = cofactor(h, 0, 1) + cofactor(h, k, k) - 2*cofactor(h, 0, k)
            assert gradient != 0
            count += 1
    print(f"Checked {count} support permanents, cofactor classes, and nonzero barycenter derivatives through n=10.")


if __name__ == '__main__':
    main()
