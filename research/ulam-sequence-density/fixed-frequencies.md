# Detecting density at fixed Fourier frequencies

Let $`U`$ be the classical Ulam sequence and $`D`$ its upper Banach
density, the limit of the largest fraction of an interval of length
$`L`$ occupied by $`U`$ as $`L\to\infty`$. Write $`d_N=A(N)/N`$ and

```math
C_N(\theta)=\frac1N\sum_{u\in U,\ u\le N}\cos(2\pi u\theta),
\qquad \theta\in\mathbb R/\mathbb Z.
```

**Proposition.** Put $`d^+=\limsup d_N`$ and $`d^-=\liminf d_N`$.

1. If $`d^+>0`$, there is a fixed nonzero $`\theta`$ with
   $`\liminf_N C_N(\theta)\le -d^+D/(1-D)`$. Thus $`U`$ has density
   zero if and only if $`\liminf_N C_N(\theta)\ge0`$ for every nonzero
   $`\theta`$.
2. If $`d^+>d^-`$, there is a fixed nonzero $`\theta`$ for which the
   difference between the upper and lower limits of $`C_N(\theta)`$ is
   at least $`(d^+-d^-)D/(1-D)`$. In particular, convergence of the
   cosine averages at every nonzero frequency would imply existence of
   the ordinary density.
3. If $`D>0`$, there are finitely many nonzero frequencies
   $`\theta_1,\ldots,\theta_k`$ such that the Ulam terms satisfying
   $`\|u\theta_i\|_{\mathbb R/\mathbb Z}<1/4`$ for every $`i`$
   have upper Banach density zero. Thus the exceptional count is
   $`o(L)`$ uniformly over intervals of length $`L`$.

The frequencies can be rational. The proposition neither identifies
Steinerberger's empirical frequency nor determines $`d^+`$ or $`d^-`$.
Ross's Corollary 5.3 treats a finite-scale negative Fourier
coefficient. Chojecki's Theorems 4.2 and 6.2 relate varying maximizing
phases to a limiting spectrum and to window counts. Here uniqueness
at each selected integer gives an estimate on *all* fixed shifts in
$`U`$ at once. [Ross, Chapter 5](https://asset.library.wisc.edu/1711.dl/6DJJQWLMRTYIH8U/R/file-fb00e.pdf) · [Chojecki](https://www.ulam.ai/research/erdos342-new.pdf) · [Steinerberger](https://arxiv.org/abs/1507.00267)

## A summable correlation on the Ulam shifts

Assume $`D>0`$. We have $`D<1`$ by the [spacing bound](reverse-spacing.md).
Choose intervals $`I_j`$ of lengths $`L_j\to\infty`$ whose Ulam
densities tend to $`D`$. Extend the indicator $`b=1_U`$ by zero on the
nonpositive integers. By a diagonal subsequence the following limits
exist for every integer $`h`$.

```math
c(h)=\lim_j\frac1{L_j}\sum_{n\in I_j} b(n)b(n-h).
```

For every finite $`F\subset U`$, each $`n>2\max F`$ in $`U`$ has at
most one $`h\in F`$ with $`n-h\in U`$. Each such $`h`$ is the smaller
parent, and two choices would give distinct pairs. Bounded initial
terms disappear in the interval mean. Consequently

```math
c(h)\ge0,\qquad \sum_{h\in U}c(h)\le D.
```

Define $`e(t)=\exp(2\pi it)`$. On the circle take a weak limit along a
further subsequence of the finite positive measures

```math
\frac{1}{L_j}\left|\sum_{n\in I_j}(b(n)-D)e(n t)\right|^2\,dt.
```

Their masses are bounded by orthogonality. Their Fourier coefficients
tend to $`c(h)-D^2`$ since cutting off the shifted interval changes
at most $`2|h|`$ terms. Adding $`D^2`$ units of point mass at zero
therefore gives a positive measure $`\sigma`$ with Fourier coefficients
$`c(h)`$, total mass $`c(0)=D`$, and atom $`m_0\ge D^2`$ at zero.
The measure is symmetric since the interval sums used real
coefficients.

Write $`m_\theta=\sigma(\{\theta\})`$ and let $`\nu`$ be the part
left after deleting the at most countably many atoms. Its Fourier
coefficients have vanishing mean square on long intervals, uniformly
in the starting point. Indeed, for any interval $`J`$ of length $`L`$,
expanding the square bounds that mean by

```math
\iint \min\!\left(1,\frac{2}{L|1-e(t-s)|}\right)d\nu(t)d\nu(s).
```

Use the value 1 on the diagonal. This tends to zero by dominated
convergence, since an atomless measure gives the diagonal zero
product measure.

## Recovering the count from the nonzero frequencies

For an interval $`J`$ write $`d_J=|U\cap J|/|J|`$ and use $`C_J`$
for the cosine sum over $`U\cap J`$ divided by $`|J|`$. Average the
identity $`c(h)=\widehat\sigma(h)`$ over $`h\in U\cap J`$, dividing
by $`|J|`$. The sum of the left side is at most $`D`$ before division,
and the atomless part tends to zero by Cauchy–Schwarz. This proves

```math
m_0d_J+\sum_{\theta\ne0}m_\theta C_J(\theta)=o(1)
\qquad (|J|\to\infty)
```

uniformly in the interval. The sum ranges over atoms and converges
absolutely. Their nonzero-frequency mass $`s=\sum_{\theta\ne0}m_\theta`$
is positive, since taking $`J=I_j`$ with $`s=0`$ would give
$`m_0D=0`$. Also $`s\le D-m_0`$, so $`m_0/s\ge D/(1-D)`$.

Along prefix lengths with $`d_N\to d^+`$ extract a further subsequence
on which all the atomic cosine averages converge. Their weighted
mean with weights $`m_\theta/s`$ is $`-m_0d^+/s`$. At least one limit
is at most that mean. This proves the forward direction of part 1.
Its converse uses $`|C_N(\theta)|\le d_N`$. For part 2 take two such
subsequences realizing $`d^-`$ and $`d^+`$. Subtract their limits
in the order low-density minus high-density. Some fixed frequency
has a difference at least $`m_0(d^+-d^-)/s`$. Absolute summability
justifies passing both limits through the sum.

For part 3 choose finitely many nonzero atoms so that the mass of the
remaining nonzero atoms is less than $`m_0/2`$. Where all the chosen
phases have distance less than $`1/4`$ from an integer, their cosines
are nonnegative. The Fourier coefficient of the full atomic part
therefore has real part at least $`m_0/2`$ there. Only finitely many
$`u\in U`$ have $`c(u)\ge m_0/4`$ by summability. At each other Ulam
term in this region, $`|\widehat\nu(u)|\ge m_0/4`$. Uniform mean-square
decay makes the number of these terms $`o(L)`$ in every interval of
length $`L`$.

The density problem now requires an estimate on the actual sequence.
For example, a single fixed angle with strictly negative lower
limit for $`C_N`$ would prove positive upper density. The observed
finite cosine sums give no such infinite-scale bound.
