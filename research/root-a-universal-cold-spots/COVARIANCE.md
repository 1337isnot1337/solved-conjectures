# Conditional covariance and the final central comparison

Independent local derivation in the WadeDavis Codex research session. Throughout, the estimates are uniform as the parameter varies over the chosen compact positive interval. [Manuscript review](HIGH-RANK-REVIEW.md)

## Positive Hessian in the localized region

Write $`\Theta_\alpha(y)=\sum_{k\in\mathbb Z} e^{-\alpha(k-y)^2}`$, and let $`K_y`$ have the probability mass function proportional to those summands. Write $`m(y)=\mathbb E K_y`$ and $`v(y)=\mathrm{Var}(K_y)`$. The means obey $`m(y+1)=m(y)+1`$ and $`m'(y)=2\alpha v(y)`$. The variances and all central moments are bounded uniformly on the compact parameter set times the phase circle, with variance bounded below by a positive constant. Let $`v_*=v(1/2)`$. Differentiating $`\log\Theta\!_\alpha`$ twice and using Jacobi's product at its strict nondegenerate minimum gives

```math
4\alpha^2v_*-2\alpha=(\log\Theta_\alpha)''(1/2)>0.
```

The right side has a strictly positive minimum over $`I`$.

For $`x\in H`$, choose $`u`$ so that $`y_i=x_i+u`$ satisfies $`\sum_i m(y_i)=0`$. Existence and uniqueness follow from strict monotonicity and integer translation. Conditional on $`\sum_iK_i=0`$, the independent variables $`K_i\sim K_{y_i}`$ have the same law as if one used parameters $`x_i`$, since the shift adds only a constant to the quadratic energy on that hyperplane. Consequently for $`w\in H`$ of norm one,

```math
\nabla^2\log P_\alpha(x)[w,w]
=-2\alpha+4\alpha^2\mathrm{Var}\!\left(\sum_iw_iK_i\,\middle|\,\sum_i K_i=0\right).
```

Assume each $`y_i`$ is within $`B/\sqrt N`$ of a half integer, for a fixed $`B`$. The conditional variance is $`v_*+o(1)`$ uniformly in $`x,w,\alpha`$. Write $`X_i=K_i-m(y_i)`$, $`\phi_i(t)=\mathbb E e^{itX_i}`$ and $`\Phi(t)=\prod_i\phi_i(t)`$. Compactness, full span one and the uniform variance lower bound give $`|\phi_i(t)|\le e^{-ct^2}`$ for $`|t|\le\pi`$, with $`c>0`$ uniform. For example, two consecutive nearest-site probabilities share a positive lower bound and the characteristic-function squared modulus loses at least a constant multiple of $`1-\cos t`$. Thus $`\int|\Phi|=O(N^{-1/2})`$. Fourier inversion with $`\sum_i m(y_i)=0`$ gives

```math
\int_{-\pi}^\pi\Phi(t)\,dt=2\pi\Pr\left(\sum_i K_i=0\right)\asymp N^{-1/2}.
```

For the lower bound, rescale by $`1/\sqrt{\sum v(y_i)}`$. The uniform cubic central moment gives a standard-normal limiting integrand on compact rescaled intervals, and the uniform Gaussian bound controls the rest.

On $`|t|\le N^{-2/5}`$ all individual $`\phi_i`$ stay bounded away from zero. Define

```math
a_i(t)=\frac{\mathbb E[X_i e^{itX_i}]}{\phi_i(t)},
\qquad
b_i(t)=\frac{\mathbb E[X_i^2 e^{itX_i}]}{\phi_i(t)}-a_i(t)^2.
```

Uniform Taylor expansion gives $`a_i(t)=it v(y_i)+O(t^2)`$ and $`b_i(t)=v(y_i)+O(|t|)`$. Uniform smoothness gives $`v(y_i)=v_*+O_B(N^{-1/2})`$. Hence $`|\sum_i w_iv(y_i)|=O_B(1)`$ since $`\sum_iw_i=0`$ and $`\sum_i|w_i|\le\sqrt N`$. Throughout the central interval,

```math
\sum_i w_ia_i=O_B(|t|+\sqrt N t^2)=o(1),
\qquad \sum_iw_i^2 b_i=v_*+o(1).
```

