# Bollobás–Erdős–Tuza maximal-independent-set conjecture

The [mesh result for boxes](BOX-NEIGHBORHOODS.md) extends to lattice points of balls in **any fixed norm**, even with arbitrary real centers and variable radii. It uses a volume expansion fact for arbitrary unions of such balls. This proves another structured case of the strong form of [Erdős #611](https://www.erdosproblems.com/611); the general conjecture remains open.

**Theorem.** Fix a dimension $d$, a norm on $\mathbb R^d$ and $c>0$. On the lattice torus $(\mathbb Z/q\mathbb Z)^d$, suppose each open neighborhood is a union of lattice-point traces of torus balls in the induced quotient norm distance. If there are $Q$ balls across all these representations and $n=q^d$, a set of size
$$O\!\left(\frac{Q\log\log n}{\log n}+\sqrt n\right)$$
hits every maximal independent set of size at least $cn$. The constant depends only on the fixed norm, $d$ and $c$.

## Uniform expansion of a union of large norm balls

For a finite union $V$ of balls with radii $r_j\ge R>0$, let $V^{+s}$ be the union with all radii increased by $s$. Then
$$\operatorname{vol}(V^{+s})\le (1+s/R)^d\operatorname{vol}(V).$$
Use the additively weighted nearest-center partition: a point is assigned to the index minimizing $\|x-z_j\|-r_j$, with fixed index tie breaks. The partition is the same after adding $s$ to all radii. Each cell is star-shaped about its own center. In fact, traveling distance $\delta$ along a segment towards its own center decreases the cell's own score by exactly $\delta$ and decreases every other score by at most $\delta$ by the triangle inequality, preserving both strict comparisons and the tie rule. This argument shows that any nonempty cell contains its center. On the cell of index $j$, contracting the portion in the enlarged ball by the factor $r_j/(r_j+s)$ lands in the original ball and remains in the same cell. Summing cell volumes proves the inequality. This is the same star-cell idea as in [Stachó's treatment of parallel volume](https://www.math.u-szeged.hu/~stacho/HTM2/PUB/acta76.pdf), here used with the additive radii as weights.

The inequality also holds on a flat torus. Lift finitely many periods of all centers to a growing cube in $\mathbb R^d$, apply the same finite-union bound, and divide by the number of periods. At each fixed torus and fixed radii, only a bounded number of layers of periods next to the cube boundary may differ from the periodic union. Their proportion tends to zero. Both sides converge to the corresponding torus volumes.

## From lattice traces to continuous volume

Choose a constant $K$ such that the norm distance from any point to the center of its unit lattice cell is at most $K$, and the norm diameter of a cube of maximum-coordinate radius $h+1$ is at most $2K'(h+1)$ for some constant $K'$. Suppose all balls defining a lattice union $U$ have radii at least $L>2K$. Let $V$ be their continuous union and let $V^-$ be formed from the same balls with radii reduced by $K$. Rounding each point of $V^-$ to the center of its lattice cell gives a vertex of $U$ by the triangle inequality. Since the cells have unit volume, $\operatorname{vol}(V^-)\le |U|$.

If $U$ contains a coordinate mesh of spacing at most $h$, every torus point is within norm distance $K'(h+1)$ of $V$. Thus increasing every radius of $V^-$ by $s=K+K'(h+1)$ covers the torus. The expansion inequality with minimum radius $L-K$ gives
$$n\le\left(1+\frac{K+K'(h+1)}{L-K}\right)^d |U|.$$
For $h=\lfloor\eta L\rfloor$ with a sufficiently small fixed $\eta>0$, this forbids a complement of size $cn$ for large $L$.

## Finish the transversal construction

Use the same radius bands and mesh as in the box proof. If radii outside the inspected bands are larger than $q$, treat them as long. Exclude the owners of intermediate-radius balls. For a uniformly rotated mesh the expected number of incidences with balls of radius below $\ell$ is $O(Q/B^d)$, as such a ball contains $O(\ell^d)$ lattice points for the fixed norm. Choose a rotation attaining that bound and exclude all owners of short balls meeting the mesh. Any maximal independent set avoiding these two exceptional groups and the mesh must dominate the mesh by its long balls. Their lattice union omits the independent set. The preceding inequality rules this out for any independent set of size at least $cn$, completing the proof.

The graph hypothesis concerns the *neighbor traces*, not graphs given merely as intersection graphs of arbitrary balls. The [related geometric maximum-set paper](https://doi.org/10.3934/fcnt.2026010) and the [hollow-graph target](https://arxiv.org/abs/2607.15486) address a different adjacency model or a different family of independent sets. No prior version of this transfer was located in the inspected sources. Coordination: [#830](https://github.com/1337isnot1337/solved-conjectures/issues/830).
