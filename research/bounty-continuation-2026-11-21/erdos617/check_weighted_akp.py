"""Exact algebra checks for the two-level AKP reduction; no graph search."""

import json
from pathlib import Path

import sympy as S


r, q, t, M, a, b, h, y = S.symbols("r q t M a b h y")
s = r - q
m = r * s + 1
B = r * (r**2 + 1) / 2
e_U = q * r * (r - 1) / 2 + M
e_UR = q * t
e_R_upper = B - e_U - e_UR

direct = (
    r * (
        q * r * (r + 1) * a**2
        + r * m * b**2
        + 2 * e_U * a**2
        + 2 * e_R_upper * b**2
        + 2 * e_UR * a * b
    )
    - 2 * (q * r * a + m * b) ** 2
)

E = 2 * q * r**2 * s + 2 * r * M
F = 2 * r * q * t - 4 * q * r * m
G = (
    2 * q * r**2 * s + (q + 2) * r**2 - 4 * r * s - 2
    - 2 * r * M - 2 * r * q * t
)
D = (q - 2) * r**2 - 2
X = q * (t - 2) + 2 * M
M0 = q * (q - 1) ** 2 / 2
t0 = s + 1

checks = {
    "coefficients_from_weighted_theorem": S.expand(direct - (E*a*a + F*a*b + G*b*b)) == 0,
    "coefficient_sum": S.expand(E + F + G - D) == 0,
    "vertex_identity": S.expand(E + F/2 - r*X) == 0,
    "optimized_value": S.cancel(G - F**2/(4*E) - (D - r*r*X*X/E)) == 0,
    "minimal_attachment_X": S.expand(X.subs({t:t0, M:M0}) - q*(r + q*(q-3))) == 0,
}

determinant = S.cancel((E * D - r*r*X*X).subs({t:t0, M:M0}) / (q*r))
positive_form = S.Poly(
    S.expand(determinant.subs(r, q*(q-1)+1+h).subs(q, y+3)), h, y
)
checks["positive_coefficients_on_surviving_region"] = all(c > 0 for c in positive_form.coeffs())
assert all(checks.values()), checks

report = {
    "scope": "exact symbolic identities and a uniform positivity certificate, not a finite parameter search",
    "checks": checks,
    "positive_polynomial_term_count": len(positive_form.terms()),
    "positive_polynomial_constant": str(positive_form.eval({h:0, y:0})),
    "full_target_completed": False,
}
out = Path(__file__).with_name("weighted-akp-check.json")
out.write_text(json.dumps(report, indent=2) + "\n")
print(json.dumps(report, indent=2))
