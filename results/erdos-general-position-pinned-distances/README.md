# Erdős’s one-third pinned-distance conjecture

The average number of distinct positive distances seen from a point of a sufficiently large planar set exceeds one third of the set size by a fixed positive proportion. The result holds under either of two geometric hypotheses.

- If no three points lie on a line, any number may lie on a circle. [General-position proof](PROOF.md) · [Review](REVIEW.md)
- If no four points lie on a circle, any number may lie on a line. This answers the weaker asymptotic question in Erdős Problem 654. [Arbitrary-collinearity proof](https://github.com/1337isnot1337/solved-conjectures/blob/f60dd0636c0a83fab066a925ebab1c1e888b77a2/results/erdos-general-position-pinned-distances/ARBITRARY-COLLINEARITIES.md) · [Independent review](https://github.com/1337isnot1337/solved-conjectures/blob/f60dd0636c0a83fab066a925ebab1c1e888b77a2/results/erdos-general-position-pinned-distances/UNRESTRICTED-REVIEW.md) · [Sources and prior results](https://github.com/1337isnot1337/solved-conjectures/blob/f60dd0636c0a83fab066a925ebab1c1e888b77a2/results/erdos-general-position-pinned-distances/UNRESTRICTED-SOURCES.md)

Precisely, there exist absolute constants $`\eta>0`$ and $`n_0`$ such that every such set $`P`$ of $`n\ge n_0`$ points satisfies

```math
\sum_{x\in P} d_P(x)>\left(\tfrac13+\eta\right)n^2,
\qquad d_P(x)=\#\{\lVert x-y\rVert:y\in P,\ y\ne x\}.
```

Here the improvement and the threshold are absolute. Taking the smaller improvement and the larger threshold from the two proofs covers both hypotheses. In particular some point sees more than the stated fraction of the set's size. Erdős proposed allowing collinearities after display (4) of his 1987 paper. The average conclusion under this relaxation strengthens the maximum conclusion he suggested. Feng and collaborators gave counterexamples to the separate near-one bound. [Erdős, pp. 167–168](https://users.renyi.hu/~p_erdos/1987-27.pdf#page=2) · [Problem 654](https://www.erdosproblems.com/654) · [Feng et al., Theorem 3](https://arxiv.org/abs/2601.22401)

The Solved Conjectures research team developed the first proof in Cinna Davis’s repository. Codex derived the arbitrary-collinearity proof in the WadeDavis research session, building on the repository’s earlier bounded-collinearity and reflection arguments. Independent project reviewers checked the written arguments. The finite checks exercise counting and geometry. Neither proof has Lean verification or external refereeing. [First audit and checks](AUDIT.md) · [New review and checks](https://github.com/1337isnot1337/solved-conjectures/blob/f60dd0636c0a83fab066a925ebab1c1e888b77a2/results/erdos-general-position-pinned-distances/UNRESTRICTED-REVIEW.md) · [First discovery issue #910](https://github.com/1337isnot1337/solved-conjectures/issues/910) · [Unrestricted discovery issue #922](https://github.com/1337isnot1337/solved-conjectures/issues/922)

If you cite these results, please credit Erdős for the questions, the project team for the first proof, and the WadeDavis research session with Codex for the arbitrary-collinearity proof. [Cinna Davis’s project](https://itsdavis.com/)
