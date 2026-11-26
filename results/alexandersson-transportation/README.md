# Alexandersson’s transportation polytope conjecture

Per Alexandersson conjectured that the Ehrhart $h^*$-polynomial of a classical transportation polytope is real-rooted whenever each margin vector has at least one entry greater than one. The polytope consists of all nonnegative real tables with the specified row and column sums. [Author’s statement, “Tableaux, polytopes and Ehrhart theory”](https://www.symmetricfunctions.com/realRootedOpenProblems.htm) · [Author’s research issue](https://github.com/PerAlexandersson/RealRooted/issues/2627)

**Result.** The conjecture is false. For every $m\ge2$, take row sums $(1,1,m)$ and column sums $(2,1^m)$. The numerator is $\sum_{j=0}^m\binom mj^2 z^j-mz$. At $m=12$ it violates the Laguerre inequality at $z=-1/5$, and exactly two of its twelve roots are nonreal. The polytope has dimension 24 and all 39 cells are available.

[Written proof](proof.md) · [Exact checker](check.py) · [Source and priority](sources.md) · [Research issue](https://github.com/1337isnot1337/solved-conjectures/issues/814)

**Review status.** Written research proof awaiting independent mathematical review.

**Lean status:** none.
