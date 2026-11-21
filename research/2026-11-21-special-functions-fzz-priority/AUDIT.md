# Fang–Zhang–Zhao priority audit

Audit date: November 21, 2026. This audit independently reviews the two results previously promoted in issues [160](https://github.com/1337isnot1337/solved-conjectures/issues/160) and [162](https://github.com/1337isnot1337/solved-conjectures/issues/162). It supplements the packages' mathematical reviews; it does not claim another resolution.

## Sturm conjecture: excluded from the new-result count

The stronger all-parameter theorem and its proof were already publicly recorded in [the-omega-institute/trureturing issue 18758](https://github.com/the-omega-institute/trureturing/issues/18758). GitHub's issue metadata gives creation on October 18, 2026, at 07:44:10 UTC and the last update on October 27, 2026, at 13:38:19 UTC. Both precede the present campaign.

The entire ordinary proof in the earlier issue, its source definitions, and every issue comment were read. The issue establishes the same claimed range: every real $`q\geq1`$, every integer $`m\geq2`$, and every consecutive row index. This includes Conjecture 4.1 of Fang, Zhang and Zhao, [arXiv:2505.05873v1, Section 4](https://arxiv.org/html/2505.05873v1#S4). The original section was independently reread and confirms the integer-$`q`$, $`m=2,3`$ quantifiers. The classical $`q=1`$ case was already the source's Theorem 1.2.

### Exact proof overlap

The earlier issue contains each substantive ingredient used in the repository package:

1. MacMahon's product identifies the Hoggatt polynomials with positive scalar multiples of a Gaussian-binomial product sum.
2. Garloff–Wagner's strict Hadamard-product theorem supplies strict geometric separation of negative roots.
3. A Jackson Rolle argument locates the derivative roots between the geometrically separated roots.
4. A partial-fraction argument preserves strict adjacent interlacing under the Jackson derivative.
5. A direct Gaussian-binomial coefficient identity identifies the Jackson derivative of the auxiliary Hadamard product.
6. Induction on the height parameter proves all rows; the final argument scaling is independent of the row index.

There is a harmless difference in the auxiliary normalization. If $`\widehat F_{N,m}`$ is the earlier issue's family and $`F_{N,m}`$ is the repository package's weighted family, then direct summation of the exponents gives

```math
F_{N,m}(t)
=q^{\binom{m+1}{3}}
\widehat F_{N,m}\!\left(q^{\binom m2}t\right).
```

The change is positive and independent of $`N`$. It does not change the theorem or supply an independent unproved part of the conjecture. The repository's use of the higher-degree polynomial in the partial-fraction ratio is another equivalent presentation of the same interlacing argument.

The earlier computations are independently pinned by [experiment commit 0e3c5db67a5683674444b4a2975053ab94db915a](https://github.com/the-omega-institute/trureturing-experiments/commit/0e3c5db67a5683674444b4a2975053ab94db915a), dated October 18, 2026, at 05:34:48 UTC. Its [README](https://github.com/the-omega-institute/trureturing-experiments/blob/0e3c5db67a5683674444b4a2975053ab94db915a/docs/reports/fang-zhang-zhao-2025-conjecture-4-1-q-hoggatt-sturm/README.md) records the exact normalization and Jackson identity. These finite computations support the provenance; the general prior argument is the ordinary proof in the issue.

### Qualification about the earlier project's status

The [October 27 comment](https://github.com/the-omega-institute/trureturing/issues/18758#issuecomment-6443303822) calls that project's formalization open. It lists a missing formal plane-partition enumeration theorem, missing strict Garloff–Wagner transport, and assembly work. Those are formalization gaps, not new ordinary mathematical inputs supplied here: MacMahon enumeration and the strict Hadamard theorem were already cited in the earlier proof.

The comment also corrects a degenerate generic lemma when the lower-degree polynomial is constant. It explicitly records the repaired positive-degree version. The earlier ordinary induction already treats the constant/linear initial comparison separately. This correction does not leave a new full conjecture for the November campaign to solve.

The conclusion is therefore conservative and definite: the repository package is a reproof of an earlier public ordinary argument. It contributes **zero new resolutions**, irrespective of whether either argument has a completed formalization or journal publication. No Lean work was performed for this audit.

## Infinite-log-convexity conjecture: separate audit

Conjecture 4.3 concerns infinite iterated log-convexity of the row sums for every fixed integer $`m\geq2`$. It is distinct from Conjecture 4.1 and from the Baxter-only Conjecture 4.2. The source's complete Section 4 was reread. The earlier Sturm issue explicitly leaves the Baxter problem outside its scope and contains no disproof of Conjecture 4.3.

At this checkpoint, no earlier disproof of Conjecture 4.3 has been located. The current package's exact all-$`m\geq4`$ refutation remains under the independent priority search below. Absence from these searches is bounded evidence, not a proof that all unindexed material is absent.

## Independent repository and corpus searches

Global GitHub issue searches were run without restricting to this repository. The exact arXiv identifier returned this campaign's issue 160, the earlier Sturm issue 18758, and an unrelated Zhang–Zhao problem. The broad Hoggatt search returned 35 issues; mathematical matches were inspected and distinguished from uses of Hoggatt as a personal name. Additional searches included:

- `"Hoggatt" "log-convex" is:issue`
- `"Hoggatt" "convexity" is:issue`
- `"Hoggatt" "infinite" is:issue`
- `"Hoggatt" "disproof" is:issue`
- `"111509459048444462640611465400686603136" is:issue`

The exact negative witness search returned only issue 160. The log-convexity searches also found [trureturing issue 25307](https://github.com/the-omega-institute/trureturing/issues/25307), which refutes a different transformation-preservation question in Zeng's q-Narayana paper. Its stated kernels, input sequence, and negative two-by-two minors were inspected; it is not a refutation of ordinary Hoggatt row-sum infinite log-convexity. [RealRooted issue 2548](https://github.com/PerAlexandersson/RealRooted/issues/2548) is explicitly about the already proved classical $`q=1`$ Sturm theorem, not the remaining deformation or iterated row-sum claim.

The [Principia archive manifest](https://github.com/PrincipiaMathOrg/math-solutions/blob/34b8b155d7db464ad7306f70b16d3af9cee34501/site-backup/MANIFEST.json) and KnowledgeSense's current preprint directory names were screened for Hoggatt, Baxter, Fang, and related log-convexity titles. No matching full target was found. This is a title/manifest search; it is not represented as a full-text search of every manuscript in those archives.

Global GitHub code search was unavailable: a Hoggatt query at approximately 07:10 UTC on November 21 returned HTTP 429 with a retry delay of 834 seconds. That failure is not a negative search result. Public web searches using both available engines and current primary-source checks supplement the successful issue search. The inaccessible Chern–Shi and Liu–Mao full texts recorded in the existing NOVELTY files remain explicit limits pending a successful alternative retrieval.

The successful issue search already supplies a decisive exclusion of the Sturm package; further unavailable searches cannot undo that finding. The infinite-log-convexity audit will be updated separately when the remaining searches are complete.
