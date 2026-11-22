import sys
def check(seq, n):
    m = (n-1)//2; N = len(seq)
    pos = {x: [j for j in range(N) if x in seq[j]] for x in range(n)}
    g = lambda x, j, s: ((pos[x][(pos[x].index(j)+s) % len(pos[x])] - j) * s) % N
    nA2 = nA4 = 0
    for j in range(N):
        a, b = tuple(seq[j])
        assert sorted((g(a, j, 1), g(b, j, 1))) == [m, m+1]; nA2 += 1
        if len(pos[a]) == len(pos[b]):   # A4 hypothesis generalised: same number of occurrences
            assert {(g(a, j, -1), g(a, j, 1)), (g(b, j, -1), g(b, j, 1))} == {(m+1, m), (m, m+1)}; nA4 += 1
    return nA2, nA4
for fn in sys.argv[2:]:
    n = int(sys.argv[1]); tot = [0, 0]; k = 0
    for line in open(fn):
        s = [frozenset(map(int, t.split('-'))) for t in line.split()]
        for r in range(len(s)):
            a, b = check(s[r:]+s[:r], n); tot[0] += a; tot[1] += b; k += 1
    print(fn, k, "rotations; A2 positions checked", tot[0], "; A4 positions checked", tot[1])
