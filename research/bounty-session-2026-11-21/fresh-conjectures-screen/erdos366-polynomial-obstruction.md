# Erdős 366: a limited obstruction to polynomial constructions

Status: an elementary feasibility observation, not a new conjecture resolution and not a nonexistence proof for the integer target.

The paid problem asks for one positive integer `n` which is powerful and whose successor is cubeful. A natural symbolic attempt would produce a nonconstant polynomial `F` such that every irreducible factor of `F` has multiplicity at least two and every irreducible factor of `F+1` has multiplicity at least three. Such a polynomial cannot exist over a field of characteristic zero.

## Proof

Work over an algebraic closure. Put `d = deg(F) > 0`, and let `r` and `s` count the distinct roots of `F` and `F+1`, respectively. Their roots are disjoint. A root of multiplicity `m` contributes multiplicity `m-1` to the derivative. Since `(F+1)'=F'`, the degree of `F'` therefore obeys

```math
d-1\ge(d-r)+(d-s)=2d-r-s.
```

The proposed multiplicities give `r <= d/2` and `s <= d/3`. Hence the right-hand side is at least `7d/6`, contradicting `d-1 < 7d/6`.

This is the elementary derivative argument underlying the polynomial abc obstruction. It excludes the stated symbolic factor-multiplicity construction only. It does not assert that integer fullness is identical to polynomial factor multiplicity. In particular it leaves isolated integer witnesses, polynomial values at selected sparse parameters, Pell-type sequences, and general Diophantine constructions entirely open. No numerical search or Lean formalization was undertaken on this observation.
