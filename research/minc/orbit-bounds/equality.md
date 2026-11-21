# Maximum permanent on a unitary orbit

## Equality in the spectral bound

In the notation of the [bound and value formula](shifted_projections.md),
assume $b>0$ and $s>0$. Equality in (1) holds exactly when, up to a
permutation and unitary diagonal conjugation, $C$ consists of identical
blocks $J_m$, with $m=1/s$ a positive integer. In particular this
classifies every maximizing matrix on each shifted projection orbit
evaluated there. Compactness implies a strict gap below (1) for every
other fixed spectrum. The size of this gap is undetermined.

First, the scalar function $h$ used in Jensen's inequality there is
strictly concave. Indeed $H(t)=t\int g^t$ is positive real analytic
for $t>0$: complex powers of $g$ on its positive set are dominated
locally on the right half-plane, with exponential decay at infinity.
Thus $h$ is real analytic. For $c\ge 1$, concavity of the power
$x^{1/c}$ and Jensen for the logarithm give

```math
\log(bc)+\mathbb E\log X\le h(c)\le\log(a+bc).
```

So $h$ tends to infinity sublinearly. Equality in a nontrivial
concavity chord would force it to be affine first on an interval and
then throughout $(0,\infty)$, which these bounds exclude.
For a zero diagonal, $h(0+)=\log\sup g$ exists and is finite by the
usual limit of integral power means. Here one may bound
$\int g^t\le (\sup g)^{t-1}\int g$ and use a finite interval near
a maximum for the reverse bound. Since $t^{1/t}\to1$, the prefactor
in $H$ does not change the limit. Strict Jensen extends to this finite
endpoint (a chord equality would still give an interior affine interval).
Taking limits in the diagonal bound (2) as in the first note shows that
equality in (1) forces every diagonal to equal $s=c>0$.

It remains to understand a specific equality condition in Gaussian
Hölder. Put $W=\operatorname{im} C$, $p=1/c$,
$f(w)=a+b|w|^2$, and take independent complex Gaussians $Z,Y$ of
covariance $C$. Write $z=\sqrt{1-t} Z$, with $0<t<1$. Conditional
Gaussian Hölder in $Y$ gives

```math
\mathbb E_Y\prod_i f(z_i+\sqrt t Y_i)
\le\prod_i \big[\mathbb E_Y f(z_i+\sqrt t Y_i)^p\big]^{1/p}.
```

Integrate over $Z$ and apply Gaussian Hölder a second time to the
functions on the right. The final upper bound is exactly the right
side of (2), since $z+\sqrt tY$ has covariance $C$. Hence equality
requires the last display to be equality at every $z\in W$ and every
$0<t<1$. Here the conditional gap is continuous in $z$ and the law of
$\sqrt{1-t}Z$ has full support on $W$.

Fix $z$ with all $z_i\ne0$. Write $u_i=\nabla\log f(z_i)$ in real
two-coordinate notation and $T=\frac12\operatorname{realify}(C)$.
The coefficient of $t$ in the right side minus the left side, divided
by $\prod f(z_i)$, is

```math
\frac12\,u^\mathsf{T}
\big[\operatorname{diag}(pT_{ii})-T\big]u.
```

Indeed the pure second derivatives of $f$ cancel. The separate powers
give the terms $(p-1)u_i^\mathsf{T}T_{ii}u_i/2$, and the joint product
subtracts the mixed terms $u_i^\mathsf{T}T_{ij}u_j$ for $i<j$.
These are ordinary Taylor expansions under Gaussian expectation: in
a fixed small neighborhood of $z$ all powers are smooth, and beyond
it the Gaussian tails dominate each polynomial growth bound, including
when $a=0$. As $pT_{ii}=I_2/2$, vanishing of this nonnegative quadratic
form puts the complex vector with entries $z_i/(a+b|z_i|^2)$ in
$E=\ker(I-C)$. Replace $z$ by $Lz$, multiply by $bL$ and let
$L\to\infty$. We have proved

```math
(1/\overline{z_i})_i\in E
\quad\text{for every } z\in W\text{ with all coordinates nonzero}. \tag{3}
```

Partition the coordinates into parallel classes: $i,j$ are in one
class when their coordinate linear functionals restricted to $W$ are
proportional. None is identically zero because $C_{ii}=c>0$. Fix a
class $S$. In its common kernel choose $z_0$ where all coordinates
outside $S$ are nonzero. This is possible because a complex vector
space cannot be covered by a finite union of proper linear subspaces.
If all coordinates lie in $S$, take $z_0=0$. Choose $v\in W$ with
all coordinates nonzero. Use (3) at $z_0+t v$, multiply by real $t$
and let $t\downarrow0$. This gives a vector in $E$ supported exactly
on $S$, with entries $1/\overline v_i$ there.

The projection of $W$ to each class is one-dimensional. These
disjoint class vectors therefore span $W$, and belong to $E\subset W$.
It follows that $E=W$ and $C$ is the orthogonal projection onto $W$.
On $S$, both $(v_i)_{i\in S}$ and $(1/\overline v_i)_{i\in S}$ lie on the
same line, hence the $|v_i|$ agree. After phases are removed the
projection on this class is $J_{|S|}$. Its diagonal $1/|S|=c$ forces
the same size in every class. Conversely, these blocks attain (1) by
the Gaussian moment evaluation. Diagonal phases and simultaneous
permutations preserve the permanent.

The proof uses the [Gaussian Hölder theorem of Chen, Dafnis and
Paouris](https://arxiv.org/abs/1306.2410); equality follows here by
conditioning and extracting its quadratic gap for this particular
function. No historical priority is asserted for the equality method.
