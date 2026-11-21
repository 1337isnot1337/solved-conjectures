"""Independent symbolic and representation checks for the order-six note.

No checker from another agent is imported.  The matching identities are
expanded in the fifteen unconstrained Gram off-diagonals, with diagonal 1.
The singlet-frame normalization is checked as a 20 by 20 integer identity.
"""

from itertools import combinations, permutations, product
import sympy as sp


def matchings(vertices):
    if not vertices:
        yield ()
        return
    a, *rest = vertices
    for b in rest:
        for tail in matchings(tuple(x for x in rest if x != b)):
            yield ((a, b),) + tail


def gram_identities():
    edges = tuple(combinations(range(6), 2))
    variables = sp.symbols("g0:15")
    edge_value = dict(zip(edges, variables))
    G = sp.eye(6)
    for (i, j), value in edge_value.items():
        G[i, j] = G[j, i] = value
    one = sp.ones(6, 1)
    row = G * one
    L = (one.T * G * one)[0]
    a = (row.T * row)[0]
    b = (row.T * G * row)[0]
    t2 = sp.trace(G * G)
    t3 = sp.trace(G * G * G)
    c = sum(row[i] ** 3 for i in range(6))
    d = sum(row[i] * G[i, j] ** 2 for i in range(6) for j in range(6))
    u = sum(G[i, j] ** 3 for i in range(6) for j in range(6))
    S1 = sum(variables)
    S2 = sum(edge_value[e] * edge_value[f] for e, f in combinations(edges, 2)
             if len(set(e + f)) == 4)
    S3 = sum(sp.prod(edge_value[e] for e in m) for m in matchings(tuple(range(6))))
    assert sp.expand(S1 - (L / 2 - 3)) == 0
    assert sp.expand(S2 - (L ** 2 / 8 - L / 2 + t2 / 4 - a / 2)) == 0
    proposed = (-6 + L / 2 + L ** 2 / 8 + L ** 3 / 48 - a - L * a / 4
                + L * t2 / 8 + 3 * t2 / 4 - t3 / 6
                + b / 2 + c / 3 - d + u / 3)
    assert sp.expand(S3 - proposed) == 0
    print("PASS: all three matching sums agree as polynomials in 15 independent Gram entries.")


def singlet_frame():
    triples = tuple(combinations(range(6), 3))
    pairs = tuple(combinations(range(6), 2))
    index = {t: i for i, t in enumerate(triples)}
    frame = [[0] * 20 for _ in range(20)]
    for m in matchings(tuple(range(6))):
        v = [0] * 20
        for choices in product((0, 1), repeat=3):
            chosen = tuple(sorted(m[j][choices[j]] for j in range(3)))
            v[index[chosen]] = (-1) ** sum(choices)
        assert sum(x * x for x in v) == 8
        for i in range(20):
            for j in range(20):
                frame[i][j] += v[i] * v[j]
    character_operator = [[0] * 20 for _ in range(20)]
    for p in permutations(range(6)):
        image3 = [tuple(sorted(p[j] for j in t)) for t in triples]
        fixed3 = sum(t == image for t, image in zip(triples, image3))
        fixed2 = sum(t == tuple(sorted(p[j] for j in t)) for t in pairs)
        chi33 = fixed3 - fixed2
        for j, image in enumerate(image3):
            character_operator[index[image]][j] += chi33
    assert all(character_operator[i][j] == 6 * frame[i][j]
               for i in range(20) for j in range(20))
    F = sp.Matrix(frame)
    assert F * F == 24 * F
    assert sp.trace(F) == 120
    print("PASS: the 15 singlet tensors have frame operator 24 times the rank-five projector.")
    print("PASS: the central (3,3) character operator is six times that frame operator.")


if __name__ == "__main__":
    gram_identities()
    singlet_frame()
