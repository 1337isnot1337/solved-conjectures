# Eventual bulk log-concavity of all four q-Stirling families

This is a partial result toward [Sagan–Swanson, *q-Stirling numbers in type B*, Conjectures 7.4 and 7.5](https://users.math.msu.edu/users/bsagan/Papers/Old/qStB-pub.pdf#page=31). It does not establish either all-order conjecture. It proves **ordinary** (not just parity) log-concavity in the bulk even for type B, where some small rows are not even ordinarily unimodal.

**Theorem.** Fix $`0<\eta<1/2`$ and $`0<\varepsilon<1/2`$. Write $`P(q)`$ for any of the four $`q`$-Stirling polynomials $`c[n,k],c_B[n,k],S[n,k],S_B[n,k]`$, $`D=\deg P`$, and $`p_j=[q^j]P(q)`$. For all sufficiently large $`n`$, uniformly over $`\eta\le k/n\le1-\eta`$ and integers $`\varepsilon D\le j\le(1-\varepsilon)D`$,
```math
 p_j^2>p_{j-1}p_{j+1}.
```
In particular the assertions also hold for the parity subsequences when $`j\pm2`$ are used. The proof does not address the extremal-rank or extremal-coefficient regimes.

## 1. Two-parameter representation

Use the symmetric-function table and marked occupancy model in the companion [normality proof](PROOF.md). Thus $`r=n-k`$, $`N`$ is the number of geometric or Bernoulli sites, $`[m_i]_q`$ is the $`i`$th variable, $`M=m_N`$, and $`m_i/M=i/N+O(1/N)`$. Let $`\theta`$ be a real parameter. Give the mark $`U_i\in\{0,\ldots,m_i-1\}`$ probabilities proportional to $`\exp(\theta U_i/M)`$. Give the corresponding occupancy $`J_i`$ the parameter
```math
 w_i=\frac{\lambda}{M}\sum_{u=0}^{m_i-1}e^{\theta u/M}.
```
In the elementary case $`w_i`$ is Bernoulli odds. In the homogeneous case $`w_i<1`$ is the geometric ratio. Sites and marks are independent before conditioning, with marks sampled independently within each site conditional on $`J_i`$. Put $`T=\sum J_i`$, $`X=\sum_{i,\ell\le J_i}U_{i,\ell}`$. Conditioning on $`T=r`$ gives the $`q`$-Stirling coefficient law tilted by $`\exp(\theta j/M)`$ at exponent $`j`$. This follows just as in the companion note: conditional generating factors cancel the tilted mark normalizations in $`w_i`$; the common factors $`(\lambda/M)^r`$ cancel too.

For each fixed $`\theta`$, choose $`\lambda=\lambda_N(\theta)`$ so that $`\mathbb ET=r`$, by the same strict monotonicity as in the companion note. This parameter is continuous in $`\theta`$, since the nonzero derivative of the occupancy mean in $`\lambda`$ gives the implicit function formula. Write $`Y=X/M`$.

## 2. Subsequence bounds for the constrained saddle

Suppose $`k/n\to\alpha\in[\eta,1-\eta]`$. Then $`r/N\to\beta`$, where $`\beta=1-\alpha\in(0,1)`$ for the elementary case and $`\beta=(1-\alpha)/\alpha>0`$ in the homogeneous case. Denote the occupancy mean as a function of its parameter by $`u(w)`$ (Bernoulli $`w/(1+w)`$, geometric $`w/(1-w)`$). Set
```math
 v_\theta(x)=\int_0^x e^{\theta u}\,du,\qquad
 b_\theta(x)=
 \frac{\int_0^x u e^{\theta u}\,du}{v_\theta(x)}
```
for $`x>0`$ (take $`b_\theta(0)=0`$). If $`\theta_N\to\theta\in\mathbb R`$, uniform Riemann sums and parameter bracketing give $`\lambda_N(\theta_N)\to\lambda(\theta)`$, the unique solution of
```math
 \int_0^1 u(\lambda(\theta)v_\theta(x))\,dx=\beta .
```
In the elementary case the integral increases from $`0`$ to $`1`$ as $`\lambda`$ goes from $`0`$ to infinity. In the homogeneous case it increases from zero to infinity as $`\lambda`$ goes to $`1/v_\theta(1)`$, because $`v_\theta'(1)>0`$ and the limiting integrand diverges like a positive constant times $`(1-x)^{-1}`$. The bracketing also shows that along any such subsequence the geometric parameters stay bounded away from 1. We have
```math
 \frac{\mathbb E Y}{N}\ \longrightarrow
 \ z(\theta)=\int_0^1 u(\lambda(\theta)v_\theta(x))b_\theta(x)\,dx . \tag{1}
```

The quantity $`D/(MN)`$ tends to $`d_{\max}=\beta-\beta^2/2`$ for the elementary case and $`d_{\max}=\beta`$ for the homogeneous case. In fact, choose the $`r`$ largest variables once for the maximum elementary degree, or the largest one $`r`$ times for the maximum homogeneous degree. The limiting function (1) tends to zero as $`\theta\to-\infty`$, because $`b_\theta(x)\le1/|\theta|`$ there. It tends to $`d_{\max}`$ as $`\theta\to+\infty`$, as follows.

* For geometric occupancies, $`w(x)=\lambda(\theta)v_\theta(x)<v_\theta(x)/v_\theta(1)`$. The ratio tends uniformly to zero for $`x\le1-\delta`$ with any fixed $`\delta>0`$. Hence the entire occupancy mean $`\beta+o(1)`$ is supported on $`x>1-\delta`$. On that interval, $`b_\theta(x)\ge x-1/\theta`$. Comparing against the upper bound $`b_\theta(x)\le1`$ and then sending $`\delta\downarrow0`$ proves $`z(\theta)\to\beta`$.
* For Bernoulli occupancies, $`w(x)=\exp(\theta(x-a_\theta))(1-e^{-\theta x})`$, where $`a_\theta=-\theta^{-1}\log(\lambda(\theta)/\theta)`$. The occupancy integral $`\beta\in(0,1)`$ forces all limit points of $`a_\theta`$ into $`[0,1]`$ and precludes divergence: for $`a_\theta\le-\delta`$ all fixed $`x>0`$ give occupancy tending to 1, and for $`a_\theta\ge1+\delta`$ all fixed $`x<1`$ give occupancy tending to 0. For any subsequential limit $`a\in[0,1]`$, the mean converges pointwise off $`a`$ to $`\mathbf 1_{x>a}`$, so dominated convergence forces $`a=1-\beta`$. Also $`b_\theta(x)\to x`$ for $`x>0`$. Thus $`z(\theta)\to\int_{1-\beta}^1 x\,dx=\beta-\beta^2/2`$.

For any sequence of indices in the bulk, pass to a subsequence with $`k/n\to\alpha`$ and $`j/(MN)\to x`$, so $`0<x<d_{\max}`$. The two extremes of $`z(\theta)`$ give finite $`\theta_-<\theta_+`$ with $`z(\theta_-)<x<z(\theta_+)`$. For large $`n`$ the corresponding finite-$`N`$ means bracket $`j/M`$. By continuity we can therefore choose $`\theta_N\in[\theta_-,\theta_+]`$ such that simultaneously
```math
 \mathbb E T=r,\qquad \mathbb E X=j .                          \tag{2}
```
Pass to a further subsequence with $`\theta_N\to\theta`$. The occupancy parameters stay uniformly inside their domains on sites with $`m_i/M\in[1/3,2/3]`$, and uniformly below 1 everywhere in the geometric case. All pairs $`(J_i,X_i/M)`$ have uniform exponential moments. Their average covariance tends to a positive definite matrix $`\Sigma`$, by uniform Riemann sums; for positivity, conditional mark variance is positive on every fixed positive-width site range. More explicitly, if $`u_i,v_i`$ are occupancy mean and variance and $`b_i,s_i^2`$ are scaled tilted mark mean and variance, the variance of $`sJ_i+tX_i/M`$ is $`v_i(s+t b_i)^2+t^2 u_i s_i^2`$, and the appropriate averages are positive for all $`(s,t)\ne(0,0)`$.

## 3. Sign of the centered second difference

Let $`p^*(a,b)=\Pr(T=a,X=b)`$ under the saddle in (2). The two-dimensional Fourier bound from the companion note still holds with the tilted marks. For completeness, let $`\psi_i(t)=\mathbb E e^{it U_i}`$. The site squared characteristic modulus at $`(s,t)`$ is at most $`1-2p_i(0)p_i(1)(1-\Re[e^{is}\psi_i(t)])`$, by retaining just the $`J_i=0,1`$ contributions in the independent-copy expansion. For sites in the middle range, $`p_i(0)p_i(1)`$ is bounded below. Their mark probabilities are bounded above and below by constants times the corresponding uniform probabilities, since $`\theta_N`$ stays bounded. Thus $`1-\Re[e^{is}\psi_i(t)]`$ is at least a constant times the same average for a uniform mark. The companion bounds apply: on $`|Mt|\le1`$ the characteristic product is at most $`\exp[-cN(s^2+M^2t^2)]`$; on $`1\le|Mt|\le\pi M`$ it is at most $`\exp(-c'N)`$. The constants here may depend on the bounded parameter interval along the chosen subsequence.

Fix $`h=1`$ or $`h=2`$. By two-dimensional inversion, expand
```math
 p^*(r,j-h)-2p^*(r,j)+p^*(r,j+h).
```
The Fourier multiplier for this combination is $`-4\sin^2(ht/2)`$. Centered at (2) there is no remaining phase. After scaling $`s=u/\sqrt N`$, $`t=v/(M\sqrt N)`$, the centered product tends to $`\exp[-(u,v)\Sigma(u,v)^{\mathsf T}/2]`$, by uniform third moments. Multiplying the second difference by $`M^3N^2`$ yields the limit
```math
 -\frac{h^2}{(2\pi)^2}\int_{\mathbb R^2}
 v^2 e^{-(u,v)\Sigma(u,v)^{\mathsf T}/2}\,du\,dv<0.
```
Indeed $`|M^2N\,4\sin^2(ht/2)|\le h^2v^2`$, so the inner region is bounded by an integrable Gaussian times $`h^2v^2`$. The outer region contributes only a polynomial factor in $`M,N`$ times $`\exp(-c'N)`$, hence tends to zero. The sign is therefore strictly negative eventually.

Divide by $`\Pr(T=r)>0`$; the tilted conditional coefficient at $`j`$ is strictly larger than the arithmetic mean of its neighbors $`j-h,j+h`$, hence larger than their geometric mean. Exponential tilting multiplies each side of the squared inequality by the same positive factor, so the original coefficients satisfy $`p_j^2>p_{j-h}p_{j+h}`$. The compact-subsequence argument proves the uniform assertion: any infinite sequence of failures would admit exactly the subsequence just handled, a contradiction.
