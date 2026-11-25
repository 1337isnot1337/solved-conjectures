# Kovalev’s square-root Taylor-section zero-free conjecture

Independent source and statement review of the four frozen Taylor modules: passed.

The reviewed source hashes are those in `taylor-handoff.json`; each lane source and integrated root source was rehashed and found identical. This review does not replace the pending whole-candidate all-owned audit and exact stock-kernel replay.

The endpoint `sectionPolynomial_eq_taylor` has only the intended positive-length hypothesis `0 < D`. It quantifies over every natural section degree and every complex evaluation point. Its right side is the literal finite sum of `iteratedDeriv k (fun w : Complex => Complex.sqrt (sum i in range D, w^i)) 0 / k!` multiplied by `z^k`. Thus the finite polynomial used by the inequality argument is identified with the actual complex Taylor coefficients; no analyticity or coefficient identification is left as a hypothesis.

The binomial recurrence proves the given recursively defined half-coefficients and correction coefficients are exactly the coefficients of the inverse square root and square root. The convergence proofs use Mathlib’s genuine binomial power series and norm summability on the open unit disk. The positive D hypothesis makes dilation injective and ensures the dilated series converges there. The Cauchy product has the exact triangular coefficient range, and the finite rearrangement includes precisely the positive multiples of D up to n; the remaining constant term is kept.

The analytic bridge does not assume a global principal-branch product identity. It proves that the product of the two analytic factors has square equal to the finite geometric polynomial for z != 1, and that both it and the principal square root equal 1 at zero. Their continuous sum is nonzero on a neighborhood of zero, so equality of their squares forces their local equality. Uniqueness of the genuine analytic power series then identifies every iterated derivative at zero. This is the branch normalization required by Kovalev’s original Conjecture 1.2 and the recorded proof’s equation (1).

The result is a bridge, not a complete zero-free theorem. Closed-disk nonvanishing still depends on the actual beta comparison and the integral correction identity. The general fractional-exponent and sharp-segment supplements are not implied by these square-root modules.

Sources: Leonid V. Kovalev, *Sharp bounds for some segments of bounded power series*, arXiv:2507.04544v1, Section 1, Conjecture 1.2; existing repository `results/kovalev-zero-free/PROOF.md`, commit `6432592c03b24aed190ed7b3204ed942a40a8da4`, Section 1, recorded by Cinna Davis. Priority qualifications in the entry are preserved.
