# Every scalar level is strictly ordered, in all ranks and at all scales

Use the standard norm, root length squared two, on the hyperplane of coordinate sum zero in $`N`$ dimensions. For $`k\in\mathbb Z`$ let $`c_k`$ have coordinate residues $`k/N`$ modulo one, with lifts of total zero. For every $`\alpha>0`$ let $`g_{N,k}(\alpha)`$ be the lattice Gaussian at $`c_k`$. Then

```math
g_{N,0}(\alpha)>g_{N,1}(\alpha)>\cdots>g_{N,\lfloor N/2\rfloor}(\alpha)
\qquad(N\ge2).
```

The remaining scalar values satisfy $`g_{N,N-k}=g_{N,k}`$. Thus the deep classes are exactly the lowest scalar classes in every rank at every Gaussian scale. In the remaining finite-rank intermediate-scale problem, any global counterexample must be noncentral. The comparison does not bound arbitrary translates. The new proof uses a branching recurrence for the Gaussian theta coefficients and the total positivity of the reflecting one-dimensional heat kernel. [Bachoc–Moustrou–Vallentin–Zimmermann, §1.6](https://arxiv.org/html/2502.08819v2#S1.SS6) · [Prior high-rank result](https://github.com/1337isnot1337/solved-conjectures/pull/970)

## Branching

A change of integer lifts gives

```math
g_{N,k}=\sum_{m\in\mathbb Z^N:\,\sum_i m_i=k}
 \exp\left(-\alpha\sum_i(m_i-k/N)^2\right).
```

It shows $`N`$-periodicity by shifting all coordinates by one, and reflection invariance by negating all coordinates. Put $`M=N-1`$, $`t_k=Mk/N`$ and $`\beta=\alpha N/M`$. Group the first $`M`$ coordinates by their sum $`l`$, so that the last coordinate is $`k-l`$. Completing squares splits the quadratic form into $`\sum_{i\le M}(m_i-l/M)^2+N(l-Mk/N)^2/M`$. Consequently,

```math
g_{N,k}=\sum_{l\in\mathbb Z}e^{-\beta(l-t_k)^2} g_{M,l}.
```

Initialize $`g_{1,l}=1`$ for every $`l`$. The scale of the smaller-rank factor in this identity is the original $`\alpha`$.

## Folding the interval

Let $`L=M/2`$ and $`H(v)=\sum_{j\in\mathbb Z}e^{-\beta(v+jM)^2}`$. For $`0\le r,t\le L`$ define the positive kernel $`K(r,t)=H(r-t)+H(r+t)`$. Fold each residue modulo $`M`$ by negation to its representative $`r\in\{0,1,\ldots,\lfloor M/2\rfloor\}`$. Its weighted contribution to the recurrence is $`b_r K(r,t)g_{M,r}`$ where $`b_r=1`$ except that $`b_0=1/2`$ and $`b_{M/2}=1/2`$ when $`M`$ is even. These halves count a fixed residue of the involution once. All weights sum to the period-one Gaussian

```math
Z(t)=\sum_r b_r K(r,t)=\sum_{l\in\mathbb Z}e^{-\beta(l-t)^2}.
```

For $`r\lt u`$ and $`t\lt t'`$ in this interval one has

```math
K(r,t)K(u,t')-K(r,t')K(u,t)\ge0.
```

Indeed $`K`$ times a fixed positive constant is the Neumann heat kernel on $`[0,L]`$ at time $`1/(4\beta)`$, by its image sum with period $`2L`$. The determinant inequality is the two-particle case of the Karlin–McGregor formula. For a direct sign proof take any nonnegative continuous test function compactly supported inside the ordered triangle $`0\lt r\lt u\lt L`$. Extend it antisymmetrically to the square by exchanging the two coordinates. Its product-Neumann heat evolution remains antisymmetric. On the triangle it has zero boundary values on the diagonal, homogeneous Neumann data on the two outer sides and nonnegative initial data. Positivity follows from the heat maximum principle (or by reflecting at the two outer sides), so the antisymmetrized kernel is nonnegative. Continuity of the explicit kernel extends the sign to endpoints. This also covers the smallest interval $`M=1`$ where there is only one folded integer and no determinant to check. [Karlin and McGregor, *Coincidence probabilities*](https://msp.org/pjm/1959/9-4/pjm-v9-n4-p13-p.pdf)

For any nonincreasing values $`a_r`$ on the folded integers, their expectation with weights $`b_rK(r,t)/Z(t)`$ is nonincreasing in $`t`$ on $`[0,L]`$. After multiplying the expectation at $`t`$ minus the expectation at $`t'`$ by $`Z(t)Z(t')`$, the result is

```math
\sum_{r\lt u} b_r b_u(a_r-a_u)
 [K(r,t)K(u,t')-K(r,t')K(u,t)]\ge0.
```

Taking $`a_r=g_{M,r}`$ uses the induction hypothesis. Their normalized expectation $`B(t)`$ is strictly positive, even when there is only one term.

## Strict decrease of the normalizer

By Poisson summation and Jacobi's triple product, the period-one $`Z(u)`$ is, up to a positive constant independent of $`u`$, the product of

```math
1+2q^{2j-1}\cos(2\pi u)+q^{4j-2},\qquad
q=e^{-\pi^2/\beta},\quad j=1,2,\ldots .
```

Every factor is positive and strictly decreases for $`0\le u\le1/2`$. Comparing a single factor strictly and the rest weakly proves strict decrease of the positive convergent product. Since $`t_k=k-k/N`$, evenness and periodicity give $`Z(t_k)=Z(k/N)`$. For $`0\le k<\lfloor N/2\rfloor`$, both $`t_k\lt t_{k+1}\le L`$ and $`0\le k/N<(k+1)/N\le1/2`$. Hence $`Z(t_k)>Z(t_{k+1})`$ while $`B(t_k)\ge B(t_{k+1})>0`$. Multiplying gives the claimed strict ordering. [Jacobi products, DLMF §20.5](https://dlmf.nist.gov/20.5)

The classical coset formulas describe the values; the folded induction compares them without a restriction on the rank or scale. The argument uses the reflection symmetry and monotone order of the smaller-rank scalar values. For a general translate its smaller-rank profile can fail that symmetry. [Classical theta-series discussion](https://people.math.harvard.edu/~elkies/M272.19/sep30.pdf) · [Original open family](https://github.com/1337isnot1337/solved-conjectures/issues/967)

[Independent review](ALL-CENTRAL-REVIEW.md) · [Exact finite checks](check_central_order.py)
