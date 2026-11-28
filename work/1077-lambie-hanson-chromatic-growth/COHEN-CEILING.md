# Lambie-Hanson's chromatic growth problem

Working note for [#1077](https://github.com/1337isnot1337/solved-conjectures/issues/1077).

## Exact question and scope

In Question 6.2 of [Lambie-Hanson, *On the growth rate of chromatic numbers of finite subgraphs* (Adv. Math. 369, 107176, 2020)](https://arxiv.org/pdf/1902.08177#page=10), write $m_G(k)$ for the minimum size of a finite subgraph of chromatic number $k$, or $+∞$ if none exists. The question asks whether for every $f:\omega\to\omega$ and every cardinal κ there is a graph with χ(G) ≥ κ and $m_G(k)≥ f(k)$ for all sufficiently large $k$.

**Proposition.** In every one-Cohen extension $V[c]$, there is a function $f$ such that every graph $G$ with $m_G(k)≥ f(k)$ eventually has χ(G) ≤ $2^{\aleph_0}$. In fact every graph with χ(G) > $2^{\aleph_0}$ has its entire profile bounded pointwise by a single ground-model function. Over CH the upper bound is sharp: the original paper's ZFC Theorem A supplies a witness with χ(G) = ℵ₁ for this same $f$.

Thus the universal statement is not a theorem of ZFC. This does not prove the negation in ZFC or show a model with a positive answer. It also does not settle the separate 2024 question on slow-growth Hajnal–Máté graphs after one Cohen real.

## Proof via ground-model edge slices

Work with the presentation $P=\omega^{<\omega}$, ordered by end extension. This is Cohen forcing, for instance by writing each entry $j$ as $1^j0$ in a binary string. The coordinate function $f=\bigcup c$ is not eventually bounded by any $g\in V\cap\omega^\omega$: for each such $g$ and every $N$ one can extend any condition to force $f(k)>g(k)$ at some $k\ge N$.

Relabel the vertices of $G$ by an ordinal θ, fix a name for its edge set, and for each $p\in P$ form the ground-model graph $`G_p=(\theta,\{e:p\Vdash e\in\dot E\})`$. In the extension, $E(G)=\bigcup_{p\in c}E(G_p)$ by the truth lemma. The slices are ordinary subgraphs of $G$, not necessarily induced. If some slice has infinite chromatic number in the ground, finite compactness gives a ground ω-sequence $g(k)=m_{G_p}(k)$ of finite numbers (at $k=0,1$ use the empty graph and a singleton, respectively). These finite witnesses survive forcing, giving $m_G(k)\le g(k)$ pointwise. This implies the stronger assertion: otherwise all the slices have finite chromatic number, and taking the tuple of their finite proper colors gives a proper coloring of $G$ by at most $2^{\aleph_0}$ colors.

In particular, if $m_G(k)\ge f(k)$ eventually then no slice can have infinite ground chromatic number, since $f(k)>g(k)$ infinitely often. This proves the proposition. Countable forcing preserves CH, because in a CH ground there are at most $(2^{\aleph_0})^V$ nice names for reals and the forcing preserves ℵ₁.

A graph with a finite subgraph of chromatic number larger than $k$ also has one of chromatic number exactly $k$ on no more vertices: delete one vertex at a time, which decreases chromatic number by at most one. This justifies both the stated profile convention and the compactness application.

## A quantitative version for the individual slices

Suppose $p_0\in c$ forces $m_{\dot G}(k)\ge f(k)$ for all $k\ge N$, with $N\ge3$. Such $p_0,N$ exist by the truth lemma. For $p\le p_0$ let $`k=\max\{N,|p|\}`$, using zero-based coordinates. Then $\chi(G_p)$ ≤ $k-1$ already in the ground. Otherwise use finite compactness to obtain a finite $k$-chromatic subgraph $H\subseteq G_p$, then extend $p$ at coordinate $k$ to take a value greater than $|V(H)|$. This new condition forces both the target bound and the finite witness that violates it. The same argument works for the stem presentation of Hechler forcing: a common extension for finitely many conditions of the same stem is formed by taking the pointwise maximum of the bound functions without lengthening the stem. Group all conditions below $p_0$ by their stems, and unite their forced edge sets within each group. Every finite witness in one such union is forced by a same-stem common extension, so the same quantitative bound holds for the union. Thus a single Hechler extension also has ceiling the continuum, even when the poset is uncountable.

More generally the slice argument works in any forcing extension with a function unbounded over the ground, whenever there are at most μ many conditions in the generic filter. If μ is infinite, the chromatic ceiling is $2^{\mu}$. One obtains the conclusion from infinitely many strict exceedances, not from eventual domination of every ground function.

## Priority audit

* [Komjáth–Shelah (2005), Theorem 3 and Lemmas 8–9](https://shelah.logic.at/files/95375/788.pdf#page=9) already give the ingredients for a relative negative answer, even though the paper frames the theorem in terms of Taylor's conjecture. They force a profile $f$ unbounded over their ground and show that every subgraph of a candidate graph belonging to the ground is finitely chromatic. Their argument applies to all graphs satisfying the eventual requirement directly, not just to the specific finite age used in that theorem. With their forcing of size ℵ₁ and their GCH model this gives the ceiling ℵ₂. That proof takes precedence on the relative negative.
* The refinement here is the reduction to **one Cohen real over an arbitrary ground**, the ceiling $2^{\aleph_0}$, its sharpness over CH, and the explicit pointwise ground bound. No earlier explicit statement of that refinement was found in the 2020 and [2024](https://doi.org/10.1112/mtk.12261) articles, [Joó's directed analogue](https://arxiv.org/abs/1908.07264), or search combinations of the 2020 question with Cohen, Hechler, and Komjáth–Shelah.
* [Komjáth–Shelah (1996), Theorems 1 and 3](https://arxiv.org/abs/math/9402213), give a distinct obstruction restricted to graphs whose order and chromatic number both equal λ⁺, with $\lambda^{\aleph_0}=\lambda$. A countable list of forced finite-age templates each contains graphs of arbitrarily large finite chromatic number. Diagonalizing against that list precludes arbitrarily slow profiles in this equal-size setting, but not for arbitrary size and chromatic number. Likewise, [Halevi–Kaplan–Shelah (2024)](https://ems.press/journals/jems/articles/11115712) give fixed shift-graph obstructions for stable graphs, not all graphs.
