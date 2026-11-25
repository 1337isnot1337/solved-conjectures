# Heim–Neuhauser’s ordinary D’Arcais root conjecture

**Proved with exact arithmetic certificates.** For the ordinary D’Arcais polynomials, the nth roots strictly decrease for every integer index at least 6 and every real parameter at least 1. This is Conjecture 2 of Heim–Neuhauser’s *Polynomization of Sun’s conjecture*, not their separate plane-partition result.

The proof establishes strict log-concavity from index 26. It controls a centered Fourier integral uniformly in the real parameter, then bridges the finite range with exact checks of shifted integer polynomials. The computational checks use exact arithmetic.

**Lean status.** Partial. Lean verifies the root comparisons for indices 6–50 and all real parameters at least 1, the reduction to log-concavity at higher indices, and the central Fourier lower bound under explicit saddle estimates.

- [Proof and reproduction commands](PROOF.md)
- [Lean statements and verification receipt](FORMALIZATION.md)
- [Independent audit and prior-work scope](AUDIT.md)
- [Discovery issue #393](https://github.com/1337isnot1337/solved-conjectures/issues/393)
