"""Finite sanity checks for the sealed cohort forcing.

No transfinite assertion is checked here. Run under Python 3 without dependencies.
"""
from itertools import combinations, product
from random import Random

def edge(u, v):
    return tuple(sorted((u, v)))

def triples(vertices, edges):
    return {t for t in combinations(sorted(vertices), 3)
            if all(e in edges for e in combinations(t, 2))}

def flag_map(vertices, edges):
    out = {e: None for e in edges}
    pages = {e: [] for e in edges}
    for t in triples(vertices, edges):
        for e in combinations(t, 2):
            pages[e].append(next(v for v in t if v not in e))
    for e, pp in pages.items():
        low = [x for x in pp if x < max(e)]
        if low:
            if len(pp) != 1:
                return None
            out[e] = low[0]
    return out

def valid(vertices, edges, cohorts):
    for a, b, z in cohorts:
        if 0 < len({a, b, z} & vertices) < 3:
            return False
        if {a, b, z} <= vertices:
            for r in vertices:
                if r < a and edge(r, z) in edges and (
                    edge(r, a) in edges or edge(r, b) in edges
                ):
                    return False
    return flag_map(vertices, edges) is not None

def extends(old_vertices, old_edges, new_vertices, new_edges):
    return (old_vertices <= new_vertices
            and {e for e in new_edges if set(e) <= old_vertices} == old_edges
            and all(flag_map(old_vertices, old_edges)[e]
                    == flag_map(new_vertices, new_edges)[e] for e in old_edges))

def eligible_options(root, cohort):
    a, b, z = cohort
    vertices = root | {a,b,z}
    variable = sorted({edge(r,v) for r in root for v in cohort}
                      | set(combinations(sorted(root),2)))
    for bits in product((False, True), repeat=len(variable)):
        edges = {(a,b)} | {e for e, bit in zip(variable,bits) if bit}
        if valid(vertices,edges,[cohort]) and flag_map(vertices,edges)[(a,b)] is None:
            root_edges = tuple(e for e in variable if set(e) <= root and e in edges)
            profiles = tuple(tuple(r for r in sorted(root)
                                   if edge(r,v) in edges) for v in cohort)
            yield (root_edges,profiles),edges

def check():
    pair_checks = singleton_checks = 0
    for n in range(1,4):
        root = set(range(n))
        early, late = tuple(range(3,6)),tuple(range(6,9))
        vs, us = root | set(early), root | set(late)
        later = dict(eligible_options(root,late))
        for signature, es in eligible_options(root,early):
            fs = later[signature]
            both = es | fs
            add = {edge(early[0],late[2]),edge(early[1],late[2])}
            final = both | add
            oracle = triples(vs|us,final)-triples(vs|us,both)
            assert oracle == {(early[0],early[1],late[2])}
            assert valid(vs|us,final,[early,late])
            assert extends(vs,es,vs|us,final) and extends(us,fs,vs|us,final)
            pair_checks+=1
    rng = Random(92026)
    root = {0,1}
    for _ in range(5000):
        cohorts = [tuple(range(a,a+3)) for a in (3,6,9)]
        root_es = {(0,1)} if rng.randrange(2) else set()
        supports = [root | set(co) for co in cohorts]
        marks = [co[0] for co in cohorts]
        old = []
        for co,s in zip(cohorts,supports):
            candidates=[e for e in combinations(sorted(s),2)
                        if set(e) - root and not(set(e) & root and co[0] in e)]
            while True:
                es=root_es | {e for e in candidates if rng.randrange(2)}
                if valid(s,es,[co]) and all(flag_map(s,es)[e] is None for e in root_es):
                    break
            old.append(es)
        both=set.union(*old)
        final=both | set(combinations(marks,2))
        vertices=set.union(*supports)
        assert valid(vertices,final,cohorts)
        assert triples(vertices,final)-triples(vertices,both)=={tuple(marks)}
        assert all(extends(s,es,vertices,final) for s,es in zip(supports,old))
        singleton_checks+=1
    print(f"{pair_checks} exhaustive two-cohort profile checks; {singleton_checks} seeded three-cohort checks")

if __name__=="__main__":
    check()
