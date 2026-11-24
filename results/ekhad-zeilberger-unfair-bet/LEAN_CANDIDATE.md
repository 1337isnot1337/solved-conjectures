# Lean candidate: overlap arithmetic and literal words

This is an **unregistered candidate**, not a verification receipt.

- [Scalar arithmetic](../../lean/Conjectures/EkhadZeilbergerOverlap.lean):
  geometric shift weights, both nonconstant-loser cases with explicit variance
  hypotheses, sharp constant-loser inequality and equality, and the intermediate
  full-alphabet comparison.
- [Literal finite-word bridge](../../lean/Conjectures/EkhadZeilbergerWords.lean):
  indexed suffix-prefix overlap predicate, exact shift sums, shift-one
  characterization of constant words, an all-length tail bound, the actual
  constant-word cross-overlap estimate via a mismatching position, the
  constant-loser extremal upper bound, and literal attainment by the proposed
  pair. The nonconstant theorem still retains the variance alternative.

The remaining obligations are the same-interior/shift-one exceptional
case, the double-endpoint variance projection (or an alternative direct
overlap argument), uniqueness of the extremizing word forms, the
full-alphabet combinatorial cases, and the published asymptotic and
equal-autocorrelation theorems. Unresolved hypotheses are explicit; no
full-result or accepted README verification status change is claimed.

Run from the repository root:

```sh
python3 scripts/verify_unfair_bet_candidate.py
```

The isolated workflow checks strict source compilation, the allowed axiom
list, and the stock kernel replay. A successful hosted receipt still
requires statement review before registration in the accepted package.
