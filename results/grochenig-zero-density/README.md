# Gröchenig’s problem

The upper-density assertion in Problem 4.12 of Karlheinz Gröchenig's *Infinite totally positive matrices: some open problems* is false. The [source](https://doi.org/10.1007/s44146-026-00264-3) asks whether the upper and lower Beurling densities of the zero set of every bounded-coefficient Pólya frequency shift sum are bounded by the corresponding densities of coefficient sign changes.

The [proof](PROOF.md) constructs a nonzero entire Gaussian shift sum with absolutely summable coefficients for which

```math
D^+(Z(f))\ge1>\frac12=D^+(c).
```

The coefficients lie on the even integers. Finite Gaussian blocks have one simple zero per unit spacing. Recursively separating the blocks makes the interference from the remaining blocks smaller than fixed nonzero sign witnesses. This produces one infinite counterexample at arbitrarily large length scales.

This refutes the published universal assertion once. The separate lower-density inequality remains undecided here. The construction does not depend on any finite numerical screen.

## Files

- [PROOF.md](PROOF.md): complete analytic construction and density calculation.
- [SOURCES.md](SOURCES.md): exact original scope and prior-art audit.
- [ROOT_REVIEW.md](ROOT_REVIEW.md): independent source and mathematical review.
- [ALGEBRA_REVIEW.md](ALGEBRA_REVIEW.md): independent mathematical review.
- [verify.py](verify.py): exact standard-library cross-checks for the block algebra and error budgets.

Run `python3 verify.py` in this directory. The script supports the written proof; it does not establish the infinite construction by finite testing. No Lean verification is claimed.

Research coordination: [issue 191](https://github.com/1337isnot1337/solved-conjectures/issues/191).
