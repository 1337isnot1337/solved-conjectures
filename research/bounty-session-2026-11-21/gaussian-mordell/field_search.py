"""Finite witness search on Mordell curves over Q(i).

Exact field arithmetic and independent checks certify positive candidates.
Bounded integral seeds and bounded group combinations do not certify the full
Mordell-Weil group, S-integral points, or absence of other witnesses.
"""
from __future__ import annotations

import argparse
import importlib.util
import itertools
import json
import math
from dataclasses import dataclass
from pathlib import Path


@dataclass(frozen=True)
class G:
    a: int
    b: int = 0
    d: int = 1

    def __post_init__(self):
        if not self.d:
            raise ZeroDivisionError
        h = math.gcd(math.gcd(self.a, self.b), self.d)
        if self.d < 0:
            h = -h
        object.__setattr__(self, "a", self.a // h)
        object.__setattr__(self, "b", self.b // h)
        object.__setattr__(self, "d", self.d // h)

    @staticmethod
    def coerce(x):
        return x if isinstance(x, G) else G(x)

    def __add__(self, other):
        q = G.coerce(other)
        return G(self.a*q.d + q.a*self.d,
                 self.b*q.d + q.b*self.d, self.d*q.d)

    __radd__ = __add__

    def __neg__(self):
        return G(-self.a, -self.b, self.d)

    def __sub__(self, other):
        return self + -G.coerce(other)

    def __rsub__(self, other):
        return G.coerce(other) + -self

    def __mul__(self, other):
        q = G.coerce(other)
        return G(self.a*q.a-self.b*q.b,
                 self.a*q.b+self.b*q.a, self.d*q.d)

    __rmul__ = __mul__

    def __truediv__(self, other):
        q = G.coerce(other)
        return G((self.a*q.a+self.b*q.b)*q.d,
                 (self.b*q.a-self.a*q.b)*q.d,
                 self.d*(q.a*q.a+q.b*q.b))

    def __pow__(self, exponent):
        if exponent < 0:
            return (G(1)/self)**(-exponent)
        result, base = G(1), self
        while exponent:
            if exponent & 1:
                result = result*base
            base = base*base
            exponent //= 2
        return result

    def row(self):
        return [self.a, self.b, self.d]


def square_root(a, b):
    norm = a*a+b*b
    h = math.isqrt(norm)
    if h*h != norm or (h+a) % 2:
        return None
    u2 = (h+a)//2
    u = math.isqrt(u2)
    if u*u != u2:
        return None
    if not u:
        if b or a > 0:
            return None
        v = math.isqrt(-a)
        return G(0, v) if v*v == -a else None
    if b % (2*u):
        return None
    v = b//(2*u)
    return G(u, v) if u*u-v*v == a else None


def add(p, q):
    if p is None:
        return q
    if q is None:
        return p
    x, y = p
    u, v = q
    if x == u:
        if y == -v:
            return None
        slope = 3*x*x/(2*y)
    else:
        slope = (v-y)/(u-x)
    r = slope*slope-x-u
    return r, slope*(x-r)-y


def multiples(p, bound):
    out = {0: None}
    q = None
    for n in range(1, bound+1):
        q = add(q, p)
        out[n] = q
        out[-n] = (q[0], -q[1]) if q else None
    return out


def smooth_over(n, base_norm):
    while n > 1:
        h = math.gcd(n, base_norm)
        if h == 1:
            return False
        n //= h
    return True


def decode(point, base, t, max_k, checker):
    if point is None:
        return None
    x, y = point
    if x.d == y.d == 1:
        return None  # Every k>=1 then forces a common nonunit factor.
    base_norm = base.a*base.a+base.b*base.b
    if not smooth_over(x.d, base_norm) or not smooth_over(y.d, base_norm):
        return None
    b2, b3 = base**2, base**3
    sx, sy = x, y
    for k in range(1, max_k+1):
        sx, sy = sx*b2, sy*b3
        if sx.d != 1 or sy.d != 1:
            continue
        # On Y^2=X^3+base^t, set a=Y*base^(3k), b=-X*base^(2k).
        bases = ((sy.a, sy.b), (-sx.a, -sx.b), (base.a, base.b))
        exponents = (2, 3, 6*k+t)
        result = checker.verify(bases, exponents)
        assert result["identity"]
        if not result["nonunit"] or result["pairwise_gcd_norms"] != [1, 1, 1]:
            return None  # Higher k multiplies both recovered bases by base.
        assert result["hyperbolic"]
        return {"x": list(bases[0]), "y": list(bases[1]),
                "z": list(bases[2]), "exponents": list(exponents), "k": k}
    return None


def get_checker():
    path = Path(__file__).resolve().parents[1]/"jsp-gaussian"/"verify_candidates.py"
    spec = importlib.util.spec_from_file_location("gaussian_checker", path)
    checker = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(checker)
    return checker


def controls(checker):
    identities = [
        (G(8, 5), G(5, 3), G(1, 2), 7),
        (G(2761, 2761), G(0, 239), G(0, 3), 13),
        (G(7347, -1240), G(-238, -72), G(7, 6), 8),
    ]
    out = []
    for a, b, z, r in identities:
        k, t = divmod(r, 6)
        if not t:
            k, t = k-1, 6
        point = (-b/z**(2*k), a/z**(3*k))
        assert point[1]**2 == point[0]**3+z**t
        doubled = add(point, point)
        if doubled is not None:
            assert doubled[1]**2 == doubled[0]**3+z**t
        assert add(point, (point[0], -point[1])) is None
        hit = decode(point, z, t, 20, checker)
        assert hit is not None and hit["k"] == k
        out.append(hit)
    return out


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--base-bound", type=int, default=4)
    ap.add_argument("--seed-bound", type=int, default=80)
    ap.add_argument("--max-seeds", type=int, default=12)
    ap.add_argument("--multiple", type=int, default=5)
    ap.add_argument("--triple-bound", type=int, default=0)
    ap.add_argument("--max-k", type=int, default=20)
    ap.add_argument("--output", required=True)
    args = ap.parse_args()
    folder = Path(args.output)
    folder.mkdir(parents=True, exist_ok=True)
    checker = get_checker()
    (folder/"controls.json").write_text(json.dumps(controls(checker), indent=2)+"\n")
    curves = {}
    for a in range(1, args.base_bound+1):
        for b in range(a+1):
            if a*a+b*b <= 1:
                continue
            for unit in [G(1), G(0, 1), G(-1), G(0, -1)]:
                base = G(a, b)*unit
                for t in range(1, 7):
                    coefficient = base**t
                    curves.setdefault(coefficient, []).append((base, t))
    x_cubes = []
    for a in range(-args.seed_bound, args.seed_bound+1):
        for b in range(-args.seed_bound, args.seed_bound+1):
            x_cubes.append((a, b, a*a*a-3*a*b*b, 3*a*a*b-b*b*b))
    seen = set()
    totals = {"curves": 0, "integral_seeds": 0, "seeds_used": 0,
              "group_combinations": 0, "raw_unique_hits": 0}
    with (folder/"seeds.jsonl").open("w") as sf, \
         (folder/"progress.jsonl").open("w") as pf, \
         (folder/"candidates.jsonl").open("w") as cf:
        for coefficient, representations in curves.items():
            seeds = []
            for a, b, c, d in x_cubes:
                y = square_root(c+coefficient.a, d+coefficient.b)
                if y is not None:
                    seeds.append((G(a, b), y))
            seeds.sort(key=lambda p: (p[0].a*p[0].a+p[0].b*p[0].b,
                                      p[1].a*p[1].a+p[1].b*p[1].b))
            print(json.dumps({"coefficient": coefficient.row(),
                              "base_residues": [[z.row(), t] for z, t in representations],
                              "points": [[x.row(), y.row()] for x, y in seeds]}),
                  file=sf, flush=True)
            chosen = seeds[:args.max_seeds]
            tables = [multiples(p, args.multiple) for p in chosen]
            checked = 0
            def inspect(point, witness):
                nonlocal checked
                checked += 1
                if point is None:
                    return
                for base, t in representations:
                    hit = decode(point, base, t, args.max_k, checker)
                    if hit is None:
                        continue
                    key = (tuple(hit["x"]), tuple(hit["y"]), tuple(hit["z"]), tuple(hit["exponents"]))
                    if key in seen:
                        continue
                    seen.add(key)
                    assert point[1]**2 == point[0]**3+coefficient
                    print(json.dumps({**hit, "coefficient": coefficient.row(),
                                      "group_witness": witness}), file=cf, flush=True)
            for i, table in enumerate(tables):
                for m, point in table.items():
                    inspect(point, [[i, m]])
            for i, j in itertools.combinations(range(len(tables)), 2):
                for m in range(1, args.multiple+1):
                    for n in range(-args.multiple, args.multiple+1):
                        if n:
                            inspect(add(tables[i][m], tables[j][n]), [[i, m], [j, n]])
            triple_bound = min(args.triple_bound, args.multiple)
            for i, j, h in itertools.combinations(range(len(tables)), 3):
                for m in range(1, triple_bound+1):
                    for n in range(-triple_bound, triple_bound+1):
                        if not n:
                            continue
                        partial = add(tables[i][m], tables[j][n])
                        for ell in range(-triple_bound, triple_bound+1):
                            if ell:
                                inspect(add(partial, tables[h][ell]),
                                        [[i, m], [j, n], [h, ell]])
            totals["curves"] += 1
            totals["integral_seeds"] += len(seeds)
            totals["seeds_used"] += len(chosen)
            totals["group_combinations"] += checked
            totals["raw_unique_hits"] = len(seen)
            print(json.dumps({"coefficient": coefficient.row(), "seeds": len(seeds),
                              "chosen": len(chosen), "checked": checked,
                              "totals": totals}), file=pf, flush=True)
    (folder/"summary.json").write_text(json.dumps({"parameters": vars(args), **totals}, indent=2)+"\n")


if __name__ == "__main__":
    main()
