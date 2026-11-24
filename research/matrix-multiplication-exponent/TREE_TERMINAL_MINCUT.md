# Hypergraph mincut compatibility for tree terminal metrics

This is a finite metric statement about the scalar charge

```math
g_d(A)=2\max_{\mu\in\mathcal P(A)}
\sum_{x,y\in A}\mu(x)\mu(y)d(x,y).
```

Set $g_d(\varnothing)=0$; the same value follows for singleton sets.

It does not construct a tensor spectral point. It makes no originality
claim. The proof below is self-contained.

## Theorem

Let $(V,d)$ be a finite metric space, and let $P\subseteq V$ be a
nonempty terminal set. Suppose that the restricted metric on $P$ is
isometric to a subset of a finite metric tree: a finite tree whose
edges are intervals of specified nonnegative lengths, equipped with
geodesic distance. For each hyperedge $H\subseteq V$ assign a
nonnegative weight $w_H$. Put

```math
\lambda_P=
\min_{\substack{S\subseteq V\\
S\cap P\ne\varnothing,\;P\setminus S\ne\varnothing}}
\sum_{\substack{H\cap S\ne\varnothing\\H\setminus S\ne\varnothing}}w_H.
```

For fewer than two distinct terminals, take the conclusion to be
trivial since $g_d(P)=0$. Otherwise,

```math
\sum_H w_H g_d(H)\ \ge\ \lambda_P g_d(P).
```

The ambient points need not lie on the terminal tree. In particular,
the theorem applies to every three-terminal metric and to every
equilateral terminal set of arbitrary cardinality, with arbitrary
metric auxiliary points.

## A nonexpansive extension into the terminal tree

Let $T$ be the finite metric tree spanned by the isometric copy of
$P$. There is a map $\phi:V\to T$ that agrees with this copy on $P$
and satisfies

```math
d_T(\phi(x),\phi(y))\le d(x,y)
\qquad(x,y\in V).
```

Here is a proof of the required extension property. Closed balls in
a tree are geodesically convex. Any finite family of pairwise
intersecting nonempty closed convex subtrees has nonempty total
intersection. To see this, fix a root $o$. In each subtree $C_i$ let
$p_i$ be its point nearest $o$, and choose $p_i$ farthest from $o$
among these finitely many nearest points. For every $j$, choose
$z\in C_i\cap C_j$. Both $p_i$ and $p_j$ lie on the path from $o$
to $z$. Since $p_i$ is at least as far from $o$, it lies between
$p_j$ and $z$, and therefore lies in $C_j$. Thus $p_i$ belongs to
every subtree.

Suppose $\phi$ is already defined on a finite subset $W$ containing
$P$, and let $x\in V\setminus W$. The balls

```math
\overline B_T(\phi(v),d(x,v)),\qquad v\in W,
```

intersect pairwise, because

```math
d_T(\phi(v),\phi(w))
\le d(v,w)\le d(v,x)+d(x,w).
```

Their total intersection is therefore nonempty. Choose $\phi(x)$
there and repeat. This proves the claimed finite extension.

## A cut measure with total mass equal to the terminal charge

Choose a probability measure $\mu$ on $P$ maximizing $g_d(P)$.
Since $\phi$ is isometric on $P$, the same measure maximizes the
charge computed with $d_T$ on those terminal images.

At an interior point $t$ of an edge of $T$, deleting $t$ gives two
components. Choose either component $S_t^T$ and put

```math
m(t)=\mu(P\cap S_t^T),\qquad
d\nu(t)=4m(t)(1-m(t))\,dt,
```

where $dt$ is edge length. The choice of component does not affect
$d\nu$. The elementary tree distance formula gives

```math
\begin{aligned}
\nu(T)
&=4\int_Tm(t)(1-m(t))\,dt\\
&=2\sum_{p,q\in P}\mu(p)\mu(q)d_T(p,q)
=g_d(P).
\end{aligned}
```

For each such $t$ pull the tree cut back to $V$ through $\phi$.
Whenever $d\nu(t)$ is positive, the cut separates two terminals.

We claim that, for every hyperedge $H$,

```math
\int_T\mathbf1_{\{H\text{ crosses the cut at }t\}}\,d\nu(t)
\le g_d(H).
```

## Domination on every hyperedge

