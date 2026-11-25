# Lean formalization

**Complete for the original Conjecture 3.6.** George Csordas and Anna Vishnyakova’s [paper, p. 1649, equations (13) and (14)](https://www.degruyterbrill.com/document/doi/10.2478/s11533-013-0269-x/pdf) fixes an admissible even polynomial with nonnegative coefficients and a nonreal zero. It asks whether nonnegative Taylor coefficients for all real arguments force the tested real entire function into the Laguerre–Pólya class.

The exact Lean endpoint [`CsordasVishnyakova.csordasVishnyakova_conj3_6_false`](../../lean/Conjectures/CsordasVishnyakova.lean) verifies the quartic `z^4 + z^2 + 1`, its factorization and a nonreal zero, the nonzero real entire witness `exp (-z^4)`, the product using the four specified shifts, and every Taylor coefficient’s nonnegativity for **every** real input. It proves the coefficient series identity and its equality to the actual iterated derivatives divided by factorials. Lastly it excludes the witness from the class defined by compact-uniform real-rooted polynomial approximants, using a comparison at zero and at the imaginary unit.

This formalizes the [published written counterexample](PROOF.md) and retains its [source audit and attribution](AUDIT.md). It does not refute the preceding theorem with the extra genus restriction. No change to the conjecture count or priority caveats.

Pinned Lean 4.35.0 passed strict compilation, the complete owned-declaration audit (49 declarations, 40 theorems, 21 private, nine required endpoints), and stock kernel replay. The [exact receipt](verification/lean-receipt.json) records source and toolchain inputs; the [audit](verification/TargetAudit.lean) checks only the standard axioms.

```sh
python3 scripts/verify_lean_target.py \
  --root Conjectures.CsordasVishnyakova \
  --require CsordasVishnyakova.csordasVishnyakova_conj3_6_false \
  --out /tmp/csordas-vishnyakova-verification
```
