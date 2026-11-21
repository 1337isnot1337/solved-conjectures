# Fang–Zhang–Zhao priority audit

**Superseding correction, 21 November 2026:** both conjectures reviewed here are prior-resolved and excluded. In addition to the already recorded Sturm proof, [Principia's complete Conjecture 4.3 disproof](https://github.com/PrincipiaMathOrg/math-solutions/blob/c18609e47b635722206b9a2e9dcd402d0edcfb0a/mathdb/368345/solution.tex) was public on 26 October 2026. The earlier no-prior-found conclusion below is withdrawn; historical searches are retained with their actual limitations.

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

## Infinite-log-convexity conjecture: prior resolution confirmed

Conjecture 4.3 concerns infinite iterated log-convexity of the row sums for every fixed integer $`m\geq2`$. It is distinct from Conjecture 4.1 and from the Baxter-only Conjecture 4.2. The source's complete Section 4 was reread. The earlier Sturm issue explicitly leaves the Baxter problem outside its scope and contains no disproof of Conjecture 4.3.

The initial audit missed an earlier complete disproof. Direct inspection of `PrincipiaMathOrg/math-solutions/mathdb/368345/solution.tex` located the [full prior source](https://github.com/PrincipiaMathOrg/math-solutions/blob/c18609e47b635722206b9a2e9dcd402d0edcfb0a/mathdb/368345/solution.tex) at public commit `c18609e47b635722206b9a2e9dcd402d0edcfb0a`, with author and committer timestamp 26 October 2026, 14:00:38 UTC. The path history returns that single insertion commit, and its file is identical to the current file. The internal manuscript date of 18 September is not used to establish public chronology. The referenced upstream branch could not be accessed, so no earlier public date is asserted.

The prior source gives the identical negative fourth iterates for $`m=4,5`$, the same degree-17 polynomial (called $`P`$ there and $`Q`$ here), the same factor $`m^4(m-1)^4(m+1)^5(m+2)^2(m^4+9m^3+26m^2+36m+72)`$, and denominator $`1547934105600`$. It proves negativity of the third iterate for every $`m\ge6`$, hence the entire $`m\ge4`$ counterfamily. Its qualification about an unread final-journal source does not erase the complete public disproof of the preprint statement. This campaign's argument is a rediscovery and contributes **zero**.

The later literature checks and access gaps below describe the original audit. They no longer leave novelty undecided: the directly read prior proof settles that gate.

### Later primary literature independently checked

The introduction and complete Section 6 of Mao–Shi, *The analytic properties of Hoggatt triangles*, [arXiv:2607.01582](https://arxiv.org/abs/2607.01582), were read in the [public full-text copy](https://www.researchgate.net/publication/408402809_The_analytic_properties_of_Hoggatt_triangles). Section 6 proves ordinary first-order log-convexity for the Baxter and height-four row sums, discusses eventual first-order log-convexity for larger heights, and asks further moment and coefficientwise log-convexity questions. None is an infinite-iterate proof or refutation. Its notation starts at row zero, so its $`H_{n,d}`$ is the source conjecture's $`H_{n+1}^{[d]}(1,1)`$.

Zeng's [November 13 revision, arXiv:2610.28691v2](https://arxiv.cnoctave.top/pdf/2610.28691), Section 8, printed page 15, was independently read. It distinguishes the recent Schur-function results as particular two-by-two inequalities and distinguishes normalized from unscaled adjacent interlacing. Its Section 13, printed pages 37–38, was also read. Proposition 13.1 refutes formal-q log-convexity preservation for a different kernel; at the classical q-limit its displayed negative constant-coefficient obstruction does not give a negative iterated ordinary Hoggatt row-sum entry. It therefore does not preempt the present Conjecture 4.3 disproof. Text searches for a counterexample and for infinite log-convexity found no such result in that manuscript.

The previously inaccessible June Chern–Shi paper, *Proof of Cigler's conjecture on q-Hoggatt numbers*, is available as an [author-hosted PDF](https://shanechern.github.io/publications/preprints/113.pdf), linked from [Chern's publication list](https://shanechern.github.io/publications.html). Its introduction, main theorem, and closing section were read. They prove polynomiality, nonnegativity, and palindromicity of a column-series transform, with a related Fibonacci–Hoggatt polynomial statement. Neither the theorem nor its closing discussion resolves Conjecture 4.3. Searches of the PDF found no occurrence of convexity or Fang. This successful retrieval closes the access gap for that June paper only.

The primary abstracts of Chern–Shi, [arXiv:2609.33732](https://arxiv.org/abs/2609.33732), and Liu–Mao, [arXiv:2608.22258](https://arxiv.org/abs/2608.22258), were inspected. They describe first-order or strong first-order log-convexity/log-concavity and transformations. Such claims do not by themselves imply infinite iterated log-convexity. Direct arXiv PDF/HTML and mirror requests failed; no assertion is made about possible additional remarks inside those full texts. Chern's current publication page supplies no link to the September manuscript.

## Independent repository and corpus searches

Global GitHub issue searches were run without restricting to this repository. The exact arXiv identifier returned this campaign's issue 160, the earlier Sturm issue 18758, and an unrelated Zhang–Zhao problem. The broad Hoggatt search returned 35 issues; mathematical matches were inspected and distinguished from uses of Hoggatt as a personal name. Additional searches included:

- `"Hoggatt" "log-convex" is:issue`
- `"Hoggatt" "convexity" is:issue`
- `"Hoggatt" "infinite" is:issue`
- `"Hoggatt" "disproof" is:issue`
- `"111509459048444462640611465400686603136" is:issue`

The exact negative witness search returned only issue 160. The log-convexity searches also found [trureturing issue 25307](https://github.com/the-omega-institute/trureturing/issues/25307), which refutes a different transformation-preservation question in Zeng's q-Narayana paper. Its stated kernels, input sequence, and negative two-by-two minors were inspected; it is not a refutation of ordinary Hoggatt row-sum infinite log-convexity. [RealRooted issue 2548](https://github.com/PerAlexandersson/RealRooted/issues/2548) is explicitly about the already proved classical $`q=1`$ Sturm theorem, not the remaining deformation or iterated row-sum claim.

The [Principia archive manifest](https://github.com/PrincipiaMathOrg/math-solutions/blob/34b8b155d7db464ad7306f70b16d3af9cee34501/site-backup/MANIFEST.json) and KnowledgeSense's current preprint directory names were screened for Hoggatt, Baxter, Fang, and related log-convexity titles. The current README indexes of [Principia](https://github.com/PrincipiaMathOrg/math-solutions), [pudim](https://github.com/pudim-project/pudim-ai-demo-zetalaw), and [CoPEER](https://github.com/qqliu/CoPEER) were also searched. No matching full target was found in those title-level checks. The later direct read of `mathdb/368345/solution.tex` shows that the archive did contain the complete disproof. These are title/manifest/index searches; they are not represented as a full-text search of every manuscript in those archives.

Global GitHub code search was unavailable: a Hoggatt query at approximately 07:10 UTC on November 21 returned HTTP 429 with a retry delay of 834 seconds. That failure is not a negative search result. Further retries were stopped to avoid resetting a shared limit. Public web searches using both available engines and current primary-source checks supplement the successful issue search. They included the exact source identifier and conjecture number, Hoggatt with infinite log-convexity, counterexample, disproof, proof, and the exact negative witness, as well as the later paper identifiers. The inaccessible September Chern–Shi and August Liu–Mao full texts remain explicit limits.

The successful issue search excludes the Sturm package. The later direct archive inspection and authenticated 26 October commit also exclude the infinite-log-convexity package. Both ordinary mathematical arguments remain valid, but neither is a new resolution for this campaign.

