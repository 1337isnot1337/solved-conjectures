# Heim–Neuhauser’s ordinary D’Arcais root conjecture

**Proved with exact arithmetic certificates.** For the ordinary D’Arcais polynomials, the nth roots strictly decrease for every integer index at least 6 and every real parameter at least 1. This is Conjecture 2 of Heim–Neuhauser’s *Polynomization of Sun’s conjecture*, not their separate plane-partition result.

The proof establishes strict log-concavity from index 26. It controls a centered Fourier integral uniformly in the real parameter, then bridges the finite range with exact checks of shifted integer polynomials. The computational checks use exact arithmetic.

**Lean status.** Partial. Lean proves the root comparison for indices 6–50 at every real parameter at least one. It constructs the unique positive saddle, proves Fourier inversion for the ordinary coefficients, and reduces strict log-concavity at every index from 501 onward to two explicit inequalities.

- [Proof and reproduction commands](PROOF.md)
- [Lean statements and verification receipt](FORMALIZATION.md)
- [Independent audit and prior-work scope](AUDIT.md)
- [Discovery issue #393](https://github.com/1337isnot1337/solved-conjectures/issues/393)
