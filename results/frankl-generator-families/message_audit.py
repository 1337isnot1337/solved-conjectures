"""Check the interpretation of boundary messages and canonical generator assignments."""
from itertools import product


def compare_pinned_tree():
    # 0 is the root, 1 and 2 its children, and 3 through 6 are the pinned leaves.
    children = ((1,2), (3,4), (5,6))
    def combine(triples):
        (a,b,c),(d,e,f) = triples
        return ((b+c)*(e+f), (a+b)*(d+e)-b*e, b*e)
    states = ((1,0,0),(0,1,0),(0,0,1))
    for pins in product(range(3), repeat=4):
        leaves = [states[x] for x in pins]
        message = combine([combine(leaves[:2]),combine(leaves[2:])])
        counts = [0,0,0]
        for interior in product((False,True),repeat=3):
            selected = interior + tuple(p == 0 for p in pins)
            if any(selected[i] and selected[j] for i,cs in enumerate(children) for j in cs):
                continue
            if any(p == 2 and not interior[1+j//2] for j,p in enumerate(pins)):
                continue
            if any(not (selected[i] or selected[0] or any(selected[j] for j in children[i]))
                   for i in (1,2)):
                continue
            state = 0 if selected[0] else 1 if any(interior[1:]) else 2
            counts[state] += 1
        assert tuple(counts) == message


def compare_fano_selections():
    edges = [sum(1 << ((i+d)%7) for d in (0,1,3)) for i in range(7)]
    unions = set()
    canonical = []
    bad = []
    for mask in range(128):
        union = 0
        for i,e in enumerate(edges):
            if mask & (1<<i):
                union |= e
        unions.add(union)
        missed = [i for i,e in enumerate(edges) if not mask & (1<<i) and e & union == e]
        bad.append(missed)
        if not missed:
            canonical.append(union)
    assert sorted(canonical) == sorted(unions)
    assert all(sum(i in b for b in bad) == 27 for i in range(7))


if __name__ == "__main__":
    compare_pinned_tree()
    compare_fano_selections()
    print("All 81 pinned boundary assignments and 128 Fano-plane selections passed.")