The Fourier integrands for the conditional first and second moments of $`\sum_iw_iX_i`$, before dividing by $`\int\Phi`$, are respectively $`\Phi\sum w_i a_i`$ and $`\Phi[(\sum w_i a_i)^2+\sum w_i^2b_i]`$. On the exterior interval use the original expanded expectation without dividing by an individual characteristic function. Each insertion removes at most two undecorated factors. The bounded first and second moments and $`(\sum|w_i|)^2\le N`$ bound both outer integrals by $`O(N e^{-c(N-2)N^{-4/5}})`$. Integration on the central interval, using $`\int|\Phi|/\int\Phi=O(1)`$, gives first moment $`o(1)`$ and second moment $`v_*+o(1)`$. This proves the result, including a positive-definite Hessian uniformly over all unit tangent directions when $`N`$ is sufficiently large.

For applying convexity, write a localized $`x_i=d_i+1/2+\epsilon_i`$ with $`d_i\in\mathbb Z`$, $`|\epsilon_i|\le B/\sqrt N`$, and $`|\bar\epsilon|=O(1/N)`$. Join it by a straight segment to $`x_i^0=d_i+1/2+\bar\epsilon`$. Along the segment $`x'_i=d_i+1/2+\epsilon_i'`$ one has $`\sum_i\epsilon_i'=N\bar\epsilon`$, $`\max_i|\epsilon_i'|\le B/\sqrt N`$. From $`m(d_i+1/2)=d_i+1/2`$ and the uniform upper bound on $`m'`$ it follows that $`|\sum_i m(x'_i)|=O_B(\sqrt N)`$. The lower bound on $`m'`$ gives $`|u(x')|=O_B(N^{-1/2})`$, so the Hessian estimate holds on the entire segment. The center $`x^0`$ is stationary by coordinate permutation symmetry modulo the root lattice. Thus a minimum within this localized sector must be exactly $`x^0`$.

## Comparison among the remaining central levels

With $`k\in\mathbb Z`$ and $`0\le k\lt N`$, a central point $`c_k`$ has common coordinate phase $`e^{2\pi ik/N}`$. By choosing integer lifts of sum $`k`$ one obtains

```math
P_\alpha(c_k)=\Theta_\alpha(1/2)^N e^{\alpha j^2/N}
\Pr\Big(\sum_{i=1}^N K_i=k\Big),
\qquad j=k-N/2,
```

where the $`K_i`$ are now independent and identically drawn at $`y=1/2`$. This is exact because on $`\sum_i m_i=k`$ the identity
$`\sum_i(m_i-k/N)^2=\sum_i(m_i-1/2)^2-j^2/N`$ holds. Localization gives bounded $`|j|`$, uniformly throughout $`I`$. Let $`|j_0|`$ be the minimum possible value consistent with the parity of $`N`$. Write $`\psi(t)=\mathbb E[e^{it(K_1-1/2)}]`$, real and even. Fourier inversion represents the probability as $`(2\pi)^{-1}\int\psi(t)^N\cos(jt)\,dt`$. This is valid also for odd $`N`$ at half-integer $`j`$, since the full inversion integrand then still has period $`2\pi`$.

The rescaling $`t=s/\sqrt{Nv_*}`$, uniform variance and Gaussian envelope give $`\int t^2\psi^N/\int\psi^N=(Nv_*)^{-1}+o(N^{-1})`$ and $`\int t^4|\psi|^N/\int\psi^N=O(N^{-2})`$, by dominated convergence and compactness of $`I`$. Since $`|j|`$ is bounded, subtract the two cosine expansions. The ratio of the two masses is

```math
\frac{P_\alpha(c_k)}{P_\alpha(c_{N/2+j_0})}
=1+\frac{j^2-j_0^2}{N}\left(\alpha-\frac1{2v_*}\right)+o_I(N^{-1}).
```

The coefficient in parentheses is uniformly positive by the one-site midpoint Hessian. Every admissible $`|j|>|j_0|`$ gives $`j^2-j_0^2\ge1`$. In odd $`N`$, the two sign choices of minimum absolute value have exactly equal mass by inversion symmetry. Hence precisely the deepest central classes survive the comparison.
