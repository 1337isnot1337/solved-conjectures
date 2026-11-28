# Source, priority, and mathematical review

## Statement

[Bóna–Pantone, *Permutations avoiding sets of patterns with long monotone subsequences*, Conjecture 6.4](https://arxiv.org/html/2103.06918v2#S6.SS4) predicts asymptotic equivalence for the class avoiding `12354,12453,13452,23451`. [Bóna’s follow-up](https://dmtcs.episciences.org/13903/pdf), §3 Conjecture 3.1 (preprint §2 Conjecture 2.1), repeats the question and proves bounds at that scale plus non-algebraicity, but does not prove equivalence with a leading constant. The earlier nearby conjectures for distinct pattern sets and the guessed differential equation are not claimed here.

A targeted Nov. 24, 2026 search checked the original and follow-up titles and conjecture numbers, the exact forbidden set, asymptotic expression, author bibliographies, recent public papers and repository issues. It located the original estimates and related work, not an earlier resolution of the exact equivalence. This is a bounded priority search, not evidence of exclusive priority. The proof credits the original decomposition, Regev’s strip asymptotics, and standard RSK and skew-tableau identities.

## Independent review

- In the canonical split, the rank of the first tail entry is exactly one plus the longest increasing subsequence among front labels smaller than it. Since this entry is the smallest omitted label, only the smallest consecutive retained labels matter. A tail that starts earlier than the first rank-$`d+1`$ entry is excluded rather than counted again.
- Under RSK the insertion tableau restricted to entries at most $s$ is the insertion tableau for the input restricted by **value**, not by position. Transposition changes its first row length to its number of rows. Conditional on the final shape, the subshape count is the product of the ordinary and skew tableau dimensions.
- The entropy estimate dominates the square of the tableau count away from row proportions $1/d$, with only polynomially many shapes. After factoring falling factorials, the skew determinant quotient is polynomial (alternating numerator divided by Vandermonde). Thus passage to coincident limiting coordinates does not divide by zero; its leading homogeneous part is the Schur polynomial. Conditional probabilities are bounded and permit averaging.
- The geometric survival function comes from uniform subsets sampled without replacement. Along $m/n\to p<1$, a geometric bound controls every tail; the memoryless waiting computation gives exactly $(d/(d+1))^d$. The small-$`m`$ binomial region has exponentially small probability even after multiplying by $n^\alpha$; on the bulk region Regev’s bounds give uniform integrability. Substitution of $d=3$ yields $625\sqrt3/(192\pi)$ using the $1234$-avoider constant documented by [Conway–Guttmann](https://arxiv.org/html/2306.12682v2#S5.SS1).
- [verify.py](verify.py) compares literal pattern filtering with Young-lattice path counts for $1\le d\le4$, lengths through seven, and checks the greedy decreasing-subsequence event against all short alphabet words. A second forward/backward path computation compared longer exact rows. None of these checks is part of the asymptotic argument.

The proof has been internally reviewed. No Lean formalization or external refereeing is claimed.

Bóna's follow-up §2.2 already records the exact count for $k=3$ and the square-root singularity asymptotic for $k=4$ from a known generating function. Those are recovered special cases, not new claims. Its §3 also establishes the Wilf equivalence with the $B_{k,k}$ family; any transferred count uses that credited equivalence. The two finite path-counting implementations agreed for 214 exact rows in total: through $n=60$ for $d=1,2,3$, and through $n=30$ for $d=4$.
