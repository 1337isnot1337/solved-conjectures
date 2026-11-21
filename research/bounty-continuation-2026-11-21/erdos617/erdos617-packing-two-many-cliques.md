# Erdős 617: packing number two permits at most five full cliques

21 November 2026. This is a continuation of the forced-two-cliques argument, not a solution of the balanced-coloring conjecture. It uses the same Abiad–Kumar–Pragada preprint inequality. Novelty and bounty eligibility are not claimed.

## Statement

Let `r>=6`, and suppose a balanced `r`-coloring exists on `n=r^2+1` vertices. Let `G` be a color graph with `e(G)<=B_r=(r^3+r)/2`.

If the maximum number of vertex-disjoint `K_r` cliques in `G` is two, then the total number of distinct `K_r` cliques is at most five.

Combined with `erdos617-forced-two-cliques.md` and the coverage estimate in `erdos617-local-clique-bound.md`, this means that a sparse color either has at least three disjoint full cliques, or has packing number two and exactly three, four, or five full cliques. The latter configurations are not excluded here.

## Shared and private vertices

As before, every vertex outside a full clique has at most one neighbor in that clique. Distinct full cliques intersect in at most one vertex, and a pairwise-intersecting triple has a common center.

Suppose the packing number is two, and list all full cliques as `Q_1,...,Q_q`. Each `Q_j` contains at most two vertices that belong to another full clique. Otherwise choose three other cliques meeting `Q_j` at three different vertices. The intersection rule makes those three cliques pairwise disjoint, contrary to the assumed packing number.

Let `P_j` be the private vertices of `Q_j`, those belonging to no other full clique. Then

```math
|P_j|\ge r-2,
```

and the `P_j` are pairwise disjoint. If two full cliques intersect, there are no edges between their private parts: an extra edge and their shared vertex would violate the external-neighbor rule. If they are disjoint, the edges between their private parts form a matching.

Define a graph `D` on the `q` full cliques, joining precisely the disjoint pairs. It is triangle-free, since a triangle would be three disjoint full cliques. Consequently the only possible cross edges between the private parts occur along `D`, and each such cross graph is a matching.

## A matching-list transversal lemma

Suppose a triangle-free graph `D` has `q>=6` vertices. For each vertex, give a disjoint list with at least `q-3` choices, and suppose choices from two different lists can conflict only along an edge of `D`, with those conflicts forming a matching for every pair of lists. Then one can choose one element from every list with no conflicts.

For `q>=7`, Mantel's theorem shows that every induced subgraph has a vertex of degree at most `floor(q/2)`. Thus `D` is `floor(q/2)`-degenerate. Since

```math
q-3\ge\lfloor q/2\rfloor+1,
```

a reversed degeneracy ordering gives a greedy selection: each earlier neighbor forbids at most one choice.

For `q=6`, either `D` is 2-degenerate, when three choices again suffice, or it has a subgraph of minimum degree three. Mantel's theorem forces such a subgraph to be all six vertices and to be `K_(3,3)`.

In the latter case, restrict every list to three choices. Pick one choice independently and uniformly in each list on one side. A list on the other side is completely blocked only if its three possible forbidden choices are all distinct and cover its list. Because each cross conflict relation is a matching, there are at most `3!=6` such assignments among the `3^3=27` equally likely assignments. The probability that any of the three opposite lists is completely blocked is at most `3*(6/27)=2/3<1`. Choose an assignment avoiding all such events, then choose an available element in each opposite list. There are no conflicts among lists on the same side. This proves the lemma without an external correspondence-coloring theorem.

## Bounding the total number of full cliques

Assume `q>=6`. First, `q<=r-1`.

If `q>=r+1`, take any `r+1` full cliques. Their private parts have at least `r-2=(r+1)-3` choices, so the transversal lemma supplies an independent set of size `r+1`, impossible. Here `r>=6` ensures the lemma applies.

If `q=r`, their union has at most `r^2<n` vertices. Take a vertex `v` outside it. Delete its neighbors from each private part; at most one choice per part is removed. The remaining lists have size at least `r-3=q-3`, and the transversal lemma gives `r` independent representatives avoiding `v`. Adding `v` again contradicts independence number at most `r`.

Put `s=r-q>=1`, and let `R` be the vertices outside all full cliques. The intersection graph of the full cliques has at most two connected components, since one clique from each of three components would be a disjoint triple. A connected family of `h` cliques has union size at most `hr-(h-1)`. It follows that

```math
I:=qr-\left|\bigcup_jQ_j\right|\ge q-2.
```

Writing `c=I+1>=q-1`, we obtain

```math
|R|=rs+c.
\tag{1}
```

The graph `G[R]` is `K_r`-free. It also satisfies `alpha(G[R])<=s`: if an independent set `S` of size `s+1` existed, delete its neighbors from all private parts. Each list would retain at least

```math
r-2-(s+1)=q-3
```

vertices. The transversal lemma would extend `S` by one vertex from each full clique, producing an independent set of size `s+1+q=r+1`.

## Edge-budget contradiction

The [Abiad–Kumar–Pragada inequality](https://borowiecki.dev/pdf/2609.00210), as used in the companion note, gives

```math
e(G[R])\ge\frac{|R|^2}{s}-\frac{r|R|}{2}
=\frac{r^2s}{2}+\frac{3rc}{2}+\frac{c^2}{s}.
```

Distinct full cliques share at most one vertex, so their internal edge sets are disjoint. Therefore

```math
\begin{aligned}
e(G)-B_r
&\ge q\binom r2+e(G[R])-\frac{r^3+r}{2}\\
&\ge\frac r2(3c-q-1)+\frac{c^2}{s}\\
&\ge r(q-2)+\frac{c^2}{s}>0,
\end{aligned}
```

where the last line uses `c>=q-1`. This contradicts the sparse-color budget. The assumption `q>=6` is false, proving the statement.

## Remaining configurations

This proof uses all full cliques and their overlap structure, rather than assuming a packing has been supplied. Its unresolved small-total families are structurally real: private lists can have fewer than three choices when `q<=5`, and a cycle of matching constraints can block a transversal. The argument does not eliminate these configurations, and it does not exclude packing numbers from three through `r-1`.
