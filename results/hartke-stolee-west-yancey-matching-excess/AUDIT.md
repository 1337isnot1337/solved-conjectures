# Source and proof audit

## Exact target and priority

[Hartke–Stolee–West–Yancey, *Extremal Graphs With a Given Number of Perfect Matchings*](https://doi.org/10.1002/jgt.21687), J. Graph Theory 73(4) (2013), 449–468; [public author manuscript, §9, Conjecture 9.15](https://dwest.web.illinois.edu/pubs/perfmat.pdf#page=21) states the tail-minimum divergence conjecture. The Dudek–Schmitt stabilization and the bound by the binary Hamming weight of $p-1$ are prior work; the latter alone is only a subsequence lower bound. Stolee's later [computations](https://arxiv.org/abs/1105.1764) give finite exact examples, not divergence.

The [2012 REGS summary, item 41](https://dwest.web.illinois.edu/regs/12results.html) reports a logarithmic lower bound on a related hypergraph excess, without spelling out its uniformity in the one-line summary. Its [linked question](https://dwest.web.illinois.edu/regs/pextremal.html) treats ordinary graphs separately and introduces the new hypergraph extension for uniformity at least three. The report's assertion of sharpness at small values also cannot be read as a blanket uniformity-two statement: the linked page gives $c_4=2<3$. No detailed primary statement carrying the workshop bound over to the ordinary graph excess was found. The author report lists the hypergraph manuscript as separate work in preparation.

Other searches on Nov. 24, 2026 used author names, Conjecture 9.15, ordinary graph excess, exact divergence wording, and citing work. No prior proof of the exact ordinary graph tail-minimum divergence was located. This bounded search leaves historical priority open, and does not claim the proposed stronger growth rate.

## Independent checks

- Paths through the deleted arc are exactly those using the adjacent directed steps $0\to1\to u$, followed by arbitrary increasing continuation; counting them gives the correct new weights.
- The first $u$ weights span exactly the required residues, even for $u=2$ and residue zero. A cycle cover can contain at most one nontrivial cycle because each such cycle contains vertex zero. This validates the passage from return choices to literal graph matchings and edge excess.
- Every nonempty prefix ending just before a zero run has positive residue modulo the chosen Mersenne number. Grouping the quotient output along the input zero run, with no assumption about absolute bit alignment, yields a nonzero block from each full group of $u$ zeros. Summing across all runs gives the claimed global bound, including all-ones inputs and trailing runs.
- The extension step preserves perfect matching count and excess, so a finite graph witness bounds the stabilized ordinary graph quantity. Minimizing over the tail preserves the same lower bound since bit length is nondecreasing.

[verify.py](verify.py) independently enumerates small **undirected** graph matchings, checks the edge counts, and tests the digit claim on a deterministic bounded list and long random bit strings. It is not part of the proof. The [complete Lean formalization](FORMALIZATION.md), [independent mathematical review](LEAN_REVIEW.md) and [source-statement review](STATEMENT_REVIEW.md) now supplement these original checks. No external referee verification or exclusive priority is claimed.
