"""Independent symbolic checks of determinant closure and the two moment-ratio limits."""

import z3


def require_unsat(label, hypotheses, negation):
    s = z3.SolverFor("QF_NRA")
    s.set("timeout", 30000)
    s.add(*hypotheses, negation)
    result = s.check()
    if result == z3.unknown:
        raise RuntimeError(f"{label}: Z3 returned unknown ({s.reason_unknown()})")
    if result != z3.unsat:
        raise RuntimeError(f"{label}: expected Z3 to return unsat, got {result}")
    print(f"{label}: {result}")


def main():
    a, b, c, d, A, B, C, D = z3.Reals("a b c d A B C D")
    f = [a, b, c, d]
    g = [A, B, C, D]
    h = [sum(f[j] * g[i - j] for j in range(i + 1)) for i in range(4)]
    require_unsat(
        "convolution preserves the necessary Hurwitz minor",
        [a >= 0, b >= 0, A >= 0, B >= 0, b * c >= a * d, B * C >= A * D],
        h[1] * h[2] < h[0] * h[3],
    )

    q, lam, ratio = z3.Reals("q lam R")
    m = [lam, lam * ratio, lam * ratio**2 * q, lam * ratio**3 * q**3]
    require_unsat("second quotient limit constant", [], m[1] * m[1] * q != lam * m[2])
    require_unsat("third quotient limit constant", [], m[1] * m[2] * q**2 != lam * m[3])
    require_unsat(
        "top count >= 1 and threshold imply strictly negative minor",
        [a >= 1, b >= 0, c >= 0, d > 0, b * c < d],
        b * c >= a * d,
    )


if __name__ == "__main__":
    main()
