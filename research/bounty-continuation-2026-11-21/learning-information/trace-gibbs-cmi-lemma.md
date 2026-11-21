# A conditional-information bound for canonical trace Gibbs sampling

Date: 21 November 2026. This is an auxiliary learner analysis for [Steinke–Zakynthinou Conjecture 6](vc-information-complexity-target.md). It does not solve that conjecture: the fixed-temperature learner analyzed here fails the samplewise empirical-error requirement, as proved in Section 4 of the linked note. No novelty or bounty completion is claimed.

Independent review: the parent agent and the conjectures research agent checked the complete proof. The latter's [review note](INDEPENDENT_REVIEW.md) records the support, weighted-edge, mixture, and tensorization checks.

## 1. Statement and measurable setting

Let $`\mathcal H`$ be a finite or countable class of measurable binary functions, with a fixed enumeration, and let its VC dimension be at most $`d`$. For a labeled sample $`z`$ of size $`n`$, group hypotheses by their prediction traces on its features. Choose one trace with probability proportional to

```math
e^{-\eta L_z(h)},\qquad
L_z(h)=\sum_{i=1}^n1[h(x_i)\ne y_i],
```

and output its first representative in the enumeration. Here $`\eta\ge0`$ is fixed in advance for the given sample size. Denote the learner by $`G_{n,\eta}`$.

The enumeration makes the canonical selection measurable. The proof also applies to a larger class if a measurable coherent representative rule is independently supplied. No general measurable-selection assertion is needed for the finite/countable statement.

For every iid data distribution $`D`$,

```math
\mathop{\mathrm{CMI}}_D(G_{n,\eta})
\le\frac{n\eta^2}{2}
+4e^\eta(1+e^\eta)d\log2\,\frac{n}{n+1}.
\tag{1}
```

Information and logarithms are in nats. In particular, $`\eta=\lambda/\sqrt n`$ gives an information bound independent of $`n`$, for fixed $`\lambda`$ and $`d`$.

## 2. Adjacent samples and their canonical supports

Consider two samples of size $`n`$ sharing $`n-1`$ entries:

```math
z^0=(z_1,\ldots,z_{n-1},u),\qquad
z^1=(z_1,\ldots,z_{n-1},v).
```

Their union sample $`T`$ has $`n+1`$ indexed entries, including both $`u`$ and $`v`$. Repeated feature values are allowed.

Let $`H_0,H_1,H_T`$ be the respective canonical representative sets, and let $`P_0,P_1`$ be the output laws. Both $`H_0`$ and $`H_1`$ are subsets of $`H_T`$: a smaller hypothesis with the same full trace would also have the same restricted trace, contradicting canonical minimality.

If $`h\in H_0\setminus H_1`$, its canonical representative $`g`$ in the $`z^1`$-trace fiber precedes it in the enumeration. The full-pool traces of $`g`$ and $`h`$ agree everywhere except the coordinate $`u`$. They cannot agree there too, because then $`h`$ would not be canonical for $`z^0`$. Thus $`h`$ is an endpoint of a unit-distance edge in coordinate $`u`$ of the full trace graph. The analogous assertion holds for $`H_1\setminus H_0`$ in coordinate $`v`$.

## 3. Weighted one-inclusion edges control missing-support mass

For the finite full trace family $`F`$, give a vertex the weight

```math
w_h=e^{-\eta L_T(h)},\qquad Z_T=\sum_{h\in H_T}w_h.
```

Every induced trace subfamily still has VC dimension at most $`d`$, so its unit-distance graph has at most $`d|F'|`$ edges. The elementary induction establishing this edge bound is in the reference-sampler section of the [target note](vc-information-complexity-target.md).

Applying it to the weight superlevel sets and integrating gives

```math
\sum_{\{g,h\}\text{ an edge}}\min(w_g,w_h)
=\int_0^\infty e(\{h:w_h\ge t\})\,dt
\le d\sum_h w_h.
\tag{2}
```

Neighboring full traces differ in exactly one prediction, hence their binary total losses differ by exactly one. Their weight ratio is $`e^\eta`$ or $`e^{-\eta}`$. Therefore

```math
\sum_{\{g,h\}\text{ an edge}}(w_g+w_h)
\le(1+e^\eta)d Z_T.
\tag{3}
```

Let $`Q_T(h)=w_h/Z_T`$. If $`Z_0`$ is the Gibbs partition function on $`H_0`$, adding the one extra feature coordinate refines each old prediction fiber into at most two full-pool fibers. Also its new loss contribution is nonnegative. Consequently

