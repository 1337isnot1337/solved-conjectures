# Independent root audit

Date: 2026-11-20. Reviewed: `CANDIDATE_PROOF.md` at commit `04ab22fc69f72cefa88c229a105ef12536ff7dbc`.

## Mathematical review

The full written argument passes this review. This is an internal mathematical review, not external peer review.

The initial-Wronskian lemma is sufficient as stated. Division by the nonvanishing first function preserves distinct zeros. Differentiation and Rolle's theorem reduce the zero count by one, and the displayed Wronskian quotient identity gives the induction hypothesis for the derivative functions. The sign of an evaluation determinant is then fixed by connectedness and the positive Vandermonde in the coalescing-node limit.

For the power kernel, factor the falling factorial from each derivative row and `(u+v_j)^delta` from each column. The remaining Vandermonde is evaluated at decreasing nodes `1/(u+v_j)`, giving the factor `(-1)^(r(r-1)/2)`. Every prefix Wronskian is nonzero for nonintegral positive delta. For integral delta=m, the same argument proves strictness through order m+1; polynomial degree proves rank at most m+1 thereafter. Thus the full parameter-dependent power signature is justified, including the sign change at delta=1.

The gamma-density kernel is strictly totally positive by its reduction to `exp(a log u)` and the same Wronskian lemma. The substitution `r=u+v`, `t=u/(u+v)` has Jacobian r and separates the double integral into a gamma integral and a beta integral. It gives precisely the required quotient, with no additional normalizing factor.

The two ordered continuous Cauchy–Binet formulas have the right orientation and normalization. Transposing the final gamma determinant introduces no sign. Each expansion term is absolutely integrable: `(u+v)^delta <= (1+u)^delta(1+v)^delta`, and gamma densities have finite polynomial moments. The resulting integrand has a fixed strict sign throughout a nonempty open ordered domain. Hence its integral has that strict sign. For integer delta, vanishing above the polynomial rank follows from the same formula.

Finally, for any finite grid with `d+x_1+y_1>0`, the interval `(-x_1,d+y_1)` is nonempty. Choosing a in this interval and b=d-a makes both translated shape grids positive. The signature is independent of this grid-dependent choice. No conclusion across gamma poles is required or claimed.

The proof establishes all orders and all positive parameter differences. The correction of the source's subsidiary order-three signature is part of this single result; it is not counted as another conjecture.

## Source and prior-resolution search

The primary statement was checked in [the journal PDF](https://dmkrp.wordpress.com/wp-content/uploads/2025/05/karp-anna-vishnyakova-and-yi-zhang.pdf), Section 3 item 11, printed pages 13–14, and in [arXiv:2408.01755v2](https://arxiv.org/html/2408.01755v2). Both state the all-order claim for c>d and the fixed order-three signature without restricting c-d to exceed one. The adjacent universal Hadamard-product belief is a different assertion, treated in issue 94.

Both search engines were used with combinations of the authors' names, gamma quotient, gamma ratio, Hankel kernel, sign regularity, rising factorial, conjecture, and proof, including recent searches through the research date. No earlier exact resolution was found in the inspected material. Concrete overlap checks included:

- [Karp's publication list](https://dmkrp.wordpress.com/publications/), which includes entries through August 2026. The listed later papers do not announce this gamma-quotient resolution. This is a bounded author-list check, not a claim that every unpublished manuscript is known.
- [Khare's publication list](https://math.iisc.ac.in/~khare/papers.html) and his [2026 entrywise-calculus survey, arXiv:2511.08406](https://arxiv.org/html/2511.08406v1). The survey concerns entrywise positivity preservers and does not state the present additive gamma-quotient result. This is relevant because the source mentions a possible later argument suggested by Khare.
- Koumandos and Pedersen, [Some two-parameter families of generalized Bernstein functions, arXiv:2507.03551v1](https://arxiv.org/pdf/2507.03551), full 17-page preprint. Its main statements concern normalized reciprocal gamma ratios and generalized Bernstein or Stieltjes classes. No Hankel-kernel or sign-regularity theorem for the present quotient is stated. The full preprint, not merely its abstract, was inspected at the main-theorem level.
- The public [Pudim applications record](https://github.com/pudim-project/pudim-ai-demo-zetalaw/blob/main/APPLICATIONS.md). Its positive q-gamma result, Simon normalized-ratio Bernstein result, Baricz four-gamma-quotient Bernstein disproof, and Bulboaca–Zayed scalar critical-point result have different statements. Their public scope descriptions were inspected.
- [Salazar, arXiv:2606.31647v2](https://arxiv.org/abs/2606.31647), has a current abstract announcing positive q-gamma, Mills-ratio, Tricomi, and Coulomb determinant results. Full-text retrieval failed. The inspected abstract describes totally nonnegative Hankel results; it does not announce the present mixed-sign gamma-quotient theorem. The inaccessible full text remains a stated limit of the search, not a source claimed to have been read.
- The public [Karp–Prilepkina Meijer zero-count disproof](https://www.trureturing.org/research/karp-prilepkina-2015-meijer-zero-count/) concerns a zero-count comparison for an inverse Mellin transform. It does not settle the present kernel assertion. No Lean work was performed.
- [Math Stack Exchange question 5141806](https://math.stackexchange.com/questions/5141806/does-this-gamma-ratio-moment-inequality-hold) asks a different alternating moment implication and has no answer in the inspected page.

The power-kernel sign calculation, gamma convolution identity, and determinant composition method are classical. Any priority claim concerns the exact named conjecture and its complete signature, not those ingredients. The defensible statement is that no earlier full resolution was located in this documented search; an absolute guarantee of priority is not possible from a literature search.

Coordination: [issue 97](https://github.com/1337isnot1337/solved-conjectures/issues/97).
