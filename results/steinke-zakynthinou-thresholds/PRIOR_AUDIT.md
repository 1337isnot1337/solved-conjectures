# Fresh prior-art audit: the agnostic threshold CMI prize

Date checked: 21 November 2026. Reviewer: the independent `other_paid_math` lane.

## Finding

**No matching prior resolution was located.** The separately stated US$20 proper-threshold and US$15 improper-threshold offers are present in the sponsors' published paper. The sources checked contain no withdrawal, expiry, or payment announcement for that exact target. The strongest recent matching paper explicitly treats evaluated CMI in the realizable setting and leaves original CMI open.

This is a source and exact-scope audit. It does not independently certify every step of the candidate proof, establish priority against unindexed work, or confirm that a sponsor has approved or paid an award. Lack of a new sponsor acknowledgment is not treated as a withdrawal of the public offer. No sponsor was contacted, and no submission or payment request was made.

The original candidate examined for target matching was `agents/demath_zzz/threshold-shifted-tree-candidate-proof.md`, SHA-256 `d8dbbfac80b7711af85df8e116a7d7a3e788fafadfeac22cf90bbfaf56388476`. The later companion `agents/demath_zzz/threshold-properization-information-lemma.md`, SHA-256 `eadb9c59a88f144ad800a5684da425c09e5d8700783a51b332a3c06c6a59a965`, was also read for scope: it always outputs a closed threshold with a finite real parameter, preserves every selected-sample prediction, and claims an absolute additional original-CMI cost. The mathematical proofs were being reviewed separately when this audit was written. Properization strengthens the same target; it is not a second completed problem. The campaign completion count remains unchanged by this audit.

## 1. The sponsor's exact target and cash offer