```math
Z_T\le2Z_0.
```

For $`h\in H_0`$,

```math
P_0(h)=\frac{e^{-\eta L_{z^0}(h)}}{Z_0}
=\frac{w_h e^{\eta\ell(h,v)}}{Z_0}
\le2e^\eta Q_T(h).
\tag{4}
```

Let $`a=P_0(H_0\setminus H_1)`$. By Section 2 and (4), it is at most $`2e^\eta`$ times the $`Q_T`$ mass incident to coordinate-$`u`$ edges. If the $`n+1`$ entries of $`T`$ are iid, exchangeability lets us average that coordinate over all $`n+1`$ positions. Equation (3) yields

```math
\mathbb E a\le
\frac{2e^\eta(1+e^\eta)d}{n+1}.
\tag{5}
```

Similarly, for $`b=P_1(H_1\setminus H_0)`$,

```math
\mathbb E(a+b)\le
\frac{4e^\eta(1+e^\eta)d}{n+1}.
\tag{6}
```

This is an averaged adjacent-sample estimate. No worst-supersample version is asserted.

## 4. Jensen–Shannon divergence on overlapping supports

Let $`C=H_0\cap H_1`$. On this common set, the difference between total losses in the two samples is in $`\{-1,0,1\}`$. Hence the logarithm of the unnormalized likelihood ratio between $`P_0(\cdot\mid C)`$ and $`P_1(\cdot\mid C)`$ has range at most $`2\eta`$.

For completeness, if $`P_t\propto e^{tf}Q`$ and the range of $`f`$ is at most $`r`$, the log partition has second derivative $`\mathop{\mathrm{Var}}_{P_t}(f)\le r^2/4`$. Its integral representation gives

```math
\mathop{\mathrm{KL}}(P_1\Vert P_0)\le r^2/8.
```

Applying this with $`r=2\eta`$ bounds both directed relative entropies between the two common-support conditional laws by $`\eta^2/2`$. Their Jensen–Shannon divergence is therefore also at most $`\eta^2/2`$; this deliberately loose constant is sufficient.

To account for the missing-support masses without a logarithmic entropy loss, put

```math
\gamma=\min(P_0(C),P_1(C))=1-\max(a,b).
```

Each law is a mixture with the **same** mixing weight $`\gamma`$: with that weight use its own common-support conditional law, and otherwise use a residual probability law. Introduce this mixture flag independently of a uniform binary input selecting $`P_0`$ or $`P_1`$. Revealing the flag can only increase information; the residual branch carries at most $`\log2`$. Thus

```math
\mathop{\mathrm{JS}}(P_0,P_1)
\le\frac{\eta^2}{2}+\max(a,b)\log2
\le\frac{\eta^2}{2}+(a+b)\log2.
\tag{7}
```

If $`C`$ is empty, take $`\gamma=0`$ and the same last bound holds. Combining (6) and (7) gives the required expected adjacent-law bound.

## 5. Tensorizing the paired-selector information

Condition on a full iid supersample $`\widetilde Z`$. The selector bits $`S_1,\ldots,S_n`$ are independent. For the learner output $`W`$, the chain rule and independence imply

```math
I(W;S\mid\widetilde Z)
\le\sum_{i=1}^n
I(W;S_i\mid S_{-i},\widetilde Z).
\tag{8}
```

For fixed values of the other selector bits, the two possible selected samples differ in exactly one entry. The summand is their Jensen–Shannon divergence. On averaging over the supersample and the other bits, their $`n-1`$ common entries and the two alternative entries are $`n+1`$ iid observations from $`D`$. Unused ghost entries do not affect either output law. Thus (6)–(7) apply to every averaged summand, and multiplying by $`n`$ proves (1).

## 6. Exact stopped obligation

The lemma verifies that the natural scale $`\eta=\lambda/\sqrt n`$ gives the desired original-information scale. It does not supply the desired error scale. The exact fixed-class counterfamily in the target note produces empirical excess at least $`m/(2\sqrt n)`$ with unbounded $`m`$, at this same temperature. The obstruction is to this learner, not to the conjecture.

A positive modification must keep both properties. Replacing the Gibbs weighting by uniform sampling from a randomized near-minimum set guarantees the empirical error directly, but changes the common-support and boundary-mass estimates above. No transfer of (1) to that learner has been proved here.
