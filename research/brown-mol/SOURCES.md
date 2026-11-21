# Sources and statement audit

Checked 21 November 2026. The complete independent priority search and its access limits are recorded in `ALGEBRA_PRIOR_AUDIT.md`.

## Original named conjecture

Jason I. Brown and Lucas Mol, *On the roots of the subtree polynomial*, arXiv:1810.08655v1, 19 October 2018; European Journal of Combinatorics 89 (2020), article 103181.

- [Primary preprint PDF](https://arxiv.org/pdf/1810.08655).
- [Primary version record](https://arxiv.org/abs/1810.08655v1).
- The definition on printed page 1 counts nonempty connected induced vertex sets, once each, by their number of vertices.
- Conjecture 4.2 on printed page 14 asserts the translated annulus for every tree of order at least two and every subtree root. Both the inner and outer inequalities are weak.
- The preceding Conjecture 4.1 is the separate disk bound centered at zero. It is not the target of this package.

The proposed result negates the universal inner inequality by an infinite family and therefore refutes Conjecture 4.2 as a whole. It is counted once. It does not refute, prove, or count the outer inequality separately.

## Current primary restatement

Xian'an Jin, Tianlong Ma, and Yi Wang, *Proof of a Brown–Mol conjecture on subtree roots*, arXiv:2608.07898v2, 14 August 2026.

- [Version record](https://arxiv.org/abs/2608.07898v2).
- [Primary PDF](https://arxiv.org/pdf/2608.07898v2).
- Conjecture 5.1 on printed page 16 repeats the exact translated-annulus statement, attributing it to Brown and Mol.
- The following discussion on printed page 17 says that the method does not directly extend to that conjecture and leaves a different approach for future work.
- The paper proves the distinct disk bound centered at zero. Its title is not a prior solution of the translated-annulus conjecture.
- The actual locally downloaded PDF has SHA-256 `0e295b5d2e2ecc946095e8840296d06f24158cc1a5ce07fecdfc1bfe39fb9824`.

## Earlier theorem for diameter at most three

Xiaojian Zeng, *The shifted subtree-root annulus for trees of diameter at most three*, public archive package `BW2-PR20260913-subtree_annulus` in `ArtificialZeng/AI-Has-Taste`, inspected at commit `65eb1f5a92a3a8b80c9e92187825ac9231f86fb2`.

- [Frozen claim](https://github.com/ArtificialZeng/AI-Has-Taste/blob/65eb1f5a92a3a8b80c9e92187825ac9231f86fb2/reproducible_source_code/BigWIN2/BW2-PR20260913-subtree_annulus/source/claim.json).
- [Complete manuscript](https://github.com/ArtificialZeng/AI-Has-Taste/blob/65eb1f5a92a3a8b80c9e92187825ac9231f86fb2/reproducible_source_code/BigWIN2/BW2-PR20260913-subtree_annulus/source/manuscript/main.tex).
- [Independent historical audit](https://github.com/ArtificialZeng/AI-Has-Taste/blob/65eb1f5a92a3a8b80c9e92187825ac9231f86fb2/assets/BigWIN2/gates/BW2-PR20260913-subtree_annulus/audit/math.md).

The exact accepted statement covers every star and every double star, with the full annulus and boundary classification, and expressly leaves arbitrary trees unresolved. The proposed family has diameter four for all branch counts at least two. The earlier result therefore does not apply to the counterfamily. We make no novelty claim about its restricted positive cases.

## Established analytic mechanism

Jason Brown and Peter T. Otto, *A generalization of the Beraha–Kahane–Weiss theorem with graph polynomial applications*, Contributions to Discrete Mathematics 20(2) (2025), 384–395; DOI 10.55016/ojs/cdm.v20i2.76682; preprint arXiv:2008.01784.

- [Published journal record](https://cdm.ucalgary.ca/article/view/76682).
- [Published full PDF](https://cdm.ucalgary.ca/article/download/76682/58530/271838).
- [Preprint record](https://arxiv.org/abs/2008.01784).

The generalized zero-limit principle allows polynomial dependence on the sequence index. This is prior analytic machinery. The published applications concern strongly connected reliability and Steele polynomials, and do not contain the present subtree family or the translated-annulus disproof. Our proof gives the needed local special case directly with Rouché's theorem and the holomorphic inverse function theorem. These standard analytic facts and the general zero-limit principle are not claimed as new.

No copyrighted source PDF is distributed in this package. Primary documents are linked for verification.
