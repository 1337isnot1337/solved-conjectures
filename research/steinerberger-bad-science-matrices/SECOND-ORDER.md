# The unconditional second term for bad science matrices

For an $`n\times n`$ real matrix $`A`$ with unit Euclidean row norms,
let $`B(A)=\mathbb E\|A\varepsilon\|_\infty`$ for independent uniform signs
$`\varepsilon`$, and set $`B_n=\max_A B(A)`$.
[Steinerberger, *Bad Science Matrices*](https://arxiv.org/abs/2402.03205)
proved $`B_n\sim\sqrt{2\log n}`$ and asked about the lower-order terms
([*Some Open Problems*, §30](https://faculty.washington.edu/steinerb/openproblems.pdf)).
[Sinha, *The Structure of Extremal Bad Science Matrices*, Theorem 2.2](https://arxiv.org/pdf/2509.10580#page=7)
obtained the logarithmic second term for normalized random sign and
almost-Hadamard constructions, and for the optimal problem under light
entry and covariance assumptions. His §2.5(2) asks to remove those
assumptions.

Here the unconditional answer is
```math
 B_n=\sqrt{2\log(2n)}
      -\frac{\log\log(2n)}{2\sqrt{2\log(2n)}}
      +O\!\left(\frac1{\sqrt{\log n}}\right).
```
More precisely, let $`b_n>0`$ satisfy $`2n\overline\Phi(b_n)=1`$,
where $`\overline\Phi`$ is the standard normal survival function. Then
```math
 \gamma\le
 \liminf b_n(B_n-b_n)
 \le\limsup b_n(B_n-b_n)\le1,
 \tag{1}
```
where $`\gamma`$ is Euler's constant. Explicit deterministic
orthogonal cosine matrices realize the lower endpoint
$`b_n+\gamma/b_n+o(1/b_n)`$ in **every** dimension.
This does not determine the third-order constant of $`B_n`$
or identify the exact maximizing matrices.

## 1. Universal upper bound from the scalar tail

[Pinelis, Theorem 1.1](https://doi.org/10.1214/EJP.v17-2026)
states that for every weighted sum $`S`$ of independent
Rademacher variables with variance $`1`$ and each $`u>0`$,
```math
 \mathbb P(S\ge u)\le\overline\Phi(u)
                         +\frac{C\varphi(u)}{9+u^2},
```
where $`\varphi`$ is the normal density and $`C`$ is absolute.
Each row of any admissible matrix is such a sum; no independence
across rows is used. Reflection and a union bound give
```math
 \begin{split}
 B(A)&\le b_n+\int_{b_n}^\infty
                     \mathbb P(\|A\varepsilon\|_\infty>u)\,du
 \\ &\le b_n+2n\int_{b_n}^\infty\overline\Phi(u)\,du
             +2n C\int_{b_n}^\infty\frac{\varphi(u)}{9+u^2}\,du
 \\ &=b_n+\frac{1+o(1)}{b_n}.
 \end{split}
```
Indeed the last correction is at most $`C/b_n^2`$, by the defining
tail probability. For the middle term,
$`\int_b^\infty\overline\Phi=\varphi(b)-b\overline\Phi(b)`$,
and the Mills expansion gives
$`\varphi(b)/\overline\Phi(b)-b=1/b+O(b^{-3})`$.
This proves the unconditional upper endpoint in (1).

## 2. Deterministic lower bound via a cosine transform

Index rows and columns by $`k,j=0,\ldots,n-1`$. Put
```math
 A_{0j}=n^{-1/2},\qquad
 A_{kj}=\sqrt{2/n}\cos\!\left(\frac{\pi k(j+1/2)}{n}\right)
 \quad(1\le k\lt n).
```
This is an orthogonal matrix. Indeed the cosine sum over $`j`$
is zero for each integer frequency from $`1`$ through $`2n-1`$
by the finite geometric sum, and the cosine product identity
then gives the orthogonality and norms. In particular
$`\max_{kj}|A_{kj}|\le\sqrt{2/n}`$.

For $`y\in\mathbb R^n`$ let
```math
 F_\lambda(y)=\lambda^{-1}\log
       \sum_{k=0}^{n-1}\big(e^{\lambda y_k}+e^{-\lambda y_k}\big).
```
It differs from $`\|y\|_\infty`$ by between zero and
$`\log(2n)/\lambda`$. For any vector $`a`$, the fourth derivative
of $`t\mapsto F_\lambda(y+ta)`$ is bounded absolutely by
$`C'\lambda^3\|a\|_\infty^4`$, uniformly in the base point and $`t`$.
Indeed this derivative is $`\lambda^3`$ times the fourth cumulant
of the signed coordinates $`\pm a_k`$ with probabilities
proportional to the corresponding exponentials. The fourth
cumulant is the centered fourth moment minus three times the
squared variance, giving the stated bound.

Replace the independent input coordinates $`\varepsilon_j`$
by independent standard normals $`G_j`$ one at a time, and apply
Taylor's formula to the scalar variable along column $`j`$ of
$`A`$. The moments through order three match, and the fourth
moments are bounded absolutely, so
```math
 |\mathbb E F_\lambda(A\varepsilon)-\mathbb E F_\lambda(AG)|
   \le C''\lambda^3 \sum_j\big(\max_k|A_{kj}|\big)^4
   =O(\lambda^3/n).
```
Returning to the max and choosing
$`\lambda=(n\log(2n))^{1/4}`$ shows
```math
 \left|B(A)-\mathbb E\|G\|_\infty\right|
  =O\big(n^{-1/4}(\log(2n))^{3/4}\big)
  =o(1/b_n),
```
because $`AG`$ has independent standard normal coordinates.
This route uses no restriction on Hadamard orders and no
high-dimensional Gaussian limit theorem.

Finally, for iid standard normals,
$`b_n(\|G\|_\infty-b_n)`$ converges to the standard Gumbel law,
whose mean is $`\gamma`$. Indeed the normal tail ratio at
$`b_n+u/b_n`$ tends to $`e^{-u}`$, hence the probability that
no coordinate exceeds that threshold in absolute value
converges to $`\exp(-e^{-u})`$. Convergence of means follows
from the same normal tail bounds. On the positive side
$`2n\overline\Phi(b_n+u/b_n)\le e^{-u}`$ for $`u\ge0`$ by
the increasing normal hazard, which is at least its argument.
On the negative side, for $`0\le u\le b_n^2/2`$, the tail
at $`b_n-u/b_n`$ is at least $`e^{u/2}/(2n)`$ by the same
hazard lower bound across that interval. The probability of
no exceedance is at most $`\exp(-e^{u/2})`$. For
$`b_n^2/2\le u\le b_n^2`$ its monotonicity gives a negligible
bound $`b_n^2\exp(-e^{b_n^2/4})`$ on the integral. The variable
cannot be smaller than $`-b_n^2`$. This proves
$`\mathbb E\|G\|_\infty=b_n+\gamma/b_n+o(1/b_n)`$.

Inverting the standard Mills expansion also gives
```math
 b_n=\sqrt{2\log(2n)}
  -\frac{\log\log(2n)+\log(4\pi)}{2\sqrt{2\log(2n)}}
  +o((\log n)^{-1/2}),
```
which with (1) is the stated sharp unconditional logarithmic term.

## Scope

The scalar tail theorem is prior work. Sinha's Theorem 2.2 gives
the corresponding second-order term for explicit classes,
and §2.5(2) explicitly leaves unconditional global optimality
open. The contribution here is the direct transfer of the
scalar tail to an unrestricted upper bound, and an unconditional
explicit every-dimension construction at the Gaussian third-order
value. The result does not settle the finite-dimensional extremal
problem or distinguish $`\gamma`$ from $`1`$ as the true global
third-order constant.
