# Partial diagonal theorem: root review and source limits

Reviewed on 20 November 2026 (America/Chicago).

The all-parameter argument in [the proof](partial_diagonal_nonbarycentric.md) is valid as written. Its conclusion concerns every `n >= 3` and `2 <= k < n`, not a finite collection of orders. The barycenter is not stationary, which is stronger than merely not minimizing.

The root review independently checked the cofactor-potential argument and the use of irreducibility of `BB^T`. Equality of the two permutation-law marginals does force equality of the laws: the symmetric relative entropy is zero because its logarithmic density is an affine function of the edge indicators. The explicit common matching makes the four-cycle comparison valid even when there is only one free diagonal position. The derangement recurrence, strict binomial-transform inequality, and the exceptional determinant at `(N,j)=(3,1)` all have the stated signs and ranges. No mathematical gap was found.

## Source coverage

The [current Problem 15 page](https://yair-lavi.com/mincs-list/problem-15/index.html) states the unrestricted characterization problem. It records Minc's results for two and three forbidden diagonal positions and finitely many possible exceptional orders for each fixed number of zeros. It also credits Song's result for all but one diagonal position. These are prior results, not contributions of this proof.

The primary publisher record for [Minc's 1994 article](https://doi.org/10.1016/0024-3795(94)90111-2) gives the title, journal, pages, and a partial non-barycentricity result in its abstract. Its exceptional-order bound differs from the one on the current problem page. The proof here does not depend on either bound. The complete 1994 text was not obtained: the public article and PDF endpoints returned access failures, and the public publisher API supplied only metadata. No claim is made about the exact wording of a conjecture in that unavailable text.

Searches with both web engines used the exact article title, barycentricity with diagonal zeros, Minc and non-barycentricity, and derangement/log-convexity terminology. No complete family theorem was found in the returned sources. This is a bounded search, not proof of priority. No separately named, explicitly posed conjecture has been verified for this precise assertion.

The primary [Chen--Gu--Ma--Wang paper](https://arxiv.org/pdf/0911.2775) concerns log-concavity and reverse ultra log-concavity after factorial normalization of Euler's difference table. The present argument uses an unnormalized determinant and includes a direct proof. Classical log-convexity and binomial-transform facts are not claimed as new.

## Counting decision

Keep this as a checked family theorem in the research notes. It does not characterize arbitrary barycentric supports, establish cohesiveness, determine the minimizing matrix, or settle the all-zero-diagonal case. It is not entered as an additional solved named conjecture on the available evidence.
