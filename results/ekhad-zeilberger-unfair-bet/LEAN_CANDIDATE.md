# Lean candidate: overlap arithmetic

This is an **unregistered candidate**, not a verification receipt.

Source: [EkhadZeilbergerOverlap.lean](../../lean/Conjectures/EkhadZeilbergerOverlap.lean).
The candidate models the geometric sum of shift weights and establishes the
strict nonconstant-loser comparison under the two variance alternatives,
the sharp constant-loser inequality and equality conditions, and the
intermediate full-alphabet constant-versus-nonconstant comparison.

The remaining obligations are the actual finite-word overlap model,
the cross-overlap and constant-run estimates, the double-endpoint variance
projection (or an alternative direct overlap argument), the large-alphabet
case, and the published asymptotic and equal-autocorrelation theorems.
The candidate explicitly retains the unresolved hypotheses rather than
introducing axioms. The accepted README verification status is unchanged.

Run from the repository root:

```sh
python3 scripts/verify_unfair_bet_candidate.py
```

The isolated workflow checks strict source compilation, the allowed axiom
list, and the stock kernel replay. A successful hosted receipt still
requires statement review before registration in the accepted package.
