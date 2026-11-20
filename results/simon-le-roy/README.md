# Simon's Le Roy complete-monotonicity conjecture

## Priority correction: excluded from new-result count

A [complete earlier disproof](https://github.com/PrincipiaMathOrg/math-solutions/blob/47371706c400c79d06e3fb62190fcf6f7a725c85/site-backup/mathdb-349140/mathdb-349140-solution.tex) by Principia Math In Progress, dated **11 September 2026**, was located and read on 20 November 2026. The pinned repository revision establishes its presence by **27 October 2026**. It proves the same open interval below the proposed threshold. Simon's named conjecture was therefore already resolved before this repository's work.

The proofs below are retained with attribution. The explicit `13/30` construction supplies additional structure, but it does not constitute a newly resolved conjecture. See [the full exclusion audit](../../research/simon-le-roy/PRIOR-EXCLUSION.md).

## Retained mathematical statement

The conjecture is false, as already proved in the earlier manuscript. We prove complete monotonicity throughout an explicit parameter interval on which Simon's proposed necessary inequality fails. The proof is analytic and uses an exact positive probability construction.

For

```math
F_{\alpha,\beta}^{(\gamma)}(z)
=\sum_{n=0}^{\infty}\frac{z^n}{\Gamma(\beta+\alpha n)^\gamma},
```

Simon conjectured, for all positive $\alpha,\beta,\gamma$,

```math
F_{\alpha,\beta}^{(\gamma)}(-x)\text{ completely monotone on }(0,\infty)
\quad\Longleftrightarrow\quad
z+\gamma(z^{\beta-\alpha}-z^\beta)\leq1\quad(0\lt z\lt1).
```

Set

```math
\beta_*=\frac{13}{30},
\qquad
\beta_1=\frac13\left(1+\frac{\log(32/21)}{\log4}\right).
```

The main theorem proves that $F_{1/3,\beta}^{(2)}(-x)$ is completely monotone for every $\beta\geq\beta_*$. Yet the proposed necessary inequality fails at $z=1/64$ for every $\beta\in[\beta_*,\beta_1)$. The interval is nonempty, with $\beta_*\lt\beta_1\lt1/2$.

This disproves the full universal equivalence. The source's sufficiency theorem is retained; a complete classification of all triples is not asserted.

## Proof

[PROOF.md](PROOF.md) gives the explicit construction. It applies Daniel Dufresne's 2010 theorem on gamma-ratio laws, which is prior work and is fully credited.

At $\beta_*=13/30$, the rational function

```math
R(s)=\frac{(s+\beta_*)^2(s+2)}{(s+1/3)(s+2/3)(s+1)}
=1+\frac{3/40}{s+1/3}-\frac{49/75}{s+2/3}
+\frac{289/200}{s+1}
```

is the Laplace transform of a unit atom at zero and the strictly positive density

```math
e^{-t/3}\left(\frac3{40}-\frac{49}{75}e^{-t/3}
+\frac{289}{200}e^{-2t/3}\right).
```

The quadratic is positive because its discriminant is exactly $-599/90000$. Independent exponential tilts and an infinite product construct a positive random variable with the required gamma-ratio moments. A gamma factor removes an auxiliary denominator, and two beta factors extend the construction to every $\beta\geq13/30$.

Gauss triplication then gives a positive random variable $X_\beta$ with

```math
F_{1/3,\beta}^{(2)}(-x)
=\frac{1}{\Gamma(\beta)^2}\mathbb E[e^{-xX_\beta}].
```

This proves all derivative inequalities at all positive arguments. Failure of the proposed necessary condition has the exact integer certificate

```math
16^{11}-21^{10}=912305066215\gt0.
```

[ALTERNATIVE_PROOF.md](ALTERNATIVE_PROOF.md) preserves the independent density argument. It constructs a signed beta-mixture integral, proves strict positivity at the logarithmic-infinite-divisibility boundary, and controls both ends of the positive axis uniformly under parameter perturbation. This yields another interval below that boundary without using Dufresne's construction.

## Source and prior work

The source is Thomas Simon, *Remark on a Mittag-Leffler function of Le Roy type*, [arXiv:2012.11018v2](https://arxiv.org/pdf/2012.11018), Section 3, printed pages 5–6; *Integral Transforms and Special Functions* 33(2) (2022), 108–114, [DOI 10.1080/10652469.2021.1913138](https://doi.org/10.1080/10652469.2021.1913138).

The construction is from Daniel Dufresne, *G distributions and the beta-gamma algebra*, *Electronic Journal of Probability* 15 (2010), no. 71, 2163–2199, Theorem 6.3 and its converse, printed pages 2187–2188; [full published PDF](https://emis.de/ft/42731).

[NOVELTY.md](NOVELTY.md) records the primary-source checks and both-engine searches. No earlier publication of this exact specialization or another resolution of Simon's equivalence was located. The audit distinguishes the older general construction, known non-log-infinitely-divisible gamma laws, numerical Le Roy investigations, and the separate threshold-convexity question. It also records four full-text access limits. This is a bounded search conclusion, not a certification of worldwide priority.

## Reviews and exact verification

The [root review](../../research/simon-le-roy/AUDIT-ROOT.md) and [algebra review](../../research/simon-le-roy/AUDIT-ALGEBRA.md) independently read both written proofs and found no gap. The [Dufresne source audit](../../research/simon-le-roy/DUFRESNE-AUDIT.md) independently checked the classical theorem and searched for the exact earlier specialization. These are internal research-team reviews, not external peer review.

Review commits: [073a685](https://github.com/1337isnot1337/solved-conjectures/commit/073a685acc2805a5b9bf57e626813caeccb7c442), [d85a2d8](https://github.com/1337isnot1337/solved-conjectures/commit/d85a2d8d0d79e07ed537816d35f6ecaef7caef5c), and [9058cef](https://github.com/1337isnot1337/solved-conjectures/commit/9058cef01a17e23bc998d8d42d9d8449929124c0).

Run the standard-library verifier with:

```sh
python results/simon-le-roy/verify.py
```

It checks the rational partial fractions, completed-square identity, total mass, strict integer comparison, 54 finite-product identities, 21 triplication normalizations, and 80 beta-product moment identities. The authoring lane and root ran it independently; all checks passed. These finite algebra checks support the proof. The infinite probability construction and complete monotonicity are established in the written argument.

Coordination and review history: [issue 104](https://github.com/1337isnot1337/solved-conjectures/issues/104). No Lean verification was performed.
