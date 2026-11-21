# López Pouso–Segura's conjectures

**Lean status:** partial

Complete proposed proofs of Conjectures 2, 5, and 8 in Óscar López Pouso and Javier Segura, *Uniform relations between the Gauss–Legendre nodes and weights*, Journal of Inequalities and Applications (2025), article 40. [Published source](https://doi.org/10.1186/s13660-025-03283-w) · [Issue 177](https://github.com/1337isnot1337/solved-conjectures/issues/177).

For the source's three sequences formed from the positive zeros of the Bessel function of order zero and their derivative weights, the proof establishes every asserted sign, strict monotonicity, and exact limit. A positive-measure representation gives convexity of the inverse squared-phase derivative. Trapezoidal errors prove the first two monotonicity statements; a resolvent identity and a weighted-average identity finish the constants and third sequence.

The three closely related assertions are counted together as one named result. The remaining finite-degree Gauss–Legendre conjectures are outside its scope.

- [Complete proof](PROOF.md)
- [Source and prior-resolution audit](SOURCES.md)
- [Independent root review](ROOT_REVIEW.md)
- [Independent algebra review](ALGEBRA_REVIEW.md)
- [Exact identity checker](verify.py) and [check record](CHECKS.md)

Both internal mathematical reviews found no substantive gap. No earlier resolution was located in the documented searches; the audit states its access limits. These are unrefereed written proofs. The exact checks supplement the analytic argument and are not a proof by finite enumeration. Lean proves strict convexity for nonzero positive mixtures of the source rational kernel and, conditionally on its ODE and positivity hypotheses, for the inverse-phase derivative through zero, assuming endpoint continuity. It partially verifies all three sequences: under explicit inverse-phase convexity, antiderivative, positive-weight and endpoint hypotheses, it proves their signs and strict monotonicity. Lean also derives all three exact limits from the stated zero and weight asymptotics, positivity, and the explicit deviation-sum constant; divergence of the weight sums follows in Lean. Connecting these hypotheses to Bessel functions and zeros and proving that constant remain unformalized; the full repository gate is pending.
