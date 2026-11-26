# Erdős’s pinned-distance conjecture in general position

For a set of sufficiently many points in the plane, suppose that no three lie on a line. From each point, count how many different positive distances it sees. **The average of these counts exceeds a fixed fraction greater than one third of the number of points.** In particular, some point sees that many different distances.

Precisely, there exist absolute constants $`\eta>0`$ and $`n_0`$ such that every such set $`P`$ of $`n\ge n_0`$ points satisfies

```math
\sum_{x\in P} d_P(x)>\left(\tfrac13+\eta\right)n^2,
\qquad d_P(x)=\#\{\lVert x-y\rVert:y\in P,\ y\ne x\}.
```

Erdős asked for this average bound and its consequence for a single point in 1987. His definition of general position also excluded four points on a circle. The theorem allows arbitrarily many points on a circle. The variant of catalogue problem 654 that allows three or more points on a line while excluding four on a circle remains open. [Original paper, pp. 167–168, displays (3) and (5)](https://users.renyi.hu/~p_erdos/1987-27.pdf#page=2) · [Problem 654](https://www.erdosproblems.com/654)

The written proof establishes the existence of the improvement without giving a numerical value. It received independent internal mathematical review. The finite checks exercise its counting and diameter lemmas. External refereeing and Lean formalization remain open. [Proof](PROOF.md) · [Mathematical review](REVIEW.md) · [Sources and priority search](AUDIT.md) · [Finite checks](verify.py) · [Issue 910](https://github.com/1337isnot1337/solved-conjectures/issues/910)

If you cite this result, please credit Erdős for the question and the Solved Conjectures research team for the proof. Cite the original paper, [the proof](https://github.com/1337isnot1337/solved-conjectures/blob/main/results/erdos-general-position-pinned-distances/PROOF.md) and [Cinna Davis’s project](https://itsdavis.com/). Author profiles are available on [GitHub](https://github.com/1337isnot1337) and [X](https://x.com/1337isnot1337).
