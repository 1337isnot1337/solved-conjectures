"""Exact elementary graph-metric diagnostics for the AMRZ conjecture.

This is a research tool, not a proof of the conjecture. No dependencies.
"""
from collections import deque
from itertools import combinations, product
import json


def graph(n, edges):
    adj = [set() for _ in range(n)]
    for u, v in edges:
        assert 0 <= u < n and 0 <= v < n and u != v
        adj[u].add(v)
        adj[v].add(u)
    return adj


def edges(g):
    return [(u, v) for u, ns in enumerate(g) for v in sorted(ns) if u < v]


def distances(g):
    n = len(g)
    ds = []
    for u in range(n):
        row = [-1] * n
        row[u] = 0
        q = deque([u])
        while q:
            v = q.popleft()
            for w in g[v]:
                if row[w] == -1:
                    row[w] = row[v] + 1
                    q.append(w)
        if -1 in row:
            return None
        ds.append(row)
    return ds


def metric_lines(g):
    d = distances(g)
    assert d is not None, 'connected graphs only'
    lines = {}
    for u, v in combinations(range(len(g)), 2):
        mask = sum(1 << w for w in range(len(g))
                   if d[u][v] == d[u][w] + d[w][v]
                   or d[u][w] == d[u][v] + d[v][w]
                   or d[v][w] == d[v][u] + d[u][w])
        lines.setdefault(mask, []).append((u, v))
    return lines


def bridges(g):
    tin = [-1] * len(g)
    low = [-1] * len(g)
    out = []
    tick = 0
    def dfs(v, p):
        nonlocal tick
        tin[v] = low[v] = tick
        tick += 1
        for w in g[v]:
            if w == p:
                continue
            if tin[w] != -1:
                low[v] = min(low[v], tin[w])
            else:
                dfs(w, v)
                low[v] = min(low[v], low[w])
                if low[w] > tin[v]:
                    out.append(tuple(sorted((v, w))))
    for v in range(len(g)):
        if tin[v] == -1:
            dfs(v, -1)
    return sorted(out)


def invariant(g):
    n = len(g)
    ls = metric_lines(g)
    bs = bridges(g)
    return dict(n=n, m=len(edges(g)), lines=len(ls), bridges=len(bs),
                pendant=sum(len(ns) == 1 for ns in g), gap=len(ls)+len(bs)-n)


def cycle(n):
    return graph(n, [(u, (u+1) % n) for u in range(n)])


def multipartite(parts):
    labels = [i for i, size in enumerate(parts) for _ in range(size)]
    return graph(len(labels), [(u, v) for u, v in combinations(range(len(labels)), 2)
                               if labels[u] != labels[v]])


def join_bridge(g, a, h, b, length=1):
    assert length >= 1
    n, m = len(g), len(h)
    path = [a] + list(range(n+m, n+m+length-1)) + [n+b]
    return graph(n+m+length-1, edges(g)+[(n+u,n+v) for u,v in edges(h)]+list(zip(path,path[1:])))


def identify(g, a, h, b):
    n, m = len(g), len(h)
    mp = {b:a}
    for i, u in enumerate(v for v in range(m) if v != b):
        mp[u] = n+i
    return graph(n+m-1, edges(g)+[(mp[u],mp[v]) for u,v in edges(h)])


def subdivide(g, edge):
    u,v=edge
    return graph(len(g)+1,[e for e in edges(g) if e!=tuple(sorted(edge))]+[(u,len(g)),(v,len(g))])


def labeled_graphs(n):
    pairs=list(combinations(range(n),2))
    for mask in range(1<<len(pairs)):
        yield graph(n,[e for i,e in enumerate(pairs) if mask>>i&1])


def basic_families(max_n=12):
    def partitions(n, smallest=1):
        if n == 0:
            yield ()
        for i in range(smallest,n+1):
            for rest in partitions(n-i,i):
                yield (i,)+rest
    for n in range(3,max_n+1):
        # C3 and C4 already occur among complete multipartite graphs.
        if n >= 5:
            yield 'C'+str(n),cycle(n)
        for parts in partitions(n):
            if len(parts)>=2 and n-max(parts)>=2:
                yield 'K'+str(parts),multipartite(parts)


def main():
    # Pick roots in all isomorphism classes of multipartite parts, and every
    # vertex of cycles. No randomization or floating-point arithmetic.
    families=list(basic_families(9))
    best=[]
    for name,g in families:
        info=invariant(g)
        if info['gap']<0:
            best.append((name,g,info))
    print(json.dumps({'deficient_basic_blocks':[(name,info) for name,g,info in best]},sort_keys=True))
    count=0
    low=[]
    for i,(name,g,info) in enumerate(best):
        for other,h,hinfo in best[i:]:
            for a,b in product(range(len(g)),range(len(h))):
                joined=join_bridge(g,a,h,b)
                info2=invariant(joined)
                count+=1
                low.append((info2['gap'],name,a,other,b,info2))
                if info2['gap']<0:
                    print(json.dumps({'candidate':(name,a,other,b),'info':info2,'edges':edges(joined)}),flush=True)
    print(json.dumps({'bridge_compositions':count,'minimum_gap':min(x[0] for x in low),
                      'one_minimizer':sorted(low)[0]},sort_keys=True))


if __name__=='__main__':
    main()
