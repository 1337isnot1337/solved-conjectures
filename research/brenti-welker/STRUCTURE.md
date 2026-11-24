# Brenti–Welker's barycentric real-rootedness question: facet gluing and layer polytopes

**Status: structural partial, not a resolution.** Brenti and Welker, [*f-vectors of barycentric subdivisions*](https://arxiv.org/abs/math/0606356), Math. Z. **259** (2008), Question 1, ask whether the barycentric boundary $h$-polynomial of every convex polytope has only real zeros. The simplicial case is theirs, the simple case follows by polarity, and the cubical case is due to [Athanasiadis](https://arxiv.org/abs/2009.02272). [Athanasiadis–Kalampogia-Evangelinou](https://arxiv.org/abs/2205.03796) already handle the pyramid and prism operations in a more general poset setting; the product mechanism used below is the classical diamond-product identity, as also used for chain polynomials in [Brändén–Leite, §6](https://arxiv.org/html/2508.13810v1#S6). The additions recorded here are the common-facet gluing criterion, the resulting explicit stacked-frustum families, and the facet-by-facet interlacing transfer for Cartesian products and free joins. Search found no identical connected-sum criterion; standalone priority is not asserted for these short consequences of standard tools.

Write $H_P(t)=h(\mathrm{sd}(\partial P);t)$, and let $f_P(x)$ enumerate strict chains of proper nonempty faces of $P$ by cardinality, including the empty chain. If $P$ has dimension $d$, then
$$
 f_P(x)=(1+x)^d H_P(x/(1+x)).
$$
The $h$-polynomial has degree $d$, leading coefficient and constant term $1$, and nonnegative coefficients (the barycentric boundary is a simplicial sphere). Consequently $H_P$ has only real roots exactly when all roots of $f_P$ lie in $(-1,0)$. The same increasing fractional-linear map preserves weak interlacing of such polynomials. Write $g\preceq h$ when $g$ weakly interlaces $h$ and has degree exactly one less.

## 1. Gluing along a common facet

Suppose $d$-polytopes $P_1,\ldots,P_k$ are glued in a tree along copies of a single combinatorial type of facet $F$, producing a convex polytope $P$ whose boundary is the indicated combinatorial connected sum. This assumes the stated gluing is attained, not that combinatorially equivalent arbitrary facets are projectively equivalent. Then
$$
 H_P=\sum_{j=1}^k H_{P_j}-(k-1)(1+t)H_F.
$$
If $H_F\preceq H_{P_j}$ for every $j$, then $H_F\preceq H_P$. In particular $H_P$ is real-rooted.

For two pieces, deleting a glued facet from a face poset removes precisely the chains containing that facet element, counted by $xf_F$; the common remaining subcomplex is the order complex of the proper nonempty faces of $F$, counted by $f_F$. Thus $f_P=f_{P_1}+f_{P_2}-(1+2x)f_F$. Transforming gives the formula; iteration gives the tree version.

If $H_F$ has simple roots and all interlacings are strict, at each root of $H_F$ all the monic $H_{P_j}$ have the same nonzero sign. Their sum therefore has the requisite alternating signs, including the extreme intervals by monicity of $H_P$. For weak interlacing, simultaneously perturb the ordered root lists to strict interlacings with a single perturbed monic $H_F$, using a small monotone displacement and placing each neighboring root in its corresponding interval. The glued polynomials stay monic of degree $d$, and the weak interlacing follows by root continuity.

## 2. Product, join, and a stronger closure property

Let $W_P(m)$ count weakly increasing lists of $m$ nonempty faces of $P$, with top allowed, and $Z_P(m)$ count lists with both top and bottom allowed. With the linear convention $\mathcal E\binom{m}{k}=x^k$,
$$
 \mathcal E(W_P)=f_P,\qquad \mathcal E(Z_P)=(1+x)f_P.
$$
Indeed, prescribe a strict chain of $k$ proper nonempty values. Record the last position occupied by each of the $k$ distinct values in the weak list; these are an arbitrary $k$-subset of $[m]$. The bottom, if present, gives another possible strict chain value and thus multiplies the chain enumerator by $1+x$.

The nonempty-face poset of $P\times Q$ is the product of the nonempty-face posets, and the full face lattice of the free join $P*Q$ is the product of the full face lattices. Thus weak lists factor, and
$$
 f_{P\times Q}=f_P\diamond f_Q,\qquad
 (1+x)f_{P*Q}=\big((1+x)f_P\big)\diamond\big((1+x)f_Q\big),
$$
where $a\diamond b=\mathcal E((\mathcal E^{-1}a)(\mathcal E^{-1}b))$ is Wagner's diamond product. [Brändén, Theorems 2–3](https://arxiv.org/abs/math/0303147), gives preservation of $[-1,0]$-rootedness, and of weak interlacing by $g\mapsto g\diamond b$ for a fixed $[-1,0]$-rooted $b$. Hence both operations preserve real-rootedness of $H$; no extra endpoint roots can appear in $f_P$ of an actual polytope since $f_P(0)=1$ and $f_P(-1)=(-1)^{\dim P}$.

They also preserve the stronger property **$H_P$ is real-rooted and $H_F\preceq H_P$ for every facet $F$**. In the Cartesian case a facet is $F\times Q$ or $P\times G$, so fix the other diamond factor. In the join case a facet is $F*Q$ or $P*G$; use the same argument after adding the common root $-1$ to both degrees, then cancel the shared factor $1+x$ in the output. A vertex factor in a join with the empty face as its facet causes no exception: its full-face $Z$-transform is $1+x$, and the empty-face-only transform is $1$, giving the same degree-one interlacing. This also shows directly why adjoining a point or taking a product with a segment gives facet interlacing for the base. Polarity preserves ordinary real-rootedness by reversing flags, but no facet-interlacing assertion for polarity is needed.

## 3. Unbounded explicit families from stacks of frusta

Let $F$ be any $e$-polytope with real-rooted $H_F$. A convex slab with positive homothetic sections of type $F$ at both ends and linear scale factors between them is combinatorially a prism over $F$. If one end has scale zero it is a pyramid. Consider any tree gluing of such pieces along the bases that is attained as a convex polytope, with $b$ prism pieces and $p$ pyramid pieces. With $M=2b+p$, its barycentric boundary polynomial is
$$
 H_P(t)=\big(1+(1+Me)t\big)H_F(t)+Mt(1-t)H_F'(t).
$$
In particular it is interlaced by $H_F$. To derive the formula, the diamond identities above with $f_{\rm segment}=1+2x$ and $(1+x)f_{\rm point}=1+x$ give the two formulas $H_{\rm piece}=(1+(1+me)t)H_F+mt(1-t)H_F'$, respectively for $m=2$ and $m=1$. At a negative simple root of $H_F$ the derivative term has sign opposite to $H_F'$, which is the required sign for strict interlacing; repeated roots follow by continuity. Apply Section 1 and collect terms.

For a concrete unlimited sequence with no gluing-existence hypothesis, assume $e≥1$, put $0$ in the interior of $F$, and choose a nonnegative concave piecewise-linear scale $r(z)$ on a closed interval, positive in the interior and with strictly decreasing successive slopes. Set
$$
 P=\{(x,z): z\text{ in the interval},\ x\in r(z)F\}.
$$
Every inequality $a\cdot x\leq r(z)$ for a normalized facet equation $a\cdot x\leq1$ of $F$ defines a convex set; their intersection gives $P$. Every genuine slope break keeps the incident strips on distinct supporting hyperplanes, so the boundary is the indicated chain gluing of the slabs. More explicitly, each linear piece of $r$ extends to a global supporting line from above by concavity, yielding the side facet for every base facet on that slab; the only other facets are the positive-radius endpoints. This realizes arbitrary numbers of prism slabs, with optional pyramid caps at the two endpoints. For instance, start with a simplex $F$ of dimension at least three, take at least two slabs and positive-radius endpoints. The end facet is a simplex, the side facets are prisms over simplices, and the intermediate vertices have too many edges to be simple: in dimension $e+1$ such a vertex has the $e$ edges in its section and the two slab edges above and below. Thus these are not covered just by the simplicial, simple, or cubical cases.

