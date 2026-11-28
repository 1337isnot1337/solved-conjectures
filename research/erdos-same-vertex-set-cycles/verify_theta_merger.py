"""Check abstract theta-merger pairings and matching-label constraints."""
from collections import Counter, defaultdict


def components(edges):
    adj = defaultdict(list)
    for u, v in edges:
        adj[u].append(v)
        adj[v].append(u)
    pending = set(adj)
    out = []
    while pending:
        x = pending.pop()
        comp, stack = [x], [x]
        while stack:
            for y in adj[stack.pop()]:
                if y in pending:
                    pending.remove(y)
                    comp.append(y)
                    stack.append(y)
        out.append(comp)
    return adj, out


def involution(edges):
    mate = {}
    for u, v in edges:
        assert u != v and u not in mate and v not in mate
        mate[u], mate[v] = v, u
    return mate


def pairing(edges, ports):
    adj, cc = components(edges)
    assert set(ports) == {u for u, nbrs in adj.items() if len(nbrs) == 1}
    out = []
    for comp in cc:
        pair = [u for u in comp if u in ports]
        assert len(pair) == 2
        out.append(tuple(pair))
    return out


def common_cross(p, q, left, right):
    p, q = involution(p), involution(q)
    chosen = []
    # Equal-sign cross case of the contraction lemma; n=1 is allowed abstractly.
    def remove(mate, u, v):
        a, b = mate[u], mate[v]
        assert a != v and b != u
        del mate[u], mate[v]
        mate[a], mate[b] = b, a

    while len(left) > 1:
        u = min(left)
        v = next(w for w in sorted(right) if w not in (p[u], q[u]))
        chosen.append((u, v))
        remove(p, u, v)
        remove(q, u, v)
        left.remove(u)
        right.remove(v)
    chosen.append((left.pop(), right.pop()))
    return chosen


def check(g):
    lo = 2*(g//4)
    hi = g-lo
    e, side = {}, {0: 0, 1: 0}
    long_ports, isolates = {0, 1}, []
    nxt = 2
    for pair, length in [((1, 2), hi), ((2, 3), lo), ((3, 1), hi)]:
        inner = list(range(nxt, nxt+length-1))
        nxt += length-1
        side.update({u: i % 2 for i, u in enumerate(inner, 1)})
        if pair == (2, 3):
            isolates.extend(inner)
        else:
            long_ports.update(inner)
        path = [0] + inner + [1]
        for i, (u, v) in enumerate(zip(path[:-1], path[1:], strict=True)):
            e[tuple(sorted((u,v)))] = (pair[i%2], pair[1-i%2])
    assert len(e) == 2*((3*g+3)//4)
    deficits = [defaultdict(set), defaultdict(set)]
    red, blue = [], []
    for state in range(2):
        red.append([uv for uv, cs in e.items() if cs[state] == 1])
        blue.append([uv for uv, cs in e.items() if cs[state] in (2,3)])
        for uv, cs in e.items():
            for u in uv:
                assert cs[state] not in deficits[state][u]
                deficits[state][u].add(cs[state])
    assert deficits[0] == deficits[1]
    p, q = map(involution, red)
    assert len(components(red[0]+red[1])[1]) == 1
    # On left ports the relative permutation p^{-1}q is p(q(u)).
    def step(u):
        return p[q[u]]

    rr = [(u, p[step(step(u))]) for u in sorted(long_ports) if side[u] == 0]
    assert len(components(red[0]+rr)[1]) == 2
    assert len(components(red[1]+rr)[1]) == 1
    rr_stubs = []
    for i, (u, v) in enumerate(rr):
        verts = [u] + (isolates if i == 0 else []) + [v]
        rr_stubs.extend(((a, 4 if side[a] == 0 else 1), (b, 4 if side[b] == 1 else 1))
                        for a,b in zip(verts[:-1],verts[1:],strict=True))
    ports = long_ports - {0, 1}
    bp, bq = [pairing(b, ports) for b in blue]
    miss = {u: next(iter({2,3}-deficits[0][u])) for u in ports}
    typ = {u: side[u] ^ (miss[u]-2) for u in ports}
    assert all(typ[u] != typ[v] for u,v in bp+bq)
    assert len(components(bp+bq)[1]) == 1
    bk = common_cross(bp,bq,{u for u in ports if typ[u]==0},{u for u in ports if typ[u]==1})
    assert len(components(bp+bk)[1]) == len(components(bq+bk)[1]) == 1
    bk_stubs = [((a,miss[a]),(b,miss[b])) for a,b in bk]
    for (a,ca),(b,cb) in rr_stubs+bk_stubs:
        assert a != b and ((side[a] != side[b]) == (ca == cb))
    observed = Counter(stub for pair in rr_stubs+bk_stubs for stub in pair)
    assert observed == Counter((u,c) for u in side for c in {1,2,3,4}-deficits[0][u])
    def imbalance(routes):
        return sum(1 if side[u]==0 else -1 for pair in routes for u,_ in pair)
    assert imbalance(rr_stubs) == imbalance(bk_stubs)


if __name__ == "__main__":
    for girth in range(4,202,2):
        check(girth)
    print("Verified theta port orders, matching labels and component counts for 99 even girths.")
