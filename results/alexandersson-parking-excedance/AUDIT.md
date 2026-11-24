# Source and independent review

## Exact target and prior work

- Per Alexandersson, [Real-rooted polynomials: open problems](https://www.symmetricfunctions.com/realRootedOpenProblems.htm), section “Words, parking functions and Catalan words,” calls it a 2026 conjecture. It uses strict excedances of the original preference word (entry exceeds its index). It records both clauses through length 12. The exact counterexample refutes real-rootedness, and therefore the conjunction. It does not claim a separate failure of consecutive interlacing between two real-rooted rows.
- Colin Defant, [Short Proofs in Algebraic and Enumerative Combinatorics](https://arxiv.org/abs/2605.19979), §3, identifies the excedance and parking-outcome descent laws. Lemma 3.3 supplies related fixed-content Ferrers rook counts. The counterexample does not require that equidistribution.
- Alexandersson’s [Real-rootedness and interlacing for parking functions and Chow polynomials](https://arxiv.org/abs/2609.05131) proves ordinary descent and other real-rootedness results. Those statements do not assert real-rootedness for the preference-word excedance statistic. Similarly, the earlier size-17 obstruction in [Real-rootedness of rook-Eulerian polynomials](https://www.diva-portal.org/smash/get/diva2%3A1957520/FULLTEXT01.pdf) concerns a permutation-avoidance enumerator, not this sum over parking words.
- The [existing tracking issue #106](https://github.com/1337isnot1337/solved-conjectures/issues/106) records earlier work in this repository: a multiaffine derivative identity and a Worpitzky recurrence, but no resolution. That work remains credited and intact.

A targeted search on 2026-11-24 used the named conjecture, the exact statistic, “nonreal,” “counterexample,” length 17 and distinctive coefficients, and checked author materials, arXiv, GitHub, MathOverflow and public claim trackers. It located the open statement and related results above, but no earlier resolution of the exact conjecture. This bounded search does not establish exclusive priority.

## Independent checks

1. Audited the ascending-value count by reconstructing a partial marked word from its marked physical indices and ordered unmarked subsequence. The eligible count depends only on the number of earlier marks; the insertion factor counts placements of identical new copies uniquely. At the end sorting the values is not an extra choice.
2. In a separate descending-value count, only values already processed occupy slots. At step `v` the condition is that at most `n−v+1` slots are occupied after placing value `v`. Choose free positions below `v` and at or above `v`; the former contribute strict excedances. All slots strictly below `v` are exchangeable, because all assigned values are at least `v`. Thus if `a` of the `v−1` early slots are free, the proportion with slot `v−1` free is exactly `a/(v−1)`. This justifies the category change in the independent recurrence. The checker compares both methods on every row through 17, and compares with literal word enumeration through 6.
3. A third count used weighted Ferrers rook products; the full length-17 vector also agreed. A separate exact Sturm diagnostic counted 14 distinct real roots of the degree-16 row. The proof only needs the rational Laguerre witness and neither asserts nor relies on minimality of 17.

The proof uses exact integer and rational computation. No approximate root calculation, Lean theorem, or outside refereeing supports the status claim.
