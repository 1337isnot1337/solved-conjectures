# Linear and quadratic Ehrhart positivity for all complete bipartite symmetric edge polytopes

This is a family-level partial result for [Ferroni–Higashitani, Conjecture 4.9(ii)](https://arxiv.org/html/2307.10852). It proves that the **linear coefficient and, when the dimension is at least two, the quadratic coefficient** of the Ehrhart polynomial are positive for the symmetric edge polytope of every complete bipartite graph. In particular it does not settle all coefficients, and does not settle the separate canonical-line conjecture of Higashitani–Kummer–Michałek.

Let $`G=K_{a+1,b+1}`$, $`a,b\ge0`$, and $`d=a+b+1`$. The known $`h^*`$-formula of [*Arithmetic aspects of symmetric edge polytopes*, Theorem 4.1](https://arxiv.org/abs/1807.07678) (also [Kölbl, Proposition 1.5](https://arxiv.org/pdf/2404.02136#page=5)) is
```math
H_G(z)=\sum_{i=0}^{\min(a,b)}\binom{2i}{i}\binom ai\binom bi z^i(1+z)^{d-2i}.
```
Define $`F_G(x)=(1-x)^d H_G(-x/(1-x))`$ for $`0\le x\le1`$, extended polynomially at 1. Put $`u=1-2x`$, $`p=x(1-x)`$. Then
```math
F_G(x)=u\sum_{i=0}^{\min(a,b)}(-1)^i
\binom ai\binom bi\binom{2i}{i}p^i u^{a+b-2i}. \tag{1}
```

## A contraction representation

For real $`\ell`$ let
```math
M(u,\ell)=\begin{pmatrix}u&\ell\\-\ell&u\end{pmatrix}.
```
In the usual monomial weight basis of the symmetric tensor power of degree $`a+b`$, the diagonal matrix element of $`\mathop{\mathrm{Sym}}^{a+b}M(u,\ell)`$ on $`e_1^a e_2^b`$ is
```math
\sum_i(-1)^i\binom ai\binom bi \ell^{2i}u^{a+b-2i}.
```
This follows by expanding $`(u e_1-\ell e_2)^a(\ell e_1+u e_2)^b`$: to retain the same exponents one swaps equal numbers from the two factors. For the normalized symmetric monomial the diagonal coefficient is the same, since normalization multiplies the input and matching output by reciprocal factors. Equivalently, in the natural Hilbert norm on the symmetric tensor subspace, this matrix element is the inner product of a unit weight vector with its image.

Take $`\ell=2\sqrt p\cos\theta`$ and average over $`\theta`$ uniformly in $`[0,2\pi]`$. Since the average of $`\cos^{2i}\theta`$ is $`4^{-i}\binom{2i}{i}`$, the average of the diagonal element is precisely the sum in (1). But $`M^*M=(u^2+\ell^2)I`$ with $`u^2+\ell^2\le u^2+4p=1`$, so its tensor and symmetric powers are contractions. We obtain the stronger bound
```math
|F_G(x)|\le |1-2x|\qquad (0\le x\le1). \tag{2}
```

## The first two coefficients

For any $`d`$-dimensional lattice polytope with numerator $`H`$ and polynomial $`F`$ as above, the usual binomial relation $`E(s)=\sum_i h_i\binom{s+d-i}{d}`$ and the beta integral give
```math
E(s)=1+\frac{\sin\pi s}{\pi}
 \int_0^1 \frac{1-F(x)}x
 \left(\frac{1-x}{x}\right)^s dx . \tag{3}
```
One first proves it on $`-1<s<0`$: the gamma reflection formula gives
```math
\binom{s+d-i}{d}
=(-1)^{i+1}\frac{\sin\pi s}{\pi}
  \int_0^1 x^{i-s-1}(1-x)^{d-i+s}\,dx .
```
Summing, and subtracting the same beta identity for $`F\equiv1`$, gives (3). The integrand for (3) is locally integrable in a complex neighborhood of zero, since $`1-F(x)=O(x)`$ as $`x\to0`$; thus one may take Taylor coefficients at zero. In particular
```math
[s]E=\int_0^1\frac{1-F(x)}x\,dx,\qquad
[s^2]E=\int_0^1\frac{1-F(x)}x\log\frac{1-x}{x}\,dx. \tag{4}
```
The first is strictly positive by (2).

By palindromicity of $`H_G`$, $`F_G(1-x)=(-1)^d F_G(x)`$, also immediate from (1). Pair $`x`$ and $`1-x`$ in the second integral in (4), over $`0<x<1/2`$. The remaining positive factor $`\log((1-x)/x)`$ multiplies
```math
\begin{cases}
(1-F_G(x))\bigl(1/x-1/(1-x)\bigr) & d\text{ even},\\[2mm]
\bigl(1-2x-F_G(x)\bigr)/(x(1-x)) & d\text{ odd}.
\end{cases}
```
Both expressions are nonnegative by (2). The even case is strictly positive on the open half interval. For odd $`d\ge3`$, the symmetric power is of positive degree, so the defining matrix element has absolute value strictly below 1 for each $`x\in(0,1/2)`$ and almost all $`\theta`$, because $`u^2+4p\cos^2\theta<1`$ except at finitely many angles. Thus $`F_G(x)<1-2x`$ there and the odd-case integral is strictly positive too. The excluded dimension-one case is the unit symmetric edge segment, whose quadratic coefficient is zero.

The canonical-line property implies positivity of every Ehrhart coefficient but is only known for some bipartite families in the cited primary literature. This calculation gives a distinct two-coefficient result uniformly across all part sizes. The amplitude bound also survives graph vertex wedges and therefore gives strictly positive linear coefficients for every vertex wedge of complete bipartite blocks (and in combination with the other classes in the companion notes). Existing arithmetic $`h^*`$-formulas are attributed above; this file makes no claim about a prior resolution of the full canonical-line conjecture.
