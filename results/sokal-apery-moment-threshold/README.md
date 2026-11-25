# Sokal’s Apéry moment threshold

**The excluded interval is proved.** For every real parameter strictly between zero and one, the Apéry polynomials do not form a Stieltjes moment sequence. This closes the remaining side of Sokal’s original threshold. The positive side was already addressed by Knowledge Sense, and Edgar previously proved the endpoint at one.

The proof detects a singularity in the Legendre-period transform throughout the excluded interval. It also distinguishes the exceptional parameter one quarter: there is a Hamburger measure there, but its support is not all nonnegative.

- [Lean formalization](FORMALIZATION.md)
- [Proof of the previously excluded interval](PROOF.md)
- [Independent alternative proof of the earlier positive side](POSITIVE_INTERVAL.md)
- [Hamburger moment classification](HAMBURGER.md)
- [Independent audit and prior-work attribution](AUDIT.md)
- [Discovery issue #415](https://github.com/1337isnot1337/solved-conjectures/issues/415)

The coefficientwise Hankel-total-positivity conjecture is not resolved here.

**Lean status:** partial. Lean excludes every parameter with 0 < x ≤ 1/40 and an open neighborhood of one quarter. It checks the moment continuation and the lower-endpoint obstruction under the torus transform identity. The identity and the saddle cusp remain unformalized.
