# Erdős 617: the disconnected residue and the remaining component gap

21 November 2026. This note examines the disconnected branch of the sparse critical reduction. It does not obtain a contradiction. It identifies the exact inequality still missing and records two attempted strengthenings that do not supply it.

## Setup

Let `r>=6`. The critical graph `H` has `r^2+1` vertices, independence number `r`, and at most `(r^3+r)/2` edges. If `H` is disconnected, every full `K_r` is an entire connected component. There are `q>=3` such components.

Remove all of them, and write

```math
s=r-q,\qquad R=H-\bigcup_{i=1}^q Q_i.
```

Then

```math
|R|=rs+1,\qquad \alpha(R)=s,\qquad \omega(R)\le r-1,
```

and

```math
e(R)\le\frac{r^2s}{2}+\frac{(q+1)r}{2}.
\tag{1}
```

The components of `R` are themselves independence-critical, since independence numbers add across components. All induced palette upper bounds remain valid. The previously proved local independence statements `P_1,P_2,P_3` exclude `s<=3`; the unresolved branch has `s>=4`.

## The exact componentwise localized bound

Let the components be `C_1,...,C_k`, and set

```math
n_i=|C_i|,\quad a_i=\alpha(C_i),\quad
\delta_i=n_i-ra_i.
```

Then

```math
\sum_i a_i=s,\qquad \sum_i\delta_i=1.
```

For a vertex `v`, let `c_R(v)` be the order of its largest containing clique. Define the total local clique deficit

```math
D=\sum_{v\in R}(r-1-c_R(v))\ge0.
```

Apply Theorem 2.2 of Abiad–Kumar–Pragada to the uniform vector on each component. Its form is

```math
2e(C_i)\ge\frac{2n_i^2}{a_i}-n_i-\sum_{v\in C_i}c_R(v).
```

After writing `n_i=ra_i+delta_i` and summing, this gives

```math
e(R)\ge
\frac{r^2s}{2}+\frac{3r}{2}
+\sum_i\frac{\delta_i^2}{a_i}+\frac D2.
\tag{2}
```

Combining (1) and (2) yields the exact necessary inequality

```math
\boxed{\quad
\sum_i\frac{\delta_i^2}{a_i}+\frac D2
\le\frac{(q-2)r}{2}.
\quad}
\tag{3}
```

The component contribution is at least `1/s` by Cauchy–Schwarz. It can also be written as

```math
\sum_i\frac{\delta_i^2}{a_i}
=\frac1s+
\sum_i a_i\left(\frac{n_i}{a_i}-r-\frac1s\right)^2.
\tag{4}
```

Thus the additional information beyond the earlier bound is the variance of the component ratios and the local clique deficit. A full contradiction from this route would require proving that their sum exceeds `(q-2)r/2`. No such lower bound has been established.

At least one component has `delta_i>0`, since the defects sum to one. Such a component must have independence number at least four. Otherwise choose `ra_i+1` of its vertices and apply the previously proved `P_1`, `P_2`, or `P_3` statement.

## Why lack of K_r does not force strict localized slack

A component `K_(r-1)` is independence-critical, is `K_r`-free, and attains the localized bound exactly. Its parameters are

```math
a_i=1,\quad n_i=r-1,\quad\delta_i=-1,\quad D_i=0,
\quad e(C_i)=\frac{(r-1)(r-2)}2.
```

Consequently the absence of `K_r` alone cannot give a positive strictness term for every component. Negative-defect components can coexist, at the level of the proved inequalities, with a component of positive defect. The missing step is to control that positive-defect component using the inherited constraints, not to assert strictness on each component.

The equality discussion in the AKP paper also does not supply a general clique-and-pentagon decomposition. Theorem 3.1 characterizes equality through regular components attaining the Fajtlowicz bound. Remark 3.2 lists further families, and the concluding discussion identifies the general equality characterization as unresolved. No near-equality structural classification is assumed here.

This is an obstruction to those proposed deductions, not a constructed graph satisfying every necessary condition of Erdős 617.

## Adding intact full-clique components weakens the subset edge cap

For an integer `m`, put

```math
T_r(m)=r\binom{k}{2}+kt,
\qquad m=kr+t,\quad0\le t\lt r,
```

and write the inherited palette cap as

```math
P_r(m)=\binom m2-(r-1)T_r(m).
```

Take any `m`-vertex set `S` in `R` and add `h` whole full-clique components, where `1<=h<=q`. There are no edges between these components or from them to `S`, so the resulting inequality is

```math
e(R[S])\le P_r(m+hr)-h\binom r2.
```

But the identity

```math
T_r(m+hr)=T_r(m)+hm+r\binom h2
```

gives

```math
P_r(m+hr)-h\binom r2
=P_r(m)+hm+r\binom h2.
\tag{5}
```

For nonempty `S`, this is strictly weaker than applying the palette cap directly to `S`. Thus simply padding a residue subset with intact full-clique components cannot improve its induced edge upper bound. The full cliques can still matter through the simultaneous colors on their cross edges, which (5) does not use.

## The positive-defect core remains a large-independence problem

Inside a positive-defect component, choose an inclusion-minimal induced subgraph `J` such that `|J|>r alpha(J)`. Put `a=alpha(J)`. Minimality gives

```math
|J|=ra+1,
\qquad |W|\le r\alpha(J[W])\quad(W\subsetneq V(J)).
```

Every vertex of `J` has degree at least `r`: its nonneighbors have independence number at most `a-1`, and applying the proper-subset inequality to them gives this degree bound. Also `J` is connected, since otherwise its proper components would sum to `|J|<=r alpha(J)`.

One may delete edges while preserving independence number `a`. Every proper-subset inequality is preserved because deletion can only increase its independence number. Therefore the core can simultaneously be taken independence-critical, with the same order and minimum-degree conclusion. It remains `K_r`-free and satisfies the inherited palette caps.

Here `a>=4` by the existing local results. The localized lower bound and the whole-core palette upper bound are

```math
\frac{ar^2}{2}+\frac{3r}{2}+\frac1a
\le e(J)
\le\frac{ar(a+r-2)}2+a.
```

Their difference is

```math
\frac r2(a-3)(a+1)+a-\frac1a,
```

which is positive for every `a>=4`. Criticality, connectedness, and minimum degree at least `r` do not, by themselves, close this interval. A further restriction on this core is required.

## Status and coordination

No connectedness argument has been transferred to this disconnected branch. In particular, the inequality `q(q-1)<r` from `erdos617-connected-small-packing.md` is not asserted here.

The exact component gap and the independent review of the preceding reductions were posted and fetched back at <https://github.com/1337isnot1337/solved-conjectures/issues/45#issuecomment-7067557980>.

The full conjecture and the bounty remain unresolved. This note records a failed closure attempt, not a solution or a fixed-parameter completion.

## Sources

- Abiad, Kumar, and Pragada, *Localization of the Caro–Wei bound and its applications to bipartiteness*, arXiv:2609.00210v1, Theorems 2.2 and 3.1, Remark 3.2, and concluding equality discussion. Primary PDF: <https://borowiecki.dev/pdf/2609.00210>.
- Earlier `P_2`, `P_3`, induced palette caps, and critical-component discussion: <https://erdosproblems.ai/wiki/research/erdos_617/independent/growing_local_independence_range> and <https://erdosproblems.ai/wiki/research/erdos_617/independent/clique_residue_and_affine_repair>.
- Companion critical reduction and full-clique disjointness proofs in the repository research log.
