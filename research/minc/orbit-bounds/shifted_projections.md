# Maximum permanent on a unitary orbit

## An exact two-eigenvalue family

Let $P$ vary over all complex Hermitian projections of rank $r$ in dimension
$n=mr$, with $m,r$ positive integers. For any real $a,b\ge0$,

```math
\max_P\mathop{\mathrm{per}}(aI+bP)
=\left[\sum_{j=0}^m {m\choose j} j!\, a^{m-j}(b/m)^j\right]^r .
```

One maximizing projection consists of $r$ diagonal blocks $J_m$, where
every entry of $J_m$ equals $1/m$. This evaluates the full unitary orbit
for these spectra, including complex projections with arbitrary diagonal.
Both multiplicities may grow. [Minc's Problem 1](https://yair-lavi.com/mincs-list/problem-1/index.html)
asks for all spectra and remains open in its structural formulation.

## A bound valid on every positive semidefinite orbit

Suppose $A=aI+bC$, where $0\le C\le I$ in the Hermitian order,
$b>0$ and $a\ge0$. Write $s=\mathrm{tr}(C)/n$ and let $X$ have the
exponential distribution of mean one. If $s>0$, then

```math
\mathop{\mathrm{per}} A\ \le
\ \left[\mathbb E(a+bsX)^{1/s}\right]^{ns}. \tag{1}
```

For a nonscalar positive semidefinite matrix one can take $a$ to be its
smallest eigenvalue and $b$ its spectral spread. The scalar case has
permanent $a^n$ if $bC=0$.

**Gaussian comparison.** Write $c_i=C_{ii}$. First suppose every
$c_i>0$. Let $Z$ be a centered circular complex Gaussian with covariance
$C$, allowing singular covariance. For an independent standard circular
Gaussian vector $W$, the covariance of $\sqrt{a}W+\sqrt b Z$ is $A$.
The complex Gaussian moment formula, followed by conditioning on $Z$, gives

```math
\mathop{\mathrm{per}} A
=\mathbb E\prod_i |\sqrt{a}W_i+\sqrt b Z_i|^2
=\mathbb E\prod_i (a+b|Z_i|^2).
```

In the moment formula the surviving pairings between unconjugated and
conjugated coordinates are indexed by permutations. Each marginal
$|Z_i|^2$ has law $c_iX$. Use the Gaussian Hölder inequality with exponent
$p_i=1/c_i\ge 1$ for the real pair consisting of the real and imaginary
parts of $Z_i$. The required covariance domination holds: in real
coordinates the covariance of $Z$ is half the realification of $C$,
whereas the block diagonal of its marginal covariances multiplied by
$p_i$ equals $I_{2n}/2$. This proves

```math
\mathop{\mathrm{per}} A\le\prod_i
\left[\mathbb E(a+b c_i X)^{1/c_i}\right]^{c_i}. \tag{2}
```

This comparison is an application of [Chen, Dafnis and Paouris,
Theorem 1(i)](https://arxiv.org/abs/1306.2410).

**Concavity in the diagonal.** Set $g(y)=(a+by)e^{-y}$ on $y\ge0$ and
extend it by zero to the negative half-line. It is log-concave. For $t>0$
let

```math
H(t)=t\int_0^\infty g(y)^t\,dy
=\int_0^\infty g(z/t)^t\,dz .
```

The integrand is jointly log-concave in $(z,t)$ since its logarithm
is the perspective of the concave function $\log g$. Prékopa's theorem
gives concavity of $\log H(t)$. Its perspective, restricted to the line
with first coordinate one, gives concavity of
$h(c)=c\log H(1/c)$ on $c>0$. Substitution in the integral gives
$H(1/c)=\mathbb E(a+bcX)^{1/c}$. Jensen applied to (2) gives (1).
This is the one-dimensional normalized integral-of-powers theorem of
[Fradelizi, Madiman and Wang](https://arxiv.org/abs/1508.04093).
For zero diagonals take $C_\epsilon=(1-\epsilon)C+\epsilon I$,
$0<\epsilon<1$, in (1) and pass to the limit. Its right side is continuous
at every $s>0$ by the integral formula. If $s=0$, positivity forces $C=0$.

**Attainment.** For the projection orbit take $s=1/m$. In one block
$J_m$ the field $Z$ can be chosen identical in every coordinate,
equal to one standard complex Gaussian divided by $\sqrt m$.
The permanent of $aI_m+bJ_m$ is therefore
$\mathbb E(a+bX/m)^m$. The $r$ blocks multiply, giving (1) with equality.
Expanding and using $\mathbb E X^j=j!$ proves the displayed formula.
For $a=0$ the maximum is $b^n(m!/m^m)^r$. For $b=0$ the same
formula follows directly.

## Attribution and outstanding cases

The Gaussian inequality and normalized log-concavity are established
results. The [earlier repository audit](../combinatorial/unitary_orbit_source_audit.md)
records Holden's elimination method, his formula for one exceptional
eigenvalue, and the classical Marcus–Minc bound and equality theorem.
When $r=1$ the orbit here is covered by that exceptional-spectrum work.
[Lavi's bounded-rank stochastic theorem](https://hexagonmath.org/pdf/2611.00353v1)
also has equal-block maximizers in divisible dimensions. Its nonnegative
stochastic hypotheses do not hold for general Hermitian projections.
The later [vector-packing paper](https://hexagonmath.org/pdf/2611.00449v1)
bounds the permanent of the entrywise modulus using row or column
absolute sums, which can exceed one for a projection. This argument uses
the spectral contraction in Gaussian Hölder.

Searches for maximum permanents of projections, bounded-rank PSD
contractions, two-eigenvalue orbits, and Gaussian Brascamp–Lieb permanent
bounds found the above inputs and comparisons. This is a bounded search.
These identities carry no historical priority claim. For arbitrary
spectra (1) is only an upper bound. Even for a projection with $r$ not
dividing $n$, the proof supplies no matching construction in general.
