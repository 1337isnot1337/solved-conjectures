"""Exact ordinary-CSF tests for recognition by pendant leaves at the centroid."""
from collections import Counter
from functools import cache
from math import comb

from verify_centroid import forest_polynomial, quotient, truncate
from verify_centroid_edge import edges_at_root, require, rooted_shapes


@cache
def order(tree):
    return 1 + sum(map(order, tree))


def rerootings(tree):
    neighbors = [[] for _ in range(order(tree))]
    for a, b in edges_at_root(tree):
        neighbors[a].append(b)
        neighbors[b].append(a)

    def shape(v, parent):
        return tuple(sorted(shape(w, v) for w in neighbors[v] if w != parent))
    return [shape(v, -1) for v in range(len(neighbors))]


def product(a, b):
    out = Counter()
    for u, c in a.items():
        for v, d in b.items():
            out[tuple(sorted(u+v))] += c*d
    return {m:c for m,c in out.items() if c}


@cache
def star_coordinates(k):
    return {tuple(sorted((h,)+(1,)*(k-h))): (-1)**(k-h)*comb(k-1,h-1)
            for h in range(1,k+1)}


@cache
def expanded(m):
    if not m:
        return {():1}
    return product(expanded(m[:-1]), star_coordinates(m[-1]))


def leaf_counts(ordinary):
    out = Counter()
    for m, c in ordinary.items():
        for star, v in expanded(m).items():
            out[star] += c*v
    leading = min(tuple(reversed(s)) for s,c in out.items() if c)
    return Counter(k-1 for k in leading)


def degrees(ordinary, n):
    histogram = Counter()
    for term, c in ordinary.items():
        singles = term.count(1)
        free = n-len(term)
        for e in range(free+1):
            histogram[n-1-e] += singles*c*comb(free,e)*(-1)**(free-e)
    return +histogram


def restored(poly, n):
    out = Counter()
    for term, c in poly.items():
        out[tuple(sorted(term+(n-sum(term),)))] += c
    return dict(out)


def forest(tree, rooted=False):
    return forest_polynomial(tuple(range(order(tree))),edges_at_root(tree),0 if rooted else None)


def test_tree(tree, totals):
    n = order(tree)
    shapes = rerootings(tree)
    ordinary = forest(tree)
    deg = degrees(ordinary,n)
    pendants = leaf_counts(ordinary)
    require(deg==Counter(map(len,shapes)), 'degree recovery')
    require(pendants==Counter(s.count(()) for s in shapes if len(s)>1), 'star partition recovery')
    if ordinary.get((n//2, n//2),0) and n%2==0:
        return
    centroid, = [s for s in shapes if max(map(order,s)) * 2 < n]
    cropped = {m[:-1]:c for m,c in ordinary.items() if m[-1]*2>n}
    b = max(i for m in cropped for i in m)
    require(b==max(map(order,centroid)),'largest branch')
    if b==1:
        return
    L = max(pendants)
    recovered = L if L>=b else None
    if L==b-1 and max(deg)>b:
        indicator=pendants[b-1]-deg[b]
        require(indicator in (0,1), 'endpoint leaf marker indicator')
        if indicator:
            recovered = b-1
        else:
            totals['off-centroid endpoint controls']+=1
    eligible=centroid.count(())>=b-1
    require(eligible==(recovered is not None),'ordinary-data eligibility')
    if not eligible:
        return
    require(recovered==centroid.count(()),'centroid leaf count')
    D=n-b-1
    F={m[:-1]:c for m,c in ordinary.items() if m[-1]>b}
    H={(1,)*j:comb(recovered,j) for j in range(recovered+1)}
    part=quotient(F,H,D)
    remainder=tuple(child for child in centroid if child)
    direct=forest(remainder,True)
    require(part==truncate(direct,D),'truncated residual root')
    if recovered==b-1:
        missing=Counter(ordinary)
        missing.subtract(restored(product(H,part),n))
        divisor=restored(H,recovered+1)
        # Its unique x_(l+1) term allows exact division by weight-lex order.
        leading=max(divisor,key=lambda m:tuple(reversed(m)))
        recovered_top=Counter()
        while +missing or -missing:
            top=max((m for m,v in missing.items() if v),key=lambda m:tuple(reversed(m)))
            rest=list(top)
            for v in leading:
                require(v in rest,'residual quotient fails division')
                rest.remove(v)
            rest=tuple(rest)
            scale=missing[top]
            recovered_top[rest]+=scale
            for m,c in divisor.items():
                missing[tuple(sorted(rest+m))]-=scale*c
        require(dict(recovered_top)=={m:c for m,c in direct.items() if sum(m)>D},'missing top layer')
        totals['restored endpoint layers']+=1
    totals['eligible trees']+=1


if __name__=='__main__':
    totals=Counter()
    for n, shapes in rooted_shapes(11).items():
        if n<3:
            continue
        for tree in {min(rerootings(s)) for s in shapes}:
            test_tree(tree,totals)
            totals['unrooted trees through eleven vertices']+=1
    chain=()
    for _ in range(4):
        chain=(chain,)
    star=((),)*4
    for heavy in (chain,star):
        test_tree(((),(),(),(),((),),heavy),totals)
    test_tree(((),(),(),((),),((),),star),totals)
    require(totals['off-centroid endpoint controls']>0,'missing negative marker fixture')
    for item,count in sorted(totals.items()):
        print(f'{item}: {count}')
