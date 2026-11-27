"""Independent exact regressions for the Boolean step in the unmarked profile transfer."""
from itertools import combinations
from random import Random


def parity_support(indices):
    support = 0
    for i in indices:
        support ^= 1 << i
    return support


def graph_test():
    tested = 0
    survivors = 0
    for n in range(1, 7):
        edges = tuple(combinations(range(n), 2))
        inside = {
            subset: sum(1 << j for j, (a, b) in enumerate(edges)
                        if subset >> a & 1 and subset >> b & 1)
            for subset in range(1, 1 << n)
        }
        expected = {0}
        for v in range(n):
            expected.add(sum(1 << j for j, edge in enumerate(edges) if v in edge))
        actual = set()
        for graph in range(1 << len(edges)):
            tested += 1
            if all((graph & covered).bit_count() in (0, subset.bit_count() - 1)
                   for subset, covered in inside.items()):
                actual.add(graph)
        assert actual == expected
        survivors += len(actual)
    return tested, survivors


def low_weight_relations(n, generators):
    subgroup = {0}
    for row in generators:
        subgroup |= {value ^ row for value in subgroup}
    rank = len(subgroup).bit_length()-1
    erased = 0
    for w in subgroup:
        if w.bit_count() <= 8:
            erased |= w
    assert erased.bit_count() <= 8*rank
    return subgroup, erased


def projection_test():
    rng = Random(315)
    pairs = cases = surviving_clean = 0
    for n, depth in [(6,1), (8,2), (12,3), (18,2), (23,4)]:
        monomials = [parity_support(c) for degree in range(5)
                     for c in combinations(range(n), degree)]
        for trial in range(15):
            # Include low-weight local checks as well as dense parity relations.
            rows = [parity_support(rng.sample(range(n), rng.choice((2, min(n, 9), n-1))))
                    for _ in range(depth)]
            subgroup, erased = low_weight_relations(n, rows)
            fibers = {}
            for monomial in monomials:
                key = min(monomial ^ v for v in subgroup)
                projected = monomial & ~erased
                if key in fibers:
                    assert fibers[key] == projected
                    pairs += 1
                fibers[key] = projected
            surviving_clean += n-erased.bit_count()
            cases += 1
    return cases, pairs, surviving_clean


def tree_profiles():
    # Each edge has its own binary place value, so an integer path length uniquely
    # identifies the actual underlying edge set. Every topology here is reduced.
    rng = Random(1030)
    trees = roots = recovered = 0
    for _ in range(110):
        graph = {0:[]}
        for i in range(1, 1 + rng.randint(3,5)):
            graph[0].append(i)
            graph[i] = [0]
        for __ in range(rng.randrange(9)):
            chosen = rng.choice([v for v, adj in graph.items() if len(adj)==1])
            for ___ in range(rng.randint(2,4)):
                new = len(graph)
                graph[new] = [chosen]
                graph[chosen].append(new)
        edges = [(v,u) for v,adj in graph.items() for u in adj if v<u]
        leaves = [v for v,adj in graph.items() if len(adj)==1]
        unit = {v:1<<i for i,v in enumerate(leaves)}
        lengths = {tuple(sorted(edge)):1<<j for j,edge in enumerate(edges)}
        dis = {}
        for v in graph:
            todo = [(v,-1,0)]
            while todo:
                x, par, val = todo.pop()
                dis[v,x] = val
                for y in graph[x]:
                    if y!=par:
                        todo.append((y,x,val+lengths[tuple(sorted((x,y)))]))
        weights={v:len(a)-2 for v,a in graph.items()}
        for o in leaves:
            roots += 1
            # All leaves except this original root have a two-label tag; all hubs
            # have the root unit tag. Hide zero, one or two actual rooted endpoints.
            tags={x:(0 if x==o else (unit[o] ^ unit.get(x,0))) for x in graph}
            hidden=rng.sample(list(graph),rng.randrange(3))
            subgroup,erased=low_weight_relations(len(leaves),[tags[x] for x in hidden])
            for root_tag in (unit[o],):
                for x in leaves:
                    if unit[x]&erased or unit[x]==root_tag:
                        continue
                    by_fiber={}
                    by_leaf={0:-1}
                    for u,v in combinations(graph,2):
                        projected=(tags[u]^tags[v]) & ~erased
                        target=(unit.get(u,0)^unit.get(v,0)) & ~erased
                        assert projected==target
                        if projected & unit[x]:
                            by_fiber[dis[u,v]]=-weights[u]*weights[v]
                        if x in (u,v):
                            other=v if u==x else u
                            by_leaf[dis[u,v]]=weights[other]
                    by_fiber[0]=-1
                    assert by_fiber==by_leaf
                    first=min(a for a in by_fiber if a)
                    parent=graph[x][0]
                    assert first==dis[x,parent] and by_fiber[first]==weights[parent]
                    recovered += 1
        trees += 1
    return trees,roots,recovered


if __name__=='__main__':
    print('Saturated simple graphs (tested, expected stars or empty):',graph_test())
    print('Boolean projection (codes, coincident monomials, clean coordinates):',projection_test())
    print('Formal-length trees (trees, leaf roots, restored leaf profiles):',tree_profiles())
