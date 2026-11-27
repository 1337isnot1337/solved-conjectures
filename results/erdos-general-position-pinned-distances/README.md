# Erdős’s one-third pinned-distance conjecture

The average number of distinct positive distances seen from a point of a sufficiently large planar set exceeds one third of the set size by a fixed positive proportion. The result holds under either of two geometric hypotheses.

- If no three points lie on a line, any number may lie on a circle. [General-position proof](PROOF.md) · [Review](REVIEW.md)
- If no four points lie on a circle, any number may lie on a line. This answers the weaker asymptotic question in Erdős Problem 654. [Arbitrary-collinearity proof](ARBITRARY-COLLINEARITIES.md) · [Independent review](UNRESTRICTED-REVIEW.md) · [Sources and prior results](UNRESTRICTED-SOURCES.md)

Precisely, there exist absolute constants $`\eta>0`$ and $`n_0`$ such that every such set $`P`$ of $`n\ge n_0`$ points satisfies

```math
\sum_{x\in P} d_P(x)>\left(\tfrac13+\eta\right)n^2,
\qquad d_P(x)=\#\{\lVert x-y\rVert:y\in P,\ y\ne x\}.
```

Here the improvement and the threshold are absolute. Taking the smaller improvement and the larger threshold from the two proofs covers both hypotheses. In particular some point sees more than the stated fraction of the set's size. Erdős proposed allowing collinearities after display (4) of his 1987 paper. The average conclusion under this relaxation strengthens the maximum conclusion he suggested. Feng and collaborators gave counterexamples to the separate near-one bound. [Erdős, pp. 167–168](https://users.renyi.hu/~p_erdos/1987-27.pdf#page=2) · [Problem 654](https://www.erdosproblems.com/654) · [Feng et al., Theorem 3](https://arxiv.org/abs/2601.22401)

The Solved Conjectures research team developed the first proof in Cinna Davis’s repository. Codex derived the arbitrary-collinearity proof in the WadeDavis research session, building on the repository’s earlier bounded-collinearity and reflection arguments. Independent project reviewers checked the written arguments. The finite checks exercise counting and geometry. Neither proof has Lean verification or external refereeing. [First audit and checks](AUDIT.md) · [New review and checks](UNRESTRICTED-REVIEW.md) · [First discovery issue #910](https://github.com/1337isnot1337/solved-conjectures/issues/910) · [Unrestricted discovery issue #922](https://github.com/1337isnot1337/solved-conjectures/issues/922)

If you cite these results, please credit Erdős for the questions, the project team for the first proof, and the WadeDavis research session with Codex for the arbitrary-collinearity proof. [Cinna Davis’s project](https://itsdavis.com/)

## Circles centered at sites

Erdős also asked what happens if only circles **centered at a site** must contain at most three other sites. The full one-third question with that hypothesis remains open. Three results narrow the search for a counterexample.

- For a fixed circle the number of ordered isosceles triples with the pin and one base on the circle and the other base outside is $`O_\varepsilon(n^{15/8+\varepsilon})`$. In a sequence approaching the one-third bound every circle and every line must contain a vanishing fraction of the sites. [Mixed-circle theorem](CIRCLE-CONCENTRATION.md) · [Independent review and source audit](CIRCLE-CONCENTRATION-REVIEW.md)
- A fixed positive gap holds if one may remove a bounded number of reflected base pairs per perpendicular bisector and a bounded number of active pins per remaining pair with only a sufficiently small quadratic excess left. A pin is active for a pair when its radius class consists of exactly three sites. [Precise bisector criterion](TWO-SIDED-BISECTORS.md)
- For a uniform-disk limit, the exact threshold for the density of a pair of bases is weak $`L^{5/2}`$. Such a limiting model exists, whereas the corresponding strong moment is impossible. This distinguishes a continuum model from a finite counterexample. [Disk theorem](DISK-MOMENT.md) · [Review and checks](BISECTOR-REVIEW.md)

Codex derived these partial results in the WadeDavis research session. Independent internal reviews and exact finite checks support the written arguments. The thresholds are asymptotic, without Lean verification or external refereeing. [Local-capacity issue #969](https://github.com/1337isnot1337/solved-conjectures/issues/969)
