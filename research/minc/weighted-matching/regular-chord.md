# Lih–Wang convexity inequality

## Regular bipartite supports of sparse or intermediate degree

Let $`A`$ be the biadjacency matrix of a simple $`k`$-regular bipartite graph
with $`n`$ vertices on each side, divided by $`k`$, where $`2\le k\le n`$.
Write $`d_n=n!/n^n`$, $`J_n=(1/n)_{ij}`$, $`M=n/k`$ (possibly nonintegral),
and $`q=99/100`$. Set

~~~math
\beta_k=(1-1/k)^{k-1},\qquad
a_k=\beta_k^k k^k/k!,\qquad E_{n,k}=M q^{M-1}/a_k.
~~~

**Theorem.** For every $`0\le t\le1/2`$,

~~~math
\mathop{\mathrm{per}}((1-t)J_n+tA)\le E_{n,k}\mathop{\mathrm{per}}A. \tag{1}
~~~

Whenever $`E_{n,k}\sqrt{M}\le1/1000`$, the
[Lih–Wang chord inequality](https://yair-lavi.com/mincs-list/conjecture-34/index.html)
holds for this $`A`$ throughout its required interval. In particular this
is true eventually along every sequence with $`M/\log n\to\infty`$,
uniformly over the support. This includes repetitions of every fixed
normalized simple regular graph, even when its ratio of near-perfect
to perfect matchings is large. Degrees can grow with order. This does
not settle C34 for general stochastic matrices.

### An exact monomer–dimer reduction

Let $`\Phi_A(y)=\sum_{j=0}^n\sigma_j(A)y^{n-j}`$, where $`\sigma_j`$ is the
sum of all $`j`$-rowed subpermanents. Expanding each position in the
permanent and integrating integer moments of the exponential density
gives, for $`t>0`$,

~~~math
\mathop{\mathrm{per}}((1-t)J_n+tA)
=n\int_0^\infty e^{-ny}t^n\Phi_A((1-t)y/t)\,dy.
\tag{2}
~~~

The coefficient of $`\sigma_j(A)`$ on both sides is
$`t^j((1-t)/n)^{n-j}(n-j)!`$.
The partition-function bound of Davies, Jenssen, Perkins and Roberts
gives $`\Phi_A(z)\le \Phi_{J_k}(z)^{n/k}`$ for $`z>0`$. Indeed after
dividing by $`z^n`$ these are matching generating functions at fugacity
$`1/(kz)`$, and their theorem compares log partition functions per
vertex with the complete bipartite graph of degree $`k`$. The
factorial lower bound of Schrijver gives
$`\mathop{\mathrm{per}}A\ge\beta_k^n`$. Neither result requires $`k\mid n`$.
[Davies et al.](https://doi.org/10.1112/jlms.12056)
[Schrijver](https://doi.org/10.1006/jctb.1997.1798)

In the complete block,
$`\Phi_{J_k}(z)=k!k^{-k}\sum_{j=0}^k\binom kj(kz)^j/j!`$.
Writing $`p=1-t`$, $`x=ky`$, define

~~~math
h_{k,p}(x)=\mathbb P\{S=T\},\qquad
S\sim\mathrm{Binomial}(k,p),\quad T\sim\mathrm{Poisson}(x)
~~~

with independent $`S,T`$. Then
$`e^{-ky}t^k\Phi_{J_k}((1-t)y/t)=k!k^{-k}h_{k,p}(ky)`$.
In particular (2) and the two cited inequalities give

~~~math
\frac{\mathop{\mathrm{per}}((1-t)J_n+tA)}{\mathop{\mathrm{per}}A}
\le \frac nk\int_0^\infty (h_{k,p}(x)/a_k)^{M}\,dx.
\tag{3}
~~~

We prove below that $`\sup_{x\ge0}h_{k,p}(x)\le q a_k`$ for $`1/2\le p<1`$.
Since $`\int_0^\infty h_{k,p}(x)\,dx=1`$ by integrating each Poisson
probability, (3) proves (1); continuity handles $`t=0`$.

### Bounding the probability of a tie

The function $`h`$ has an interior maximum, since it goes to zero at
infinity and $`h'(0)=kp(1-p)^{k-1}-(1-p)^k>0`$. At any maximizer $`x`$,
let $`W`$ have probability proportional to
$`\binom kj p^j(1-p)^{k-j} x^j/j!`$ at $`j`$. The logarithmic derivative of
$`h`$ gives $`\mu=\mathbb E W=x`$. Consecutive probability ratios give
$`\mathbb E W^2=x[p/(1-p)](k-\mu)`$.
Furthermore $`\mathrm{Var}(W)\le\mu`$: the function
$`v(j)=(j+1)\mathbb P(W=j+1)/\mathbb P(W=j)
=x[p/(1-p)](k-j)/(j+1)`$ decreases. Thus
$`\mathbb E[W(W-1)]=\mathbb E[Wv(W)]\le\mu\mathbb E[v(W)]=\mu^2`$.
It follows that $`x\ge kp-(1-p)`$.

Fourier inversion of the difference $`S-T`$ now gives

~~~math
h_{k,p}(x)\le I(w):=\frac1{2\pi}\int_{-\pi}^{\pi}e^{-w(1-\cos u)}\,du,
\quad w=x+kp(1-p)\ge3k/4-1/2=:w_k.
~~~

Here $`|1-p+pe^{iu}|^k\le e^{-kp(1-p)(1-\cos u)}`$ and
$`kp(2-p)-(1-p)`$ is increasing on $`[1/2,1]`$.
The function $`I`$ decreases. For $`k=2,3`$, expanding $`e^{w\cos u}`$ and
integrating gives $`I(w)=e^{-w}\sum_{j\ge0}(w^2/4)^j/(j!)^2
\le e^{-w+w^2/4}`$. At $`w_2=1,w_3=7/4`$ this is less than $`q a_2,q a_3`$,
respectively, where $`a_2=1/2`$, $`a_3=32/81`$.

For $`k\ge4`$ split the integral for $`I`$ at $`|u|=\pi/2`$. On the inner
part $`\sin(|u|/2)\ge(2\sqrt2/\pi)|u|/2`$ by concavity.
On the outside $`1-\cos u\ge1`$. Integrating a Gaussian gives

~~~math
I(w_k)\le\frac{\pi}{2\sqrt{2}\sqrt{2\pi w_k}}+\tfrac12 e^{-w_k}.
~~~

After multiplication by $`\sqrt k`$, each summand decreases with $`k`$
for $`k\ge4`$. At $`k=4`$ the resulting bound is
$`\sqrt{\pi/10}+e^{-5/2}<0.644`$, which is
less than $`0.99\sqrt{e/(2\pi)}`$. Finally
$`a_k\ge\sqrt{e/(2\pi k)}`$: the power series for the logarithm gives
$`k(k-1)\log(1-1/k)\ge-k+1/2+1/(6k)`$
and the upper Stirling estimate for $`k!`$ has logarithmic correction
at most $`1/(12k)`$. This proves the asserted strict probability margin.

### Recovering the chord through the origin

For $`t\ge E_{n,k}`$ the right side of (1) is at most $`t\mathop{\mathrm{per}}A`$.
When $`E_{n,k}\sqrt M\le1/1000`$, the interval $`0\le t\le E_{n,k}`$
is inside the [uniform Hessian ball](../nov20-independent/inequalities/uniform_radial_permanent.md):
$`\|t(A-J_n)\|_F=t\sqrt{M-1}`$. The permanent is convex there. At its
two endpoints it lies on or below the proposed affine chord, hence it
does so throughout the interval. Also $`E_{n,k}<1/2`$ under the
given condition. The sequence assertion follows from
$`E_{n,k}\sqrt M\le C M^{3/2}\sqrt k\,q^{M-1}`$.

### General weighted seeds and the unresolved test

For an arbitrary fixed doubly stochastic matrix $`B`$ of order $`b`$,
take $`A=B^{\oplus m}`$, $`n=mb`$. By factorization of the matching
generating function, (2) gives the exact exponential rate at the midpoint,

~~~math
\lim_{m\to\infty}
\left[\frac{\mathop{\mathrm{per}}((J_n+A)/2)}{(\mathop{\mathrm{per}}B)^m}\right]^{1/m}
=\max_{y\ge0}\frac{e^{-by}\Phi_B(y)}{2^b\mathop{\mathrm{per}}B}.
~~~

Indeed the integrand on the right side of (2), divided by the endpoint,
is the $`m`$th power of the continuous function on the right here. Its
maximum is finite, its integral is finite, and every neighborhood
of a maximizer has positive measure. The prefactor $`mb`$ has $`m`$th
root tending to one. A value greater than one would yield actual
C34 counterexamples, since $`d_n\le\mathop{\mathrm{per}}A`$. The regular
support theorem rules out that mechanism for normalized simple regular
seeds. It does not supply an irregular weighted witness.