If $H$ is empty or has one point, it crosses no cut and both sides
of the claimed domination are zero. For larger $H$, let $C_H$ be the
smallest subtree containing $\phi(H)$, and let
$\pi_H:T\to C_H$ be nearest-point projection. Such projection is
well-defined because tree paths are unique. Apart from finitely many
edge points, a cut crosses $\phi(H)$ exactly when its point lies in
$C_H$. For cuts inside $C_H$, projecting to $C_H$ preserves the side
of each point, except possibly at finitely many projection points,
which have zero edge-length measure. Consequently, with
$\eta=(\pi_H)_*\mu$,

```math
\begin{aligned}
\int_T\mathbf1_{\{H\text{ crosses at }t\}}\,d\nu(t)
&=4\int_{C_H}m(t)(1-m(t))\,dt\\
&=2\sum_{x,y\in C_H}\eta(x)\eta(y)d_T(x,y).
\end{aligned}
```

The displayed sums are finite, since $\eta$ has finite support.
We next show that moving from the subtree $C_H$ back to its
generating set $\phi(H)$ cannot lower the maximal distance energy.

Every point $z\in C_H\setminus\phi(H)$ lies on a path between two
points $a,b\in\phi(H)$. Choose $\theta\in[0,1]$ with
$d_T(a,z)=(1-\theta)d_T(a,b)$. Distance to any fixed point $y$ is
convex along a tree path, so

```math
d_T(z,y)\le\theta d_T(a,y)+(1-\theta)d_T(b,y).
```

Replace any mass $p$ at $z$ by masses $p\theta$ at $a$ and
$p(1-\theta)$ at $b$. All interactions with the remaining measure
weakly increase. The interaction inside the replaced mass changes
from zero to a nonnegative quantity. Thus the total distance energy
does not decrease. Repeating this finitely often gives a probability
measure supported on $\phi(H)$ with energy at least that of
$\eta$. It follows that

```math
2\sum_{x,y}\eta(x)\eta(y)d_T(x,y)
\le g_{d_T}(\phi(H))\le g_d(H).
```

The last inequality follows from the nonexpansiveness of $\phi$;
if different points have the same image, lift any image measure to
arbitrary representatives in $H$. This proves the claim.

## Integration of the mincut inequality

For $\nu$-almost every cut of positive weight, the cut separates
$P$ and hence has total crossing hyperedge weight at least
$\lambda_P$. Integrating and using the hyperedge domination gives

```math
\begin{aligned}
\sum_Hw_Hg_d(H)
&\ge\sum_Hw_H
\int_T\mathbf1_{\{H\text{ crosses at }t\}}\,d\nu(t)\\
&\ge\lambda_P\nu(T)
=\lambda_Pg_d(P).
\end{aligned}
```

This completes the proof.

## Scope and a remaining obstruction

Every three-point metric is a tripod metric, with arm lengths
$(d_{ij}+d_{ik}-d_{jk})/2$. Every equilateral metric is a star metric
with equal arm lengths. Zero lengths can be collapsed. The theorem
therefore includes both cases without any Euclidean hypothesis.
Pseudometrics are handled by first identifying points at distance
zero and then pulling the resulting cuts back to the original
labels. These pulled cuts are still admissible terminal-separating
cuts in the original hypergraph, so their capacities are at least
the original $\lambda_P$; no equality of the two mincut values is
needed.

The theorem does not cover arbitrary Euclidean terminal metrics.
For example, the four vertices of a square are not a tree metric:
the three sums of distances across opposite pairings are
$2\sqrt2$, $2$, and $2$, whereas a tree metric has its two largest
such sums equal. A single nonexpansive tree replacement cannot
preserve their charge. To check this last statement, label the square
cyclically. Its distance matrix has first row $(0,1,\sqrt2,1)$ and is
circulant. On the subspace of vectors whose coordinates sum to zero,
its eigenvalues are $-\sqrt2,-\sqrt2,\sqrt2-2$, all strictly negative.
Thus the uniform measure is the unique distance-energy maximizer and
has positive mass on all four vertices. If a dominated tree metric
preserved the optimum, any of its maximizing measures would also
maximize the square energy, hence would be this uniform measure.
Equality of the energies would then force equality of all six
pairwise distances, which is impossible for a tree metric. A general
Euclidean terminal proof requires a different argument.
