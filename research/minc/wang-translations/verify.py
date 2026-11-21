"""Exact checks of the orbit congruences in the accompanying note."""
from random import Random


def permanent(a):
    n = len(a)
    dp = [0] * (1 << n)
    dp[0] = 1
    for used in range(1, 1 << n):
        row = a[used.bit_count() - 1]
        rest = used
        total = 0
        while rest:
            bit = rest & -rest
            total += dp[used ^ bit] * row[bit.bit_length() - 1]
            rest ^= bit
        dp[used] = total
    return dp[-1]


def tensor(a, b):
    return [[x*y for x in r for y in s] for r in a for s in b]


def developed(f):
    q = len(f)
    return [[f[(j-i) % q] for j in range(q)] for i in range(q)]


def present_kernel(f):
    return [[1] * (len(f) + 1)] + [[1] + r for r in developed(f)]


def pgroup_tensor_tests():
    random = Random(101)
    for q, p in [(3, 3), (5, 5), (9, 3)]:
        for size in ([1, 2, 3] if q == 3 else [1, 2] if q == 5 else [1]):
            for _ in range(8):
                a = [[random.randrange(-3, 4) for _ in range(size)] for _ in range(size)]
                f = [random.randrange(-3, 4) for _ in range(q)]
                bordered = present_kernel(f)
                for row in bordered[1:]:
                    row[0] = -2
                bordered[0][1:] = [3] * q
                bordered[0][0] = -3
                lhs = permanent(tensor(a, bordered))
                rhs = (-3*sum(f))**size * permanent(a)**2
                assert (lhs-rhs) % p == 0
                split = (-3)**size * permanent(a) * permanent(tensor(a, developed(f)))
                assert (lhs-split) % q == 0


def paley_conference(q):
    if q == 9:
        # F_3[t]/(t^2+1), encoded by a + 3b.
        def sub(i, j):
            return (i % 3 - j % 3) % 3 + 3*((i//3 - j//3) % 3)
        def square(i):
            a, b = i % 3, i//3
            return (a*a-b*b) % 3 + 3*((2*a*b) % 3)
    else:
        def sub(i, j):
            return (i-j) % q
        def square(i):
            return i*i % q
    squares = {square(i) for i in range(1, q)}
    def character(a):
        return 0 if a == 0 else (1 if a in squares else -1)
    return [[0] + [1]*q] + [[1] + [character(sub(i, j)) for j in range(q)] for i in range(q)]


def paley_ii(q):
    c = paley_conference(q)
    h = []
    for top in (True, False):
        for i, row in enumerate(c):
            plus = [x + int(i == j) for j, x in enumerate(row)]
            minus = [x - int(i == j) for j, x in enumerate(row)]
            h.append(plus + minus if top else minus + [-x for x in plus])
    return h


def check_hadamard(h):
    for i, a in enumerate(h):
        for j, b in enumerate(h):
            assert sum(x*y for x, y in zip(a, b)) == len(h) * (i == j)


if __name__ == '__main__':
    pgroup_tensor_tests()
    h = present_kernel([-1, 1, -1])
    square = tensor(h, h)
    check_hadamard(square)
    p = permanent(square)
    assert (p-permanent(h)**2) % 3 == 0
    print('Tensor of two order-four factors:', p)
    for q in (5, 9):
        h = paley_ii(q)
        check_hadamard(h)
        perm = permanent(h)
        assert perm % q == 0
        print('Paley II, q =', q, 'permanent =', perm, 'quotient =', perm//q)
