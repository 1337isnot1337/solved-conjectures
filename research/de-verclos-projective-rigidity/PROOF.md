# Projective rigidity from support of dimension greater than one

**Theorem.** Let μ,ν be Borel probability measures in the plane giving zero mass to every affine line. If they have equal iid order-type laws at every finite size and `dim_H(supp μ)>1`, there is an invertible real projectivity P with `P_*μ=ν` (equivalently, on the real projective plane). Equality of the order-type laws at size three also ensures that a second realization is line-null: positive mass on a line would give positive probability to a collinear triple. No assumption is made on the Hausdorff dimension of any full-μ set.

This is the normalized measure formulation of [Conjecture 5 in *Limits of Order Types*](https://arxiv.org/html/1811.02236v1#Thmtheorem5), also [Conjecture 1.38 in de Joannis de Verclos's thesis](https://remi-de-verclos.github.io/manuscript.pdf#page=71). Sections 1 and 6 use the ideas of the prior [secants and incidence arguments](https://github.com/1337isnot1337/solved-conjectures/tree/675bcb73bd751dacf531e1accc8abdefa03a7d89/results/de-verclos-projective-rigidity). The thesis's §1.11 used differentiation of both a chirotope map and its inverse under lower-dimensional bounds on both sampling measures; here the new step is §3, which permits one-sided differentiation with nondegenerate derivatives in §§4–5.

## 1. Orientation relation and an auxiliary Frostman measure

Use homogeneous lifts `x*=(x_1,x_2,1)` and embed the target plane by `j(y)=y*/|y*|` into the closed upper hemisphere H of the sphere. Write `[w]` for the projective class of a vector. There is a closed relation R in `E×H`, `E=supp μ`, projecting onto E, and the support of a coupling with marginals μ and `j_*ν`, such that for any three pairs in R,

```math
\det(x_1^*,x_2^*,x_3^*)\det(w_1,w_2,w_3)\ge 0. \qquad (1)
```

Indeed, exchangeability makes the labeled sign pattern conditionally uniform on the finite relabeling orbit given the unlabeled order type. Thus the infinite labeled sign arrays have equal laws. Couple the iid sequences conditionally on a common array. Almost surely the empirical marginals converge weakly, so the pair empirical laws are tight and a subsequential limit has the desired marginals. If its support violated (1), continuity and eventual hits in three open neighborhoods would contradict equality of sampled signs. The projection of R is closed by compactness of H and has full μ-mass, so is E.

**Strict secants.** If `dim_H D>1`, for any distinct finite u,v, their determinants with secants from D have both strictly positive and strictly negative products. Normalize `u=(-1,0), v=(1,0)` and discard points on their axis. The determinant product for points `(x,y),(x',y')` is `(yy')²(a-a')(b-b')`, where `a=(x+1)/y,b=(x-1)/y`. When all products are nonnegative, the map to `a+b` is an isometry for the ℓ¹ metric on the new coordinates; when all are nonpositive, use `a-b`. The coordinate changes are locally bi-Lipschitz off the axis, so either sign restriction forces dimension at most 1.

No w in H is paired to two distinct points u,v. If it were, the endpoints of a strict separating secant of E have neighborhoods whose pairs still separate u,v. They have positive μ-mass. Take independent coupling points with source in the two neighborhoods; their target distributions are absolutely continuous with respect to the target marginal. Almost surely their determinant with w is nonzero: the first target point is not projectively w, and the second avoids its projective line with w by line-nullity. This contradicts (1) with u and v. On any compact `E_0⊂E` the nonempty compact fibers admit a Borel selector, for instance by recursively intersecting each fiber with the first meeting member of fixed finite closed covers of H of mesh tending to zero. The nonemptiness tests are projections of compact sets, and the selected nested sets converge to a point. The selector is injective on the sphere.

The selector preimage of any fixed projective line has dimension at most 1. Divide the lifts of the line in H into finitely many arcs of length less than π to avoid antipodal pairs. In a preimage of dimension >1, select a secant separating two distinct source points of R whose target lifts are on the same strict side of this line. Such two pairs exist by the line-null marginal and source atomlessness. The selected lifts of the secant are distinct in one arc and span the line, so their two target determinants have the same strict sign, violating (1). In particular the equator preimage has dimension at most 1.

Take a compact `E_0⊂E` of dimension >1 (intersect the closed E with increasing closed balls). Choose an exponent `1<s<2` strictly below `dim_H E_0`, and a Frostman probability with exponent strictly greater than s, carried by E₀. Remove the selector's equator preimage and apply Lusin, retaining a compact set K of positive mass with continuous selector in the finite target chart. Restrict and normalize the auxiliary measure, denoted σ; it is Frostman with exponent >s and has finite s-energy. Write `f:K→R²` for the continuous finite selector. It is injective, has weak sign preservation (1) on K, and each target line preimage is σ-null.

There is a Borel σ-full set `G⊂K` of **incidence anchors**: any line through q in G has points of K arbitrarily close to q on both strict sides. For if a line through q bounds an empty open half-disc of K, a rational ball U containing q and lying in the full disc (on both sides of the line) makes q a boundary point of the closed convex hull of `K∩U`. The union of these bounded convex boundaries has dimension at most 1. For `q∈G` and distinct collinear source points q,x,y, (1) and continuity at q along K imply `det(j(f(q)),w_x,w_y)=0` for any coupled representatives of x,y. In particular any line containing two anchors has all its K-images on their common target line (use either anchor in this limiting argument).

## 2. Typical slices and transverse richness

Let θ run over unoriented normal directions, with angular length measure. Write `π_θ(x)=x·n_θ` for an orthogonal coordinate in some measurable choice of unit normal, and `L_{θ,t}={π_θ=t}`. The following holds for `σ(da)dθ`-almost every `(a,θ)`:

1. On `L=L_{θ,π_θ(a)}` there is a nonatomic conditional probability `σ_{θ,t}`, carried by K. There is a subset `A_{θ,t}⊂K∩L` of full conditional measure containing a, and a belongs to the support of this conditional probability. In particular a is an accumulation point of `A_{θ,t}\{a}`.
2. The set `A_{θ,t}` consists of anchors from G with the following additional property: in every open neighborhood U of `b∈A_{θ,t}`, the projection of σ from U has a positive density on a length-density-one subset of the normal coordinate line at t. More precisely, for every rational open ball U containing b, t is a length-density-one point of `{d((π_θ)_*(σ|U))/dt>0}`. Any σ-null subset of K may be discarded when applying the property.

Here is a measure-theoretic verification, including the almost-everywhere parameters. For almost every θ, `π_{θ*}σ≪dt`, by Marstrand's measure projection theorem; one can also see it by smoothing with the 1D strip kernel of width δ and bounding the averaged squared L² norm by `C I_1(σ)`: for a pair x,y the allowable θ have length at most `C min(1,δ/|x-y|)` and the overlap in t has length at most `2δ`. The smoothed densities converge as measures; bounded L² norm along a subsequence for a.e. θ follows from Fatou and yields the AC claim. Projection of any restriction is also AC for those θ.

Disintegrate with respect to the measurable map `(θ,x)→(θ,π_θ(x))` on `dθ σ(dx)`, with projected density `ρ(θ,t) dθdt`, to obtain jointly measurable probabilities `σ_{θ,t}`. At a.e. θ,t the strip measures `(2δ)⁻¹ 1_{|π_θ(x)-t|<δ}σ(dx)` converge weakly to `ρ(θ,t)σ_{θ,t}` by differentiation for a countable dense family of continuous test functions on K including 1. The same overlap estimate, now multiplying the pair contribution by `|x-y|^{-(s-1)}`, bounds the averaged `(s−1)`-energy of strip measures by `C I_s(σ)`. Lower semicontinuity of energy and Fatou give finite energy, hence no atom, for a.e. θ,t with `ρ(θ,t)>0`. The disintegration is supported on K and the indicated fiber almost everywhere.

For each fixed good θ and rational ball U, the projected restriction has a density ρ_U; `π_θ(b)` is a Lebesgue density point of `{ρ_U>0}` for σ-a.e. `b∈U`, by Lebesgue differentiation and absolute continuity. Intersect the countable conditions and membership in G, then disintegrate. To get A, also intersect with the support of the slice probability, which has full slice measure; nonatomicity gives the asserted accumulation. All conditions may be taken measurable: use jointly measurable Radon–Nikodym derivatives of the projected joint measures, density limits on rational radii, and the usual countable-ball support tests on the conditional probability. More explicitly, on each good parameter take A to be the intersection of its fiber with G, the transverse density-point tests, and the support of the slice probability. This is a Borel family: its support test is positivity of the slice probability of each ball of radius `1/j` centered at the candidate point. Keep exactly the parameters with positive projected density, fiber concentration, finite slice energy, and full conditional mass of A. These are measurable kernel tests, conull for the projected measure. Thus `(a,θ)` is good if its projected parameter is retained and a belongs to that parameter's A. Every selected anchor has other A-points in each neighborhood by full slice mass, the support test, and nonatomicity.

The transverse property implies the following simultaneous sampling fact, used only inside a single good slice. In coordinates where L is `y=0`, let `a_i=(p_i,0)` be any finite selection from A. Given a countable list of fixed real heights, one may take a common sequence `r_n↓0` such that for each i and each listed h there are points `z_{i,n}(h)∈K` with

```math
z_{i,n}(h)\longrightarrow a_i,\qquad \frac{y(z_{i,n}(h))}{r_n}\longrightarrow h. \qquad (2)
```

One may avoid a specified σ-null set for nonzero heights and take `z_{i,n}(0)=a_i`. To see this, at stage n use a rational ball of radius less than 1/n about each anchor and the first n heights. For small r the offset intervals `r(h−1/n,h+1/n)` each meet that ball's positive-projection-density set in positive length: the complement has `o(r)` length in any fixed bounded dilation of `(-r,r)`. Such an interval has positive projected mass. Take r sufficiently small for all those finitely many requests simultaneously. Values not yet requested at stage n can be set arbitrarily.

## 3. Transverse scaling forces an exact projectivity of a slice

**Lemma.** On each slice with the properties above, `f|A` is the restriction of one projectivity from L to a target projective line.

All images are on a line L′ by incidence. Choose positively oriented Euclidean coordinates in source and target making these two lines `y=0`. For any finitely selected anchors `p_1<…<p_m`, their target abscissae are ordered monotonically: apply (1) to each pair with a single b in K outside L with image outside L′, using the σ-nullity of both exclusions. After a half-turn in the target if necessary, the abscissae satisfy `q_1<…<q_m`. The same sign test against any two of the anchors shows that for points near the anchors with prescribed nonzero height, the source and target heights have the same signs, provided the target point is off L′. Use that preimage as the σ-null exclusion in (2).

It suffices to treat a finite selection `m≥4`; every triple of distinct matched points determines a unique line projectivity, so the finite result for every four gives the assertion. Fix an interior index j and put

```math
\alpha=\frac{p_m-p_j}{p_m-p_1},\quad \beta=1-\alpha,\qquad \alpha'=\frac{q_m-q_j}{q_m-q_1},\quad \beta'=1-\alpha'.
```

Choose positive rationals `d,L_0` with `1<L_0<min(1/α,1/β)` and `d<min(α/β,β/α)`. Use (2) for the rational heights in `[-d,L_0]`. Set `c_n=y(f(z_{j,n}(1)))>0` for large n and `H_{i,n}(h)=y(f(z_{i,n}(h)))/c_n`. The normalized heights for every fixed rational h in `J=(-d,L_0)` are bounded as n tends to infinity, as follows.

The sign calculation used in the comparisons is this: if `x_i<x_k<x_l`, then the determinant of their three homogeneous points (in this order) equals `(x_l−x_i)(a y_i+b y_l−y_k)` with `a=(x_l−x_k)/(x_l−x_i)` and `b=1−a`. Thus (1) compares the middle elevation with its interpolation in the same sense in both charts, allowing equality on the target side. All horizontal coordinates in these comparisons tend to their corresponding anchor abscissae.

For the left endpoint at height `L_0`, the triple of endpoint elevations `(L_0,0)` and j elevation 1 has the middle strictly above the interpolation. Thus (1) bounds its target normalized height from above by the inverse of an interpolation coefficient tending to `α'>0`. The identical argument using endpoint elevations `(0,L_0)` bounds the right endpoint. For left endpoint height `−d`, the right endpoint at elevation 1 and middle at 0 give positive source interpolation `−αd+β>0`, so the target interpolation is nonnegative, giving a lower bound for the left height from the already bounded right height at 1. The other lower bound uses `α−βd>0` and left endpoint at 1. The endpoint heights at 1 are bounded by the same upper-bound comparison as the heights at `L_0`. To bound intermediate heights at any endpoint abscissa, use (1) on two points from that same cluster and one fixed anchor on a different abscissa. For increasing prescribed heights, the source orientation sign is eventually determined by their height difference and the fixed difference of abscissae. In the target it compares target heights divided by the abscissa offsets from the fixed anchor; those offsets have the same nonzero limit within the cluster. Comparison to heights `−d,L_0` gives both bounds. Finally at any internal abscissa and any fixed h strictly between `−d,L_0`, use endpoint elevations both `−d` and both `L_0` to place the normalized middle height between bounded interpolations. The horizontal coordinates of all images tend to the q's by continuity; thus all interpolation coefficients used here converge to the corresponding strictly positive coefficients.

Pass to a diagonal subsequence to obtain finite limits `H_i(h)` for rational h in J. The same comparison against a fixed anchor that was used to bound endpoint heights shows that **all** the H_i are nondecreasing. We have `H_i(0)=0` and `H_j(1)=1`. For any ordered triple of indices `i<k<l`, write `a,b` for its source interpolation coefficients and `a',b'` for its target ones (all are strictly positive and both pairs sum to 1). The orientation of the source triple in (2), after division by r_n, compares the middle elevation with its linear interpolation. Thus for rational `u,h,w` in J,

```math
\begin{aligned}h\lt au+bw&\implies H_k(h)\le a'H_i(u)+b'H_l(w),\\h>au+bw&\implies H_k(h)\ge a'H_i(u)+b'H_l(w).\end{aligned} \qquad (3)
```

For clarity, these inequalities imply a genuine continuous Pexider equation, not just an equation on a thin set. For `v=au+bw` and real `u,w∈J`, approximate u,w by rationals from below. Their interpolated values tend to v strictly from below. For each such value, use (3) with rational middle heights immediately above and below it, all strictly below v and tending to v. This gives `H_k(v^-)=a'H_i(u^-)+b'H_l(w^-)`. Approximating from above gives the same formula for right limits. Any jump of H_i at u would therefore force a jump of H_k at every `au+bw` as w runs over J, which is impossible for a monotone function. The same argument applies to H_l. The formulas then give continuity of H_k. Values originally defined at rationals lie between their left and right limits. It follows that the extensions satisfy, on the full product of intervals,

```math
H_k(au+bw)=a'H_i(u)+b'H_l(w). \qquad (4)
```

Apply (4) first to the endpoints and the normalizing index j. Keeping the argument of H_j unchanged under `(u,w)→(u+h,w−αh/β)` shows that for each sufficiently small h, increments `H_1(u+h)−H_1(u)` are independent of u whenever both arguments are in J; choose any eligible w. The same argument gives constant increments for H_m. Continuous local additivity gives affine H_1,H_m on J (first obtain a linear increment for small h, then subdivide differences). Zero at 0 removes the intercepts. For every intermediate k, (4) with the same endpoints gives an affine `H_k(h)=m_k h`, as one sees first by taking u=w=h. By varying u and w separately, its coefficients satisfy

```math
a'm_1=am_k,\qquad b'm_m=bm_k.
```

Here all slopes are strictly positive: `m_j=1` by normalization, then the coefficient equations force positivity at both endpoints and every middle index. At each intermediate index k these equalities give

```math
\frac{q_k-q_1}{q_m-q_k}=\frac{m_1}{m_m}\frac{p_k-p_1}{p_m-p_k}. \qquad (5)
```

This is exactly a single projectivity of the projective line for the finite selection: conjugate the two displayed fractional-linear coordinates by multiplication by `m_1/m_m`. The endpoints also match. This proves the lemma.

## 4. Full-measure incidences hold for almost every independent pair

Let `θ(a,b)` be the unoriented normal direction to line ab for `a≠b`. For σ-a.e. a the distribution of `θ(a,b)` under `σ(db)` is absolutely continuous in angle. We use [Orponen, Theorem 1.11, Anal. PDE 12 (2019), 1273–1294](https://arxiv.org/html/1710.11053v3#S1.Thmtheorem11): outside the support of a compactly supported planar measure of finite s-energy the exceptional centers for AC have Hausdorff dimension at most `2−s`. Apply it to `σ|U` for every rational ball U, with support inside `closure(U)`. All the countably many exceptional center sets are σ-null by the Frostman bound. Any b different from a lies in some such ball with `a∉closure(U)`, and σ has no atoms. Therefore the radial projection of all of σ from a is AC, and taking unoriented normals preserves AC.

In particular `(a,b)→(a,θ(a,b))` sends `σ×σ` to a measure absolutely continuous with respect to `σ(da)dθ`. The **same** holds with b in the first component, not merely for the line in the space of lines. Hence for `σ×σ`-a.e. `(a,b)` both endpoints lie in the good subset A of the same slice. On that slice f agrees with a line projectivity on A; each of a,b is an accumulation point of A. This is the pair property used below.

## 5. From slice projectivities to a plane projectivity

Choose two distinct anchors a,b for which the pair property holds with σ-a.e. other point and their pinned angular distributions are AC. Their images are distinct. Send the line ab to infinity in the source, with a the vertical direction and b the horizontal direction; make the corresponding projective coordinate change in the target. In source K discard ab and the preimage of the matching target pole line, both σ-null. With the source and target matrices denoted M and N, choose their scales on a homogeneous frame so that `Ma*=Nf(a)*=e_2` and `Mb*=Nf(b)*=e_1`. Take a nonempty relatively open portion `W⊂K` of positive σ-mass, with both charts bounded on W, and the signs of both chart denominators constant. Such portions cover the non-exceptional set by continuity. The transformed map on W, denoted T, has the form

```math
T(u,v)=(F(u),G(v)). \qquad (6)
```

Indeed vertical lines go to vertical lines by incidence at a, horizontal lines by incidence at b. The weak sign inequality with a and two points of W shows that F is monotone, possibly nonincreasing: the determinant with the transformed vertical anchor is `u'-u`, times the two source denominators and `det(M)^{-1}`; the analogous target determinant is `F(u')-F(u)` with its two denominators and `det(N)^{-1}`. On W each denominator product is positive, so any reversal is uniform. Do the same for G using b. Both are bounded on their domains and have bounded monotone extensions to real intervals, or to the whole line, by taking monotone envelopes on gaps. The two coordinate marginals of the transformed `σ|W` are absolutely continuous, as each coordinate is a smooth projective parameter of the corresponding pencil from a or b with AC angular law (work in local pencil charts away from the pole). Thus ordinary one-variable derivatives of the extensions of F and G exist and are finite at almost every point of the respective marginals.

They are nonzero there (as a statement about `σ|W`-a.e. point). For almost every x in W the pair (a,x) is good. Its line projectivity maps a (now vertical infinity) to the target vertical infinity, so in these charts it is an affine bijection of the two lines; on A it agrees with T. There are points of A tending to x on this line and distinct from x, and these eventually belong to W by relative openness. Difference quotients for G along these points equal the nonzero slope of this affine bijection. The pair (b,x) gives the same conclusion for F.

For `σ|W×σ|W`-a.e. pair x,x' there are likewise good slice points on xx′ tending to x, whose images lie on the line joining T(x) and T(x′). Directional differentiation of (6) at x therefore yields

```math
T(x')-T(x)\parallel \mathop{\mathrm{diag}}\bigl(F'(u),G'(v)\bigr)(x'-x). \qquad (7)
```

Both coordinate differences of x,x′ are nonzero for almost every pair by the AC marginals. By (7) and the nonzero derivatives, the two image coordinate differences are also nonzero. Taking slopes and applying (7) at the opposite endpoint, the ratio `G'(v)/F'(u)` is equal at x and x′ for almost every pair, hence equal to one nonzero constant λ almost everywhere. Dividing the target's second coordinate by λ gives a map S for which `S(x')−S(x)` is parallel to `x'−x` for almost every pair.

Select two distinct typical points x₀,x₁ with the parallel property for their pair and, individually, with almost every x. Since T is injective, `S(x₁)−S(x₀)=c(x₁−x₀)` for `c≠0`. The line x₀x₁ has zero σ-mass; this remains true after the chart change since projectivities take lines to lines. At almost every other x the two prescribed target parallels intersect uniquely at `S(x₀)+c(x−x₀)`. So S equals that homothety almost everywhere on W. Undoing the chart changes and scaling yields a plane projectivity P, agreeing projectively with f on a positive-σ set B in the original coordinates. By the Frostman bound `dim_H B>1`.

## 6. Strict secants propagate the projectivity to the whole coupling

Suppose `(x,z)∈R` and `[z]≠P(x)`; put `v=P⁻¹([z])`. Choose a projective chart containing x and v, remove its infinity line from B, and use local bi-Lipschitz invariance to retain dimension >1. For b in B the original source homogeneous lift is proportional to the new chart lift transformed back, and the selected target lift is proportional to that lift further transformed by P. By finite partition retain dimension >1 where the two proportionality signs are each constant. For distinct b,c in this piece, (1) becomes, up to a single fixed overall sign,

```math
\det(b^*,c^*,x^*)\det(b^*,c^*,v^*)\ge 0.
```

with lifts in the chosen chart. Indeed the lift scalars for b,c occur twice with equal signs on the piece, and all matrix determinant and x,z scalar signs are fixed. The strict secant calculation in §1 gives both strict signs, a contradiction. So `[z]=P(x)` everywhere on R. The coupling marginals yield `P_*μ=ν`; the pole line, if present, is μ-null. This proves the claim.

**Orientation convention.** If M is an invertible matrix for P, the affine chirotope of a finite noncollinear triple is multiplied by `sign(det M)∏ sign((Mx_i*)_3)`. By (1) it is preserved on almost every iid triple. If both denominator signs had positive μ-mass, triples entirely in either sign cell would produce opposite factors, which is impossible. Thus P has constant denominator sign μ-a.e., and the matrix may be chosen so this sign and its determinant are both positive. In particular the sphere map `w↦Mw/|Mw|` is orientation-preserving and sends `j_*μ` to `j_*ν`; by continuity its graph over E contains R (in original source and lifted target coordinates). The result is a projective equivalence of measures; it need not assert that a topological support point on the null pole line has finite image. If the target support is compact, there is no such source support point, since the lifted target support is then compact strictly above the equator and contains the target projection of R.
