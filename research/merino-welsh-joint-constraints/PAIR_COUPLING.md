# A graph-specific coupling to investigate

Research continuation for [Merino–Welsh issue 44](https://github.com/1337isnot1337/solved-conjectures/issues/44), 21 November 2026. **The coupling below is unproved. No resolution of Merino–Welsh, no counterexample graph, and no additional conjecture count are claimed.** The purpose is to isolate information about actual graphs that the earlier abstract boundary relaxation omits.

## 1. The candidate and its meaning

Let `X` be a finite connected loopless bridgeless multigraph with distinct terminals `u,v`. Write

```math
A=A(X),\qquad C=C(X),\qquad t=t(X),\qquad
Q(X)=\frac{AC}{t^2}.
```

Let `B` be the number of acyclic orientations in which neither terminal reaches the other, and put `D=A-B`. Equivalently, `B=A(X/(u=v))`, with every loop created by the identification **retained** when evaluating the acyclic-orientation count. In particular, `B=0` if the terminals are adjacent. Let `R=R_X(u,v)` be their effective resistance when every edge has unit resistance. The candidate is

```math
\frac{DC}{t^2}
=Q(X)\,\mathbb P_{\rm ac}(u,v\text{ are comparable})
\ \ge\ 2^{\,1-2R}.
\tag{C}
```

Here the probability is for a uniformly chosen acyclic orientation. The actual graph diagnostic below tests nonadjacent terminal pairs. Allowing adjacent pairs is useful for stating the deletion–contraction closure, but no general claim for either domain is proved here.

For the abstract three-terminal data in `THREE_TERMINAL_REPLACEMENTS.md`, the left side would be

```math
c_0(1-a_{ij})=\frac{101}{10000},
```

while `R=11/8` gives the right side `2^{-7/4}>1/4`. Thus (C), if proved for the applicable graph class, excludes that particular abstract witness. This does not by itself show that adding (C) resolves the whole three-terminal relaxation.

The scale in (C) is sharp on doubled trees. If `X` is obtained from a tree by replacing each edge with two parallel edges, then `A=C=t=2^{n-1}`, so `Q(X)=1`. If the unique underlying path between the terminals has `l` edges, its resistance is `l/2`. A uniformly chosen acyclic orientation independently chooses the direction of each doubled edge. The path is directed in either direction with probability `2^{1-l}`. Hence (C) is an equality for every terminal pair in every doubled tree.

## 2. A limitation: the unrestricted candidate is already strong

Attach a two-edge doubled path to an arbitrary connected loopless bridgeless graph `H`, identifying one end of the path with one vertex of `H`. Choose the ends of the path as terminals of the resulting graph `X`. The terminal resistance is one, comparability has probability one half, and `Q(X)=Q(H)`. Consequently (C) for this `X` asserts

```math
\frac{Q(H)}2\ge\frac12,
```

which is the full multiplicative Merino–Welsh inequality for `H`.

Thus (C) on all connected graphs is at least as strong as the original problem. It must not be described as a routine extra inequality that bypasses the main difficulty. A restriction to the outside graphs arising in a minimum-counterexample argument, or a direct proof on relevant two-connected blocks, would need a real argument.

## 3. Exact block factorization

Suppose the unique block path from `u` to `v` consists of `r` blocks `H_1,...,H_r`. Give each such block its entry and exit vertices as terminals. Let `P_i` be its acyclic-orientation comparability probability, and let `R_i` be its effective resistance. Then

```math
P_{uv}=2^{1-r}\prod_{i=1}^r P_i,
\qquad R_X(u,v)=\sum_{i=1}^r R_i,
\qquad Q(X)=\prod_{H\text{ a block of }X}Q(H).
\tag{1}
```

The orientation counts and spanning-tree counts multiply over blocks. Acyclic orientations in distinct blocks are independent under the uniform law. Each block's comparability event has two equally numerous directions, and all directions along the block path must agree. Effective resistances add along the path; branches meeting it at only one vertex carry no terminal current. These facts prove (1).

Define the normalized left-to-right ratio in (C) by

```math
\mathcal M(X;u,v)
=\frac{Q(X)P_{uv}}{2^{1-2R_X(u,v)}}.
```

Then (1) gives the exact identity

```math
\mathcal M(X;u,v)
=\left(\prod_{i=1}^r\mathcal M(H_i;u_i,v_i)\right)
 \left(\prod_{H\text{ off the block path}}Q(H)\right).
\tag{2}
```

The off-path factors cannot be dropped. Deducing (C) for `X` from its path blocks still requires `Q(H)>=1` for every off-path block. That is a Merino–Welsh assertion. In a suitable minimum-counterexample induction it can be supplied for strictly smaller blocks; it is not available for arbitrary graphs without proof. The underlying series identities are the counting identities of [Noble and Royle, Lemmas 3.3–3.4](https://arxiv.org/abs/1303.6416), rather than a new resolution of their subject.

## 4. Dropping the factor Q is false

One possible shortcut would replace (C) by the bound

```math
P_{uv}\ge2^{1-2R_X(u,v)},
\qquad R_X(u,v)\ge\frac34,
\tag{C0}
```

and then multiply by the inductively available inequality `Q(X)>=1`. This fails even for simple bridgeless graphs, and also fails when every edge belongs to a parallel pair of size two.

For the simple family, take `K_n-ab` with `n>=14` and attach two triangles in a block chain beginning at `b`. Let `v` be a new vertex in the last triangle, different from its cut vertex. The missing-edge block has

```math
A=n!-(n-1)!,\qquad B=(n-1)!,\qquad
P_{ab}=\frac{n-2}{n-1},\qquad R_{ab}=\frac{2}{n-2}.
```

The orientation formula follows from chromatic deletion–contraction, and the resistance follows by placing all other clique vertices at the same midpoint potential. Each triangle contributes an always-comparable terminal pair and resistance `2/3`. By (1),

```math
P_{av}=\frac{n-2}{4(n-1)}\lt\frac14,
\qquad R_{av}=\frac{2}{n-2}+\frac43
\in\left(\frac43,\frac32\right].
```

Thus the right side of (C0) is at least `1/4`, and (C0) fails for every member of this family.

There is a more direct family for the multiplicity-two setting. Start with `K_n-ab`, `n>=4`, double every edge, and attach a path of **two doubled edges** from `b` to a new terminal `v`. Parallel doubling preserves acyclic orientations and halves effective resistance. Each doubled path edge has resistance `1/2` and an always-comparable terminal pair. Therefore

```math
P_{av}=\frac{n-2}{4(n-1)}\lt\frac14,
\qquad R_{av}=1+\frac{1}{n-2}
\in\left(1,\frac32\right].
```

Again (C0) fails. These graphs are loopless, connected and bridgeless, their maximum edge multiplicity is two, and every edge lies in a parallel class of size two. In both families the terminal resistance lies inside `(3/4,2)`, not merely above `3/4`.

These are counterexamples to the auxiliary shortcut only. They do not refute (C), where `Q` is retained, or the Merino–Welsh conjecture. Nor are they asserted to satisfy every necessary condition for being the outside graph of a minimum counterexample. In particular, restrictions beyond simplicity or multiplicity two and the displayed resistance range would need to be used explicitly. The minimum-counterexample parallel-class restriction does imply that deleting one parallel pair leaves multiplicity at most two, but that fact alone cannot justify (C0).

## 5. Safe deletion–contraction closure

There is a useful conditional closure property. Let `e` be an edge different from a terminal edge `uv`. Suppose both `X-e` and `X/e` are connected, loopless and bridgeless, and the terminals remain distinct. Suppose (C) holds for both children, with the same convention about retained loops in the terminal quotient. Then (C) holds for `X`.

To prove this, put `F=tR`, the number of spanning two-forests separating the terminals. For the two children, use subscripts `1,2`. Deletion–contraction gives

```math
D=D_1+D_2,\quad C=C_1+C_2,
\quad t=t_1+t_2,\quad F=F_1+F_2.
\tag{3}
```

For `F`, partition separating two-forests according to whether they contain `e`; contraction is a bijection in the containing case because `e` does not identify the terminals. For `D`, subtract the chromatic deletion–contraction identities before and after terminal identification. If a child's terminals become adjacent, its terminal quotient has a loop and acyclic count zero, which is consistent with the identity. This is why deleting newly created loops in that quotient would be incorrect.

Set `a=log 2`. Cauchy–Schwarz and the two assumed child inequalities yield

```math
DC\ge
\bigl(\sqrt{D_1C_1}+\sqrt{D_2C_2}\bigr)^2
\ge
2\bigl(t_1e^{-aR_1}+t_2e^{-aR_2}\bigr)^2.
```

Apply convexity of `exp(-a x)` with weights `t_i/(t_1+t_2)`. By (3), their weighted mean resistance is `F/t`. Therefore

```math
DC\ge2t^2e^{-2aF/t}=t^2\,2^{1-2R}.
```

This does not settle the series/parallel-pair configurations that obstruct safe deletion–contraction. It is a closure lemma under explicit child hypotheses.

## 6. What the coupling would do for a parallel pair

Use the previously established minimum-counterexample reductions cited in the [repository research log](https://github.com/1337isnot1337/solved-conjectures/blob/main/docs/merino-welsh-research.md). Suppose a minimum-edge counterexample `G` has a parallel class consisting of exactly two edges with ends `u,v`. Deleting both leaves a connected bridgeless graph `H`; the terminals are now nonadjacent. Write

```math
A=A(H),\quad B=A(H/(u=v)),\quad D=A-B,
\quad C=C(H),\quad C'=C(H/(u=v)),
\quad t=t(H),\quad F=t(H/(u=v)),\quad R=F/t.
```

The terminal quotient is a smaller connected loopless bridgeless graph, so induction gives `BC'>=F^2`. The exact parallel-extension identities are

```math
A(G)=D+2B,\qquad C(G)=C+3C',
\qquad t(G)=t+2F.
```

Cauchy–Schwarz now gives

```math
\sqrt{A(G)C(G)}
\ge\sqrt{DC}+\sqrt{6BC'}
\ge\sqrt{DC}+\sqrt6\,F.
```

Strict failure first forces `sqrt(DC)<t-(sqrt6-2)F`, whose right side must therefore be positive. Squaring is legitimate and gives the necessary condition

```math
\frac{DC}{t^2}
\lt \bigl[1-(\sqrt6-2)R\bigr]^2.
\tag{4}
```

The earlier marginal reduction places the probability that a uniform spanning tree meets the parallel pair strictly between `3/5` and `4/5`. That probability is `2R/(1+2R)`, hence

```math
\frac34\lt R\lt2.
```

On this whole interval,

```math
2^{1-2R}\gt\bigl[1-(\sqrt6-2)R\bigr]^2.
\tag{5}
```

Here is an elementary check of (5), without numerical sampling. The convex function `2^{1/2-R}` lies above its tangent at `R=1`, namely

```math
L(R)=\frac{1+(1-R)\log2}{\sqrt2}.
```

The difference `L(R)-[1-(sqrt6-2)R]` is affine. At `R=3/4`, it is strictly greater than `7/9-7/10=7/90`, using `log2>2/3`, `sqrt2<3/2`, and `sqrt6>12/5`. At `R=2`, it is strictly greater than `1/5-1/5=0`, using also `log2<7/10`. Thus it is positive throughout the interval. The line on the right of the comparison is positive there because `sqrt6-2<1/2`; squaring proves (5). The logarithm bounds follow, for example, from the convergent series `log2=2 sum_{k>=0} (1/3)^{2k+1}/(2k+1)`.

Therefore (C) for the outside graph `H` would exclude every such parallel-pair configuration. This is a conditional implication. Neither (C) for these outside graphs nor a corresponding treatment of all series-pair configurations has been proved. Equation (4), rather than (C), is the unconditional necessary condition derived here for a hypothetical minimum counterexample.

## 7. Actual graph diagnostic

`check_pair_coupling.py` uses the public NetworkX graph-atlas data. The included `graph-atlas.dat` is the decompressed data, with its BSD license in `atlas-LICENSE.txt`. The source URL and hashes are retained in `pair-coupling-check.json` and `PAIR_COUPLING_SOURCES.md`.

Run `python3 check_pair_coupling.py` with SymPy installed. The checker reads the included data and requires no network access.

The diagnostic considers every connected atlas core with at most seven vertices and at most twelve edges, provided it has a nonadjacent vertex pair. It tests both the simple core when bridgeless and the graph obtained by doubling all core edges. The completed scope is:

| Graph type | Graphs tested | Nonadjacent terminal pairs tested |
|---|---:|---:|
| Bridgeless simple cores | 352 | 3,234 |
| Uniformly doubled connected cores | 748 | 7,564 |

There are no violations in this scope. The 250 equality pairs are exactly the nonadjacent terminal pairs in the 23 doubled-tree cores. The general doubled-tree argument above accounts for all those equalities.

The program enumerates acyclic orientations of the simple core to obtain `A` and `D`. Parallel doubling does not change these counts. For the cyclic count after replacing every core edge by `q` parallels, it uses the exact Tutte subset expansion

```math
C_q=\sum_{F\subseteq E}(-1)^{k(F)-1}(2^q-1)^{|F|}.
```

A reduced Laplacian determinant and rational inverse give `t` and `R`. Comparisons of a positive rational with `2` to a rational power use integer exponentiation after elementary integer-exponent bounds. Floating-point arithmetic is used only to rank already proved strict positive gaps, not to determine their signs.

These are bounded checks of an auxiliary statement. They do not prove (C), establish its general truth, or count as resolving a parameter case of Merino–Welsh.

## 8. Nearby literature and present disposition

Both web search engines were used for the exact combination of acyclic terminal comparability, effective resistance, and Merino–Welsh. The full primary texts of [Chen–Xie, arXiv:2609.33680](https://arxiv.org/abs/2609.33680) and [Xu–Dong–Xu, arXiv:2610.25817](https://arxiv.org/abs/2610.25817) were downloaded and the relevant statements were read. No statement of (C) was located in this bounded check.

Chen–Xie Lemma 2.7 proves `Q(H+uv)>=2Q(H)/(1+R)^2`, using the exact spanning-tree edge-addition identity and separate orientation extension bounds. It does not compare `D C/t^2` with an exponential in the terminal resistance. Their main assertions concern graph joins.

Xu–Dong–Xu use the same six two-terminal counts as Noble–Royle. Their Theorem 4.3 proves, for `H=T-st` arising from a rooted two-tree, an inequality of the form

```math
(A(H)+B(H))C_2(H)
\ge2F(H)^2\exp\!\left(\frac{4}{5R(H)}\right).
```

Here `C_2` counts almost totally cyclic orientations. This is a restricted graph class, different counts, and the reciprocal resistance in the exponent. It is a relevant precedent for coupling orientation counts to an electrical parameter, but it neither proves nor refutes (C). The cited paper's main result is the chordal-graph Merino–Welsh theorem, not the unrestricted graph conjecture.

The next mathematical obstacle is a proof or a structural counterexample to the actual graph coupling. Further extensions of the earlier finite-gadget list do not answer that question.
