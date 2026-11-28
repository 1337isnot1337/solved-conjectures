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

## Spanning-tree bounds on paired edges

In a minimum-edge counterexample, a uniformly random spanning tree meets
each parallel pair with probability strictly between $3/5$ and $4/5$. It
contains both edges of each series pair with probability strictly between
$1/5$ and $2/5$. Deleting a parallel pair leaves a bridgeless graph. Dually,
contracting a series pair leaves a loopless graph. In particular, no
three-edge bond contains a parallel pair, and no triangle contains a series
pair.

### Proof

Write $a(N)=T_N(2,0)$, $c(N)=T_N(0,2)$, and $t(N)=T_N(1,1)$ for a
matroid $N$. Let $M$ be the cycle matroid of a minimum-edge graph
counterexample. Its direct-sum factors are graphic, and the three
evaluations multiply over direct sums, so $M$ is connected. The elementary
reductions in Chen, Jin, and Ma, §5 apply to $M$: each element belongs to
one pair, series or parallel. The series-side argument can use $`M^*`$,
because the dual of each proper minor of $`M^*`$ is a proper minor of $M$ and
satisfies the same product inequality whenever it is loopless and coloopless.

Let $M_1$ result from deleting one element of a parallel pair and let $e$
be the survivor. Set $D=M_1\setminus e$ and $C=M_1/e$. Parallel deletion
preserves connectivity of the matroid. The pair is maximal, so $C$ is
loopless and coloopless. In particular, $t(C),a(C),c(C)>0$. Normalize by
putting

```math
q=\frac{t(D)}{t(C)},\qquad
x=\frac{a(C)}{a(D)},\qquad
r=\frac{c(D)}{c(C)}.
```

Lemma 5.7 of Chen, Jin, and Ma gives $0\lt x\le 1$ and $0\le r\le1$.
Deletion–contraction at $e$, followed by the parallel-extension formula,
gives the evaluation triples

```math
\begin{array}{c|ccc}
 & a & c & t
\\ M_1 & a(D)+a(C) & c(C)(1+r) & t(C)(q+1)
\\ M & a(D)+a(C) & c(C)(3+r) & t(C)(q+2).
\end{array}
```

Put $s=(q+2)^2$ and $d=3+r$. Minimality gives the conjectured inequality
for $M_1$ and $C$. Comparing the normalized ratios $ac/t^2$ of $M$ to
those two minors gives, respectively,

```math
r>\frac{2q^2+2q-1}{2q+3},
\qquad
(1+x)d\lt xs.
```

The second inequality implies $r<s/2-3$ since $x\le1$. The difference of
this upper bound and the first lower bound equals

```math
\frac{(2q-1)(q+2)^2}{2(2q+3)} .
```

It must be positive, so $q>1/2$. The first lower bound then exceeds $1/8$,
since its difference from $1/8$ is
$\frac{(2q-1)(8q+11)}{8(2q+3)}$. Consequently $c(D)>0$. Since $D$ is
loopless, this makes it coloopless as well, so minimality also applies
to $D$.

Comparing $ac/t^2$ of $M$ to that of $D$ now gives
$(1+x)dq^2<rs$. The prior comparison to $C$ gives
$1+x>s/(s-d)$, because $x(s-d)>d$. Combining the two yields

```math
dq^2 < r(s-d),\qquad
3q^2 < r(4q+1-r)\le 4q .
```

For the last inequality, $4q-r(4q+1-r)=(1-r)(4q-r)\ge0$
since $q>1/2$ and $r\le1$. Hence $q<4/3$. The chance of using the
parallel pair is $2/(q+2)$ by the spanning-tree count, so it lies in
$(3/5,4/5)$. Complementing bases in the dual gives the stated series
probability and the dual assertion on contracting the pair.

### What remains

The bounds constrain weighted spanning-tree marginals after replacing each
parallel pair by an edge of weight $2$ and suppressing each series pair
into an edge of weight $1/2$ in a cycle-matroid-equivalent representation.
A proof that every such compressed graph violates a necessary condition,
or a concrete graph with product below its squared tree count, would
resolve the full conjecture. The bounds alone give neither conclusion.
