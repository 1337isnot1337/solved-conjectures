"""Exact supplementary check of the rational cubic in PROOF.md."""
from fractions import Fraction as F
r = F(15, 16)
a, b, c, d = r**4, -3*r, F(3), F(-1)
delta = b*b*c*c - 4*a*c**3 - 4*b**3*d - 27*a*a*d*d + 18*a*b*c*d
assert delta == F(-72517275, 4294967296)
assert delta < 0
print("Exact negative discriminant:", delta)
