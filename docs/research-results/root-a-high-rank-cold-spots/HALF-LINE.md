# One lower Gaussian cutoff for root type A, in both parities

27 November 2026 UTC. Codex in the WadeDavis research session. The proof uses the conditioning identities established in the [compact-interval argument](PROOF.md). The full all-scale question is tracked in [issue #967](https://github.com/1337isnot1337/solved-conjectures/issues/967).

**Theorem.** For each $`a>0`$ there exists $`N_a`$ such that for every $`N\ge N_a`$ and every $`\alpha\ge a`$, the only minimizing classes for the Gaussian sum on $`A_{N-1}=\mathbb Z^N\cap\mathbf 1^\perp`$ are the deep classes $`c_k`$ with $`k`$ nearest to $`N/2`$. There is consequently an absolute $`A`$ such that for every rank and every $`\alpha\ge A`$ in this standard normalization, the minimizing classes are precisely the deep classes. For the latter conclusion take $`a=1`$ and apply the fixed-rank theorem to the finitely many remaining ranks. [Bachoc, Moustrou, Vallentin and Zimmermann, Theorem 1.3 and its proof](https://arxiv.org/html/2502.08819v2#S1.SS5)

## A lower bound at the integer mean

If $`S`$ has a log-concave mass function $`f`$ on the integers, finite variance $`V`$ and integer mean $`m`$, the piecewise-linear interpolation of $`\log f`$ is concave on its support. Jensen gives $`\log f(m)\ge-H(S)`$. If $`U`$ is independent and uniform on an interval of length one centered at zero, then $`h(S+U)=H(S)`$ by disjointness of the unit bins. The Gaussian maximizes differential entropy at fixed variance, so

```math
f(m)\ge[2\pi e(V+1/12)]^{-1/2}.
```

Sums of independent integer Gaussians have log-concave mass functions. For a self-contained proof, the Toeplitz matrix with entries $`f(j-i)`$ for any strictly positive log-concave $`f`$ has nonnegative two-by-two minors by monotonicity of successive ratios. Multiplying two such convolution kernels preserves nonnegativity of each minor by Cauchy–Binet, first summing over a finite set of intermediate integers and then taking limits. The adjacent minors of the product give log-concavity of the convolution. [Bobkov, Marsiglietti and Melbourne, Corollary 4.3](https://www-users.cse.umn.edu/~bobko001/papers/2022_CPC_BMM_Discrete.log-concave.distributions.pdf)

## A penalty uniform up to infinite parameter

Use $`\Theta_\alpha(y)=\sum_{r\in\mathbb Z}e^{-\alpha(r-y)^2}`$, $`K_y`$ with normalized singleton weights, and $`m(y),v(y)`$ for its mean and variance. A star denotes the midpoint $`y=1/2`$. As in the compact proof, Jacobi's product gives $`v(y)\le v_*`$ and $`v_*>1/(2\alpha)`$ for every $`\alpha`$. The midpoint law is symmetric and supported at distance at least $`1/2`$ from its mean, so $`v_*\ge1/4`$. It has bounded moments of every order uniformly for $`\alpha\ge a`$, by comparison of each paired weight with the central pair. In particular $`\inf_{\alpha\ge a}(v_*-1/(2\alpha))>0`$ by continuity on a compact interval and $`v_*\ge1/4`$ on the remaining tail.

Write each shifted singleton center as $`y=\ell+1/2+z/\alpha`$ with $`|z|\le\alpha/2`$. Set $`g_\alpha(z)=\log(\Theta_\alpha(y)/\Theta_*)`$. There is a constant $`c_a>0`$ with

```math
g_\alpha(z)\ge c_a\min(z^2,|z|).
```

Indeed, dividing the paired summands about the half integer by their midpoint weights shows that $`g_\alpha(z)\ge\log\cosh z-z^2/\alpha`$. The right side is at least $`|z|/2-\log2`$ throughout the allowed interval. For $`|z|\le4\log2`$, the minimum of $`\log\cosh z/z^2`$, with its removable value at zero, is positive. For all sufficiently large $`\alpha`$ this proves the required quadratic bound there. On a compact interval $`a\le\alpha\le A`$ the unique midpoint minimum and strict positive curvature give the same conclusion by compactness.

If $`|z|\le C`$, the singleton law after subtracting $`\ell`$ is the midpoint law tilted by $`e^{2z(k-1/2)}`$. The two masses at $`k=0,1`$ have a common positive lower bound uniform in $`\alpha\ge a`$ and $`|z|\le C`$. Indeed the total normalizing sum divided by the midpoint weight at zero is bounded by the convergent series $`\sum_{k\in\mathbb Z}e^{-a k(k-1)+2C|k-1/2|}`$. The same series with polynomial multipliers bounds all central moments uniformly. Differentiating in $`z`$ gives $`\partial_z m=2v`$ and $`\partial_z v=2\mathbb E[(K-m)^3]`$, uniformly bounded on this box. Here $`\partial_z m`$ is also bounded away from zero by the adjacent masses.

## Localization in both parities

For $`x\in\mathbf1^\perp`$, choose the unique $`u`$ for which $`y_i=x_i+u`$ makes the sum $`S`$ of the independent $`K_{y_i}`$ have mean zero. Write $`y_i=\ell_i+1/2+z_i/\alpha`$ and let $`J=\sum_i(\ell_i+1/2)`$. Set $`j_0=\mathop{\mathrm{dist}}(N/2,\mathbb Z)`$, equal to zero or one half. Then $`|J|\ge j_0`$ and $`Nu=J+\sum_i z_i/\alpha`$. For any real $`s`$ the triangle inequality gives $`(J+s)^2-j_0^2\ge-2j_0|s|`$. When $`|s|\le j_0`$ use $`|J+s|\ge j_0-|s|`$, and otherwise the right side is at most $`-j_0^2`$. Hence, writing $`D=\alpha Nu^2+\sum_i g_\alpha(z_i)-\alpha j_0^2/N`$,

```math
D\ge\sum_i[g_\alpha(z_i)-|z_i|/N]
\ge(c_a/2)\sum_i\min(z_i^2,|z_i|)-O_a(1/N).
```

For the second inequality absorb the linear cost against the linear penalty for $`|z_i|\ge1`$ when $`N`$ is large. For smaller coordinates complete the square individually at cost $`O_a(N^{-2})`$.

The exact square-completion identities of the compact proof are

```math
P_\alpha(x)=\Theta_*^N e^{\alpha Nu^2+\sum_i g_\alpha(z_i)}\Pr(S=0),
\qquad
P_\alpha(c_{N/2+j_0})=\Theta_*^N e^{\alpha j_0^2/N}\Pr(S_*=N/2+j_0),
```

where the second probability concerns $`N`$ independent midpoint integers. Their two adjacent probabilities are uniformly positive. Fourier inversion, or the Gaussian envelope in the compact proof, gives the upper bound $`O_a(N^{-1/2})`$. The entropy inequality and $`V=\sum_i v(y_i)\le Nv_*=O_a(N)`$ give a lower bound of order $`N^{-1/2}`$ for $`\Pr(S=0)`$. Therefore $`D\le C_a`$ at every global minimizer. The penalty estimate shows $`\max_i|z_i|\le C'_a`$.

The tilted singletons now have uniform moments and two uniformly positive adjacent probabilities. The centered Fourier local limit expansion of the compact proof applies with constants depending only on $`a,C'_a`$, giving $`\Pr(S=0)=(2\pi V)^{-1/2}(1+O_a(N^{-1}))`$. The same expansion applies at the midpoint target, including its bounded shift $`j_0`$. For precision, $`|\phi_i(t)|\le e^{-c_at^2}`$ on $`[-\pi,\pi]`$, from the two adjacent atoms. At small $`t`$, $`\log\phi_i=-v_it^2/2+iO_a(t^3)+O_a(t^4)`$. On $`|t|\le N^{-2/5}`$ bound the integrated real-part error by the Gaussian integral of $`O_a(Nt^4+N^2t^6+t^2)`$, and outside this interval use the envelope. Since $`V\asymp_a N`$, the relative error is $`O_a(N^{-1})`$.

Exact comparison now gives $`D\le \tfrac12\log(V/(Nv_*))+O_a(N^{-1})\le O_a(N^{-1})`$. The lower bound on $`D`$ first puts every $`|z_i|`$ below one, then gives

```math
\sum_i z_i^2=O_a(N^{-1}),\qquad \sum_i|z_i|=O_a(1),\qquad |J|=O_a(1).
```

For the last bound use zero total mean, $`m(\ell_i+1/2)=\ell_i+1/2`$ and the bounded derivative in $`z`$. No expansion of $`e^{\alpha j_0^2/N}`$ is involved.

## Forcing a scalar phase and selecting the level

Swap two $`z_i`$ while keeping their integer parts and the original common tilt $`u`$ fixed, and join the corresponding $`x`$ endpoints by a straight segment. The endpoints have equal energy because they differ by a permutation followed by a root-lattice translation. If $`w_i`$ are the interpolated $`z_i`$, all are $`O_a(N^{-1/2})`$. Re-establish zero tilted mean by adding the same parameter increment $`d`$ to the $`w_i`$, thus using centers $`\ell_i+1/2+(w_i+d)/\alpha`$. The sum to be canceled is $`J+\sum_i h_\alpha(w_i)`$ with $`h_\alpha(z)=m(1/2+z/\alpha)-1/2`$. Since $`h_\alpha(0)=0`$ and $`h'_\alpha=2v`$ has bounds above and below for $`|z|\le1`$, at $`d=\pm(\max_i|w_i|+C_a/N)`$ the mean sums have opposite signs, taking $`C_a>\sup|J|/\inf h'_\alpha`$. Thus $`|d|=O_a(N^{-1/2})`$ and all retilted dimensionless deviations on the whole segment stay $`O_a(N^{-1/2})`$.

The two-site conditional estimate from the compact proof now applies uniformly for every $`\alpha\ge a`$. On bounded deviations of the two integers from their means, apply the local limit to the remaining $`N-2`$ variables and divide by the full probability at its mean. The resulting mass ratio tends uniformly to one. On arbitrary deviations it is uniformly bounded by Fourier inversion for the numerator and the lower local limit for the denominator, so uniform singleton tails handle second moments. Consequently $`\mathrm{Var}(K_i-K_j\mid S=0)=2v_*+o_a(1)`$. The second derivative along $`e_i-e_j`$ is $`4\alpha^2(\mathrm{Var}(K_i-K_j\mid S=0)-1/\alpha)`$, which is positive by the uniform midpoint variance gap. Strict convexity excludes distinct deviations at a minimum.

At a scalar phase the index is $`k=-\sum_i\ell_i`$ modulo $`N`$, so one can choose $`j=k-N/2=-J=O_a(1)`$. For the midpoint characteristic function $`\psi`$, the uniform envelope, variance bounds and moment bounds yield

```math
\frac{\int t^2\psi(t)^N\,dt}{\int\psi(t)^N\,dt}
=\frac{1+o_a(1)}{Nv_*},
\qquad
\frac{\int t^4|\psi(t)|^N\,dt}{\int\psi(t)^N\,dt}=O_a(N^{-2}).
```

The integrals run from $`-\pi`$ to $`\pi`$. At admissible levels, inversion uses $`\cos(jt)`$, valid also for half-integral $`j`$ and odd $`N`$. Expanding these cosines and taking the logarithm of the **probability ratio** gives the following formula while leaving the exact tilt exponent intact:

```math
\log\frac{P_\alpha(c_{N/2+j})}{P_\alpha(c_{N/2+j_0})}
=\frac{j^2-j_0^2}{N}\left(\alpha-\frac1{2v_*}\right)+o_a(N^{-1}).
```

The coefficient has a positive infimum for $`\alpha\ge a`$, by midpoint curvature and $`v_*\ge1/4`$. Nonnearest admissible levels have $`j^2-j_0^2\ge1`$. In odd $`N`$ the nearest two levels tie by inversion symmetry. This proves both parities and the asserted dimension-uniform eventual cutoff.

The earlier bounded search located a separate fixed-rank large-parameter result and the low-rank universal cases. It did not locate the simultaneous half-line conclusion for all sufficiently high ranks. The estimate here still allows the rank threshold to depend on the lower endpoint $`a`$. [BMVZ, §1.6](https://arxiv.org/html/2502.08819v2#S1.SS6)
