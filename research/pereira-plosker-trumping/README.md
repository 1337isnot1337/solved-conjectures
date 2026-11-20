# Pereira–Plosker's trumping conjecture

Status: complete candidate proofs passed separate internal mathematical reviews. The boundary-hypothesis and prior-theorem audits remain open. No named resolution is claimed yet.

The target is Conjecture 1 in Pereira and Plosker, [arXiv:1405.2845](https://arxiv.org/pdf/1405.2845), printed page 7; *Linear Algebra and its Applications* 468 (2015), 80–86, DOI [10.1016/j.laa.2014.01.026](https://doi.org/10.1016/j.laa.2014.01.026).

The source asks whether positivity of a generalized Dirichlet series on $(1,\infty)$, absolute convergence on the closed half-plane $\mathop{\mathrm{Re}}s\geq1$, and a simple zero at $s=1$ characterize the existence of a positive Dirichlet multiplier making $\zeta(s)\zeta_2(s)/(s(s-1))$ completely monotone.

The analysis gives an exact positive-multiplier criterion. The phrase “simple zero” requires explicit attention because the source places the zero on the boundary of the stated half-plane and does not define boundary multiplicity.

## Findings

1. A full positive-multiplier lemma holds in the real Wiener algebra of absolutely summable power series. One proof uses classical polynomial factors, norm approximation, and a positive Neumann series. An independent proof uses separation of an Archimedean semiring and multiplicativity of extreme positive functionals.
2. If the inverse Laplace density $h$ associated with the quotient is integrable, a monotone rounding of the input atoms reduces the conjecture to that lemma. The multiplier can be chosen on one arithmetic progression.
3. Holomorphic extension across a neighborhood of $s=1$, with a simple zero there, implies the required integrability by an elementary Fourier cutoff argument.
4. A merely finite, nonzero right derivative at $s=1$ is weaker. An explicit infinite block construction refutes the assertion under that interpretation. The obstruction is that any finite positive multiplier would force $h$ to be integrable.

The complete arguments are in [CANDIDATE_PROOF.md](CANDIDATE_PROOF.md). The detailed source and priority audit is in [NOVELTY.md](NOVELTY.md), and a separate full mathematical review is recorded in [AUDIT-ALGEBRA.md](AUDIT-ALGEBRA.md). The proof is not restricted to a finite dimension or a fixed determinant order.

## Prior work checked

The source statement and both authors' relevant publication records were searched with both engines. No exact prior resolution was located. The following neighboring results have been directly inspected and do not immediately settle the statement:

- Aubrun–Nechita, [2009, Section 6](https://www.numdam.org/item/AIHPB_2009__45_3_611_0.pdf): approximation by finitely supported vectors under norm and entropy conditions.
- Fritz, [arXiv:2004.13655v4](https://arxiv.org/pdf/2004.13655), Theorem 5.6: catalytic stochastic order for compactly supported random variables.
- Motzkin–Straus, [1969, Section 4](https://msp.org/pjm/1969/29-3/pjm-v29-n3-p13-p.pdf): positive power-series multipliers on smaller convergence disks, with a full-radius question left open in that paper.
- Katkova–Vishnyakova, [2001, Theorems 1–2](https://ekhnuir.karazin.ua/bitstreams/41e252c6-eba5-435f-bbbb-66a8582ace7e/download): positive convolution multipliers under all exponential moments, eventual positivity, and positivity of the bilateral Laplace transform on the whole real line.
- Pomatto–Strack–Tamuz, [arXiv:1807.06927](https://arxiv.org/pdf/1807.06927): unrestricted two-sided background noise. The required multiplier here is supported on a positive half-line.

The 2019 Moein–Pereira–Plosker follow-up concerns stochastic operators, and the 2026 Elkouss–Maity–Nema–Strelchuk paper concerns finite probability vectors. Their full preprints were inspected and did not resolve the target; exact references and scope are recorded in NOVELTY.md.

Diamond–Essén's *Functions with non-negative convolutions*, JMAA 63 (1978), 463–489, DOI [10.1016/0022-247X(78)90091-4](https://doi.org/10.1016/0022-247X(78)90091-4), is a material prior-theorem risk. It is cited by Katkova–Vishnyakova. Publisher, author-page, and mathematical-review retrieval attempts by two agents have not yielded its full theorem. It has not been represented as a fully inspected source or excluded as an earlier resolution.

Coordination: [issue 96](https://github.com/1337isnot1337/solved-conjectures/issues/96). No Lean work.