[Steinke and Zakynthinou, *Open Problem: Information Complexity of VC Learning*](https://proceedings.mlr.press/v125/steinke20b/steinke20b.pdf), COLT 2020, PDF pp. 3–4, Definition 3, Conjecture 6, and Section 3, supplies the target and offer. Specializing Conjecture 6 to real thresholds requires one distribution-independent learner for each $`n\ge1`$ with


```math
I(A_n(\widetilde Z_S);S\mid\widetilde Z)\le C_I
\quad\text{for every iid data distribution }D,
```


and


```math
\mathbb E_{A_n}\widehat L_z(A_n(z))
\le\inf_{h\in\mathcal T}\widehat L_z(h)+\frac{C_L}{\sqrt n}
\quad\text{for every fixed labeled sample }z.
```


Here $`\widetilde Z`$ contains $`n`$ independent pairs of observations and $`S`$ consists of independent fair selector bits. The constants are absolute; taking their maximum meets the source's single-constant convention.

Section 3 expressly offers **US$20 for thresholds or US$15 for an improper learner**. It also mentions efficiency and determinism bonuses. No bonus is claimed here. The text imposes no stated expiry date. This is payment to the solver, not an honorary donation.

### Threshold endpoints

The companion [full framework manuscript, arXiv:2001.09122v3](https://arxiv.org/pdf/2001.09122v3), Section 4.4, printed p. 25, defines


```math
\mathcal T=\{x\mapsto1[x\ge t]:t\in\mathbb R\}\cup\{0\}.
```


Its infinity parameter denotes the constant-zero function. The original candidate uses this comparator class and permits open thresholds in its output, matching the improper offer. The companion conversion instead always outputs a finite closed threshold and preserves all predictions on the selected sample. On every finite sample, adding the constant-zero comparator leaves the minimum empirical loss unchanged, because a finite threshold above its largest feature has the same trace. Consequently the companion's claimed theorem matches the stronger proper offer without depending on whether infinity is called a proper parameter. The endpoint convention remains relevant to the original candidate's atom handling.

## 2. Required distinctions

These are scope checks on the claimed theorem, not interchangeable formulations.

| Requirement | Insufficient substitute |
|---|---|
| Original CMI of the output hypothesis | Information only in its loss or prediction vector on a supersample; a data-processing upper bound runs in the wrong direction for recovering original CMI. |
| One learner for all distributions | A learner supplied with the data-generating distribution or a ghost sample. |
| Every iid distribution, including atoms and arbitrary noisy labels | Only realizable, atomless, uniform-feature, or Massart-noise distributions. |
| Expected empirical excess on every individual labeled sample | Only an expected population-risk bound, or an empirical bound averaged over samples from a particular distribution. |
| An absolute information bound for all sample sizes | A logarithmic information bound combined with a sharper generalization theorem. |
| The separately rewarded threshold statement, proper or improper as actually proved | The general proper VC conjecture, its realizable versions, or the full improper VC conjecture. |

The candidate's stated theorem matches the left-hand column. Establishing that its construction actually satisfies the theorem is the separate proof-review obligation.

## 3. Primary literature examined

### Steinke–Zakynthinou 2020: constant information already known for realizable thresholds

The [framework manuscript](https://arxiv.org/pdf/2001.09122), Section 4.4, Theorem 4.21, printed pp. 25–26, analyzes the smallest positively labeled observation, or infinity if there is none. The information bound holds even for a fixed supersample. The accuracy guarantee is consistency whenever the sample is realizable. It supplies no agnostic approximate-minimum-loss guarantee on all labeled samples.

As a direct diagnostic, put one positive observation at the smallest feature and make all remaining labels zero. The smallest-positive rule misclassifies all those negatives; the all-zero comparator makes only one error. The normalized excess tends to one, so this old learner cannot meet the prize's order-$`n^{-1/2}`$ samplewise requirement. This diagnostic is only a scope check on that particular old algorithm.

The framework manuscript's Conjecture 4.18 uses a worst-supersample information requirement. The separate open-problem paper uses distributional CMI, averaging over an iid supersample. The candidate relies on the latter requirement and must not be described as proving the stronger fixed-pool statement.

### Hafez-Kolahi et al. 2020: chaining recovers the optimal generalization rate

[Hafez-Kolahi, Golgooni, Kasaei, and Soleymani Baghshah, *Conditioning and Processing: Techniques to Improve Information-Theoretic Generalization Bounds*](https://papers.nips.cc/paper/2020/file/befe5b0172188ad14d48c3ebe9cf76bf-Paper.pdf), NeurIPS 2020, Sections 4.2 and 5, pp. 6–9, is an important apparent overlap.

Theorem 7 and equations (26)–(30) remove the logarithm in the **generalization bound** through a weighted series of scale-dependent processed information quantities. The processed hypotheses can depend on the conditioned supersample. This does not state a single implementable learner with bounded original CMI. The text immediately before Section 5 itself distinguishes the original conjecture's proposed change of learning algorithm from its analysis of existing algorithms. No exact agnostic-threshold solution is supplied there.

### Haghifam et al. 2020 and 2021: proper realizable impossibility and stable compression

[Haghifam, Dziugaite, Moran, and Roy, *On the Information Complexity of Proper Learners for VC Classes in the Realizable Case*](https://arxiv.org/pdf/2011.02970), Sections 3–5, Statement 1 and Theorem 4.2, refutes the universal **proper** realizable claims corresponding to Conjectures 7 and 8. It does not refute Conjecture 6 restricted to thresholds, and it does not forbid an improper threshold learner with the weaker order-$`n^{-1/2}`$ empirical allowance.

Their [NeurIPS 2021 paper, *Towards a Unified Information-Theoretic Framework for Generalization*](https://proceedings.neurips.cc/paper/2021/file/ddbc86dc4b2fbfd8a62e12096227e068-Paper.pdf), has two relevant locations:

- Section 3.1, Theorem 3.4 and Remark 3.5, pp. 5–6: constant CMI for stable compression under realizable distributions, and the same old smallest-positive threshold learner.
- Section 4.1, Statement 1 and Theorem 4.4, pp. 7–8: the proper realizable obstruction. Section 6, p. 10, separately discusses remaining original- and evaluated-information questions.

Neither location provides the agnostic improper threshold theorem at issue.

### Grünwald–Steinke–Zakynthinou 2021: conditional PAC-Bayes fast rates

[Grünwald, Steinke, and Zakynthinou, *PAC-Bayes, MAC-Bayes and Conditional Mutual Information: Fast rate bounds that handle general VC classes*](https://proceedings.mlr.press/v134/grunwald21a/grunwald21a.pdf), COLT 2021, Theorem 9, Section 3.1.1, and Example 1, pp. 10–13, gives conditional complexity bounds and faster excess-risk rates under Bernstein-type conditions.

Its VC complexity still has the logarithmic sample-size factor; the threshold example with label noise gets a fast rate from an additional distributional condition. It does not state a distribution-independent agnostic threshold learner with absolute original CMI and the required empirical guarantee for every sample. A fast population-risk rate alone would not prove that information bound.

### Haghifam et al. 2022: leave-one-out information

[Haghifam, Moran, Roy, and Dziugaite, *Understanding Generalization via Leave-One-Out Conditional Mutual Information*](https://arxiv.org/abs/2206.14800), ISIT 2022, is also summarized on the [coauthor's publication page](https://gkdz.org/publication/hdmr22/). It conditions on a supersample of size $`n+1`$ with one observation left out. Its optimal VC-rate application uses the one-inclusion graph algorithm in the realizable setting. This is a different information experiment and an accuracy regime different from the present agnostic target. Its statement that it answers an open challenge about information-theoretic generalization must not be read as resolving the $15 threshold offer.

### Hanneke–Wang 2026: evaluated CMI, with original CMI expressly left open

[Hanneke and Wang, *The Optimal Information Complexity of VC Learning*, arXiv:2610.10600v3](https://arxiv.org/abs/2610.10600), dated **8 November 2026**, is the closest recent title. The full manuscript was inspected through this [accessible PDF copy](https://borowiecki.dev/pdf/2610.10600); its first-page version/date was checked. The paper is independently listed on [Hanneke's author page](https://stevehanneke.com/) and the [FOCS 2026 program](https://focs.computer.org/2026/main-program/). The mirror is a copy of that manuscript, not an independent publication or an independent mathematical result.

Exact locations:

- Introduction, printed pp. 3–4: the setting is realizable; the paper distinguishes output CMI from evaluated CMI. The paragraph following the main-result description on p. 4 explicitly leaves optimal original CMI open.
- Sections 2.1–2.4, pp. 5–6: the bounded quantity is $`\mathop{\mathrm{eCMI}}`$; Theorems 2.2–2.3 use majority constructions.
- Section 2.5, p. 6, and Section 7, pp. 19–20: the supersample and proof are realizable and use a consistent target function. The isolated broad-looking sample quantifier in Theorem 2.3 does not supply an agnostic proof.

This manuscript neither proves nor refutes the exact original-CMI threshold target.

### Yueksel 2026: growing-dimensional convex prediction, not threshold learning

[Yueksel, *An Accuracy–Information Tradeoff for Loss-Difference Conditional Mutual Information*, arXiv:2610.09206v2](https://arxiv.org/abs/2610.09206), dated 8 October 2026, was inspected through its [61-page PDF copy](https://borowiecki.dev/pdf/2610.09206). Sections 2–3, pp. 3–4, define smooth convex linear prediction on a Euclidean ball and expected population excess risk. Theorem 3 assumes dimension at least a constant times the sample size and bounds loss-difference information. Section 6, Proposition 12, p. 7, explicitly retains a dimension requirement for its lower-bound conclusion. These hypotheses do not cover one-dimensional binary thresholds under zero-one loss.

Appendix J, p. 57, discusses finite-domain threshold mutual-information lower bounds and the Livni–Moran PAC-Bayes limitation; it supplies no new constant-CMI threshold learner or threshold-CMI impossibility theorem. Other occurrences of “threshold” are numerical cutoffs, tracing rules, or Lean declaration names. The primary manuscript's setting, theorem, and threshold-specific discussion were inspected, rather than relying only on the abstract. The copy's domain is not treated as independent publication evidence.

### Older threshold lower bounds use a different information quantity

[Bassily et al., *Learners that Use Little Information*](https://proceedings.mlr.press/v83/bassily18a/bassily18a.pdf), ALT 2018, introduction and Section 5, concerns $`I(A(S);S)`$, the mutual information with the entire training sample. Its proper-threshold ERM lower bound is not a lower bound for information about selector bits conditioned on an iid paired supersample. Its Section 6.3 positive construction additionally knows the data distribution and has logarithmic information cost. Neither result settles the present distribution-independent original-CMI target.

[Livni and Moran, *A Limitation of the PAC-Bayes Framework*](https://proceedings.neurips.cc/paper/2020/file/ec79d4bed810ed64267d169b0d37373e-Paper.pdf), NeurIPS 2020, Section 3, Theorem 2 and Corollary 1, pp. 3–4, forces large posterior-to-prior relative entropy for accurate threshold learners under some realizable distribution, even when the prior may depend on the distribution. Its prior is sample-independent. The theorem does not impose the same restriction on a conditional reference law depending on the paired supersample, and therefore is not a disproof of constant original CMI. This distinction is necessary even after the candidate is properized.

### Cai et al., 18 November 2026: sample compression, including an agnostic corollary

[Cai et al., *Near-Quadratic Sample Compression for All VC Classes*, arXiv:2611.25011v1](https://arxiv.org/html/2611.25011v1), was checked in the primary full HTML. Theorem 1.1 gives compression using $`O(d^2\log^2d)`$ examples and $`O(d\log^2d)`$ side bits. **Remark 1.2(c) does include an agnostic consequence**: compress the examples correctly classified by an empirical minimizer, obtaining a predictor with no greater empirical error. Thus describing the whole paper as realizable-only would be inaccurate.

The paper does not state constant original CMI, nor the stability premise that makes the earlier stable-compression information bound apply. Its threshold mention explains that a constant number of retained examples can encode infinitely many hypotheses. Section 5 closes with the polynomial compression conclusion. Full-text checks for mutual information found no such theorem.

The distinction can be seen directly: given a paired pool, a compression scheme of size $`k`$ with at most $`b`$ side bits has at most


```math
2^{b+1}\sum_{j=0}^{k}\binom{2n}{j}
```


possible messages. Counting their entropy only gives order $`k\log n+b`$ information, which retains dependence on $`n`$ even when $`d=1`$. A stronger information argument would still be needed. The displayed compression theorem therefore does not itself establish the prize's absolute original-CMI bound.

## 4. Current sponsor and resolution-record checks

Both sponsors' public research pages were freshly opened:

- [Thomas Steinke](https://www.thomas-steinke.net/): marked last updated June 2026; links the original framework paper and the 2021 conditional PAC-Bayes work.
- [Lydia Zakynthinou](https://lydiazakynthinou.com/index.html): includes November 2026 research news and the original framework paper.

Neither inspected page contains a threshold-prize resolution, withdrawal, expiry, or payment announcement. This is a statement about those pages, not an inference that they comprehensively record every award.

The search also surfaced a `solveall.org` catalog endpoint and a synthetic literature-prior dataset referencing it. The catalog page redirected to an inaccessible sign-in service; the indexed dataset labels were speculative or supported-conjecture entries, not an inspectable full threshold proof. They supply no prior-resolution evidence. No account or login was used.

## 5. Search coverage and limits

The audit used both available search engines, exact titles and authors, the phrases “Conjecture 6,” “agnostic threshold,” “constant CMI,” “improper learner,” and “conditional mutual information,” plus later-date and prize/payment/withdrawal queries. It followed the principal 2020, 2021, 2022, and November 2026 primary results and both sponsor pages. Technical scope conclusions above come from the primary papers, not the summaries returned by search engines.

Direct retrieval of the latest arXiv endpoint was blocked, but the full v3 PDF was available from the identified copy and was read with its authors, version, date, definitions, theorem statements, and original-CMI caveat. No such access limit remains for that manuscript's scope. Search absence cannot exclude an unpublished or unindexed proof, and the public offer is not a sponsor acceptance of the candidate.

## 6. Decision for the continuation

The current record supports continuing full mathematical review of the candidate and its properization as a possible solution of the **separately offered agnostic real-threshold prize**, at the US$20 proper level if both proof components are valid. The US$15 improper level is the weaker alternative, not an additional completion. The record does not support treating the 2020 realizable theorem, a chaining bound, a PAC-Bayes population-risk statement, a leave-one-out result, the general proper impossibility, or the November 2026 evaluated-CMI theorem as an earlier resolution of this exact target. The older threshold lower bounds and the October 2026 convex-prediction lower bound also do not refute the claimed threshold theorem.

An eventual report must distinguish a checked mathematical proof, a public priority claim, and an actually approved or received award. This audit establishes none of the latter two and changes no completed-target count by itself.

The exact original drafts named by review hashes are preserved in [reviewed-sources.json](reviewed-sources.json). The consolidated [proof](PROOF.md) combines the checked construction and properization.
