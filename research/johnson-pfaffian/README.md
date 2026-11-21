# Johnson's conjecture

Proposed proof of Conjecture 7.1 in William Johnson's *Pfaffian Positivity for Convex Kernels and Optimal Matching Bounds*, arXiv:2610.24371v1. Mathematical review and the final current-source priority audit are recorded separately; this draft is not yet a registered result.

The conjecture states that, for every positive nonincreasing log-convex distance kernel on an even number of ordered real points, its Pfaffian is at least every perfect-matching product.

The proof establishes a more general statement for products of circular interval factors. A positive diagonal scaling replaces each wrapped interval by its ordinary-interval complement. Johnson's existing endpoint inequality then applies after any cyclic rotation. It bounds the Pfaffian below by the entry for any adjacent pair times the Pfaffian after deleting that pair. Repeated deletion proves the inequality for every noncrossing matching; uncrossing gives all matchings. A finite mixed-difference decomposition of the logarithm places the conjecture's kernels in this class.

- [Proof](PROOF.md).
- Independent mathematical reviews: [combinatorics](COMBINATORICS_REVIEW.md), [analysis](ANALYSIS_REVIEW.md), and [root](ROOT_REVIEW.md).
- [Exact supplementary checks](verify.py). Run `python3 verify.py`; no external package is required. These checks test signs and indices, and are not premises of the universal proof.

The existing endpoint inequality, kernel uncrossing reduction, rainbow bound, and Albouy–Moeckel nonvanishing result are credited to Johnson. The proposed new result is the full all-matching statement of his separately stated Conjecture 7.1. No Lean work is included.
