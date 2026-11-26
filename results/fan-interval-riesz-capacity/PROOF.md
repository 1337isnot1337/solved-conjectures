# The Clark–Laugesen interval capacity-ratio conjecture

For a compact set $`K\subset\mathbb R`$ and real $`t>-1`$, write
```math
 C_t(K)=\sup_{\mu\in\mathcal P(K)}
       \mathcal M_t(|X-Y|),\qquad X,Y\stackrel{\rm iid}{\sim}\mu,
```
where $`\mathcal M_t(Z)=(\mathbb E Z^t)^{1/t}`$ for $`t\ne0`$
and $`\mathcal M_0(Z)=\exp(\mathbb E\log Z)`$. Use the usual
extended conventions, in particular mean zero for an infinite
negative moment. This is the Riesz capacity denoted
$`\mathop{\mathrm{Cap}}\nolimits_{-t}(K)`$ in the original sources, with $`t=0`$
the logarithmic capacity.

**Theorem.** Let $`I=[0,1]`$. For every $`-1<r<s<1`$ and compact
$`K\subset\mathbb R`$ with $`C_s(K)>0`$,
```math
 \frac{C_r(K)}{C_s(K)}\le \frac{C_r(I)}{C_s(I)}.
 \tag{1}
```
If $`s>0`$, equality holds exactly for nondegenerate closed intervals
up to translation and scaling. If $`s\le0`$, equality holds
exactly for sets that contain a nondegenerate closed interval $`J`$
and whose remainder $`K\setminus J`$ has zero inner
$`(-s)`$-Riesz capacity (logarithmic when $`s=0`$).
The case of two negative Riesz exponents was posed explicitly in
[Fan, *Riesz capacity ratios with negative exponents*, Conjecture 4.1](https://arxiv.org/html/2609.11186v1#S4.SS1).
The theorem covers the full one-dimensional nontrivial parameter
range of [Clark–Laugesen, *Maximizing Riesz capacity ratios: conjectures
and theorems*, Conjecture 12](https://arxiv.org/pdf/2410.14809#page=10);
the simple endpoint cases are recalled in §6.

The key is a comparison of conditional interval averages. A
suitable joint distribution for the two endpoints of an interval
can be realized by observing a uniform point through two
independent exponential offsets in log-odds coordinates. The
exponent parameter changes only the distribution of the offsets'
common rate. The comparison then follows from explicit
addition of independent noise.

## 1. Interval equilibrium

For $`-1<t<1`$, let $`\mu_t`$ be the probability law on $`I`$ with
density proportional to $`[x(1-x)]^{-(1+t)/2}`$, and set
$`\alpha_t=(1-t)/2`$. This is the beta law with both parameters
$`\alpha_t`$. It is the interval equilibrium in the above convention.
Here is a derivation to fix both its normalization and its range.

For $`0<t<1`$, differentiating the potential at $`z\in(0,1)`$
reduces to the difference of a left fractional integral and its
reflection. With $`a=\alpha_t`$, the left integral, omitting its
constant prefactor, is
```math
 \int_0^z (z-x)^{t-1}[x(1-x)]^{a-1}\,dx
 = z^{-a}(1-z)^{-a}B(a,t).
```
Indeed substitute $`x=zu`$, then
$`v=(1-z)u/(1-zu)`$, using $`a+t=1-a`$.
The expression is reflection-symmetric, so the potential is
constant. The differentiated kernel is locally integrable
for $`t>0`$, and the density is smooth on interior compact
subintervals, justifying this differentiation. For any fixed
interior $`z`$ the potential $`\int |z-x|^t d\mu_t(x)`$
is holomorphic in the strip $`-1<\Re t<1`$ by dominated
integration on compact substrips, including the beta
normalizing factor. Hence it is constant in $`z`$ throughout
that strip by the identity theorem. At $`t=0`$, taking its
parameter derivative gives constancy of
$`\int\log|z-x|\,d\mu_0(x)`$; the derivative of the normalized
mass contributes zero. These potentials extend continuously
to the two endpoints for the stated real parameter range.
For example near $`0`$, the potentially singular integral
over $`x<2z`$ is $`O(z^{a+t})`$ for a negative power, by
scaling, and $`a+t=(1+t)/2>0`$; the logarithmic analogue is
$`O(z^a(1+|\log z|))`$. On the other part, use dominated
convergence, or first restrict outside a fixed neighborhood of zero.

For completeness, the constant-potential law is an optimizer.
The signed-measure energy of $`d^t`$ for $`0<t<1`$, and of
$`\log d`$ when $`t=0`$, is nonpositive on measures of mass
zero; the energy of $`d^t`$ for $`-1<t<0`$ is nonnegative.
These signs follow by representing the kernels respectively by
positive multiples of
```math
 \int_0^\infty(1-e^{-u d^2})\,\frac{du}{u^{1+t/2}},\qquad
 -\tfrac12\int_0^\infty(e^{-u d^2}-e^{-u})\,\frac{du}{u},
 \qquad
 \int_0^\infty e^{-u d^2}\,\frac{du}{u^{1+t/2}}.
```
The Gaussian quadratic form is nonnegative, as follows by
expanding $`e^{-u(x-y)^2}=e^{-u x^2}e^{-u y^2}e^{2uxy}`$
into a positive-coefficient sum of squares. For two finite-energy
laws on $`I`$ where one has the constant potential, the cross
energy is finite, justifying separate integration of the signed
terms. Expansion about $`\mu_t`$ cancels the cross term.
The signs give the asserted optimizer, using minimization of raw
energy when $`t<0`$. The same Gaussian argument gives strictness
for a nonzero signed difference: the Gaussian quadratic form can
vanish only if all polynomial moments of $`e^{-u x^2}`$ times
that difference vanish, which forces it to be zero on a compact
set. This is the standard potential-theoretic equilibrium test.

Put $`U_t=\int |x-y|^t d\mu_t(x)d\mu_t(y)`$, with $`U_0=1`$.
For $`t\ne0`$, evaluation at $`z=0`$ gives
```math
 C_t(I)^t=U_t
 =\frac{B((1+t)/2,(1-t)/2)}{B((1-t)/2,(1-t)/2)}
 =\frac{\Gamma((1+t)/2)\Gamma(1-t/2)}{2^t\sqrt\pi}.
 \tag{2}
```
For $`t=0`$, the arcsine law's logarithmic capacity is $`1/4`$,
also obtained by differentiating the middle formula at zero.
These are the classical interval formulas; see also Fan, §4.1.

## 2. The observation law

Write $`w(z)=\log(z/(1-z))`$ and let $`\ell(u)=1/(1+e^{-u})`$
be its inverse. Put $`\beta=1-t\in(0,2)`$. Use the following
observation model with state $`z\in(0,1)`$:
1. Select an integer $`j\ge0`$, independently of $`z`$, with probabilities
```math
 p_\beta(j)=\frac1{Z_\beta}
   \frac{(\beta)_j}{j!\,(j+\beta/2)^2},
 \qquad \lambda_j=j+\beta/2,
```
where $`Z_\beta`$ normalizes the sum and $`(\beta)_j`$ is the
rising factorial. The sum is finite since its terms are
$`O_\beta((1+j)^{\beta-3})`$.
2. Independently sample $`E,F`$ exponential of rate $`\lambda_j`$.
The observed endpoints in log-odds coordinates are
$`A=w(z)-E,\ B=w(z)+F`$, and the observation is $`(j,A,B)`$.
Set $`x=\ell(A)`$ and $`y=\ell(B)`$.

With uniform prior $`dz`$, the conditional law of $`z`$ given
$`(j,A,B)`$ is uniform on $`(x,y)`$. Indeed its likelihood
with respect to $`dA\,dB`$ is the constant
$`\lambda_j^2 e^{-\lambda_j(B-A)}`$ times
$`\mathbf1_{\{x<z<y\}}`$. In particular the posterior does not
depend on $`j`$ once the endpoints are fixed.

The marginal law of $`(x,y)`$, denoted $`\pi_t`$, is the ordered
pair of $`\mu_t`$ samples tilted by their distance to the power $`t`$:
```math
 \pi_t(dx\,dy)=
 \frac{2 (y-x)^t}{U_t}\,\mathbf1_{\{0\lt x\lt y<1\}}
                   \,d\mu_t(x)d\mu_t(y).
 \tag{3}
```
To verify (3), sum over $`j`$ after integrating the likelihood
over $`z`$: the log-odds endpoint density is proportional to
```math
 (y-x)\sum_{j\ge0}\frac{(\beta)_j}{j!}e^{-(j+\beta/2)(B-A)}
   =(y-x)\big[2\sinh((B-A)/2)\big]^{-\beta}.
```
Use
$`2\sinh((B-A)/2)=(y-x)/\sqrt{x(1-x)y(1-y)}`$
and $`dA\,dB=dx\,dy/[x(1-x)y(1-y)]`$. This gives the density
in (3) up to the constant, which is fixed by normalization.

## 3. Addition of noise makes the exponent increase

For $`\beta'>\beta`$, the index law $`p_{\beta'}`$ is stochastically
larger than $`p_\beta`$. In fact
```math
 \frac{p_\beta(j+1)}{p_\beta(j)}
 = \frac{j+\beta}{j+1}
   \left(\frac{j+\beta/2}{j+1+\beta/2}\right)^2
```
increases in $`\beta`$. Therefore $`p_{\beta'}(j)/p_\beta(j)`$
is increasing in $`j`$, which gives the claimed order
(by comparing the averages of this ratio below and above
any fixed threshold). Couple the two index laws monotonically
by inverse distribution functions. For $`r<s`$ this supplies
a coupling $`j_r\ge j_s`$ and hence $`\lambda_r>\lambda_s`$.

Given the observation with exponent $`r`$, sample $`j_s`$ from
this coupling conditionally on $`j_r`$, without using the state.
Independently widen each endpoint in log-odds coordinates by
a random increment that is zero with probability
$`\lambda_s/\lambda_r`$ and otherwise an independent
exponential of rate $`\lambda_s`$. The sum of an exponential of
rate $`\lambda_r`$ and such an increment is exponential of rate
$`\lambda_s`$, as is seen by multiplying their Laplace transforms:
```math
 \frac{\lambda_r}{\lambda_r+u}
 \left(\frac{\lambda_s}{\lambda_r}
       +\left(1-\frac{\lambda_s}{\lambda_r}\right)
        \frac{\lambda_s}{\lambda_s+u}\right)
 =\frac{\lambda_s}{\lambda_s+u}.
```
The two resulting offsets are independent conditionally on
the two indices, and their joint law depends just on $`j_s`$.
Thus the observation for $`s`$ is obtained by a randomization
of the observation for $`r`$ that does not use the state, for
every prior. This is the only information-comparison fact needed
([Blackwell’s terminology](https://doi.org/10.1214/aoms/1177729032));
the above construction proves the exact comparison directly.

## 4. Monotone transport and arbitrary Stieltjes derivatives

Let $`Q:(0,1)\to\mathbb R`$ be any bounded nondecreasing function
and let $`dQ`$ be its positive Stieltjes derivative on $`(0,1)`$.
For $`(x,y)`$ with $`0<x<y<1`$ put
$`D_Q(x,y)=(Q(y)-Q(x))/(y-x)`$.
The pushforward of $`dQ`$ through the observation channel,
relative to the law with uniform prior, has Radon–Nikodym
derivative $`D_Q(x,y)`$. Indeed its observation density replaces
the integral $`y-x=\int_x^y dz`$ in §2 by $`\int_{(x,y)}dQ(z)`$;
these agree with the specified chord numerator at all continuity
endpoints of $`Q`$, which have full endpoint measure. This argument
works for singular derivatives or jumps as well as ordinary
absolutely continuous transport functions.

Now couple the observations $`O_r,O_s`$ by the state-independent
randomization of §3 with uniform prior. Write $`D_r,D_s`$ for
the corresponding chord averages, with marginal laws given by
$`\pi_r,\pi_s`$. The density identity and state independence give
```math
 D_s=\mathbb E[D_r\mid O_s].
 \tag{4}
```
For detail, for every bounded test function of $`O_s`$, integrate
it against the law from the prior $`dQ`$; first using the
$`s`$-channel, then using the $`r`$-channel followed by the
same randomization. The two results are respectively its
integrals against $`D_s`$ and against $`D_r`$ under the
uniform-prior coupling. Both densities are integrable, with
mean $`dQ((0,1))`$.

For $`r<1`$, (4) and conditional Jensen yield
$`\mathcal M_r(D_s)\ge \mathcal M_r(D_r)`$:
$`u^r`$ is concave when $`0<r<1`$; it is convex when $`r<0`$,
in which case the $`1/r`$ power reverses the sign; and
$`\log`$ is concave when $`r=0`$. The claim also follows
with extended zero values by approximation. Monotonicity
of power means for the same nonnegative random variable
therefore gives
```math
 \mathcal M_s(D_s)\ge\mathcal M_r(D_s)
                   \ge\mathcal M_r(D_r).
 \tag{5}
```

## 5. Capacity comparison and equality

If $`C_r(K)=0`$, then (1) is immediate and strict. Otherwise
take an equilibrium law $`\nu_r`$ on $`K`$, which exists by
compactness, continuity when $`r>0`$, and lower semicontinuity of
the minimized energy (negative log energy at $`r=0`$) when $`r\le0`$. Choose the increasing quantile map
$`Q`$ sending $`\mu_r`$ to $`\nu_r`$. It takes values in $`K`$
almost everywhere for every $`\mu_t`$, since these beta laws
have positive Lebesgue densities. Thus $`Q_\#\mu_s`$ is an
admissible competitor for $`C_s(K)`$. Equation (3) and (2)
give, for all $`t\in(-1,1)`$,
```math
 \mathcal M_t(|Q(X)-Q(Y)|)
    = C_t(I)\,\mathcal M_t(D_t),
       \qquad X,Y\stackrel{\rm iid}{\sim}\mu_t .
 \tag{6}
```
For nonzero $`t`$ this is just cancellation of $`(y-x)^t`$
in the tilted measure. For $`t=0`$, subtract the expected
logarithmic interval distance; its integral is finite and
$`\pi_0`$ is the original ordered law.

For $`t=r`$ the left-hand side of (6) is $`C_r(K)`$.
For $`t=s`$ it is at most $`C_s(K)`$. The inequalities (5)
give (1).

Suppose equality holds. The power means with distinct
parameters in the first inequality of (5) are equal and
positive; strictness of the power-mean inequality forces
$`D_s`$ to be a positive constant almost surely. The endpoint
density (3) is positive in the open ordered triangle.
Hence $`Q(y)-Q(x)=c(y-x)`$ for Lebesgue-almost every pair
there, which by Fubini makes $`Q`$ affine almost everywhere.
It follows that its full-interval image $`J`$ under that
affine map is the support of $`\nu_r`$, and therefore
$`J\subseteq K`$. Further, (6) and the equality force
$`C_s(K)=C_s(J)`$. If $`s>0`$, a point outside $`J`$ sees a
strictly larger $`s`$-potential of the equilibrium on $`J`$
than an endpoint of $`J`$, so adding a small mass at that point
increases energy and capacity. It follows that $`K=J`$.

If $`s<0`$, the $`s`$-potential of the equilibrium on $`J`$
strictly decreases outside either endpoint, so any finite
$`s`$-energy probability supported on a compact subset of
$`K\setminus J`$ decreases the raw energy upon a sufficiently
small mixture, strictly increasing $`C_s`$. For $`s=0`$
the logarithmic potential increases outside the endpoints,
and the same perturbation increases the mean logarithmic
distance. Thus $`K\setminus J`$ must have zero inner
$`(-s)`$-capacity in either case. Conversely, if that remainder
has zero inner capacity, every finite-energy law on $`K`$
at parameter $`s`$ gives it zero mass: otherwise a restricted
and normalized law on some compact subset a positive distance
from $`J`$ would have finite energy. The same is true at
parameter $`r<s`$ by power-mean monotonicity. So the capacities
at both orders are those of $`J`$, as claimed.

## 6. Endpoints and literature scope

In the original sign convention set $`p=-s,\ q=-r`$.
This proves Conjecture 12 in dimension one for $`-1<p<q<1`$,
including the logarithmic cases. If $`p\le-1`$, then
$`C_{-p}(K)=2^{1/p}\mathop{\mathrm{diam}}(K)`$. Indeed for
$`t\ge1`$ and a distribution on its diameter interval,
replace each coordinate in $`|X-Y|^t`$ by an endpoint
Bernoulli of the same mean, using separate convexity.
Its final moment is at most half the diameter to the
power $`t`$, attained by equal endpoint weights. Comparing
$`K`$ to its containing diameter interval now proves the
original ratio inequality for $`p\le-1,\ q<1`$ directly.
The fixed-length limiting assertion is already
Clark–Laugesen's Theorem 2, not a new result.

The exact target is Fan's Conjecture 4.1 and the full
one-dimensional branch of Clark–Laugesen Conjecture 12;
this is **not** the multidimensional ball conjecture.
[Clark–Laugesen's subsequent one-dimensional capacitary
Brunn–Minkowski theorem](https://arxiv.org/abs/2611.17640)
compares Minkowski sums at a fixed exponent, and identifies
a prior technical report for the opposite, two-point
maximality problem. Neither of those statements compares
a compact set's normalized capacities across the exponents
in (1). Searches for the exact interval ratio, the Fan
conjecture number, and the posterior-interval method did not
identify a previous proof. The conventional interval
equilibrium and the abstract information-comparison terminology
are credited above; the new ingredient here is the explicit
log-odds observation and its ordered exponential-rate mixture.
