# Multiplicative Merino–Welsh conjecture

Research log for [issue #44](https://github.com/1337isnot1337/solved-conjectures/issues/44). The conjecture is open.

## Statement and literature

For every connected loopless and bridgeless multigraph, the number of
spanning trees squared is at most the product of the numbers of acyclic
and totally cyclic orientations.

- [Conde and Merino](https://fs.unm.edu/IJMC/ComparingTheNumberOfAcyclicAndTotallyCyclicOrientations.pdf)
  pose the product inequality. The original maximum inequality is due to
  [Merino and Welsh](https://doi.org/10.1007/s000260050140).
- [Noble and Royle, Lemmas 2.2–2.4 and Theorem 4.5](https://bura.brunel.ac.uk/handle/2438/9384)
  restrict a smallest counterexample to series and parallel classes of size
  two or three and prove the conjecture for series–parallel graphs.
- [Chen, Jin, and Ma, Section 5](https://arxiv.org/abs/2610.27706)
  improve the class-size restriction to exactly two for matroids. Their
  reductions stay within graphic matroids because they use minors, components,
  and the order-dual argument for series classes. Thus the improvement also
  applies to a smallest graph counterexample.
- [Beke et al.](https://doi.org/10.1016/j.aim.2024.109674)
  disprove the matroid extension. [Chen and Xie](https://arxiv.org/abs/2610.06589)
  determine the sharp axis threshold for matroids, which is greater than 2.
  [Chen's permutation-Tutte counterexamples](https://hexagonmath.org/2610.00433v1)
  concern the auxiliary inequality of Csikvári, §7.3.
- [Váli](https://arxiv.org/abs/2611.15008) proves the product inequality for
  sufficiently sparse or dense graphs. [Xu, Dong, and Xu](https://arxiv.org/abs/2610.25817)
  cover bridgeless chordal graphs. [Chen and Xie](https://arxiv.org/abs/2609.33680)
  give quantitative inequalities for joins.

The recent papers, arXiv citations, and Hexagon postings checked in November
2026 give no resolution for all graphs. The two-element reduction was
rediscovered during the opening investigation and is credited to Chen, Jin,
and Ma. The argument below gives an additional necessary condition.
