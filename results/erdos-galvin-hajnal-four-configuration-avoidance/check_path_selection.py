"""Finite checks for the one-Cohen path rule. Python 3, no dependencies.

The stationary guessing and forcing arguments are not tested here.
"""
from itertools import combinations
from random import Random

def unique_paths(n, edges):
    for start in range(n):
        count = [0] * n
        count[start] = 1
        for x in range(start, n):
            for y in range(x + 1, n):
                if (x, y) in edges:
                    count[y] += count[x]
                    if count[y] > 1:
                        return False
    return True

def forbidden(edges):
    for x, y, z in combinations(edges, 3):
        ints = (x & y, x & z, y & z)
        overlap = sorted(map(len, ints))
        if overlap == [1, 1, 1] and not x & y & z:
            return "T1"
        if len(x | y | z) == 4:
            return "T3"
        if overlap == [1, 2, 2] and len(x & y & z) == 1 and len(x | y | z) == 5:
            return "T4"
        for a,b,c in ((x,y,z),(x,z,y),(y,z,x)):
            common = a & b
            if len(common) == 2 and not common & c and (a | b) - common <= c:
                return "T9"
    return None

def check_patterns(n):
    triples = tuple(combinations(range(n), 3))
    count = 0
    def visit(start, base, top, selected):
        nonlocal count
        count += 1
        assert forbidden(selected) is None
        for j in range(start, len(triples)):
            a,b,c = triples[j]
            lower, upper = (a,b), (b,c)
            if lower in top or upper in top or upper in base:
                continue
            next_base, next_top = base | {lower}, top | {upper}
            if not unique_paths(n,next_base | next_top):
                continue
            visit(j+1,next_base,next_top,selected+(frozenset((a,b,c)),))
    visit(0,set(),set(),())
    return count

NEUTRAL = (0, "base", 0)

def check_slots(repeats):
    rng = Random(10592026)
    for _ in range(repeats):
        a,b,c = 53,73,101
        m = rng.randrange(1,10)
        code_b = "0"*20 + "1"
        code_c = "0"*20 + "0"
        codes = {b: code_b, c: code_c}
        q = {}
        for _ in range(rng.randrange(25)):
            stage=rng.randrange(m)
            if rng.randrange(2):
                q[("N",stage)]=rng.randrange(22)
            else:
                prefix=rng.choice(tuple(codes.values()))[:rng.randrange(22)]
                q[("R",stage,prefix)] = (rng.randrange(18),rng.choice(("base","top")),rng.randrange(m))
        p=dict(q)
        for stage in range(m):
            length=p.setdefault(("N",stage),rng.randrange(22))
            for vertex in (b,c):
                p.setdefault(("R",stage,codes[vertex][:length]),NEUTRAL)
        p[("N",m)] = 21
        p[("R",m,code_b)] = (a,"base",0)
        p[("R",m,code_c)] = NEUTRAL
        p[("N",m+1)] = 21
        p[("R",m+1,code_c)] = (b,"top",m)
        p[("R",m+1,code_b)] = NEUTRAL
        assert all(p[key]==old for key,old in q.items())
        def h(x):
            return {a:40,b:24,c:2}.get(x,x//2)
        accepted = {b:{}, c:{}}
        for vertex in (b,c):
            for stage in range(m+2):
                length = p[("N",stage)]
                pred,mode,selector = p[("R",stage,codes[vertex][:length])]
                previous = [record[0] for record in accepted[vertex].values()]
                if 0 < pred < vertex and pred>stage and h(pred)>max([h(vertex), *previous]):
                    accepted[vertex][stage] = (pred,mode,selector)
        assert accepted[b][m][:2] == (a,"base")
        assert accepted[c][m+1] == (b,"top",m)

if __name__ == "__main__":
    counts = [(n,check_patterns(n)) for n in range(3,8)]
    check_slots(5000)
    print(f"ordered selected-path hypergraphs checked: {counts}")
    print("seeded two-vertex finite slot extensions: 5000")
