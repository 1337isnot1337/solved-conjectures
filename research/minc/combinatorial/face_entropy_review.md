# Review of the exact entropy duality on a Birkhoff face

Date: 20 November 2026 (America/Chicago).

This independently checks the root agent's proposed variational identity. It does not resolve a Minc-list target, and its historical priority has not been established.

Let Omega(D) be a nonempty face of the Birkhoff polytope. For P in the face, let nu_P maximize entropy among distributions on supported permutation matrices with mean P. Put


```math
I(P)=\sum_i H(P_{i,\cdot})-H(\nu_P).
```


Let mu_P be the Gibbs distribution with weights

```math
\mu_P(\sigma)=\frac{\prod_i p_{i,\sigma(i)}}{\mathop{\mathrm{per}}P},
```

on permutations supported by P, and let M(P) be its marginal matrix.

## The boundary causes no missing first-order condition

Work on the active support of P. Each positive entry lies in a supported permutation, by a Birkhoff decomposition. P is in the relative interior of the corresponding face. The entropy maximizer nu_P is positive on every permutation in that face and therefore has finite Gibbs parameters B on the active edges:


```math
\nu_P(\sigma)=\frac{\prod_i b_{i,\sigma(i)}}{\mathop{\mathrm{per}}B}.
```


Both P and M(P) have exactly this active support. Hence the tangent direction

```math
D_P=P-M(P)
```

is feasible in both signs for a sufficiently small step inside the active face.

The entropy derivative along a zero-margin tangent D is

```math
dI_P[D]=\sum_{ij}d_{ij}\log(b_{ij}/p_{ij}),
```

where the sum is over active entries. Row and column gauge terms do not affect this formula.

## The identity and the extremizers

Directly expanding the relative entropies gives


```math
\log\mathop{\mathrm{per}}P
=-I(P)+\mathop{\mathrm{KL}}(\nu_P\Vert\mu_P),
```

and

```math
dI_P[D_P]
=\mathop{\mathrm{KL}}(\nu_P\Vert\mu_P)
 +\mathop{\mathrm{KL}}(\mu_P\Vert\nu_P).
```


At a maximizer of I, the latter derivative vanishes because both signs of D_P are feasible. Both relative entropies therefore vanish. In particular nu_P=mu_P and M(P)=P.

The entropy value H(nu_P) is continuous on the finite marginal polytope. One boundary justification is as follows. If P_l tends to P, choose any Birkhoff decomposition of P_l. The mass assigned to permutations using an edge outside the support of P is bounded by the sum of those vanishing outside entries. Remove this mass and normalize the remaining distribution. Its marginal Q_l belongs to the limiting active face and tends to P. Maximum entropy varies continuously near the relative-interior point P in that face. Combining nu_{Q_l} with the removed mass gives feasible distributions converging to nu_P, which proves the needed lower semicontinuity. Upper semicontinuity follows by compactness of the probability simplex.

Consequently I has a maximizer, and the two displayed identities prove


```math
\boxed{\min_{P\in\Omega(D)}\log\mathop{\mathrm{per}}P
=-\max_{P\in\Omega(D)}I(P).}
```


The extremizer sets agree. Indeed, if P minimizes the permanent, then

```math
-I_{\max}=-I(P)+\mathop{\mathrm{KL}}(\nu_P\Vert\mu_P)
```

and I(P)<=I_max force I(P)=I_max and zero relative entropy.

## A companion descent calculation

On the active support,

```math
\frac{\partial}{\partial p_{ij}}\log\mathop{\mathrm{per}}P
=\frac{M(P)_{ij}}{p_{ij}}.
```

Therefore the same tangent direction satisfies

```math
\begin{aligned}
d(\log\mathop{\mathrm{per}})_P[D_P]
&=n-\sum_{ij}\frac{M(P)_{ij}^2}{p_{ij}}\\
&=-\sum_{ij}\frac{(M(P)_{ij}-p_{ij})^2}{p_{ij}}
\le0.
\end{aligned}
```


This direction increases I by a symmetrized relative entropy and decreases the log permanent by a Pearson divergence. This resembles a reversed Baum--Eagon update; no new dynamical theorem or priority claim is being made. The calculation does not justify conjugation averaging, concavity of I, or a characterization of the fixed points.
