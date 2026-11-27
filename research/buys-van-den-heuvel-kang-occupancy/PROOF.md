# Occupancy in triangle-free graphs of given average degree

Let $`G`$ be a finite, nonempty, simple triangle-free graph with $`n`$ vertices and average degree $`d`$. Write $`Z_G(t)=\sum_I t^{|I|}`$, where the sum ranges over its independent sets. Under the hard-core distribution of fugacity $`t>0`$, an independent set $`I`$ has probability $`t^{|I|}/Z_G(t)`$. Write $`\alpha(t)=\mathbb E_t|I|/n`$.

**Theorem.** Uniformly over all such graphs and $`0<\lambda\le1`$, as $`\lambda d\to\infty`$,

```math
\alpha(\lambda)\ge (1-o(1))\,\frac{\log(\lambda d)}{d}.
```

At $`\lambda=1`$ this is Conjecture 12 of Buys, van den Heuvel and Kang. The uniform random independent set has expected size at least $`(1-o(1))n\log(d)/d`$. The bound uses the average degree even when the maximum degree is much larger. The same authors separately pose a pointwise inequality called Conjecture 12 redux. Its full finite-parameter bound remains open here. Cinna Davis recorded the variance-and-entropy approach and its conclusion in the original issue. This manuscript reconstructs the details. [Source, p. 10](https://arxiv.org/pdf/2503.10002v2#page=10) · [Research record](https://github.com/1337isnot1337/solved-conjectures/issues/497)

## A variance bound from the neighborhood of one vertex

We use the single-vertex residuals and their covariance identities already recorded in the repository’s weighted hard-core calculation. Conditioning on the entire triangle-free neighborhood will give a bound in terms of occupancy itself. [Earlier covariance identities](https://github.com/1337isnot1337/solved-conjectures/blob/a028ccae5b30ff9856db665d75b4ffc6b73d7c4d/research/davies-sandhu-tan-variance/WEIGHTED-COVARIANCE.md)

Fix $`t>0`$. Let $`M=|I|`$, let $`B_v`$ be the indicator of $`v\in I`$, and let $`U_v`$ be the indicator that no neighbor of $`v`$ belongs to $`I`$. Set $`p=t/(1+t)`$, $`Y_v=B_v-pU_v`$, and $`S=\sum_vY_v`$. Conditional on the configuration off $`v`$, the mean of $`B_v`$ is $`pU_v`$. In particular $`Y_v`$ has conditional mean zero. The remaining part of $`M`$ is fixed under this conditioning, so

```math
\mathbb E[M Y_v]=\mathbb E[Y_v^2]=(1-p)\mathbb E B_v.
```

If $`u\ne v`$ is a nonneighbor of $`v`$, the variable $`Y_u`$ is determined off $`v`$, whence $`\mathbb E[Y_uY_v]=0`$. If $`u,v`$ are adjacent and either is occupied, the other is blocked and has score zero. When both are empty their score product equals $`p^2 U_uU_v`$. Thus, with the inner sum counting **ordered** neighbors,

```math
\mathop{\mathrm{Var}}(S)=(1-p)n\alpha(t)
   +p^2\sum_v\sum_{u\sim v}\mathbb E[U_vU_u].
```

For a fixed $`v`$, expose $`I`$ outside its closed neighborhood. Let $`K`$ count the neighbors of $`v`$ that have no occupied exterior neighbor. These $`K`$ available neighbors form an independent set, by triangle-freeness. The conditional normalizer is $`D=t+(1+t)^K`$: either the center is occupied, of weight $`t`$, or the center is empty and an arbitrary subset of these neighbors is occupied. The conditional probability that the center is occupied is $`X=t/D`$. Both ends of an incident edge can be uncovered only if its neighbor is available and the entire closed neighborhood is empty. For each available neighbor this empty configuration has conditional probability $`1/D`$. Consequently the conditional sum of joint uncovering probabilities at $`v`$ is $`K/D=KX/t`$.

Choose $`v`$ uniformly as well as sampling its exterior. Then $`\mathbb E X=\alpha(t)`$. The definition of $`X`$ yields

```math
KX=\frac{X\log(t(1-X)/X)}{\log(1+t)}.
```

The function $`x\mapsto x\log(t(1-x)/x)`$ has second derivative $`-1/[x(1-x)^2]`$ on $`0\lt x<1`$. Jensen’s inequality therefore bounds $`\mathbb E[KX]`$ by $`\alpha(t)\log(t(1-\alpha(t))/\alpha(t))/\log(1+t)`$. Apply Cauchy–Schwarz to $`\mathop{\mathrm{Cov}}(M,S)=(1-p)n\alpha(t)`$ and substitute the resulting upper bound on $`\mathop{\mathrm{Var}}(S)`$. With $`a=\alpha(t)`$ this gives

```math
\frac{\mathop{\mathrm{Var}}_t(M)}{n}
\ \ge\
\frac{a}{1+t+\dfrac{t}{\log(1+t)}
                      \log\!\left(\dfrac{t(1-a)}{a}\right)} .
```

The single-vertex conditional law gives $`0\lt a\le p`$, so the logarithm in the denominator is nonnegative.

## From variance to free energy

Write $`F(t)=n^{-1}\log Z_G(t)`$. Differentiation of the finite generating function gives $`dF/d\log t=\alpha(t)`$ and $`d\alpha/d\log t=\mathop{\mathrm{Var}}_t(M)/n>0`$. The strict inequality follows since both the empty set and singleton sets occur. Fix an upper fugacity $`\eta>0`$, put $`A=\alpha(\eta)`$, and invert $`a=\alpha(t)`$ on $`0\lt t\le\eta`$. For $`f(a)=\log(t(a)/a)`$ we have $`f(a)\ge0`$ and

```math
\frac{df}{d\log a}
   = \frac{a}{\mathop{\mathrm{Var}}_t(M)/n}-1
   \le \eta+(1+\eta)f(a).
```

Here $`t/\log(1+t)\le1+t`$, and $`\log(t(1-a)/a)\le f(a)`$. Set $`b=1+\eta`$ and $`c=\eta/b`$. The derivative inequality says $`(f(a)+c)/a^b`$ is nonincreasing. Integrating toward smaller $`a`$ gives $`f(a)\ge(a/A)^b(f(A)+c)-c`$.

Since $`Z_G(t)=1+nt+O_G(t^2)`$ at zero, $`a=t+O_G(t^2)`$ and the integration-by-parts boundary term $`a\log t`$ tends to zero. Thus

```math
F(\eta)=A(1+f(A))-\int_0^A f(a)\,da .
```

The lower bound for the integral gives the finite-parameter inequality

```math
F(\eta)\le\frac{1+\eta}{2+\eta}\,
            A\bigl(2+\log(\eta/A)\bigr).
```

## Recovering the sharp leading constant

Let $`L=\log(\lambda d)`$ and take $`\eta=\lambda/(1+L)`$ for $`L>0`$. Then $`\eta\to0`$ uniformly and $`\log(\eta d)=L-\log(1+L)\sim L`$. Theorem 5 of Buys, van den Heuvel and Kang gives the following for $`0\le\eta\le2`$ and $`d>2`$, with $`W`$ the nonnegative Lambert function. [Primary theorem, equation (4)](https://arxiv.org/pdf/2503.10002v2#page=7)

```math
F(\eta)\ge
 \frac{W(\eta d)^2+2W(\eta d)-W(2\eta)^2-2W(2\eta)}{2(d-2)}
 \ge (1-o(1))\frac{L^2}{2d}.
```

Indeed $`W(\eta d)\sim\log(\eta d)\sim L`$, and $`W(2\eta)`$ is bounded. These estimates are uniform in the chosen graph and fugacity.

Fix $`0<\varepsilon<1`$, and put $`A_0=(1-\varepsilon)L/d`$. For large $`L`$, $`0\lt A_0<\eta`$, since $`\eta d=\exp(L)/(1+L)`$. The function $`a\mapsto a(2+\log(\eta/a))`$ is increasing on $`0\lt a\le\eta`$. If $`A\le A_0`$, the preceding upper bound on $`F(\eta)`$ is at most $`(1-\varepsilon+o(1))L^2/(2d)`$, because $`\log(\eta/A_0)=L-\log(1+L)-\log((1-\varepsilon)L)\sim L`$. This contradicts the lower bound for sufficiently large $`L`$. Hence $`\alpha(\lambda)\ge\alpha(\eta)>A_0`$ eventually for each fixed $`\varepsilon`$. This proves the theorem.
