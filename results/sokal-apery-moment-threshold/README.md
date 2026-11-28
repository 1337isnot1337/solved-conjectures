# Sokal’s Apéry moment threshold

**Prior work.** The excluded interval was already settled by Brandon Li and Ethan Yeroushalmi, Zenodo, registered 7 November 2026, [doi:10.5281/zenodo.24043854](https://doi.org/10.5281/zenodo.24043854), and the Hamburger classification is also stated in Joshua W. Davis, Zenodo, registered 21 November 2026, [doi:10.5281/zenodo.24331816](https://doi.org/10.5281/zenodo.24331816). Cite those works for the result. This page records a later derivation first committed on 24 November 2026. It is unranked and is not counted as a new resolution. [Details](PROOF.md)

**The excluded interval is proved.** For every real parameter strictly between zero and one, the Apéry polynomials do not form a Stieltjes moment sequence. This is the remaining side of Sokal’s original threshold. The positive side was already addressed by Knowledge Sense, and Edgar previously proved the endpoint at one.

The proof detects a singularity in the Legendre-period transform throughout the excluded interval. It also distinguishes the exceptional parameter one quarter: there is a Hamburger measure there, but its support is not all nonnegative.

- [Lean formalization](FORMALIZATION.md)
- [Proof of the previously excluded interval](PROOF.md)
- [Independent alternative proof of the earlier positive side](POSITIVE_INTERVAL.md)
- [Hamburger moment classification](HAMBURGER.md)
- [Independent audit and prior-work attribution](AUDIT.md)
- [Discovery issue #415](https://github.com/1337isnot1337/solved-conjectures/issues/415)

The coefficientwise Hankel-total-positivity conjecture is not resolved here.

**Lean status:** partial. Lean excludes every parameter with 0 < x ≤ 1/40 and an open neighborhood of one quarter. It checks the moment continuation and the lower-endpoint obstruction under the torus transform identity. The identity and the saddle cusp remain unformalized.
