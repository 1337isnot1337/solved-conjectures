# All deep classes have positive Hessian at every Gaussian scale

Fix any $`N\ge2`$ and any $`\alpha>0`$. In the primal root lattice $`A_{N-1}=\mathbb Z^N\cap\mathbf1^\perp`$, each deepest central class is a nondegenerate strict local minimum of the translated Gaussian mass. This includes both nonreal deepest classes when $`N`$ is odd. The initial root-lattice research note already gave the conclusion for even $`N`$ using the conjugation-invariant phase locus. The proof here gives a single identity for both parities. The remaining finite-rank intermediate-scale question concerns competitors separated from these strict minima. [BMVZ, §1.6](https://arxiv.org/html/2502.08819v2#S1.SS6) · [Tracking issue](https://github.com/1337isnot1337/solved-conjectures/issues/967)

## Exact midpoint curvature

Write $`k=N/2+j`$ for the deepest level, where $`j=0`$ for even $`N`$ and $`j=\pm1/2`$ for odd $`N`$. Let $`K_i`$ be independent integers with probabilities proportional to $`e^{-\alpha(m-1/2)^2}`$, and put $`S=\sum_i K_i`$. At the central class $`c_k`$ the lattice Gaussian induces exactly the law of these variables conditioned on $`S=k`$, up to fixed individual integer shifts. Indeed, with lifts of sum $`k`$, the two quadratic energies using the common centers $`1/2`$ and $`k/N`$ differ by a constant on the constrained hyperplane.

Let $`\psi(t)=\mathbb E\exp(it(K_1-1/2))`$ and $`w(t)=\psi(t)^N\cos(jt)`$. On $`-\pi\lt t<\pi`$, Poisson summation followed by Jacobi's triple product gives the real positive formula
```math
\psi(t)=e^{-t^2/(4\alpha)}
\prod_{r\ge1}\frac{(1-c_r e^{\pi t/\alpha})(1-c_r e^{-\pi t/\alpha})}{(1-c_r)^2},
\qquad c_r=e^{-(2r-1)\pi^2/\alpha}.
```
Indeed the Fourier transform of $`e^{-\alpha x^2}e^{itx}`$ on the half-integer lattice has terms $`(-1)^m e^{-\pi^2 m^2/\alpha+\pi mt/\alpha}`$ after extracting the Gaussian factor. The products and their logarithmic derivatives converge uniformly on compact subintervals. Each of the two logarithmic factors in the numerator has strictly negative second derivative: for $`0\lt u=c_re^{\pm\pi t/\alpha}<1`$ it equals $`-(\pi/\alpha)^2 u/(1-u)^2`$. Therefore
```math
-(\log\psi)''(t)>1/(2\alpha).
```
Also $`\cos(jt)>0`$ throughout the open interval for both parities. The zeros of $`\psi`$ at the endpoints are simple, as the product shows. Thus $`w[-(\log\psi)'']`$ is integrable even for $`N=2`$.

Symmetry gives conditional mean zero to $`K_1-K_2`$. Inverting its second moment, the two single-site second-moment insertions give $`-2\psi''\psi^{N-1}`$, while minus twice the cross term gives $`2(\psi')^2\psi^{N-2}`$. All unconditioned centered moments here are real after taking the even integral against $`\cos(jt)`$. Consequently
```math
\frac12\mathop{\mathrm{Var}}(K_1-K_2\mid S=k)
=\frac{\int_{-\pi}^{\pi}w(t)[-(\log\psi)''(t)]\,dt}
{\int_{-\pi}^{\pi} w(t)\,dt}
>\frac1{2\alpha}.
```
For the original Gaussian mass $`P_\alpha`$, direct differentiation along $`e_1-e_2`$ gives second logarithmic derivative $`-4\alpha+4\alpha^2\mathop{\mathrm{Var}}(K_1-K_2\mid S=k)>0`$. All coordinate permutations fix a central class modulo $`A_{N-1}`$. The gradient on the sum-zero hyperplane therefore vanishes. Permutation invariance makes the Hessian a scalar on this hyperplane, since all diagonal entries of its equivariant ambient extension coincide, as do all off-diagonal entries. The positive root direction proves the assertion in every nonzero tangent direction.

The estimate gives a dimension-independent lower bound at each fixed scale. Expanding the paired logarithmic factors, with $`q=e^{-\pi^2/\alpha}`$ and $`b=\pi/\alpha`$, gives
```math
-(\log\psi)''(t)=\frac1{2\alpha}+2b^2\sum_{l\ge1}\frac{l q^l}{1-q^{2l}}\cosh(blt).
```
This function is strictly greater away from zero than its value at zero, which is $`v_*=\mathop{\mathrm{Var}}K_1`$. The positive weighted average is therefore strictly greater than $`v_*`$. For every unit tangent vector $`v`$ this proves
```math
\nabla^2\log P_\alpha(c_k)[v,v]>4\alpha^2v_*-2\alpha
=(\log\Theta_\alpha)''(1/2)>0,
\qquad \Theta_\alpha(y)=\sum_{r\in\mathbb Z}e^{-\alpha(r-y)^2}.
```
The factor of two between a unit tangent vector and the displayed root direction comes from $`\|e_1-e_2\|^2=2`$. The bound is sharp as a rank-independent lower bound: at fixed $`\alpha`$, the conditional two-site law converges in second moments to the independent midpoint law as $`N\to\infty`$. To see this directly, for bounded values of the two midpoint variables the ratio of the local probabilities for the remaining $`N-2`$ variables and for the full $`N`$ variables tends to one, by the span-one local limit theorem at bounded offset. Fourier inversion bounds that ratio uniformly for all values, and Gaussian tails control the truncated second moments. Thus the conditional variance of their difference tends to $`2v_*`$.

## Global comparison for phase deviations paired about a deep class

Fix either deepest class $`c_k`$. Consider all $`x=c_k+d`$ for which the coordinate residues of $`d`$ are invariant under negation. The product of their phases is one. Thus residues of order two have even multiplicity and the coordinates can be lifted in opposite pairs, with zeros left over. Their lifted sum is zero, so this choice represents the original $`d`$ modulo the root lattice. Then
```math
P_\alpha(c_k+d)\ge P_\alpha(c_k)
```
for every positive scale and every rank, with equality exactly at $`d=0\pmod{A_{N-1}}`$. In particular this compares globally along each whole root line through either deep class. For odd $`N`$ these loci are centered at nonreal scalar phases, and each has $`\lfloor N/2\rfloor`$ continuous parameters before taking their permutation images.

Indeed the offset computation for the midpoint lattice variables gives, up to the same positive constant for all $`d`$ in the zero-sum hyperplane,
```math
P_\alpha(c_k+d)= e^{-\alpha\sum_i d_i^2}\int_{-\pi}^\pi e^{-ijt}
\prod_i\psi(t-2i\alpha d_i)\,dt .
```
The cross term in the spatial Gaussian is $`2\alpha\sum_i d_i(K_i-1/2)`$ because $`\sum_i d_i=0`$. For a pair $`d,-d`$ the corresponding factors in the integral are complex conjugates. Unpaired zero factors are real and positive on the interior of the interval. The full real product is even in $`t`$, leaving the nonnegative weight $`\cos(jt)`$. By analytic continuation of the Jacobi product to $`t+2i\alpha d`$, the Gaussian prefactor gains exactly $`e^{\alpha d^2}`$ in modulus. The two factors of each Jacobi pair have moduli $`|1-c_re^{\pm bt}e^{\pm2\pi i d}|`$, at least $`1-c_re^{\pm bt}`$. Hence $`e^{-\alpha d^2}|\psi(t+2i\alpha d)|\ge\psi(t)`$, strictly at every interior $`t`$ if $`d\notin\mathbb Z`$. Multiplying these comparisons proves both the inequality and equality characterization.

## The neighboring central classes in both parities

For even $`N`$, the two adjacent central levels $`N/2\pm1`$ also have strictly higher mass than $`N/2`$ at every scale. Define for real $`s\in[0,1]`$ the interpolation
```math
G(s)= e^{\alpha s^2/N}\int_{-\pi}^{\pi}\psi(t)^N\cos(st)\,dt,
\qquad D(t)=\log\psi(t)+t^2/(4\alpha).
```
At integer offsets this agrees with the central-class Gaussian mass up to a single positive factor. The function $`D`$ is even with $`D''<0`$ by the product, so $`D'(t)<0`$ for $`0\lt t<\pi`$. Integration by parts has zero boundary term from $`\psi(\pm\pi)=0`$. It yields
```math
e^{-\alpha s^2/N}G'(s)
=-2\alpha\int_{-\pi}^{\pi}D'(t)\psi(t)^N\sin(st)\,dt>0
\qquad(0\lt s\le1).
```
The sign follows on the positive half-interval, with an even integrand after including the minus sign. Hence $`G(1)>G(0)`$ and inversion covers the negative neighbor.

For odd $`N\ge3`$, the neighboring scalar levels $`N/2\pm3/2`$ have strictly higher mass than the two deepest ones as well. Write $`\psi_\gamma`$ for the preceding characteristic function at scale $`\gamma`$. On $`0\lt t<\pi`$ put $`R(t)=\psi_\alpha(t)^N/\psi_{\alpha/N}(t)`$. The Gaussian factors cancel. Taking logarithmic derivatives of the Jacobi factors gives
```math
-(\log R)'(t)=2Nb\sum_{\substack{l\ge1\\N\nmid l}}
\frac{q^l}{1-q^{2l}}\sinh(blt)>0.
```
Indeed, the reference has parameters $`Nb,q^N`$, so exactly the multiples of $`N`$ disappear from the sum for $`-N(\log\psi_\alpha)'\!+(\log\psi_{\alpha/N})'`$. Consider the probability measure on $`[0,\pi]`$ of density proportional to $`\psi_{\alpha/N}(t)\cos(t/2)`$. Its expectation of $`h(t)=\cos(3t/2)/\cos(t/2)=2\cos t-1`$ equals $`e^{-2\alpha/N}`$, by Fourier inversion for one half-integer discrete Gaussian. The functions $`R,h`$ are both strictly decreasing, so their covariance is strictly positive. This follows also by integrating $`(R(t)-R(u))(h(t)-h(u))`$ against two independent copies. Hence
```math
\frac{\int_0^\pi\psi_\alpha(t)^N\cos(3t/2)\,dt}
     {\int_0^\pi\psi_\alpha(t)^N\cos(t/2)\,dt}
> e^{-2\alpha/N}.
```
The tilt multiplier between these two central-class masses is $`e^{2\alpha/N}`$, proving the strict comparison. Negating the classes gives the other neighbor. This comparison controls the first scalar levels beyond the deepest. The [all-central theorem](ALL-CENTRAL.md) orders the remaining scalar levels in every rank.

## Central comparisons in ranks four, five, and six

Write $`g_k(\alpha)=P_\alpha(c_k)`$ and $`s=\pi^2/\alpha`$. Poisson summation on the root lattice, followed by grouping the reciprocal lattice into its $`N`$ root cosets, gives
```math
g_k(\alpha)=\frac{(\pi/\alpha)^{(N-1)/2}}{\sqrt N}
\sum_{l=0}^{N-1} g_l(s)\cos(2\pi kl/N).
```
Indeed $`c_k\cdot c_l=-kl/N\pmod1`$ and negation identifies complementary cosets. The positive Fourier weights also show $`g_0>g_k`$ for every nonzero residue $`k`$. For $`N=5`$ the deepest classes have $`k=2,3`$ and the neighbor comparison rules out $`k=1,4`$. This gives a strict ordering of all three levels.

For $`N=6,7`$ we already know $`g_2(\alpha)>g_3(\alpha)`$ for every $`\alpha>0`$. In the transform for this difference the coefficient of $`g_0(s)`$ vanishes. Grouping opposite indices leaves three coefficients, of signs $`+,-,+`$ respectively, since before applying multiplicities at $`l=1,2,3`$ they equal
```math
\cos(4\pi l/N)-\cos(6\pi l/N)=2\sin(5\pi l/N)\sin(\pi l/N).
```
Their sum is zero by summing each nontrivial character separately. The positive difference is a positive multiple of $`A(g_1(s)-g_2(s))+C(g_3(s)-g_2(s))`$, with $`A,C>0`$. Since $`g_3(s)-g_2(s)<0`$, we obtain $`g_1(s)>g_2(s)`$. The strict ordering thus holds for every $`s>0`$. In these three ranks a counterexample to universality would have to be a noncentral translate. The underlying coset theta identities are classical. [Conway–Sloane, Chapter 4](https://link.springer.com/book/10.1007/978-1-4757-2016-7) · [Elkies on root-lattice coset theta formulas](https://people.math.harvard.edu/~elkies/M272.19/sep30.pdf)

A bounded primary-source check under “deep holes”, “local minima”, “positive Hessian”, “all scales”, “type A”, Gaussian and translated theta located BMVZ’s sufficient-large-scale local uniqueness and the earlier even-$`N`$ repository calculation. The two lowest ranks and rank three have established all-scale global classifications. The argument above proves strict local minimality in the remaining odd-$`N`$ cases as well. It does not compare all translates in the still open finite-rank range. [BMVZ, §2.2](https://arxiv.org/html/2502.08819v2#S2.SS2) · [Jacobi’s triple product](https://dlmf.nist.gov/20.5)

[Independent review](LOCAL-AND-SYMMETRIC-REVIEW.md) · [Exact finite checks](check_central_order.py)
