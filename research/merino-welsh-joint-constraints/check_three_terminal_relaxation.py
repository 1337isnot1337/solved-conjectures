"""Exact obstruction to a specified Merino--Welsh proof relaxation.

These are abstract normalized boundary data, not counts of an asserted graph.
All checks use fractions. The output is a route diagnostic, not a graph
counterexample or a resolution of the conjecture.
"""
from fractions import Fraction as F
from itertools import product
import json


def main():
    r = [F(11, 8)] * 3
    d = F(363, 256)
    a = [F(99, 100)] * 3
    b = F(49, 50)
    c = [F(101, 100)] + [F(21, 10)] * 3 + [F(27, 10)]
    checks = []

    def check(name, margin, strict=False):
        assert margin > 0 if strict else margin >= 0, (name, margin)
        checks.append((name, margin))

    determinant_error = d-r[0]*r[1]+((r[0]+r[1]-r[2])/2)**2
    assert determinant_error == 0
    check("resistance determinant identity", determinant_error)
    for i in range(3):
        check(f"positive acyclic pair {i}", a[i], True)
        check(f"strict acyclic pair upper {i}", 1-a[i], True)
        check(f"acyclic triple subset {i}", a[i]-b, True)
    check("positive acyclic triple", b, True)
    check("acyclic union bound", b-sum(a)+2, True)
    check("base graph induction", c[0]-1, True)
    for i in range(3):
        check(f"pair quotient induction {i}", a[i]*c[i+1]-r[i]**2, True)
        check(f"strict cyclic contraction lower {i}", c[i+1]-c[0], True)
        check(f"strict cyclic contraction upper {i}", c[4]-c[i+1], True)
    check("triple quotient induction", b*c[4]-d*d, True)
    check("cyclic three-pair bound", 2*c[4]+c[0]-sum(c[1:4]), True)

    def star(q):
        support = [i for i, x in enumerate(q) if x]
        if len(support) == 3:
            aa = 4 + sum(a) + b
        elif len(support) == 2:
            p = {(0, 1): 0, (0, 2): 1, (1, 2): 2}[tuple(support)]
            aa = 3+a[p]
        elif len(support) == 1:
            aa = F(2)
        else:
            raise ValueError("An empty star has an isolated extra vertex")
        v = [2**x-1 for x in q]
        cc = ((sum(v)-1)*c[0] + v[0]*v[1]*c[1]
              + v[0]*v[2]*c[2] + v[1]*v[2]*c[3]
              + v[0]*v[1]*v[2]*c[4])
        tt = (sum(q) + q[0]*q[1]*r[0] + q[0]*q[2]*r[1]
              + q[1]*q[2]*r[2] + q[0]*q[1]*q[2]*d)
        return aa, cc, tt

    star_margins = []
    for q in product(range(6), repeat=3):
        if not 2 <= sum(q) <= 5:
            continue
        aa, cc, tt = star(q)
        margin = aa*cc-tt*tt
        check(f"smaller star {q}", margin, True)
        star_margins.append((margin, q))

    triangle_margins = []
    for q in product(range(6), repeat=3):
        if sum(q) > 5:
            continue
        support = [i for i, x in enumerate(q) if x]
        aa = 1+sum(a[i] for i in support)
        if len(support) == 2:
            aa += b
        elif len(support) == 3:
            aa += 2*b
        v = [2**x-1 for x in q]
        cc = (c[0]+sum(v[i]*c[i+1] for i in range(3))
              +(v[0]*v[1]+v[0]*v[2]+v[1]*v[2]
                +v[0]*v[1]*v[2])*c[4])
        tt = (1+sum(q[i]*r[i] for i in range(3))
              +(q[0]*q[1]+q[0]*q[2]+q[1]*q[2])*d)
        margin = aa*cc-tt*tt
        check(f"smaller triangle {q}", margin, True)
        triangle_margins.append((margin, q))

    aa, cc, tt = star((2, 2, 2))
    target_margin = aa*cc-tt*tt
    assert target_margin < 0
    inclusion = (2+4*r[0]+4*r[1]+8*d)/tt
    assert F(3, 5) < inclusion < F(4, 5)
    print(json.dumps({
        "scope": "abstract boundary-data relaxation, not a graph counterexample",
        "normalized_data": {"r": list(map(str, r)), "d": str(d),
                            "a": list(map(str, a)), "b": str(b),
                            "c": list(map(str, c))},
        "exact_checks_passed": len(checks),
        "smaller_star_checks": len(star_margins),
        "smaller_triangle_checks": len(triangle_margins),
        "least_smaller_star_margin": str(min(star_margins)[0]),
        "least_smaller_star_q": min(star_margins)[1],
        "least_smaller_triangle_margin": str(min(triangle_margins)[0]),
        "least_smaller_triangle_q": min(triangle_margins)[1],
        "doubled_star": {"A_over_A0": str(aa),
                         "A0_C_over_t0_squared": str(cc),
                         "t_over_t0": str(tt),
                         "normalized_MW_margin": str(target_margin),
                         "pair_tree_inclusion": str(inclusion)},
        "proof_of_Merino_Welsh_claimed": False,
    }, indent=2))


if __name__ == "__main__":
    main()
