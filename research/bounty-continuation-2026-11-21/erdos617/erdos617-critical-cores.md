# Erdős 617: minimal independence-ratio cores

Status, 21 November 2026: partial structural deductions only. No complete solution, Lean certificate, submission, or payment. The deductions below were checked independently within this campaign. A later priority search found the same local independence-three exclusion in prior public notes, so that result is an independent verification, not a new result of this campaign.

## Exact paid target and sources

The [live Conjectures.io target](https://conjectures.io/problems/erdos617-erdos-617) asks for a proof or refutation of the following statement:

> For every integer `r >= 3`, every edge coloring of `K_(r^2+1)` with `r` colors has an `(r+1)`-vertex set missing at least one color.

At retrieval the page accepted submissions, recorded no full-proof or refutation attempts, and displayed an estimated bounty of $2,600. The amount is variable and is not reserved by this note. The page also records prior contributions and says that part of a future payout can go to recognized contributors.

```text
task: fc-v2-erdos617-erdos-617-321e66f647895cc6454329ce-formalized
theorem: Erdos617.erdos_617
source type SHA-256: b09f19335b263c526494b75db3aa54d45f08510855a534f9aa0b9e76d6c0aab5
task commitment: 7efc0968ad846e491725e624bc0441297f1fb9d6821f5ca21a6c00a479ddcbad
```

The mathematical source is Erdős and Gyárfás, [*Split and balanced colorings of complete graphs*](https://www.renyi.hu/~gyarfas/Cikkek/92_splitandbalanced.pdf), Discrete Mathematics 200 (1999), 79–86. Conjecture 1 is the exact all-parameter statement. Lemmas 1 and 2 establish `r=3,4`; the affine-plane construction on `r^2` vertices is already in that paper. A [2026 primary preprint](https://github.com/Robby955/erdos-617-fixed-cases/blob/main/r5/main.tex) treats the fixed five-color case and explicitly does not claim the general theorem. Additional fixed-parameter claims were located; none is used as a premise here, and this note is not an extension of a numerical verification range.

Existing repository work in [issue 45](https://github.com/1337isnot1337/solved-conjectures/issues/45), particularly [commit 8edaf698](https://github.com/1337isnot1337/solved-conjectures/commit/8edaf698044b329782f802dd79b1fec2c213e7e0), assumes a packing of monochromatic cliques of order `r`. It does not establish that such a packing exists in an arbitrary counterexample. The [September partition-stability contribution](https://github.com/conjectures-io/conjectures-contribution/blob/main/contributions/erdos-617/a42828d35af07fc6555806b68d2bbf20eebcf3bdadce894a8d038dd07e09205e/sources.md) already formalizes partition stability and hereditary palette bounds. Those facts are prior work, not new contributions claimed here.

The route below starts from an arbitrary color graph and does not assume a clique packing.

**Priority correction.** The public note [*A growing local independence range*](https://erdosproblems.ai/wiki/research/erdos_617/independent/growing_local_independence_range), Proposition 3, already gives the exclusion at `3r+1` vertices for `r>=6`, using the same degree-`r` vertex and two-clique argument. It also contains the preceding independence-two exclusion and the exact `2r` boundary lemma. This source was found after our independent derivation and before reporting any resolution. The proof below is retained as a checked reconstruction and a starting point for the separate application of the later localized Caro–Wei theorem.

## Necessary conditions on each color graph

Suppose a counterexample exists and let `G` be one color graph on `N=r^2+1` vertices. Then `alpha(G) <= r`. More generally, let

```math
T_r(u)=r\binom q2+sq,\qquad u=qr+s,\quad 0\le s\lt r.
```

This is the minimum edge count of a graph on `u` vertices with independence number at most `r`, by the complement form of Turán's theorem. Applying that bound to every other color on any vertex set `U` gives the hereditary necessary inequality

```math
e(G[U])\le \binom{|U|}{2}-(r-1)T_r(|U|).
\tag{1}
```

In particular, every `(r+1)`-set has at most `binom(r,2)+1` edges of `G`; no `K_(r+1)` can occur. If `Q` is a clique of order `r` in `G`, every vertex outside `Q` has at most one neighbor in `Q`: otherwise `Q` together with that vertex violates this same local upper bound. Thus edges between two disjoint cliques of order `r` form a matching.

Choose `G` to be a color with the fewest edges. Then

```math
e(G)\le B_r:=\frac{r(r^2+1)}2.
\tag{2}
```

The inequality restricted only to `(r+1)`-sets is insufficient to prove `e(G)>B_r`. The independent companion note `erdos617-one-color-review.md` gives a counterfamily to that proposed intermediate implication. Its first example is `5 K_7` disjoint from `C_5[K_3]`: it has 50 vertices, independence number 7, 165 edges rather than the budget 175, and at most 22 edges on every eight-set. The stronger hereditary inequality (1) rejects it on its 15-vertex pentagon component. This graph is not a coloring counterexample to Erdős 617.

## Minimal induced subgraph with too small an independent set

Since `N > r alpha(G)`, choose an inclusion-minimal nonempty vertex set `W` such that, for `H=G[W]`,

```math
|W|>r\alpha(H).
```

Write `a=alpha(H)`. Then:

1. `|W|=ar+1`.
2. Every proper subset `U` of `W` satisfies `|U| <= r alpha(H[U])`.
3. `H` is connected and has minimum degree at least `r`.
4. `e(H)>r|W|/2`.

For (1), deleting any vertex gives `|W|-1 <= r alpha(H-v) <= ra`; combine this with `|W|>ra`. Statement (2) is minimality. If `H` were disconnected, applying (2) to its components and adding would contradict `|W|>r alpha(H)`, which proves connectedness.

For a vertex `v`, its nonneighbors outside itself induce a graph of independence number at most `a-1`, because adding `v` to an independent set there preserves independence. By (2), their number is at most `r(a-1)`. Since `|W|=ar+1`, this implies `deg_H(v)>=r`.

If every degree were `r`, Brooks' theorem would make `H` `r`-colorable unless `H` were `K_(r+1)` or an odd cycle. The first alternative is forbidden by (1), and the odd-cycle exception has degree 2, whereas `r>=3`. An `r`-coloring would give an independent set of size at least `ceil((ar+1)/r)=a+1`. Therefore some degree exceeds `r`, proving (4).

Substituting `|W|=ar+1` in (1) yields

```math
e(H)\le \frac{ar(a+r-2)}2+a.
\tag{3}
```

Several cases are therefore impossible:

- `a=1`: `H` would be `K_(r+1)`.
- `a=2`, for `r>=4`: (3) gives `2e(H)<=2r^2+4<=r(2r+1)`, contradicting (4).
- `a=r`: then `H=G`, so (4) contradicts (2).

## Uniform exclusion of a core with independence number three

**Lemma.** For `r>=6`, the minimal graph `H` above cannot have `a=3`.

### Proof

Suppose `a=3`, so `|H|=3r+1`. Equation (3) gives

```math
2e(H)\le 3r^2+3r+6<(r+1)(3r+1)
```

for `r>=6`. Minimum degree is at least `r`, so there is a vertex `v` of degree exactly `r`. Put `A=N_H(v)` and `R=V(H)\setminus(A\cup\{v\})`. Then `|A|=r`, `|R|=2r`, and `alpha(H[R])<=2`.

First suppose `R` contains a clique `Q` of order `r`. Each vertex outside `Q` has at most one neighbor in `Q`. If `R\setminus Q` contained a nonadjacent pair `y,z`, at most two vertices of `Q` could be adjacent to either one, leaving a vertex of `Q` that extends them to an independent triple in `R`. This is impossible. Hence `Q'=R\setminus Q` is also a clique of order `r`.

The set `A` is not a clique, since otherwise `A\cup\{v\}` would be `K_(r+1)`. Choose nonadjacent vertices `u,w` in `A`. In each of `Q,Q'`, at least `r-2>=2` vertices are nonadjacent to both `u,w`. The edges between `Q` and `Q'` form a matching, so one can choose a vertex `x` from the available portion of `Q` and a vertex `y` from the available portion of `Q'` that are nonadjacent. Then `u,w,x,y` is an independent four-set in `H`, again impossible. We conclude that `H[R]` contains no clique of order `r`.

Let `F` be the complement of `H[R]`. It is triangle-free, and its independence number is at most `r-1`. Every neighborhood in a triangle-free graph is independent, so `Delta(F)<=r-1`. On the other hand, (1) on the `2r`-set `R` gives

```math
e(F)\ge (r-1)T_r(2r)=r(r-1).
```

This saturates the degree upper bound, forcing `F` to be `(r-1)`-regular.

A triangle-free nonbipartite graph on `n` vertices has minimum degree at most `2n/5`. For completeness, take a shortest odd cycle of length `ell>=5`. Each vertex outside the cycle has at most two neighbors on it: three or more neighbors would have cyclic gaps of length at least two, one odd gap of length at most `ell-4`, and hence a shorter odd cycle through that vertex. Summing the degrees of the cycle vertices gives `ell delta <= 2n`, and therefore `delta<=2n/5`.

Here `n=2r` and `r-1>4r/5` for `r>=6`, so `F` must be bipartite. A bipartite graph on `2r` vertices has an independent set of size at least `r`, contradicting `alpha(F)<=r-1`. This proves the lemma.

The independent reviewer checked all steps, including the exact sizes of the available subsets of `Q,Q'` and the shortest-odd-cycle argument.

### What remains after these deductions

For `r>=6`, any hypothetical counterexample has a sparsest color graph with a minimal induced graph satisfying

```math
4\le a\le r-1,\qquad |H|=ar+1,\qquad
\delta(H)\ge r,\qquad
\frac{r|H|}{2}<e(H)\le\frac{ar(a+r-2)}2+a.
\tag{4}
```

The middle range is not excluded. In particular, the lemma does not settle Erdős 617.

## Chromatic-critical density: an exact boundary and a non-transfer warning

Kostochka and Yancey, [*Ore's conjecture on color-critical graphs is almost true*](https://kostochk.web.illinois.edu/docs/2016/jctb14-y.pdf), J. Combin. Theory Ser. B 109 (2014), 73–101, Theorem 4, prove that an actual `(r+1)`-critical graph `J` on `u` vertices satisfies

```math
e(J)\ge
\left\lceil
\frac{(r-1)(r+2)u-(r+1)(r-2)}{2r}
\right\rceil.
\tag{5}
```

At `u=ar+1`, the real quantity inside the ceiling is

```math
\frac{r(ar+1)}2+\frac{(a-1)(r-2)}2.
```

However, minimality of the independence ratio does not prove that `H` is chromatic-critical. Substituting `H` into (5) without another argument would be a gap. It contains an `(r+1)`-critical subgraph, but that subgraph can have fewer vertices.

One valid consequence is that every `(r+1)`-critical subgraph of any candidate color graph has at least `3r-1` vertices, for `r>=4`. Compare (5) to (1). For `u=r+s`, `1<=s<=r-1`, or `u=2r+s`, `0<=s<=r-2`, the difference between the upper bound and the real lower bound is a convex quadratic in `s`, and its endpoint values are negative. Hence orders from `r+1` through `3r-2` are impossible. At the next three orders the upper bound minus the real lower bound is respectively

```math
2-\frac2r,\qquad
\frac{r^2+5r-2}{2r},\qquad
5
\quad
\text{for }u=3r-1,3r,3r+1.
```

These positive gaps are not contradictions. Further structure of critical subgraphs, or a valid way to combine different colors' degree excesses, is still required. No such final argument is supplied here.
