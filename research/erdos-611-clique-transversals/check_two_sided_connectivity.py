"""Exact atlas checks for the two-sided connectivity reduction."""
from functools import lru_cache
import networkx as nx


def parts(mask):
    p = mask
    while p:
        yield p
        p = (p - 1) & mask


def check(g):
    n = len(g)
    full = (1 << n) - 1
    nbr = [sum(1 << y for y in g[x]) for x in range(n)]
    anti = [full ^ (1 << x) ^ nbr[x] for x in range(n)]

    def vertices(m):
        return (i for i in range(n) if m >> i & 1)

    @lru_cache(None)
    def data(m):
        maximal = []
        for s in parts(m):
            covered = s
            for v in vertices(s):
                if nbr[v] & s:
                    break
                covered |= nbr[v]
            else:
                if m & covered == m:
                    maximal.append(s)
        assert maximal
        return min(x.bit_count() for x in maximal), min(
            t.bit_count() for t in parts(m) if all(t & x for x in maximal)
        )

    def components(m, adjacency):
        while m:
            reached = m & -m
            while True:
                new = reached
                for x in vertices(reached):
                    new |= adjacency[x] & m
                if new == reached:
                    break
                reached = new
            yield reached
            m ^= reached

    ordinary = opposite = 0
    i, t = data(full)
    for m in parts(full):
        n_keep = m.bit_count()
        s = n - n_keep
        im, tm = data(m)
        assert im >= i-s
        c = list(components(m, nbr))
        if len(c) > 1:
            assert sum(data(x)[0] for x in c) == im
            assert all(data(x)[1] >= t-s for x in c)
            ordinary += 1
        c = list(components(m, anti))
        if len(c) > 1:
            assert all(data(x)[0] >= i-s for x in c)
            assert sum(data(x)[1] for x in c) == tm
            assert tm >= t-s
            opposite += 1

    # The square of the score is rational; maximize by cross-multiplication.
    h, hn, hd = 0, 0, 1
    for m in parts(full):
        im, tm = data(m)
        p, q = (im * tm)**2, m.bit_count()**3
        if p * hd > hn * q:
            h, hn, hd = m, p, q
    k = h.bit_count()
    a_num, a_den = i*t, n*n
    assert k*a_den**2 >= a_num**2*n
    ih, th = data(h)
    assert ih*th*a_den >= a_num*k*k
    for m in parts(h):
        if (k-m.bit_count())*16*a_den**2 <= a_num**2*k:
            assert len(list(components(m, nbr))) == 1
            assert len(list(components(m, anti))) == 1
    return ordinary, opposite


def main():
    graphs = ordinary = opposite = 0
    for g in nx.graph_atlas_g():
        if not g:
            continue
        a, b = check(g)
        graphs += 1
        ordinary += a
        opposite += b
    print(f"{graphs} graphs, {ordinary} graph separator inequalities, "
          f"{opposite} complement separator inequalities")


if __name__ == "__main__":
    main()
