# Universal Gaussian cold spots of every dual type-A lattice

Codex derived this argument in the WadeDavis research session on 27 November 2026 UTC. Bachoc, Moustrou, Vallentin and Zimmermann asked about universality of stable cold spots and singled out the dual type-A family. Cinna Davis previously treated small and large Gaussian parameters. The theorem below settles the intermediate range for ranks at least four. The earlier dual-checkerboard theorem already covers rank three. The circular summation used in the proof is a specialization of a theorem of Song Heng Chan and Zhi-Guo Liu. [Bachoc–Moustrou–Vallentin–Zimmermann, §1.6](https://doi.org/10.1017/fms.2026.10169) · [Earlier large-parameter result](https://github.com/1337isnot1337/solved-conjectures/blob/069f966bc77c5a962460597e9a6118becd7f50e0/research/lattice-cold-spot-stability/STABILITY.md) · [Earlier small-parameter result](https://github.com/1337isnot1337/solved-conjectures/blob/069f966bc77c5a962460597e9a6118becd7f50e0/research/lattice-cold-spot-stability/SMALL-ALPHA.md) · [Chan–Liu](https://doi.org/10.1016/j.jnt.2009.09.011).

## Theorem

Let $`N\ge2`$, let $`H=\{x\in\mathbb R^N:\sum_jx_j=0\}`$, and let $`L=A_{N-1}^*=\pi_H(\mathbb Z^N)`$, where $`\pi_H`$ is orthogonal projection. For every $`\alpha>0`$, the global minimizers of

```math
P_\alpha(x)=\sum_{v\in L}e^{-\alpha\|v-x\|^2},\qquad x\in H,
```

are precisely the lattice translates of the permutations of the centered staircase $`h_j=(j-(N-1)/2)/N`$, $`0\le j\lt N`$. These are exactly the deep holes. In this normalization, writing $`q=e^{-\pi^2/\alpha}`$, the minimum is

```math
\sqrt N\left(\frac{\pi}{\alpha}\right)^{(N-1)/2}
\prod_{k=1}^{\infty}\frac{(1-q^{2k})^N}{1-q^{2Nk}}.
```

## Proof

Use the period-one convention

```math
\theta_q(t)=\sum_{a\in\mathbb Z}q^{a^2}e^{2\pi iat},
\qquad F_x(t)=\prod_{j=0}^{N-1}\theta_q(t+x_j),
\qquad C(x)=\int_0^1 F_x(t)\,dt.
```

Every factor is strictly positive on the real line by one-dimensional Gaussian Poisson summation. Integration keeps precisely the frequency vectors of coordinate sum zero. This hyperplane section of $`\mathbb Z^N`$ is the dual lattice of $`L`$. Its basis $`e_i-e_0`$, $`1\le i\lt N`$, has Gram determinant $`N`$, hence Poisson summation in $`H`$ gives

```math
P_\alpha(x)=\sqrt N(\pi/\alpha)^{(N-1)/2} C(x).
```

Average $`F_x`$ over the translations $`t\mapsto t+b/N`$, $`0\le b\lt N`$, and denote this operator by $`A`$. Its Fourier series retains precisely the frequencies $`kN`$. In the coefficient of frequency $`kN`$, substitute $`a=u+k\mathbf1`$ for the integer vector in the product series. Then $`\sum_j u_j=0`$, $`\|a\|^2=\|u\|^2+Nk^2`$ and $`a\cdot x=u\cdot x`$. Absolute convergence justifies the rearrangement, including negative $`k`$. Consequently

```math
AF_x(t)=C(x)\theta_{q^N}(Nt).
```

This is the real, unit-period specialization of Chan–Liu, Theorem 4, with their first integer parameter equal to one. Chua had earlier related circular sums of powers of an unshifted theta function to the dual type-A theta series. [Chan–Liu](https://doi.org/10.1016/j.jnt.2009.09.011) · [Zhu, Theorem 1.1](https://arxiv.org/pdf/1202.1869#page=1) · [Chua](https://doi.org/10.1090/S0002-9939-01-06080-4).

For $`x=h`$ the translation by $`1/N`$ permutes the factors modulo period one, so $`AF_h=F_h`$. We have the pointwise identity $`AF_x=(C(x)/C(h))F_h`$.

Every shift has the same logarithmic integral,

```math
\int_0^1\log F_x(t)\,dt=N\int_0^1\log\theta_q(t)\,dt.
```

It follows that the ratio admits the exact representation

```math
\log\frac{C(x)}{C(h)}
=\int_0^1\big[\log(AF_x)(t)-A(\log F_x)(t)\big]\,dt\ \geq\ 0.
```

The inequality is the concavity of the real logarithm on positive numbers. Equality implies that the continuous, pointwise nonnegative integrand vanishes identically. Strict concavity then forces $`F_x(t+1/N)=F_x(t)`$ for all real $`t`$.

To characterize this equality, Jacobi's triple product gives

```math
\theta_q(t)=\prod_{k\ge1}(1-q^{2k})
\big|1+q^{2k-1}e^{2\pi it}\big|^2.
```

For each integer $`r\ge1`$, the coefficient of $`e^{2\pi irt}`$ in $`\log\theta_q(t)`$ is therefore

```math
b_r=\frac{(-1)^{r-1}q^r}{r(1-q^{2r})}\ne0.
```

Indeed, expand each logarithm of $`1+q^{2k-1}e^{2\pi it}`$ in its convergent power series. The resulting series is absolutely summable for $`0\lt q<1`$. If $`F_x`$ has period $`1/N`$, the coefficients of $`\log F_x`$ at $`1,\ldots,N-1`$ vanish. Writing $`z_j=e^{2\pi ix_j}`$, these coefficients are $`b_r\sum_jz_j^r`$. The first $`N-1`$ power sums of the phases vanish. Newton's identities now show that their first $`N-1`$ elementary symmetric functions vanish, so the multiset of phases consists of the roots of $`X^N+(-1)^N\prod_j z_j`$. The constant term is nonzero. Its roots are a rotated regular $`N`$-gon. [Jacobi's triple product, DLMF §20.5](https://dlmf.nist.gov/20.5).

Thus $`x=h_\sigma+s\mathbf1+u`$ for a permutation $`\sigma`$, some $`s\in\mathbb R`$ and $`u\in\mathbb Z^N`$. Projection onto $`H`$ gives $`x=h_\sigma+\pi_H(u)`$. Conversely, lattice translations and permutations preserve $`P_\alpha`$, so every such point attains equality.

For completeness, one can identify the deep holes without importing a Voronoi classification. For fixed $`x`$, let $`d(x)=\min_{v\in L}\|v-x\|`$. For $`\alpha\ge1`$, bracketing the Gaussian sum between $`e^{-\alpha d(x)^2}`$ and $`e^{-(\alpha-1)d(x)^2}P_1(x)`$ shows that $`-\alpha^{-1}\log P_\alpha(x)\to d(x)^2`$. Thus $`h`$ is a deep hole. To see that all deep holes are listed, the Voronoi cell of zero is the permutohedron with vertices the coordinate permutations of $`h`$. Indeed the inequalities against $`\pi_H(\mathbf1_S)`$ are $`\sum_{j\in S}x_j\le |S|(N-|S|)/(2N)`$. They imply every Voronoi inequality. Subtract the minimum coordinate of an integer representative and decompose it into indicators of its nested positive level sets. For nested sets the inner product of their projections is the size of the smaller set times one minus the size of the larger set divided by $`N`$. It is nonnegative, so the sum of the individual squared norms is at most the squared norm of the sum. Adding the indicator inequalities gives the inequality for the projected integer vector. For every linear functional, order its weights and apply summation by parts to the subset bounds. Its maximum is attained at the similarly ordered permutation of $`h`$ since the largest $`k`$ staircase coordinates sum to $`k(N-k)/(2N)`$. The support functions therefore agree. Strict convexity of squared norm and equality of all vertex norms give the required list of farthest points in the cell.

Finally, let $`E(q)=\prod_{k\ge1}(1-q^{2k})`$. Since the staircase phases are regular and have product one, $`\prod_j(1+u e^{2\pi ih_j})=1+u^N`$. Multiplying the Jacobi products gives $`F_h(t)=E(q)^N\theta_{q^N}(Nt)/E(q^N)`$. Its mean is $`E(q)^N/E(q^N)`$, which yields the claimed minimum.

## Positive Hessian at every scale

The integral gap also shows that every minimum is nondegenerate at each fixed $`\alpha>0`$. For $`v\in H`$ define $`g(t)=\sum_j v_j(\log\theta_q)'(t+h_j)`$. The second derivative of a log-sum of exponentials is the weighted mean of the second derivatives plus the weighted variance of the first derivatives. At $`x=h`$ all $`N`$ summands in $`AF_x`$ have equal weight. In the integral gap, the second derivatives of the individual logarithms therefore cancel, leaving

```math
\nabla^2\log C(h)[v,v]=\int_0^1\left(A(g^2)-(Ag)^2\right)dt.
```

The coefficients of $`g`$ at every multiple of $`N`$ vanish, since $`e^{2\pi irh_j}`$ is then independent of $`j`$ and $`\sum_jv_j=0`$. Hence $`Ag=0`$. Parseval and the displayed coefficients $`b_r`$ yield

```math
\nabla^2\log C(h)[v,v]
=8\pi^2\sum_{r\ge1}\frac{q^{2r}}{(1-q^{2r})^2}
\left|\sum_{j=0}^{N-1}v_j e^{2\pi irh_j}\right|^2.
```

The first $`N-1`$ nonconstant discrete Fourier modes detect every nonzero tangent vector $`v\in H`$. The Hessian is positive definite. The boundedness of all theta derivatives and the positive lower bound on $`F_x`$ for fixed $`q`$ justify differentiation under the integral.
