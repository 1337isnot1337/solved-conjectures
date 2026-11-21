"""Explore exact last-row replacements in the triangular sign family."""
from itertools import product
from binary_kernels import permanent, determinant


def cofactors_top(n):
    a = [[1 if i >= j else -1 for j in range(n)] for i in range(1, n)]
    dp = [0] * (1 << n)
    dp[0] = 1
    for mask in range(1, (1 << n) - 1):
        r = mask.bit_count() - 1
        t = mask
        v = 0
        while t:
            bit = t & -t
            v += a[r][bit.bit_length() - 1] * dp[mask ^ bit]
            t -= bit
        dp[mask] = v
    return [dp[((1 << n) - 1) ^ (1 << j)] for j in range(n)]


def signs_for_sum(values, goal):
    half = len(values) // 2
    first = {}
    for signs in product((-1, 1), repeat=half):
        first[sum(a * b for a, b in zip(values[:half], signs))] = signs
    for signs in product((-1, 1), repeat=len(values) - half):
        rest = goal - sum(a * b for a, b in zip(values[half:], signs))
        if rest in first:
            return first[rest] + signs
    return None


def main():
    for n in range(3, 21):
        p = cofactors_top(n)
        target = 1 << (n - 1)
        fixed = p[0] - p[1]
        signs = signs_for_sum(p[2:], target - fixed)
        if signs is None:
            signs = signs_for_sum(p[2:], -target - fixed)
        print(n, p, "target", target, "signs", signs, flush=True)
        if signs is not None:
            a = [[1 if i >= j else -1 for j in range(n)] for i in range(n)]
            a[0] = [1, -1] + list(signs)
            assert abs(permanent(a)) == abs(determinant(a)) == target


if __name__ == "__main__":
    main()
