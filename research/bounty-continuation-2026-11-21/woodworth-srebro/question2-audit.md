# Woodworth–Srebro 2019: prize audit and a stopped convexification route

Date: 21 November 2026.

Status: no complete solution. Question 2 survives the primary-source audit below. The direct conversion attempted here fails a necessary two-point inequality for convex subgradients. That failure is a limitation of this conversion, not an impossibility theorem for the prize.

Coordination: [campaign issue 223, reservation](https://github.com/1337isnot1337/solved-conjectures/issues/223#issuecomment-7069926668). No sponsor contact, submission, fee, or payout claim.

## 1. Original target and separate cash options

The [original COLT 2019 paper](https://proceedings.mlr.press/v99/woodworth19a/woodworth19a.pdf), Sections 2 and 4, defines the deterministic minimax query complexity T(d,M,epsilon) for convex, globally 1-Lipschitz functions on real d-space having a global minimizer in the unit ball. An exact query returns the function value and any valid subgradient. The algorithm must work for every allowed subgradient choice. Its persistent state has M bits between calls; internal computation has no corresponding restriction.

The four questions have separate cash alternatives:

| Question | Cash alternative | Audit disposition |
| --- | ---: | --- |
| 1: characterize the whole query/memory tradeoff, up to the specified factors | US$500 | Not resolved by the located results; not attempted here. |
| 2: polynomial query complexity with near-linear memory | US$200 | Survives this audit; bounded attempt below. |
| 3: near-optimal query complexity with polynomially subquadratic memory | US$200 | Prior negative results; excluded from new discovery. |
| 4: any polynomial incursion into the former unknown tradeoff region | US$100 | Prior results; excluded from new discovery. |

The printed Question 2 asks whether

```math
T(d,M=\widetilde O(d),\epsilon)=O(\mathop{\mathrm{poly}} d)
```

in its stated regime

```math
d=\Omega(\log^c(1/\epsilon)),
\qquad
d=O(\epsilon^{-c})\quad\text{for all }c.
```

The preceding prose specifies memory of order d times a polynomial in log(1/epsilon). The intended task is an unrestricted high-accuracy oracle theorem, not a result for another fixed dimension. For example, epsilon=exp(-(log d)^2) is a useful admissible test family: a superpolynomial query lower bound with d times polylog(d) memory would rule out a uniform positive answer. A positive algorithm only for that family would not settle the whole question.

The public offer contains cash payable for mathematical resolution and no printed deadline. This audit has not obtained a present sponsor confirmation that the payment remains available.

## 2. Primary prior work and its scope

1. [Marsden–Sharan–Sidford–Valiant, COLT 2022](https://proceedings.mlr.press/v178/marsden22a.html) establish a nontrivial first-order query/memory lower bound, covering the earlier Question 4 request. Their lower bound is polynomial in d and does not rule out every polynomial query complexity.

2. [Blanchard–Zhang–Jaillet, COLT 2023](https://proceedings.mlr.press/v195/blanchard23a/blanchard23a.pdf), Theorem 1, require a polynomial query penalty when deterministic memory is at most d^(2-delta). The introduction explicitly identifies Question 3. The later [recursive-cutting-plane paper](https://arxiv.org/html/2306.10096v1), Theorem 3.3, supplies an explicit log(1/epsilon) dependence and preserves this exclusion in the smaller-accuracy regime. Its upper bounds still have an exponential dependence on the block parameter; its discussion leaves a corresponding low-memory question open.

3. [Blanchard, FOCS 2024](https://ieee-focs.org/FOCS-2024-Papers/pdfs/FOCS2024-1oojWxXs5YAKfs3z3lBRMF/167400c413/167400c413.pdf), Theorems 1–2, give much stronger lower bounds for separation-oracle **feasibility**. Page 3 explicitly distinguishes that model: its lower bounds do not imply the analogous first-order convex-optimization lower bounds. Its oracle can prioritize the first violated layer and reset probing subspaces. These features motivated, but do not justify, the attempted conversion below.

4. [Menart–Nikolov–Shamir, arXiv:2607.24827v1](https://arxiv.org/abs/2607.24827), submitted 21 July 2026, state stronger polynomial-in-d first-order lower bounds. Even accepting those stated bounds, they do not exclude polynomial query complexity at near-linear memory and do not characterize the entire tradeoff. This status audit does not certify every proof in that paper.

Primary-title, author, exact-question, linear-memory, and high-accuracy searches were checked through 21 November 2026. No matching resolution of Question 2 was found. GitHub issue searches found no separate active lane in this repository before the reservation. No inference about actual prize awards is made from a paper's existence or title.

## 3. Necessary convex consistency

If g_x is a subgradient of a convex function f at x and g_y is a subgradient at y, then

```math
f(y)\ge f(x)+\langle g_x,y-x\rangle,
\qquad
f(x)\ge f(y)+\langle g_y,x-y\rangle.
```

Adding gives the necessary monotonicity condition

```math
\langle g_x-g_y,x-y\rangle\ge0. \tag{1}
```

This elementary condition does not involve the chosen function values. Consequently, supplying different values cannot repair a violation.

## 4. Exact obstruction to priority-preserving convexification

Let a=b=c=1/8 and let K be the rectangle

```math
K=[-a,a]\times[-b,b]\subset B_2(0,1).
```

Consider a valid separation rule that first checks the horizontal constraint. It returns e_1 when x_1>a, and, when |x_1| is at most a and x_2>b, returns e_2. Other branches can be completed by the corresponding coordinate separators. Only these two branches are used.

### Fixed positive rescaling fails away from the boundary

Fix any positive scalars alpha and beta for the two layers. Choose

```math
0\lt h<\min\{a,\beta c/(2\alpha)\},
\qquad
u=(a+h,b+2c),\quad v=(a-h,b+c).
```

Both queries lie in the unit ball and strictly inside their respective oracle branches. Their proposed gradients are alpha e_1 and beta e_2. Hence

```math
\langle \alpha e_1-\beta e_2,u-v\rangle
=2\alpha h-\beta c<0.
```

By (1), these two oracle outputs cannot be subgradients of one convex function. Thus no fixed choice of positive layer weights converts even this two-layer priority separator into an exact first-order oracle at all queries.

### Bounded query-dependent rescaling still fails on the switch boundary

Suppose instead that the positive scaling may depend on the query, but the resulting gradients must have norm at most L, as required for an L-Lipschitz objective. Set

```math
v=(a,b+c).
```

The first constraint passes at v, so the rule prescribes beta e_2 for some beta>0. At

```math
u_h=(a+h,b+2c)
```

it prescribes alpha_h e_1, where 0<alpha_h is at most L. Choose

```math
0\lt h<\min\{a,\beta c/L\}.
```

Then

```math
\langle \alpha_h e_1-\beta e_2,u_h-v\rangle
=\alpha_h h-\beta c
\le Lh-\beta c<0.
```

The same contradiction applies. This is a pointwise statement about preserving the separator's direction at every query. It does not rule out a simulation that moves queries, changes dimension, uses additional oracle calls, or deliberately changes the returned directions.

## 5. What the weighted-maximum attempt actually needs

The natural convex surrogate max_p w_p h_p(x), with convex violation functions h_p and positive weights, chooses the largest weighted violation. The feasibility oracle chooses the first positive violation. These rules differ arbitrarily close to a layer boundary: an earlier positive violation can be too small to dominate a later one. Section 4 proves that an exact pointwise identification cannot be forced merely by choosing the weights.

For a preselected finite transcript, a positive margin might make priorities agree on that transcript. That is not enough for the desired lower bound. One would still have to establish a margin for an adaptive optimization algorithm, preserve the transcript's function values and all convex interpolation inequalities after the feasibility construction resets probes, and control the resulting accuracy loss. None of those obligations has been proved here.

The bounded attempt therefore stops. The surviving prize question is left open, with no new completion, no unrestricted lower bound, and no claimed novelty for the elementary monotonicity test.

