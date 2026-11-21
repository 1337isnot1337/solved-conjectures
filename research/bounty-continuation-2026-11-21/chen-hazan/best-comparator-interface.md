# Chen–Hazan: the best-comparator interface and two exact scope tests

21 November 2026. This note does not solve the US$500 prize problem. It gives an exact counterexample to one proposed modification of a published reduction and explains why an unrestricted auxiliary-loss interpretation of the displayed target is insufficient to identify the intended problem.

No sponsor contact, submission, award acceptance, or payment is claimed.

## 1. The target being kept fixed

The [published Chen–Hazan COLT 2024 paper](https://proceedings.mlr.press/v247/chen24e/chen24e.pdf), Section 2 and equation (1), asks for an efficient black-box reduction with

```math
\frac1T\sum_{t=1}^T\mathbb E\|\nabla f(x_t)\|_2^2
\le C\,\frac{\sqrt{M\beta}\,R_T(\mathcal A)}T.
```

The constant is to be universal. The objective is globally differentiable with a $`\beta`$-Lipschitz gradient, the initial gap is at most $`M`$, and fresh stochastic gradients are unbiased with variance at most $`\sigma^2`$. The opening definition makes $`R_T(\mathcal A)`$ a guaranteed upper bound on regret against the **best fixed comparator**, not a signed regret against one preselected action.

The paper's stated purpose includes retaining adaptive and dimension-sensitive advantages of the supplied online learner. Section 4 offers $500 for an efficient reduction giving its equation (1). It does not specify a separate payment for an impossibility result.

The current [Hu–Simchi-Levi manuscript, arXiv:2607.17607v4](https://arxiv.org/pdf/2607.17607v4), Theorem 6.1, has additional variance and initial-gap terms. Its Theorem 8.2 concerns a designated playable comparator. The separate primary-source audit by the other worker records this distinction. This note does not claim to verify the entire 56-page manuscript.

## 2. Replacing the comparator does not remove the initial-gap term

Here is a direct counterexample to taking Algorithm 1 of Hu–Simchi-Levi, replacing its identity-comparator regret by an ordinary best-comparator certificate, and dropping the additive terms.

Fix an integer $`T\ge2`$ and set

```math
\varepsilon=T^{-1/2},\qquad
L=\frac{1-\varepsilon^2/2}{\varepsilon}.
```

Define the one-dimensional function

```math
f_T(x)=
\begin{cases}
0,&x\le-L-\varepsilon,\\[2mm]
\frac12(x+L+\varepsilon)^2,&-L-\varepsilon\le x\le-L,\\[2mm]
\varepsilon(x+L)+\frac{\varepsilon^2}{2},&x\ge-L.
\end{cases}
```

Its derivative is

```math
f'_T(x)=\min\{\varepsilon,\max\{0,x+L+\varepsilon\}\}.
```

Consequently $`f_T`$ is differentiable, its derivative is $1$`-Lipschitz, `$\inf f_T=0$`, and `$f_T(0)=1$`. Take the exact-gradient oracle, initial point `$x_1=0$, and parameters

```math
\beta=M=1,\qquad \sigma=0.
```

These parameters are fixed; only the admissible function varies with the horizon.

For the cited Algorithm 1, $`G=\sqrt{M\beta}=1`$, $`a=1`$, $`\eta=1/64`$, and $`m_1=0`$. Let the scalar preconditioner domain be $`[0,1]`$. This set is compact and convex, and every member is a symmetric one-by-one matrix of operator norm at most one. Its iteration is

```math
x_{t+1}=x_t-\frac1{64}U_t m_t,\qquad
m_{t+1}=s_t,\qquad
\ell_t(u)=-s_t m_tu.
```

All queried gradients equal $`\varepsilon`$. To check this without assuming the conclusion, suppose the preceding queries lie in $`[-L,\infty)`$. Then $`m_t=\varepsilon`$ for $`t\ge2`$, so each movement is nonpositive and has magnitude at most $`\varepsilon/64`$. Thus, for every $`t\le T`$,

```math
x_t\ge-\frac{(T-1)\varepsilon}{64}>-L,
```

because $`(T-1)/64\lt T-1/2`$. Induction closes. In particular,

```math
\frac1T\sum_{t=1}^T|f'_T(x_t)|^2=\varepsilon^2=\frac1T.
```

The online losses are exactly

```math
\ell_1(u)=0,\qquad
\ell_t(u)=-\frac{u}{T}\quad(2\le t\le T).
```

Now supply ordinary projected online gradient descent on $`[0,1]`$, using the online stepsize $`\gamma=\sqrt T`$. Its standard potential proof gives, for **every** sequence of convex losses with subgradients bounded in absolute value by $1/T$,

```math
\sum_{t=1}^T\ell_t(U_t)
-\min_{u\in[0,1]}\sum_{t=1}^T\ell_t(u)
\le
\frac{1}{2\gamma}
+\frac{\gamma}{2}\sum_{t=1}^T|\ell'_t(U_t)|^2
\le\frac1{\sqrt T}.
```

This is a genuine worst-case regret certificate for the supplied loss class, not merely zero regret against the identity and not merely a lucky realized value.

If the desired formula held for this unmodified reduction with that certificate, it would imply

```math
\frac1T\le C\,\frac{1/\sqrt T}{T},
```

which fails once $`T>C^2`$.

The conclusion is limited to this reduction and this proposed deletion of its additive terms. It neither contradicts the published theorem nor rules out another loss construction, another update rule, or another efficient black-box reduction. In the published theorem the initial-gap term is $97/T$, which is consistent with the example.

## 3. Unrestricted auxiliary losses make the displayed inequality automatic

The opposite scope issue is also exact. If a reduction may add an independent online game whose only purpose is to enlarge its regret certificate, then a baseline stochastic-gradient algorithm satisfies the displayed formula for every online learner. This is not being counted as the intended prize solution.

Assume $`\beta,M>0`$ and fresh, conditionally unbiased stochastic-gradient samples with conditional variance at most $`\sigma^2`$. Let

```math
G=\sqrt{M\beta},\qquad
B=\max\{G,\sigma\sqrt T\},\qquad
\eta=\frac{G}{\beta B}.
```

Use an arbitrary online learner $`\mathcal A`$ on the Euclidean unit ball in $`\mathbb R^d`$, $`d\ge1`$. At round $`t`$, after its current action $`u_t`$ has been chosen, set

```math
\eta_t=\eta\,\frac{3+u_{t,1}}4\in[\eta/2,\eta].
```

Make one stochastic-gradient query $`g_t`$ at $`x_t`$ and update

```math
x_{t+1}=x_t-\eta_tg_t.
```

Independently draw a fresh Rademacher sign $`\epsilon_t`$ and feed the online learner the linear loss

```math
\ell_t(u)=\frac B{\sqrt T}\epsilon_tu_1.
```

The next action may depend on all preceding signs. The current sign is drawn after the current action, so $`\mathbb E[\epsilon_tu_{t,1}]=0`$. The stochastic-gradient update does depend on the black-box action through its stepsize, but the extra online game still has no statistical connection to the objective's gradient information.

### 3.1 Optimization bound

Smoothness and conditional unbiasedness give

```math
\mathbb E[f(x_{t+1})\mid\mathcal H_t]
\le f(x_t)
-\eta_t\left(1-\frac{\beta\eta_t}{2}\right)
\|\nabla f(x_t)\|^2
+\frac{\beta\eta_t^2\sigma^2}{2}.
```

Here $`\mathcal H_t`$ includes $`x_t`$ and $`u_t`$ before the oracle sample. Since $`\eta_t\ge\eta/2`$ and $`\beta\eta_t\le1`$,

```math
\frac{\eta}{4}\sum_{t=1}^T\mathbb E\|\nabla f(x_t)\|^2
\le M+\frac{\beta\eta^2\sigma^2T}{2}.
```

Hence

```math
\frac1T\sum_{t=1}^T\mathbb E\|\nabla f(x_t)\|^2
\le\frac{4M}{\eta T}+2\beta\eta\sigma^2
\le\frac{6GB}{T}.
```

The last inequality uses $`B^2\ge\sigma^2T`$. Standard induction using the Lipschitz gradient and finite second moments justifies integrability at every finite step.

### 3.2 The forced regret baseline

For this auxiliary game the realized regret against the best fixed unit-ball action is

```math
\mathop{\mathrm{Reg}}^{\mathrm{best}}_T
=\frac B{\sqrt T}
\left(\sum_{t=1}^T\epsilon_tu_{t,1}
+\left|\sum_{t=1}^T\epsilon_t\right|\right).
```

Let $`S_T=\sum_t\epsilon_t`$. The learner-dependent term has expectation zero, so

```math
\mathbb E\mathop{\mathrm{Reg}}^{\mathrm{best}}_T
=\frac B{\sqrt T}\mathbb E|S_T|.
```

The elementary moment identities are $`\mathbb ES_T^2=T`$ and $`\mathbb ES_T^4=3T^2-2T`$. Hölder's inequality gives

```math
\mathbb E|S_T|
\ge\frac{(\mathbb ES_T^2)^{3/2}}{(\mathbb ES_T^4)^{1/2}}
\ge\sqrt{T/3}.
```

Therefore any valid pathwise regret certificate $`\widehat R_T`$ satisfies

```math
\mathbb E\widehat R_T\ge B/\sqrt3.
```

If the supplied guarantee is a deterministic worst-case number $`R_T(\mathcal A)`$, the same lower bound holds directly for that number. Combining with the optimization calculation gives

```math
\frac1T\sum_{t=1}^T\mathbb E\|\nabla f(x_t)\|^2
\le
6\sqrt3\,\frac{G\,R_T(\mathcal A)}T.
```

For a data-dependent certificate the corresponding statement has $`\mathbb E\widehat R_T`$ on the right. The degenerate cases $`M=0`$ or $`\beta=0`$ can return the initial stationary point.

This construction uses one oracle call and one online call per round. Its defect as an interpretation of the prize is not computational cost: it forces $`R_T`$ to pay the baseline $`B`$ through an unrelated random game. Thus it cannot certify the adaptive improvement sought in the paper. It demonstrates why the displayed inequality alone, without a precise permitted-loss interface, is not a sufficient basis for claiming a fresh prize resolution.

## 4. Prior routes and stopping rule

The natural two-independent-sample quadratic surrogate

```math
\ell_t(\eta)
=\frac{\beta\eta^2}{2}\|g_t\|^2-\eta\langle g_t,g'_t\rangle
```

is already in Zhuang, Cutkosky, and Orabona, [*Surrogate Losses for Online Learning of Stepsizes in Stochastic Non-Convex Optimization*](https://proceedings.mlr.press/v97/zhuang19a/zhuang19a.pdf), ICML 2019. Its Theorem 2 retains a variance term in addition to regret and the initial gap. This formula and its proof were read before considering it here.

Likewise, changing a dynamic comparator into one static function-space comparator is already the exact reduction in Jacobsen, Rudi, Orabona, and Cesa-Bianchi, [*Dynamic Regret Reduces to Kernelized Static Regret*](https://openreview.net/pdf?id=4LSulRbbeL), NeurIPS 2025, Theorem 1. The interpolation complexity remains part of the resulting comparator norm. A time-coordinate or RKHS lift is not a new resolution of the current prize.

The remaining objective is a genuine efficient reduction with the sponsor's best-comparator guarantee that retains its adaptive content without imposing an unrelated regret baseline. This attempt has not supplied it. The fixed-comparator impossibility theorem, the counterexample in Section 2, and the artificial construction in Section 3 do not settle that question. No completed-bounty count changes.
