# Dilcher–Kidwai–Tomkins’s Stern-polynomial conjecture

**Proved.** Proves that all zeros of all Stern polynomials lie strictly to the left of Re z = 1. Analytic estimates and an exact compact-region certificate cover all binary run lengths.

- [Complete proof](PROOF.md)
- [Analytic exterior bound](EXTERIOR.md)
- [Exact compact-region checker](check.cpp)
- [Independent audit and earlier work](AUDIT.md)
- [Discovery issue #447](https://github.com/1337isnot1337/solved-conjectures/issues/447)

The [partial Lean formalization](FORMALIZATION.md) checks the actual recurrence, all-index run/continuant reduction and the finite parabolic criterion. The near-one estimates, certified compact region and separate exterior argument remain unformalized. The [independent statement review](LEAN_REVIEW.md) and [scoped receipt](../../docs/verification/lean-stern-half-plane-partial-20261124-162051/receipt.json) record the exact checked scope. This is not a completed Lean formalization.
