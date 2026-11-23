# Sources and verification scope

Audit date: 23 November 2026. This note supports the [written deduction](PROOF.md) tracked in [issue #247](https://github.com/1337isnot1337/solved-conjectures/issues/247). It records what was actually inspected and what the source statements imply. It does not certify a fresh Lean build of the imported development.

## 1. Pinned permanent border theorem

Claude (Anthropic), *VP ≠ VNP over every field*, repository `anthropics/formal-math`, commit `11b6c7e3c927df2658f513b6b68ea7f8929c62c5`.

| Material | Exact reference | Role |
| --- | --- | --- |
| [Paper](https://github.com/anthropics/formal-math/blob/11b6c7e3c927df2658f513b6b68ea7f8929c62c5/vp-vnp/paper.pdf) | Theorems 1.1 and 1.4; Definition 1.3; Section 1.3; Definition N.1 and Theorem N.5 | Quantitative border lower bound and counted gates |
| [Statement.lean](https://github.com/anthropics/formal-math/blob/11b6c7e3c927df2658f513b6b68ea7f8929c62c5/vp-vnp/Statement.lean) | `Statement.Computes`, `Statement.Approximates`, `Statement.MainTheoremApprox` | Exact formal statement, read separately from its proof |
| [Solution.lean](https://github.com/anthropics/formal-math/blob/11b6c7e3c927df2658f513b6b68ea7f8929c62c5/vp-vnp/Solution.lean) | `Solution.mainTheoremApprox` | Connects the public statement to the proved paper theorem |
| [Paper/Approximate.lean](https://github.com/anthropics/formal-math/blob/11b6c7e3c927df2658f513b6b68ea7f8929c62c5/vp-vnp/Paper/Approximate.lean) | `Paper.thm_approx` and its final proof | Approximation model and explicit positive constant |
| [README](https://github.com/anthropics/formal-math/blob/11b6c7e3c927df2658f513b6b68ea7f8929c62c5/vp-vnp/README.md) | Source's verification instructions and review statement | Distinguishes proof checking from checking what the theorem says |

The formal theorem has the quantifiers: there exists an absolute positive real $`a`$; for each characteristic $`p`$ there is $`m_0`$; for every field of that characteristic, every $`m\ge m_0`$, and every approximating circuit with $`s`$ gates, the lower bound holds. The permanent clause assumes $`p\ne2`$. Setting $`p=0`$ and the field to $`\mathbb C`$ gives the required all-sufficiently-large bound. No constant-free assumption or subsequence restriction is present.

The circuit definition counts every list entry. Constants and variable inputs count as gates, as do addition and multiplication outputs. The approximation definition allows arbitrary constants in the Laurent-series field. Its coefficient condition says that negative epsilon coefficients of the output vanish, and the epsilon coefficient at zero is the target polynomial. This matches rational-function approximants that are regular at zero, through the embedding of rational functions in Laurent series. No bound on the total degree of the approximating polynomial is present.

The formal permanent is written as a sum of products of variables indexed by $`(\sigma(i),i)`$. Reindexing the sum by inverse permutations makes this the same polynomial as $`\sum_\sigma\prod_i x_{i,\sigma(i)}`$ used in the note. There is no transpose or alternative-polynomial assumption hidden in the comparison.

The final proof of `Paper.thm_approx` supplies $`a=1/1600^2`$. The public theorem only states existence of a positive constant. The proof note uses that public statement; the explicit witness is recorded as a checked optional refinement. The source does not give a useful numerical final threshold for this application.

### Immutable identifiers

| File | Git blob SHA |
| --- | --- |
| `vp-vnp/paper.pdf` | `5f7608fd559424700bd870430f68e6cd08c0a564` |
| `vp-vnp/Statement.lean` | `e64db90a929defe35d5b76d6eaa9bc0c87843ad3` |
| `vp-vnp/Solution.lean` | `f3244ce6578809af47489210bd270af0e0aef400` |
| `vp-vnp/Paper/Approximate.lean` | `912956ff7bc12ae154e6dffdb98e20fb27b21739` |
| `vp-vnp/README.md` | `20bb96a82948c9e04ebba09a7b3ee46929cbda8b` |

The inspected PDF has 1,023,554 bytes and SHA-256 `882f5eefb1e067cc8c99ddfe660c10d1d67f9fcee7b69364bd0bab06c0c1f97c`. The source files were read through the GitHub connector at the pinned commit; the PDF was decoded locally and its relevant text inspected. These are reproducible source identifiers, not a substitute for proof checking.

### Existing CI evidence and its limit

The source's [workflow run 45266217321](https://github.com/anthropics/formal-math/actions/runs/45266217321) completed successfully at PR-head commit `918c8e2778aee18b0283dc5a33ed39ab3cd63a96`. The [verify (vp-vnp) job](https://github.com/anthropics/formal-math/actions/runs/45266217321/job/138013752301) reports success for its `lake build` step and its Comparator acceptance step. The `vp-vnp` directory tree at that head and at the pinned merge commit is the same: `b076b4b081298c4e909bac3f87f0e4462d1fb2cb`.

This audit inspected the remote job status. It did not independently run `lake build`, Comparator, or nanoda. The pinned README describes the release as an AI-written research artifact and says that no human mathematician has checked its proof. The logical deduction in this directory imports its stated theorem. Neither the existing CI result nor our source inspection makes the new BSS deduction Lean-verified.

## 2. Corrected factor and graph-complexity theorem

Peter Bürgisser, *The Complexity of Factors of Multivariate Polynomials*, [arXiv:1812.06828v1](https://arxiv.org/abs/1812.06828v1), 17 December 2018; [full text](https://arxiv.org/html/1812.06828v1). The paper revises the article in *Foundations of Computational Mathematics* 4(4), 369–396 (2004), DOI [10.1007/s10208-002-0059-5](https://doi.org/10.1007/s10208-002-0059-5). The later journal correction is *FoCM* 20, 1667–1668 (2020), DOI [10.1007/s10208-020-09477-6](https://doi.org/10.1007/s10208-020-09477-6).

| Location in corrected version | Statement used or checked |
| --- | --- |
| Section 1.1 | $`L`$ counts all arithmetic operations in a division-free straight-line program with arbitrary field constants; exclusion complexity minimizes over all nonzero multiples |
| Lemma 1.1 | Published decision-to-exclusion link; the note reproves a division-safe bound with explicit overhead |
| Theorem 1.3 | General factor-to-approximation estimate in the target factor's degree and exclusion complexity |
| Remark 1.4(1) | Graph-specific loss $`O(M(d^2)\mathop{\mathrm{EC}}(g))`$ |
| Corollary 1.5 | Direct graph-decision-to-approximation corollary; establishes that the transfer is prior work |
| Definition 2.1 | Rational epsilon constants, regular output coefficients, division-free arithmetic programs |
| Proposition 3.4 and end of Section 3.3 | Construction supporting the graph-specific estimate |
| Section 4 | Derivation of the direct graph-decision consequence |

The word “degree” in the bound is the degree of the desired factor, not of the polynomial multiple supplied to the factor theorem. Neither the multiple's degree nor its multiplicity appears in the approximative estimates. In contrast, Theorem 1.2 for exact factor complexity includes the multiplicity. Substituting that earlier theorem into this proof would not justify a polynomial loss when the multiplicity is exponential.

The graph-specific estimate has no input-count factor. In this application there are $`m^2+1`$ variables, and even a separate polynomial factor in that input count would preserve the final exponent. The note uses the actual published estimate and also gives a fallback from Theorem 1.3 with ordinary matrix multiplication and schoolbook coefficient convolution. That fallback gives $`O(m^{10}(T+1))`$ and avoids any dependence on a fast matrix multiplication exponent.

The 2018 note corrects the statement and proof of Theorem 5.7, which concerns approximation order. The present proof does not invoke Theorem 5.7, bound the epsilon approximation order, or use a conversion whose cost depends on that order. It directly embeds the division-free rational-function approximation in the Laurent-series model of the pinned lower bound. Theorem 2.4's topological interpretation of approximative complexity is therefore also unnecessary for the deduction.

## 3. The separate BSS-versus-Valiant reference

Peter Bürgisser, *Intractability of Hilbert's Nullstellensatz implies algebraic hardness of permanent*, [arXiv:2606.25121](https://arxiv.org/abs/2606.25121). The primary full-text retrieval inspected here displays the June 2026 text. Indexed version metadata also lists a v2 of 19 October 2026; this audit does not claim to have compared the full October version.

In the retrieved primary text, Section 1.4, Theorem 1.1 concerns implications from complex BSS separation to constant-free Valiant separation. **Conjecture 1.1**, in that same section, is the proposed converse from border algebraic hardness to separation of the nonuniform complex BSS classes with arbitrary constants. It remains a conjectural implication in that source. Neither statement is an input to the proof of Theorem 1 in this directory.

This reference is included to prevent the reverse implication from being silently assumed in the application. The [P_C versus NP_C campaign](https://github.com/1337isnot1337/solved-conjectures/issues/248) must supply an independent bridge into its nondeterministic or fixed-level hierarchy target. The exact graph lower bound here establishes only its deterministic obstruction.

## 4. Prior-result check and credit

The decision/exclusion mechanism predates this work. Bürgisser attributes the elementary exclusion lemma to earlier algebraic decision-complexity work, and his Corollary 1.5 already gives the general graph transfer used here. The factor theorem is Bürgisser's; the permanent border lower bound is the pinned Claude/Anthropic result. The note supplies a self-contained derivation of their requested quantitative decision consequence, including defined-division handling and the two gate conventions.

Searches for permanent graph decision complexity and the supplied 2026 reference were checked in both web indexes. The current repository instructions, recent commits, issue searches, open pull requests, and research directory were read before opening #247. The Discussions listing returned a GitHub loading error, so it did not provide a complete discussion audit. A concurrent BSS campaign subsequently opened #248 and was cross-linked promptly. No claim of priority for a new lower-bound technique or a new named-conjecture resolution is made.

The four-worker review split was: root integration and independent proof check; permanent-source audit; corrected-factor audit; and graph-path/BSS-model audit. Review receipts and any corrections are recorded separately. Internal AI review is distinct from outside human review and from formal verification.

## 5. Validation appropriate to this change

The deliverable is a written mathematical deduction with pinned theorem imports. Local validation checks Markdown structure, the internal file links, exact arithmetic in the stated overheads, and the repository's README verification-table rule when its index is edited. Mathematical review checks the infinite statements, rather than treating finite examples or a numeric screen as a proof. No Lean source or theorem-registration file is changed by this work, and no repository-wide Lean build is claimed.
