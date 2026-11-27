# The dandelion minimum at orders 21 through 64

**Theorem.** For each integer $`n`$ from 21 through 64, if a simple graph and its complement are connected and their algebraic connectivities sum to at most the dandelion value, each graph has a leaf. The all-orders double-leaf comparison then identifies all minimizers as generalized dandelions up to complementation. This includes every graph in the diameter-three domain of Barrett–Evans–Hall–Kempton’s Conjecture 2. The proof below uses connectedness of both graphs throughout and works at these orders irrespective of diameter. Together with the previous results at orders 4 through 10 and at orders at least 65, the remaining orders for both questions are 11 through 20. [Primary conjecture](https://arxiv.org/pdf/2201.04225#page=15) · [Double-leaf proof](MISSING-LEAF.md) · [Orders 4–10](SMALL-REMAINDER.md) · [Orders 65 and above](INTERVAL-LEAF-THRESHOLD.md)

Write $`x`$ and $`y`$ for the two algebraic connectivities, with $`x\le y`$, and $`a,b`$ for the corresponding mean-zero unit Fiedler vectors in the respective graphs. Choose their signs so the maximum absolute entries $`M,H`$ are positive maxima. A subscript $`U`$ on a variable denotes a box upper bound. The argument uses three ingredients in addition to the existing star-energy estimates and leaf argument.

## A normalized coordinate bound

For a unit eigenvector with eigenvalue $`\lambda`$, a vertex of degree $`d`$ and coordinate $`f`$ has neighbor-coordinate sum $`(d-\lambda)f`$ and nonneighbor-coordinate sum $`-(1+d-\lambda)f`$. The vertex itself belongs to neither group. Both graphs are connected, so $`1\le d\le n-2`$. Cauchy–Schwarz in the two groups yields

```math
 f^2\left(1+\frac{(d-\lambda)^2}{d}
              +\frac{(1+d-\lambda)^2}{n-1-d}\right)\le 1 .
```

If $`d>u\ge\lambda`$, replacing $`\lambda`$ by $`u`$ lowers the bracket. For $`d\le u`$ use the lower bound one. The resulting function $`F_n(d,u)`$ is nondecreasing in integer $`d`$. Indeed, for $`d>u`$ the first fraction has derivative $`1-u^2/d^2>0`$, and the second has increasing numerator and decreasing positive denominator. A known coordinate lower bound $`m`$ therefore yields the largest allowable degree $`d`$ from $`m^2 F_n(d,u)\le1`$. If at most $`k`$ edges at a vertex are missing, its degree is at least $`n-1-k`$, and $`B(k,u)=1/\sqrt{F_n(n-1-k,u)}`$ bounds its coordinate magnitude from above for $`1\le k\le n-2`$. For $`k=0`$, the mean-zero row equation gives zero whenever $`u<n`$. These bounds apply to either graph independently.

## Four signed extrema

Choose a maximizing and minimizing vertex in each vector. Write their magnitudes as $`(M,m_-)`$ and $`(H,h_-)`$. Both signs occur. A lower bound on the range of $`a`$ follows from the established complete-pair inequality $`1\le x R_b^2 +y R_a^2`$ and $`R_b\le 2H`$. Also, summing $`(M-a_i)(a_i+m_-)\ge0`$ over all vertices gives $`1\le nMm_-`$. Thus

```math
 m_-\ge\max\left\{\frac{1}{nM_U},
  \sqrt{\frac{\max(0,1-4x_UH_U^2)}{y_U}}-M_U\right\}.
```

The symmetric bound holds for $`h_-`$. The complete-pair inequality follows by expanding the sum over all unordered pairs of the products of the two squared coordinate differences; the sum is at least one, and its portions on each graph are at most $`xR_b^2`$ and $`yR_a^2`$. [Expansion and energy identity](LARGE-ORDER.md)

When the two eigenvalues are below one, the two signed extrema in each graph are nonadjacent and have no common neighbor. Indeed, at an extremum of magnitude $`A`$, every neighbor lies on the same side of zero with magnitude at least $`(1-\lambda)A`$, by the extremal row equation expressed as a sum of drops of one sign. This applies also after negating the vector.

The four selected vertices are distinct. If a vertex were selected for both graphs, then its opposite extremum in the first graph would be its neighbor in the complement, while its opposite extremum in the complement would be its neighbor in the first graph. These two other vertices must be different. They cannot be adjacent in the first graph because that would give a common neighbor to its own extrema, and they cannot be adjacent in the complement for the same reason there. In the four cross pairs, each extremum for the second graph sees at most one of the first graph’s extrema in the first graph. Each extremum for the first graph sees at most one of the second graph’s extrema in the complement. Thus precisely two cross pairs belong to the first graph and form a perfect matching; the remaining two pairs form a perfect matching in the complement. This proof requires no diameter bound or uniqueness of the extrema.

For each of the two possible matchings, check a necessary coordinate condition on each of its four edges. Suppose a first-graph edge joins a first-graph extremum of magnitude at least $`A`$ to a second-graph extremum of magnitude at least $`C`$. At the latter vertex the magnitude of its first vector coordinate is at least $`(1-x_U)A`$. Let $`d`$ bound the second-graph degree there, by the normalized coordinate inequality at $`C`$. Every second-graph neighbor has second coordinate of magnitude at least $`(1-y_U)C`$; let $`j`$ bound its second-graph degree. Applying the opposite coordinate bound to these neighbors and summing the first vector’s mean-zero row equation gives the necessary inequality

```math
 (1-x_U)A\le
 \min\left\{B(d,x_U),\frac{d\, B(j,x_U)}{n-d-x_U}\right\}.
```

The denominator is positive since $`d\le n-2`$ and $`x_U<1`$. Interchange both graphs for each complementary edge. If both matchings fail an edge condition the box is impossible.

## Closing the exact boxes

In each order the verifier bounds the dandelion value $`D_n`$ from above using the cubic in Barrett–Evans–Hall–Kempton’s Lemma 4.2. The polynomial is negative at zero, positive at one, negative at $`n-1`$ and positive at $`n`$. A cubic therefore has one root in each intervening interval. Rational bisection of the two outer intervals bounds the smaller root from above and the larger from below, giving the upper bound $`D`$ on their difference plus $`n`$. Every candidate satisfies $`0<x\le D/2`$ and $`y\le D-x`$. Both vector maxima lie between $`1/\sqrt n`$ and $`\sqrt{(n-1)/n}`$ by normalization and centering. [Dandelion eigenvalues](https://arxiv.org/pdf/2201.04225#page=15)

Bisect the longest of the three box intervals for $`x,H,M`$ at its rational midpoint, including the midpoint in both halves. Test separately whether the positive extremum of $`a`$ has degree one or degree at least two. A box can be eliminated by the complete-pair inequality, the four-extrema condition, or an inconsistent coordinate or degree bound. For the remaining boxes, the upper degree at the $`b`$ maximum gives an almost-universal star in the first graph, hence a lower bound on $`M`$. For a first-graph extremum of degree at least $`p`$, the row at that extremum has a neighbor of coordinate at least $`(1-x_U/p)M`$. The two opposite-graph stars at this neighbor and the extremum have disjoint edges, giving the lower bound on $`H`$ from the earlier interval proof. After these refinements the program calls the same leaf-closing function as the order-65 certificate, with the newly proved own and opposite bounds. Its signed upper bound after the two distinguished vertices are known to be nonadjacent is used solely for an upper bound on a coordinate, as in the published research argument. [Shared closing argument](INTERVAL-LEAF-THRESHOLD.md#closing-a-branch) · [Shared verifier](verify_effective_interval.py)

The checker uses rational arithmetic, upward-rounded upper bounds and downward-rounded lower bounds for square roots. It raises an error on every unresolved terminal box. Running it over the 44 orders closed 1,638 terminal boxes and both degree branches in each. Of the 3,276 branch certificates, 1,084 used the extremal matching, 616 used the complete-pair inequality, 998 used the first- or second-leaf contradiction, and 578 used degree, maximum or coordinate bounds. No enumeration of graphs is required. [Exact checker](verify_finite_interval.py)

```sh
python3 research/barrett-evans-hall-kempton-dandelion/verify_finite_interval.py
python3 research/barrett-evans-hall-kempton-dandelion/verify_effective_interval.py 65
```

An independent Codex reviewer checked the normalized row bound, the four-extrema matching, all cross-edge inequalities, the directions of the interval estimates, the cubic root isolation and the shared leaf argument. The reviewer reran all 44 orders and reproduced the 3,276 branch closures. This certificate is internally reviewed and computer-assisted. It has no Lean formalization or external referee report.

The WadeDavis research session contributed this finite localization certificate to the ongoing campaign in [tracking issue #962](https://github.com/1337isnot1337/solved-conjectures/issues/962). The previous effective-threshold proof, its shared closing argument and the double-leaf classification retain their original attribution.
