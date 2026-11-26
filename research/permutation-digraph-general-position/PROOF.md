# Permutation digraph general position conjecture

Chandran, Di Stefano, Erskine, Sreelatha, Thomas and Tuite conjecture just after [Theorem 3.6 of *The general position number of digraphs*](https://arxiv.org/html/2604.15909#S3.SS3) that their lower bound is exact for integers k≥3 and d≥2k. In their notation the alphabet has size N=d+k, vertices are length-k words without repetitions, and an arc drops the first symbol and appends a symbol not in the full old word. The proposed value is $2(N-2)_{k-1}$, where the subscript denotes a falling factorial.

**The conjecture is false at every parameter pair in its stated domain.** In fact
```math
\mathrm{gp}(\mathrm{Pe}(d,k))\ \ge\ 3(N-3)_{k-1}
\ =\ 2(N-2)_{k-1}+(d-2k+1)(N-3)_{k-2}.
```
The last addend is strictly positive for every d≥2k.

## The marker construction

Let B be any set of h alphabet symbols, with 1≤h≤N−k+1. Select all words whose last symbol is in B and whose first k−1 symbols are outside B. The number of selected words is $h(N-h)_{k-1}$. The source paper takes h=2. The following distance argument works with any h.

Every walk of length ℓ in the digraph is encoded by a word of length k+ℓ. Its successive length-k windows are the vertices of the walk. A word encodes such a walk precisely when any two occurrences of the same symbol have indices differing by at least k+1: this includes both the initial word and every admissibility test for an appended symbol.

For distinct selected words u,v, no nonempty proper suffix of u is a prefix of v: the suffix ends in a marker, while a proper prefix of v has none. Therefore any walk from u to v has length at least k. For the upper bound, insert k−1 pairwise distinct fresh symbols between the two words, all outside the set of symbols in u and v. There are at least N−2k≥k fresh symbols available. An occurrence at index i in u and index j in v (using indices 0 through k−1 inside each word) now has separation 2k−1+j−i. The only separation at most k would come from i=k−1 and j=0; these two symbols are different because the former is marked and the latter is not. Thus the concatenation encodes a walk of length 2k−1. The two directed distances between distinct selected vertices consequently lie between k and 2k−1.

No directed geodesic contains three distinct selected vertices. If it did, the segment between the first and third would be geodesic, yet its two subsegments between consecutive selected vertices each have length at least k. This contradicts the upper bound 2k−1 for the endpoints. Therefore the selected words form a general position set. Take h=3 and factor out $(N-3)_{k-2}$ from the difference with the conjectured value to get the displayed strict inequality.

## Size of the gap

The ratio of the sizes at marker-palette sizes h+1 and h, as long as both are admissible, is
```math
\frac{(h+1)(N-h-k+1)}{h(N-h)}.
```
This exceeds one exactly when h<(N−k+1)/k. In particular h=ceil((N−k+1)/k) is optimal among these marker sets (with a tie to h+1 at equality). For each fixed k≥3 and d tending to infinity, the family has asymptotic density $k^{-1}(1-k^{-1})^{k-1}$ among all length-k permutation words, whereas the conjectured value has density tending to zero. The ratio to the conjectured value is unbounded.

For comparison, for all stated parameters the density of any general position set is at most 2/(2k+1). Take the word u=(0,1,…,k−1) and its reversal v. Their only possible suffix-prefix overlap is one symbol; this length-(k−1) candidate walk is illegal because its first appended symbol k−2 is still in u. In any walk of length at least k, the last symbol of u and the first of v must be separated by at least k+1 in the encoding, forcing length at least 2k. Inserting k distinct fresh symbols between these disjoint windows gives a legal walk of length 2k. Apply a uniform alphabet permutation to this geodesic. Each of its 2k+1 windows is uniform among all vertices, and each image geodesic has at most two vertices of a general position set. The resulting expectation gives the upper density bound.

The exact value for all k≥3 remains open. The result refutes the stated equality, not the valid lower bound of Theorem 3.6 and not the separate Kautz digraph question.
