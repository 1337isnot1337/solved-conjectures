# Erdős 617: a high-degree transversal forces three disjoint full cliques

21 November 2026. This is a conditional structural restriction on a hypothetical counterexample, not a solution of the full conjecture. The proof uses the localized independence bound of Abiad, Kumar, and Pragada (arXiv:2609.00210v1, Theorem 2.2 or Theorem 3.1), independently reviewed in the companion notes. No priority claim is made.

## Preserved setup

Let `r>=6`, `n=r^2+1`, and `B=(r^3+r)/2`. Choose a sparsest color in a hypothetical balanced `r`-coloring, then delete edges until its independence number becomes edge-critical. Denote the reduced graph by `H`.

The proof uses only these preserved necessary conditions:

- `|V(H)|=n`, `alpha(H)=r`, and `e(H)<=B`;
- deleting any edge raises the independence number to `r+1`;
- a vertex outside any full clique `K_r` has at most one neighbor in it;
- every clique has order at most `r`.

The edge-deleted graph is not asserted to be part of a new partition into color classes. The edge-deletion scope is explained in `erdos617-edge-critical-reduction.md`.

Earlier deductions force two disjoint full cliques. If the maximum full-clique packing number is exactly two, the same companion note proves that `H` is connected; every vertex belongs to at most two full cliques; and the intersection graph of all full cliques is one of six listed shapes.

## Degrees of full-clique vertices

If `Q=K_r` in a connected edge-critical graph `H` with the above properties, then

```math
\alpha(H-Q)=r.
\tag{1}
```

Indeed, if it were at most `r-1`, deleting any edge between `Q` and its complement would leave independence number at most `r`: the clique still contributes at most one independent vertex. Connectedness supplies such a cross edge, since `|V(H)|>r`, contradicting edge-criticality.

Every vertex `v` of `Q` therefore has a neighbor outside `Q`. Otherwise an independent `r`-set in `H-Q` would extend through `v`. Consequently

```math
d_H(v)\ge r\qquad(v\text{ in a full clique}).
\tag{2}
```

A vertex shared by two full cliques has the stronger bound

```math
d_H(v)\ge 2r-2,
\tag{3}
```

because the cliques meet only in that vertex.

## A general transversal inequality

Let `X` be any set meeting every full clique of `H`; write `h=|X|` and `R=H-X`. Then `R` is `K_r`-free, `alpha(R)<=r`, and `|R|=n-h`. The localized independence bound gives

```math
e(R)\ge\frac{(n-h)^2}{r}-\frac{r(n-h)}2.
\tag{4}
```

If `D=e(H)-e(R)` counts the edges deleted with `X`, combining (4) with `e(H)<=B` gives the necessary bound

```math
D\le\left(\frac{3h}{2}-1\right)r-\frac{(h-1)^2}{r}.
\tag{5}
```

On the other hand,

```math
D=\sum_{x\in X}d_H(x)-e_H(X).
\tag{6}
```

A small transversal made of high-degree shared vertices violates (5).

## Excluding the six packing-two patterns

The vertices of the clique-intersection graph `L` are all full cliques of `H`. Each edge of `L` corresponds to its unique shared vertex in `H`.

### `P_3`, `C_4`, `P_4`, and `2K_2`

For each of these four graphs, two edges cover all vertices of `L`. Choose their two shared vertices as `X`. Thus `h=2`, and (3), (6) give

```math
D\ge 2(2r-2)-1=4r-5.
```

But (5) gives `D<=2r-1/r`. The lower bound exceeds this by

```math
2r-5+\frac1r>0\qquad(r\ge3).
```

### `C_5`

Three edges cover its five vertices. Choose the corresponding three shared vertices. Then

```math
D\ge3(2r-2)-\binom32=6r-9.
```

The bound (5) for `h=3` is `D<=7r/2-4/r`. The lower bound exceeds this by

```math
\frac{5r}{2}-9+\frac4r>0\qquad(r\ge4).
```

No information about the exact edges among these three shared vertices is needed.

### `K_2` together with an isolated vertex

Two full cliques intersect at `z`; the remaining full clique `Q` is disjoint from both. Choose `x` in `Q` nonadjacent to `z`. This is possible because `z` has at most one neighbor in `Q`.

The set `X={z,x}` meets all three full cliques, and its members are nonadjacent. By (2) and (3),

```math
D\ge(2r-2)+r=3r-2.
```

This exceeds the `h=2` upper bound by

```math
r-2+\frac1r>0\qquad(r\ge2).
```

All six possible patterns are excluded. Therefore the reduced sparse graph contains at least three pairwise disjoint full cliques.

## Exact conclusion and remaining gap

For `r>=6`, a hypothetical balanced coloring gives an edge-critical subgraph of one of its sparsest color graphs containing at least three disjoint `K_r`. The original color graph consequently contains the same three disjoint cliques.

This does not force a packing of size `r`. The prior argument excluding `r` disjoint full cliques therefore does not complete the conjecture. Intermediate packing sizes remain to be handled.

The proof was independently reviewed by the root agent and the conjectures agent. It uses the cited recent independence theorem and elementary structural deductions; it has not been formalized in Lean.

## Source and companion proofs

- Aida Abiad, Hitesh Kumar, Shivaramakrishna Pragada, *Localization of the Caro–Wei bound and its applications to bipartiteness*, arXiv:2609.00210v1, 31 August 2026. Primary PDF: <https://borowiecki.dev/pdf/2609.00210>.
- `erdos617-local-clique-bound.md`: the localized bound and full-clique coverage.
- `erdos617-forced-two-cliques.md`: two disjoint full cliques.
- `erdos617-edge-critical-reduction.md`: preservation under edge deletion, connectedness, and the six intersection patterns.
- Prior research and overlap are recorded in those notes; this report does not assert that the present deduction has no earlier occurrence.
