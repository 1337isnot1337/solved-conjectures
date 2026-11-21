# Brown–Mol's conjecture: independent prior-work audit

Date: 21 November 2026. Scope: the universal translated-annulus assertion in Brown–Mol Conjecture 4.2, not the distinct origin-centered disk conjecture.

## Finding

No earlier resolution of the translated-annulus conjecture was found in the sources and archives inspected below. The most substantial earlier public work located is Xiaojian Zeng's complete proof for all trees of diameter at most three. Its frozen claim, manuscript, and mathematical audit all explicitly leave the arbitrary-tree conjecture unresolved. The present proposed trees have diameter four for every branch count at least two and therefore lie outside that earlier result.

This is a documented search conclusion, not a proof that no unpublished or unindexed result exists. It should accompany, rather than replace, the separate mathematical reviews.

## Binding primary statement and subsequent paper

1. Jason I. Brown and Lucas Mol, *On the roots of the subtree polynomial*, [arXiv:1810.08655v1](https://arxiv.org/abs/1810.08655v1), 19 October 2018; subsequently European Journal of Combinatorics 89 (2020), article 103181. The actual primary PDF was downloaded and its text inspected. Conjecture 4.2 is on printed page 14. It asserts both inequalities

   ```math
   \frac12\le\left|z+\frac12\right|
   \le\frac12+(n-1)^{1/(n-1)}
   ```

   for every subtree root of every tree of order at least two. The paper's preceding Conjecture 4.1 concerns a disk centered at zero and is a different statement. Its finite verification through order 18 does not establish Conjecture 4.2.

2. Xian'an Jin, Tianlong Ma, and Yi Wang, *Proof of a Brown–Mol conjecture on subtree roots*, [arXiv:2608.07898v2](https://arxiv.org/abs/2608.07898v2), 14 August 2026. The primary PDF and the concluding section were inspected locally. Conjecture 5.1 on printed page 16 repeats the exact translated annulus. The following discussion on page 17 leaves it for future work. Their proved bounds are centered at zero, so their title is not evidence that the translated-annulus conjecture was resolved. The current version record found in this search lists v2 as the latest revision.

3. The [original author's research page](https://faculty.tru.ca/lmol/Research.html) is indexed with the 2020 publication and 2019 CanaDAM presentation. Search results did not expose a later annulus resolution. Direct requests for the research page returned 502/503 errors, so this audit does not claim to have inspected its complete live contents. The primary arXiv statement and the 2026 full-paper restatement were available independently.

## Earlier public double-star theorem: exact scope comparison

A global GitHub code search for the original arXiv identifier found the public repository `ArtificialZeng/AI-Has-Taste`. The inspected snapshot is pinned at commit

`65eb1f5a92a3a8b80c9e92187825ac9231f86fb2`.

The package is `BigWIN2/BW2-PR20260913-subtree_annulus`. The following exact files were read:

- [Frozen claim](https://github.com/ArtificialZeng/AI-Has-Taste/blob/65eb1f5a92a3a8b80c9e92187825ac9231f86fb2/reproducible_source_code/BigWIN2/BW2-PR20260913-subtree_annulus/source/claim.json).
- [Full manuscript](https://github.com/ArtificialZeng/AI-Has-Taste/blob/65eb1f5a92a3a8b80c9e92187825ac9231f86fb2/reproducible_source_code/BigWIN2/BW2-PR20260913-subtree_annulus/source/manuscript/main.tex).
- [Independent mathematical audit](https://github.com/ArtificialZeng/AI-Has-Taste/blob/65eb1f5a92a3a8b80c9e92187825ac9231f86fb2/assets/BigWIN2/gates/BW2-PR20260913-subtree_annulus/audit/math.md).
- [Precise problem and contribution](https://github.com/ArtificialZeng/AI-Has-Taste/blob/65eb1f5a92a3a8b80c9e92187825ac9231f86fb2/reproducible_source_code/BigWIN2/BW2-PR20260913-subtree_annulus/source/problem.md).
- [Package manifest](https://github.com/ArtificialZeng/AI-Has-Taste/blob/65eb1f5a92a3a8b80c9e92187825ac9231f86fb2/reproducible_source_code/BigWIN2/BW2-PR20260913-subtree_annulus/package.json).

The manuscript is *The shifted subtree-root annulus for trees of diameter at most three*, attributed to Xiaojian Zeng. It proves strict containment of every nonzero root for every double star with two positive leaf populations, then includes stars and the boundary classification. Its displayed counting formula is

```math
\frac{\Phi_{D(a,b)}(z)}{z}
=a+b+(1+z)^a+(1+z)^b+z(1+z)^{a+b}.
```

The outer-bound proof uses a convex endpoint estimate on the shifted circle and Rouché's theorem. The inner bound follows from elementary modulus estimates. This is a genuine all-parameter partial theorem, not merely a finite screen, but its domain is explicit. The manuscript's final discussion states that it supplies no conclusion for diameter four or greater. The frozen claim and referee report independently preserve the same restriction.

The present family consists of a central vertex with several adjacent branch centers, each supporting four leaves. For at least two branches, leaves in distinct branches are distance four apart. Thus the earlier theorem does not cover any sufficiently large member of the proposed counterfamily. The present proof does not claim the earlier star or double-star results as new.

The archive package labels its own review 13 September 2026. We do not infer publication chronology solely from that label, and no exact first-publication date is needed to decide the scope mismatch: even the entire currently public package does not resolve the universal conjecture.

## General zero-limit theorem checked separately

Jason Brown and Peter T. Otto, *A generalization of the Beraha–Kahane–Weiss theorem with graph polynomial applications*, Contributions to Discrete Mathematics 20(2) (2025), 384–395, [journal page](https://cdm.ucalgary.ca/article/view/76682), [published full PDF](https://cdm.ucalgary.ca/article/download/76682/58530/271838), DOI 10.55016/ojs/cdm.v20i2.76682. The journal gives publication on 28 October 2025; the preprint is [arXiv:2008.01784](https://arxiv.org/abs/2008.01784).

The published theorem extends the familiar zero-limit mechanism to coefficients polynomial in the sequence index. Its graph applications concern strongly connected reliability and Steele polynomials. The full extracted text has no subtree or Mol occurrence, and its application section contains no translated-annulus claim or the present tree family. The general analytic mechanism is prior mathematics. The proposed proof supplies a short, self-contained local lemma with an explicit nonzero-derivative hypothesis; it does not claim to invent the zero-limit principle.

## Archive and search coverage

The following searches were carried out during this audit, in addition to the source checks above.

- Both web engines were queried using the original and new paper identifiers; Brown–Mol with subtree roots, annulus, proof, counterexample, and disproof; the exact original title; Conjecture 4.2; and the Jin–Ma–Wang Conjecture 5.1 attribution. Searches also included diameter-four subtree polynomials and the generalized Beraha–Kahane–Weiss applications. The relevant hits were the papers above, the double-star archive, current problem listings, and unrelated graph-polynomial work.
- The complete locally saved path inventories for PrincipiaMathOrg and the trureturing Problems and available Blueprint sections were screened for `Brown–Mol`, `subtree`, `340810`, `2608.07898`, and `1810.08655`. No matching resolution path was found. The subtree hits in the combinatorics inventory concerned unrelated Helly and Golomb/Notik material. A path inventory is not a full content search, and is not represented as one.
- A global GitHub code search for the exact original arXiv identifier returned 20 hits. The relevant hits were the ArtificialZeng package and the `10m-u/open-problems-catalog` entry; the remaining exact-number hits were unrelated data. The complete relevant ArtificialZeng claim and manuscript were inspected as described above.
- The pinned [10m-u catalog entry Q3839](https://github.com/10m-u/open-problems-catalog/blob/ca8d4d44ba3db527f19f28928c240168f545ecfe/problems/mathematics/combinatorics-graph-theory-part-3.md#q3839) gives the exact universal translated annulus and reports no matching resolution through 10 October 2026. Its references include the 2026 doctoral context and Jin–Ma–Wang v2. This is a secondary status record, not a substitute for the inspected primary source.
- Global GitHub issue searches for the original arXiv identifier and combinations of subtree polynomial, annulus, and Brown–Mol found no matching earlier resolution. Broad subtree and numeric-ID queries also returned many unrelated software results; those were not treated as mathematical evidence.
- A broad GitHub code query combining subtree and annulus returned thousands of mostly unrelated software files. Its inspected first page found the same ArtificialZeng package and no distinct mathematical result. This broad query was not exhaustive. A query for the newer arXiv identifier timed out, and one code query was rate limited; these failures are not counted as negative evidence.
- MathDB's [annulus entry 340810](https://mathdb.com/p/340810/the-annulus-conjecture-for-subtree-roots-of-trees) still labels the conjecture open, but its separate disk entry also retains an outdated open label despite Jin–Ma–Wang's proof. Consequently, neither label is used to establish priority.

## Subsequent full-content archive audit

The campaign replaced the initial path screens with full-content archive searches. Brown–Mol's exact source identifiers, author names, and translated-annulus assertion were included in each report:

- [Principia full-text audit](../../research/2026-11-21-principia-fulltext-audit/PRINCIPIA_FULL_TEXT_AUDIT.md): all 1,728 file blobs verified against the pinned Git snapshot, every PDF extracted, and embedded text searched. The only subtree-root phrase concerns descendant blocks in an arbor polytope; no subtree-polynomial annulus assertion was found.
- [Trure, mxym, and AFTD audit](../../research/campaign-20261121/TRURE_MXYM_AFTD_AUDIT.md): complete archive text searches, PDF and compressed-source passes, public issue checks, and the full published AFTD knowledgebase. No matching translated-annulus resolution was found.
- [ArtificialZeng full-content audit](../../research/2026-11-21-artificialzeng-priority/AUDIT.md): every regular UTF-8 file, all 472 PDF conversions, and bounded compressed-certificate headers at the pinned commit. The only matching Brown–Mol theorem is the diameter-at-most-three result compared above. Textless figures, capped certificate bodies, and other binary files remain explicit limits.

These reports provide immutable snapshots, hashes, complete target lists, and reproducible search scripts. They record two exact earlier resolutions of other campaign targets, which were withdrawn from the new-result count. No corresponding full-resolution collision was found for Brown–Mol. Complete file acquisition and keyword searches do not amount to a semantic reading of every unrelated archived theorem.

## Conclusion for integration

The published general zero-limit theorem and the earlier double-star theorem must be acknowledged as prior context. Neither contains the present diameter-four counterfamily or a resolution of the translated-annulus conjecture. Within the documented coverage, the priority gate is clear. The result should be described as a proposed disproof of Brown–Mol Conjecture 4.2, with the outer inequality left untouched, and counted once for the universal conjecture.
