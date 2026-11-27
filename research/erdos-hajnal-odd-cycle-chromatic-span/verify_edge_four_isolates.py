"""Check the explicit edge-plus-four-isolates counterexample."""
from itertools import combinations, product

A = set(range(4))
B = set(product(range(4), range(3)))
X = {(i, j, c) for i, j in combinations(A, 2) for c in range(3)}
V = A | B | X
N = {v: set() for v in V}

def edge(u, v):
    N[u].add(v)
    N[v].add(u)

for C in (A, B):
    for u, v in combinations(C, 2):
        edge(u, v)
for a, b in product(A, B):
    if a != b[0]:
        edge(a, b)
for x in X:
    i, j, c = x
    for v in A | (B - {(i, c), (j, c)}):
        edge(x, v)

E = [(u, v) for u, v in combinations(V, 2) if u in N[v]]
assert len(X) > len(A | B) + 1
for u, v in E:
    anti = V - N[u] - N[v]
    assert not any(all(w not in N[z] for w, z in combinations(C, 2))
                   for C in combinations(anti, 4))

for labels in product(range(3), repeat=4):
    colors = {b: b for b in B} | {i: (i, labels[i]) for i in A}
    assert any(set(colors.values()) == {colors[u] for u in N[x]} for x in X)

for target in X:
    i, j, c = target
    labels = {i: c, j: c} | dict(zip(sorted(A-{i, j}), sorted(set(range(3))-{c})))
    colors = {b: b for b in B} | {i: (i, labels[i]) for i in A}
    for x in X-{target}:
        colors[x] = next(b for b in B if b not in {colors[u] for u in N[x]})
    assert all(colors[u] != colors[v] for u, v in E if target not in (u,v))

print(f"{len(V)} vertices, {len(E)} edges, 81 blocked core assignments, "
      f"{len(X)} deletion colorings, no edge with four independent antineighbors.")
