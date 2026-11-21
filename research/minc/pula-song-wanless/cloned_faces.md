# Pula–Song–Wanless conjecture

For integers $n,m\ge2$ let $V_{m,n}$ have an $I_n$ top-left block and ones on all other cells of its $(n+m)$-square support. Replace each vertex by $l$ twins. For every fixed pair $m,n$, for all sufficiently large $l$ these supports are **never barycentric** and are **noncohesive exactly when $n>m$ and $(n-m)^2\ge n$**. In the noncohesive case their unique minimizer vanishes on the whole bottom-right block and is positive on every other allowed entry.

This differs from the threshold $(n-m)^2\ge m$ for $n>m$ at clone multiplicity one. For example, every base $m=d^2$, $n=d^2+d$, $d\ge2$, is noncohesive but becomes cohesive for all sufficiently large clone multiplicities. The threshold for multiplicity one is discussed in [the original problem and proof](proof.md) and [the 2011 paper](https://cs.du.edu/~mathfiles/preprints/nsm-math-preprint-1022.pdf). The result here applies the [general spanning-tree theorem for cloned faces](../combinatorial/cloned_faces.md) and resolves its degenerate boundary for this family.

## The spanning-tree and scaling optima

By uniqueness, both the finite minimizer for large $l$ and the limiting tree optimizer are invariant under every support automorphism and transposition. Write their macro weights as $a$ on the $n$ top diagonal cells, $y$ on cross cells and $x/m$ on bottom cells. The margin equations give
```math
 y=(1-x)/n,\qquad a=1-(m/n)(1-x),\qquad
 \max(0,1-n/m)\le x\le1.
```
These matrices have nonconstant eigenvalues $a$ of multiplicity $n-1$, zero of multiplicity $m-1$, and $c=a+x-1$. The tree product, up to a constant, is $g(x)=(1-a^2)^{n-1}(1-c^2)$. Its log is strictly concave on the connected region, and $g(1)=0$. For $m>n$, at the left endpoint $a=0$ and $-1<c<0$, giving $g'>0$. For $m=n$, $g$ is zero at the left endpoint. For $m<n$, write $r=m/n$. The derivative at $x=0$ is
```math
 (\log g)'(0)=-\frac{2(n-1)(1-r)}{2-r}+\frac{2r}{1-r}.
```
It is negative, zero or positive according as $(n-m)^2$ exceeds, equals or falls below $n$. If positive, all allowed weights at the limiting optimum are positive and the clones are eventually cohesive. If negative, convergence of first derivatives and strict convexity of the normalized permanent near the optimum force the finite minimizer to have $x=0$ eventually. The zero derivative requires the separate calculation below.

The doubly stochastic scaling satisfies $a x/m=y^2$. Put $u=a/y$, so that $y=1/(m+u)$, $x=my/u$, and $n=m+u-m/u$. In particular $u>1$. Substitution gives
```math
 -\tfrac12(\log g)'(x)
 =(n-1)\frac{(m/n)a}{1-a^2}+\frac{(1+m/n)c}{1-c^2}
 =\frac{u^2(u-1)(u+m)}{(2u+m)(u^2+m)}>0 .
```
Thus the scaling differs from the tree optimum and the general theorem proves eventual nonbarycentricity for every pair.

## The zero-derivative case

Put $d=n-m>0$, $T=dl$, and $R_l(w)=\sum_{t=0}^l\binom lt^2t!w^t$, with $s_j=[w^j]R_l(w)^n$. Let $P_l(x)$ be the actual permanent of the symmetric lifted matrix. Recording $t_i$ matches within each top diagonal block gives
```math
 P_l(x)=\frac{(ml)!^2}{l^{(m+n)l}}
 \sum_{j=0}^{ml} s_{T+j}\,a^{T+j}y^{2(ml-j)}\frac{(x/m)^j}{j!}.
```
Indeed after choosing the top matches there are $ml-j$ remaining top rows and columns. Completing the cross matches and the remaining bottom bijection gives $(ml)!^2/j!$ choices. Consequently
```math
 \frac{P_l'(0)}{P_l(0)}=-ml+\frac{nd}{m}\frac{s_{T+1}}{s_T}.
```
On vectors $(t_1,\ldots,t_n)$ of sum $T$, put probability proportional to $\prod_i\binom l{t_i}^2t_i!$. The mean of each coordinate is $lp$, $p=d/n$. Marking one occupied cell in degree $T+1$ and deleting it gives $(T+1)s_{T+1}/s_T=\mathbb E\sum_i(l-t_i)^2$, since the one-coordinate weight ratio is $(l-t)^2/(t+1)$. Thus
```math
 \frac{P_l'(0)}{P_l(0)}
 =\frac{n^2d\mathop{\mathrm{Var}}(t_1)-m^2 l}{m(dl+1)}.                       \tag{1}
```

We record the variance to constant order. Put $b=p(1-p)/(1+p)$ and $h=(n-1)/n$. Then for fixed $n,p$ as above,
```math
 \mathop{\mathrm{Var}}(t_1)=l b h+
 \frac{p(n-1)(np^3+np-2p+2)}{n^2(1+p)^4}+o(1).                          \tag{2}
```
Here are details of the lattice expansion. Apart from constants and linear terms, Stirling gives the logarithmic weight at $t=lz$ as $l f(z)+v(z)+O(l^{-1})$, with
```math
 f(z)=-z\log z-2(1-z)\log(1-z),\qquad v(z)=-\tfrac12\log z-\log(1-z).
```
On compact subintervals of $(0,1)$ the $l^{-1}$ term is a smooth function of $z$ times $l^{-1}$, with uniform $O(l^{-2})$ remainder. Put $U_i=(t_i-lp)/\sqrt l$ on the hyperplane of coordinate sum zero. Up to normalization the Gaussian leading term has covariance $C=b(I-J_n)$ because $f''(p)=-1/b$. The first relative correction is $l^{-1/2}f'''(p)\sum U_i^3/6$. At order $l^{-1}$ the nonconstant correction is
```math
 W=\frac{f''''(p)}{24}\sum U_i^4+\frac{v''(p)}2\sum U_i^2
       +\frac{f'''(p)^2}{72}\left(\sum U_i^3\right)^2 .
```
Linear terms sum to zero and constants cancel after normalization.

For the error estimates restrict first to $\max |U_i|\le\log l$. Taylor remainders of the displayed relative expansion are $O(l^{-3/2}(1+\log l)^{12})=o(l^{-1})$, still $o(l^{-1})$ after weighting by $\sum U_i^2$. Strict concavity with $-f''$ bounded below and the global $O(\log l)$ factorial bounds make the discarded tails smaller than every negative power of $l$, even after counting the polynomial number of tables. The normalizing sum has a term within bounded rounding distance of the central table. Gaussian sums of the remaining polynomials on the shifted mesh of spacing $l^{-1/2}$ in $n-1$ independent coordinates equal their integrals up to relative mesh normalization and an exponentially small additive error. This follows from Poisson summation, since Fourier transforms of polynomials times a positive definite Gaussian are of the same form, uniformly bounding the shift factors by one. Thus the integrated odd correction vanishes.

By symmetry the constant correction to the variance is $\mathop{\mathrm{Cov}}(\sum U_i^2,W)/n$ under the leading Gaussian. For homogeneous $H$ of degree $j$, this covariance with $H$ is $jb\mathbb E H$, by differentiating the Gaussian scale on the hyperplane. Wick's formula gives $\mathbb E\sum U_i^4=3nb^2h^2$ and $\mathbb E(\sum U_i^3)^2=6b^3(n-1)(n-2)/n$, using $\sum_j C_{ij}=0$. The correction is therefore
```math
 v''(p)b^2h+\tfrac12 f''''(p)b^3 h^2+
 \tfrac12 f'''(p)^2 b^4(n-1)(n-2)/n^2 .
```
Substitution gives (2).

At the threshold $n=d^2$, $p=1/d$, the leading term in (1) cancels exactly. The constant term of (2) simplifies to
```math
 \frac{(d-1)(d^2+2d-1)}{d^2(d+1)^3}>0 .
```
Hence $P_l'(0)>0$ eventually. The tree optimum is at zero and strict convexity of $Q_l$ in a common neighborhood again forces its minimizer to remain exactly at zero. This proves the classification, including every pair on the threshold. The associated catalogue entries ask for all supports; this result adds no full entry.

The [exact checker](verify_clone_threshold.py) compares the flow-table polynomial with 16 directly computed permanents, verifies 63 boundary-variance identities, and evaluates the positive threshold correction for three fixed pairs along increasing clone multiplicities.
