# Gröchenig’s problem

The upper-density assertion in Problem 4.12 of Karlheinz Gröchenig's *Infinite totally positive matrices: some open problems* is false. The [source](https://doi.org/10.1007/s44146-026-00264-3) asks whether the upper and lower Beurling densities of the zero set of every bounded-coefficient Pólya frequency shift sum are bounded by the corresponding densities of coefficient sign changes.

The [proof](PROOF.md) constructs a nonzero entire Gaussian shift sum with absolutely summable coefficients for which

```math
D^+(Z(f))\ge1>\frac12=D^+(c).
```

The coefficients lie on the even integers. Finite Gaussian blocks have one simple zero per unit spacing. Recursively separating the blocks makes the interference from the remaining blocks smaller than fixed nonzero sign witnesses. This produces one infinite counterexample at arbitrarily large length scales.

This refutes the published universal assertion once. The separate lower-density inequality remains undecided here. The construction does not depend on any finite numerical screen.

## Lean verification

Lean constructs one real coefficient sequence in ℓ¹(ℤ), with absolute mass one and support on the even integers. Its actual Gaussian shift sum is nonzero, has an entire extension and locally finite real zeros, and satisfies D⁺(c)=1/2 and D⁺(Z(f))≥1. Coefficient sign changes use the source convention that skips zero coefficients.

All 20 modules in the exact closure passed strict source checks, the complete owned-declaration axiom audit, and stock-kernel replay. The closure contains 14 Gröchenig modules and six reused KVZ kernel modules; all 20 were audited as owned modules. The audit covers 351 declarations, 310 theorem declarations, 78 private declarations, and 157 required endpoints.

The final theorem explicitly includes the even support, coefficient mass one, actual convergent representation, nonzero entire extension, local finiteness, and both density conclusions.

[Formal theorem](../../lean/Conjectures/Grochenig.lean) · [Verification receipt](../../docs/verification/lean-grochenig-20261121/receipt.json).

The separate lower-density inequality remains unresolved here. The combined repository gate and hosted validation remain separate checks.

## Files

- [PROOF.md](PROOF.md): complete analytic construction and density calculation.
- [SOURCES.md](SOURCES.md): exact original scope and prior-art audit.
- [ROOT_REVIEW.md](ROOT_REVIEW.md): independent source and mathematical review.
- [ALGEBRA_REVIEW.md](ALGEBRA_REVIEW.md): independent mathematical review.
- [verify.py](verify.py): exact standard-library cross-checks for the block algebra and error budgets.

Run `python3 verify.py` in this directory. The script supports the written proof; it does not establish the infinite construction by finite testing. Lean verifies the infinite construction separately; see the checked scope above.

Research coordination: [issue 191](https://github.com/1337isnot1337/solved-conjectures/issues/191).

**Lean status:** complete for the upper-density disproof. The separate lower-density inequality remains unresolved.
