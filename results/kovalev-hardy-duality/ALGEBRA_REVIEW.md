# Independent algebra review

Reviewed on 21 November 2026 by the algebra agent. The full written proof and the standard-library verifier pass this review. The argument refutes the lower inequality in Kovalev's Conjecture 6.1 for an infinite family covering every matrix order at least 500001. It does not decide the conjecture's upper inequality or the first dimension in which the lower one fails.

## Source and normalization

I independently read the original primary paper's definitions (1.2), (6.1), Conjecture 6.1, and the projection calculation (6.4)–(6.5), using the locally downloaded arXiv PDF's text. The source is [Kovalev, arXiv:2607.17373v1](https://arxiv.org/abs/2607.17373). The conjecture is on printed page 9 and quantifies over all real square matrices of order greater than two. Its pairing is the trace divided by the order. The proof uses precisely that pairing and the source's constant.

For a positive diagonal input, pointwise Cauchy–Schwarz produces a supporting functional for the full real matrix space. Gaussian sign symmetry removes every off-diagonal coefficient. Equality at the input matrix, followed by normalization of that input, proves that the displayed matrix has dual norm exactly one. This proves both directions of the dual-norm equality; it does not merely give a lower bound obtained from a diagonal test matrix.

I checked the Gaussian radius normalization and the fourth moment identity independently. They give

```math
\left(c_n\|A\|_{H^4}\right)^4
=\frac{8}{\pi^2}
\left[\left(\sum_i g_i^2\right)^2+2\sum_i g_i^4\right].
```

The direction of the resulting counterexample is therefore correct: a quartic quantity strictly above the stated constant violates the lower conjectured norm bound.

## The matrix family and uniform transfer

The input has one diagonal entry equal to one and all remaining entries equal to the square root of a fixed positive constant divided by their count. Permutation symmetry, without an independence assumption about an individual small coordinate and the denominator, gives the exact gradient formula. Its quartic expression includes an additional positive term that the proof safely discards.

Conditional Jensen applies because the reciprocal square-root function is convex in the chi-square average. The integrands are finite and integrable: the first expectation is bounded by the first absolute Gaussian moment, and the second by the expected square root of the chi-square average divided by the square root of the fixed constant.

For the second expectation, I checked the pointwise comparison in both ranges of its positive variable. In the range above one, the difference of the squared positive quantities factors as stated. Independence of the large Gaussian coordinate and the chi-square average then permits factorization of the expectation.

The mean-zero identity for the negative part of the centered average and its exact variance give

```math
\mathbb E\min(X_k,1)\geq1-\frac1{\sqrt{2k}}
\geq\frac{999}{1000}
\qquad(k\geq500000).
```

This is a bound for every integer in the indicated range. The proof does not infer a finite-dimensional violation solely from a formal limiting calculation. All constructed matrix entries are positive, so the counterexamples are full-rank real matrices.

## Special-function and elementary constants

I independently derived both one-dimensional expectation formulas. Substitution of a hyperbolic sine, followed by doubling the integration variable, gives the factors in (14), including the factor two in the denominator of the first expectation. The integral representation agrees with [DLMF 10.32.9](https://dlmf.nist.gov/10.32.E9).

The expansion of the zeroth modified Bessel function is exactly [DLMF 10.31.2](https://dlmf.nist.gov/10.31.E2). Differentiation must use the local function

```math
L(z)=\log(2/z)-\gamma,
```

then evaluate at the chosen positive argument. This was noted to the author as a minor notation clarification. The derivative signs and all four geometric-series majorants are correct. Substituting an upper bound for the logarithmic factor into its negative contribution gives the required lower bound for the Bessel difference. That lower bound is positive before it is multiplied by the elementary exponential lower bound.

The Euler-constant remainder is derived by telescoping the defining harmonic-number limit. Its integral representation is correct. The upper sum telescopes, and the lower sum exceeds the integral used in the proof. The resulting coarse rational bounds on Euler's constant and the logarithm suffice for the strict bounds claimed for their difference.

The logarithmic series has positive terms, with a valid geometric majorant for the tail. The arctangent certificate uses the alternating-series enclosure in the correct direction in Machin's formula. The rational upper bound for the square root follows by squaring positive quantities.

## Exact arithmetic and independent replay

I read and ran `verify.py`. It uses rational arithmetic throughout the required comparisons and returned `ALL_RATIONAL_COMPARISONS_PASSED`. The lower quartic fraction and the final gap agree exactly with the written proof.

I also wrote and ran `review_constants.py` independently before reading that verifier. It uses a different logarithmic decomposition,

```math
\log9600=13\log2+\log(75/64),
```

and different alternating-series truncations for the pi bound. It obtains the same final positive rational separation:

```math
\frac{8370960719747393508158728849}
{20430400000000000000000000000000}>0.
```

These checkers verify the finite arithmetic in the analytic proof. Neither checks a list of matrices or supplies a numerical substitute for the uniform transfer argument.

## Priority scope of this review

Supplementary exact-title, arXiv-identifier, author/Hardy-norm, and global GitHub issue searches found the July primary source, related older planar work, general reviews, and the campaign's own issue 209. They did not reveal a prior resolution. These supplementary searches do not replace the package's separate priority audit. Mathematical correctness of this construction and the extent of prior searching are separate claims.
