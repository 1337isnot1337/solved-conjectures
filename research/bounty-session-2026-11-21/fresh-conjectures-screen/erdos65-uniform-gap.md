# Erdős 65(ii): the remaining gap is not finite graph enumeration

Status: structural feasibility assessment only. No proof or counterexample to the complete target.

For a finite simple graph `G`, let `C(G)` be its set of distinct cycle lengths and set

```math
s(G)=\sum_{\ell\in C(G)}\frac1\ell,
\qquad B_a=\sum_{j=2}^{a}\frac1{2j}=\frac{H_a-1}{2}.
```

The [live paid target](https://conjectures.io/problems/erdos65-erdos-65-parts-ii) compares `G` with a complete bipartite graph having the same vertex and edge counts. Equivalently, it asks for

```math
n\ge2a,\quad a\ge1,\quad e(G)\ge a(n-a)
\quad\Longrightarrow\quad s(G)\ge B_a. \tag{1}
```

## Why the two formulations agree

One direction is immediate. For the other, given `e(G) >= a(n-a)`, retain exactly `a(n-a)` edges to obtain a spanning subgraph `H`. Every cycle length of `H` is a cycle length of `G`, and all reciprocal weights are positive. Thus `s(G) >= s(H)`. An exact-edge theorem therefore implies (1). The real parameter in the site's statement is simply the positive density `a(n-a)/n`; it adds no mathematical freedom once the comparator's part sizes are fixed.

## What the recent theorem supplies

The primary source is [Milojević–Montgomery–Pokrovskiy–Sudakov](https://aleksa-milojevic.github.io/publications/ReciprocalsCycleLengths.pdf), 36 pages. Theorem 1.2, printed page 3, proves

```math
a\ge a_0,\quad n\ge2a,\quad e(G)>(a-1)(n-a+1)
\quad\Longrightarrow\quad s(G)\ge B_a
```

for some sufficiently large absolute `a_0`, together with an equality statement. The notation paragraph on that page explains that hierarchy constants are generally not specified numerically. Section 6.3, printed page 26, selects `1/a_0 << epsilon << 1` so that three earlier lemmas apply. Lemmas 3.1 and 3.2 impose connectivity, degree and `n > a^1.02` conditions on their minimal counterexample; the last inequality is a lower bound.

This scope check does not independently certify the full paper. It establishes that the cited result does not claim (1) for every `a`.

## Why an explicit threshold would not finish the target

Even after extracting a numerical `a_0`, the omitted statements would be

```math
\text{for each }2\le a<a_0,
\quad\text{for every } n\ge2a,
\quad\text{for every qualifying }G,\quad s(G)\ge B_a.
```

There are finitely many `a`, but infinitely many graph orders for each one. Exhaustive enumeration through any fixed order leaves the same universal gap. The paper's bound `n > a^1.02` cannot be used as an upper cutoff.

## An elementary pruning observation

Fix `a`. Suppose a strict counterexample to (1) exists, and choose one of minimum order `n`. If `n > 2a`, then

```math
\delta(G)\ge a+1. \tag{2}
```

Indeed, if `deg(v) <= a`, the graph `G-v` has at least

```math
a(n-a)-a=a((n-1)-a)
```

edges and has `n-1 >= 2a` vertices. Its cycle-length sum is at most `s(G) < B_a`, contradicting minimality. This is an elementary consequence of the exact edge threshold, not a new resolution. It neither bounds `n` nor forces all even cycle lengths from four through `2a`.

## A direct obstruction to the standard blowup route

Replace every vertex of `G` by `t` independent twins, and every edge by a complete bipartite graph. Write the resulting graph as `G[t]`. It has `tn` vertices and `t^2 e(G)` edges. Thus the edge requirement scales correctly from `a` to `ta`.

The cycle-length sum does not scale correctly. If `G` has a triangle, then `G[t]` contains `K_{t,t,t}`, which contains a cycle of every length from three through `3t`. An explicit cyclic color word proves the last assertion. For length `3q`, use `(ABC)^q`. For length `3q+1`, use `(ABC)^(q-1) ABAC`. For length `3q+2`, use `(ABC)^(q-1) ABABC`. All adjacent colors, including the final and initial colors, differ; each color occurs at most `t` times. Give each occurrence a distinct vertex in its color class.

Consequently

```math
s(G[t])\ge H_{3t}-\frac32,
\qquad B_{ta}=\frac12(H_{ta}-1).
```

The first bound grows as `log t`, while the comparator grows as `(log t)/2`. More explicitly, `H_m >= log(m+1)` and `H_m <= 1+log m` give

```math
s(G[t])-B_{ta}
\ge \log(3t+1)-\frac32-\frac12\log(ta)>0
```

whenever `t >= 3a`: indeed `(3t+1)^2 > 9t^2 >= 27at > e^3 at`, since `e<3`. Thus a hypothetical triangle-containing small-`a` counterexample would be repaired by these large blowups. The existence of the large-`a` theorem cannot be transferred back by this operation.

This argument does not exclude every possible amplification construction, nor does it prove a theorem about all triangle-free counterexamples. It explains a concrete failure of the most immediate transformation.

## Missing input

A complete route would need a proof uniform in `n` for every omitted `a`, a proved computable bound on the order of a minimal counterexample, or a different construction that demonstrably preserves a strict deficit while increasing `a`. None was established in this pass. The prior finite order-ten audit was not extended. No full-target count is assigned to this note.
