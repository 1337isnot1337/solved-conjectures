"""Generate one quadratic Chabauty certificate; see rational-points.md for usage."""
import hashlib
import json
import sys
from pathlib import Path

source, model_arg, prime_arg = sys.argv[1:]
source = Path(source).resolve()
source_sha256 = "0ffc203aea0c27de5d55419931c406bad1f8590a82a5f0f9c64ea5dd5388220b"
assert hashlib.sha256(source.read_bytes()).hexdigest() == source_sha256
load(str(source))
proof.all(True)
model, p, prec = ZZ(model_arg), ZZ(prime_arg), 40
assert model in (1, 2) and p in (5, 11, 13, 17, 19)
R = PolynomialRing(QQ, "x")
x = R.gen()
f = -31*x^6 + 45*x^4 + 3*x^2 - 1 if model == 1 else x^6 - 3*x^4 - 45*x^2 + 63
K = Qp(p, prec)
curves = [EllipticCurve([0,f[4],0,f[2]*f[6],f[0]*f[6]^2]),
          EllipticCurve([0,f[2],0,f[0]*f[4],f[6]*f[0]^2])]
assert all(E.rank(proof=True) == 1 for E in curves)
generators = [E.gens(proof=True)[0] for E in curves]
torsion = [sorted(E.torsion_points(), key=lambda P: tuple(P)) for E in curves]


def local_coordinates(E, generator, torsion_points):
    """For each torsion choice, bound the integer coefficient in two moduli."""
    Ebar, EK = E.change_ring(GF(p)), E.change_ring(K)
    g = Ebar(generator)
    order, mult = g.order(), Ebar.cardinality()
    table = {}
    for j, T in enumerate(torsion_points):
        point = Ebar(T)
        for i in range(order):
            table.setdefault(tuple(point), []).append((int(i), int(j)))
            point += g

    logarithm = E.formal_group().log(prec=25).truncate()
    def integral(P):
        point = mult * P
        arg = -point[0] / point[1]
        assert arg.valuation() >= 1
        return logarithm(arg) + O(p^22)

    base_log = integral(EK(generator))
    assert 0 < base_log.valuation() < 12

    def read(P):
        if P.is_zero() or P[0].valuation() < 0:
            bar = Ebar(0)
        else:
            bar = Ebar(GF(p)(P[0]), GF(p)(P[1]))
        coeff = integral(P) / base_log
        assert coeff.precision_absolute() >= 3
        if coeff.valuation() < 0:
            return []
        residue = int(ZZ(coeff.lift()) % (p^2))
        return [(residue, i, j) for i, j in table.get(tuple(bar), [])]

    return EK, int(order), read


data = [local_coordinates(E, G, T) for E, G, T in zip(curves, generators, torsion)]
known, extra = quadratic_chabauty_bielliptic(
    f, p, prec, omega_info=True, potential_good_primes=False)
recognised = {(QQ(P[0]), QQ(P[1])) for group in known for P in group if P[2] != 0}
expected = {(QQ(s), QQ(y)) for s in (-1, 1) for y in (-4, 4)}
if model == 2:
    expected |= {(QQ(s), QQ(y)) for s in (-3, 3) for y in (-12, 12)}
    expected |= {(s*QQ(3)/5, y*QQ(852)/125) for s in (-1, 1) for y in (-1, 1)}
assert recognised == expected


def rows(P):
    left = data[0][2](X_to_E1map(P, data[0][0], f[6]))
    right = data[1][2](X_to_E2map(P, data[1][0], f[0], f[6]))
    return [(a, b) for a in left for b in right]


for group in known:
    for P in group:
        if P[2] and P[0]:
            assert rows(P)

result = dict(model=int(model), prime=int(p), orders=[row[1] for row in data],
              generators=[[str(t) for t in G] for G in generators],
              torsion=[[[str(v) for v in T] for T in ts] for ts in torsion],
              rows=[sorted(set(r for P in group for r in rows(P))) for group in extra])
print("SIEVE_JSON", json.dumps(result), flush=True)
