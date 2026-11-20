"""Exact checks of the four conditional probability models.

This verifies finite algebraic identities and index conventions. It does not
prove an asymptotic theorem; the analytic proof is in PROOF.md.
Only the Python standard library is used.
"""

from fractions import Fraction
from functools import lru_cache


def trim(p):
    p = list(p)
    while p and not p[-1]:
        p.pop()
    return tuple(p)


def add(p, q):
    out = [0] * max(len(p), len(q))
    for i, value in enumerate(p):
        out[i] += value
    for i, value in enumerate(q):
        out[i] += value
    return trim(out)


def mul(p, q):
    if not p or not q:
        return ()
    out = [0] * (len(p) + len(q) - 1)
    for i, x in enumerate(p):
        for j, y in enumerate(q):
            out[i + j] += x * y
    return trim(out)


def scale(p, c):
    return trim(c * x for x in p)


@lru_cache(None)
def recurrence(family, n, k):
    """Original four defining recurrences, with polynomial coefficients."""
    if k < 0 or k > n:
        return ()
    if n == 0:
        return (1,) if k == 0 else ()
    a = {"c": n - 1, "S": k, "cB": 2 * n - 1,
         "SB": 2 * k + 1}[family]
    return add(recurrence(family, n - 1, k - 1),
               mul((1,) * a, recurrence(family, n - 1, k)))


def model_parameters(family, n, k):
    if family == "c":
        return True, tuple(range(1, n)), n - k
    if family == "cB":
        return True, tuple(range(1, 2 * n, 2)), n - k
    if family == "S":
        return False, tuple(range(1, k + 1)), n - k
    return False, tuple(range(1, 2 * k + 2, 2)), n - k


def conditional_model(elementary, lengths, m, lam):
    """Joint count/mark law, truncated only above the conditioning count."""
    joint = {0: (Fraction(1),)}
    for a in lengths:
        if elementary:
            denominator = 1 + lam * a
            factors = [(Fraction(1, 1) / denominator,),
                       (lam / denominator,) * a]
        else:
            assert 0 < lam * a < 1
            factors = []
            power = (1,)
            for r in range(m + 1):
                factors.append(scale(power, (1 - lam * a) * lam**r))
                power = mul(power, (1,) * a)
        updated = {}
        for old_count, old_poly in joint.items():
            for count, factor in enumerate(factors):
                total_count = old_count + count
                if total_count <= m:
                    updated[total_count] = add(
                        updated.get(total_count, ()), mul(old_poly, factor))
        joint = updated
    p = joint.get(m, ())
    assert p and sum(p) > 0
    return scale(p, 1 / sum(p))


def main():
    checked = 0
    for family in ("c", "S", "cB", "SB"):
        for n in range(1, 7):
            for k in range(1, n + 1):
                expected = recurrence(family, n, k)
                normalized = scale(expected, Fraction(1, sum(expected)))
                elementary, lengths, m = model_parameters(family, n, k)
                largest = max(lengths, default=1)
                for divisor in (2, 3):
                    actual = conditional_model(
                        elementary, lengths, m, Fraction(1, divisor * largest))
                    assert actual == normalized, (family, n, k, divisor)
                    checked += 1
    print(f"PASS: {checked} exact conditional-model identities in four families.")
    print("The asymptotic conclusion is proved analytically in PROOF.md.")


if __name__ == "__main__":
    main()
