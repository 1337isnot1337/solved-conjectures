# The excluded parameter interval in Sokal's Apéry moment conjecture

**Theorem.** For every real $x$ with $0<x<1$, the sequence
```math
A_n(x)=\sum_{k=0}^n\binom nk^2\binom{n+k}k^2 x^k,\qquad n=0,1,\ldots,
```
is not a Stieltjes moment sequence.

This proves the entire negative branch of [Sokal, Conjecture 1, IHP Computer Algebra Workshop, slide 27](https://rtca2023.github.io/pages_Paris/DocM6/Sokal.pdf), also restated in [his MSU talk, slide 36](https://users.math.msu.edu/group/combinatorics-graph-theory-seminar/sokal.pdf). The positive side was previously addressed in the October 2026 Knowledge Sense preprint (see [the audit](AUDIT.md)); with that work this proves the original threshold. There is no claim on the separate coefficientwise conjecture. At $x=1$, the Stieltjes property is known by [Edgar, arXiv:2005.10733](https://arxiv.org/abs/2005.10733); at $x=0$ it is trivial.

## 1. A real torus representation

Write $P_n$ for the ordinary Legendre polynomial. The expansion $P_n(1+2u)=\sum_{k=0}^n\binom nk\binom{n+k}k u^k$ gives
```math
A_n(x)=\mathbb E_\theta\left[P_n(1+2\sqrt{x}e^{i\theta})P_n(1+2\sqrt{x}e^{-i\theta})\right],
```
where angles are uniform on the circle. On averaging the [Legendre addition formula, DLMF 14.18.2](https://dlmf.nist.gov/14.18.E2) over its angle, one obtains
```math
P_n(u)P_n(v)=\mathbb E_\phi P_n\big(uv+\sqrt{u^2-1}\sqrt{v^2-1}\cos\phi\big).
```
Indeed, for real $u,v$ in the range of the addition formula the sign of the radical product is immaterial because the odd powers of $\cos\phi$ average to zero. The averaged right side is a polynomial in $u,v$, so the identity then holds for complex $u,v$. In particular when $v=\bar u$ we can use the nonnegative radical product $|u^2-1|$.

For $u=1+2\sqrt{x}e^{i\theta}$ the integrand's Legendre argument becomes
```math
1+4x+4\sqrt{x}\cos\theta
 +4\sqrt{x}|1+\sqrt{x}e^{i\theta}|\cos\phi.
```
Conditional on $\theta$, the last cosine term has the same distribution as the real part of $(1+\sqrt{x}e^{i\theta})e^{i\psi}$ multiplied by $4\sqrt{x}$, where $\psi$ is an independent uniform angle. Thus the argument has the same distribution as $1+4x+4\sqrt{x}(\cos\theta+\cos\psi)+4x\cos(\theta+\psi)$. Under the map $(a,b)\mapsto(\theta,\psi)=(a+b,a-b)$, the uniform torus measure maps to itself. Elementary trigonometry therefore yields
```math
A_n(x)=\mathbb E P_n(Z),\qquad
Z=1+8x\cos^2 a+8\sqrt{x}\cos a\cos b,
```
where $a,b$ are independent uniform angles. At $x=1$ the same torus argument, after a shift of an angle, also appears in the [OEIS A005259 formulas](https://oeis.org/A005259).

Write $\mu$ for the distribution of $Z$. The [Legendre generating function](https://dlmf.nist.gov/18.12.E11) gives, for $z$ near zero,
```math
F(z):=\sum_{n\ge0}A_n(x)z^n
=\int (1-2tz+z^2)^{-1/2}\,d\mu(t).
```

## 2. What the Stieltjes condition would force

Assume for contradiction that $A_n(x)=\int_0^\infty q^n\,d\nu(q)$ for a positive measure $\nu$. The elementary binomial bound $A_n(x)\le(n+1)64^n$ for $0<x<1$ implies that $\nu$ is compactly supported: any positive mass above $64+\epsilon$ would give faster moment growth. Thus $F(z)=\int(1-qz)^{-1}\,d\nu(q)$ is holomorphic at every nonreal and every negative real $z$.

For $\operatorname{Im}w>0$ define
```math
G(w)=\int (w-t)^{-1/2}\,d\mu(t)
```
using the branch with $\arg(w-t)\in(0,\pi)$. Put $z(w)=w-\sqrt{w^2-1}$ with the square root chosen so that $z(w)\sim(2w)^{-1}$ at infinity. This inverse of $w=(z+z^{-1})/2$ maps the upper half-plane into the lower half of the unit disk, with $z(w)\ne0$. By factoring the Legendre kernel, the identity
```math
G(w)=\sqrt{2z(w)}\,F(z(w))
```
holds first near large real positive $w$ approached from above, using branches that agree on real $w>\max(\operatorname{supp}\mu\cup\{1\})$. It holds throughout the upper half-plane by holomorphic uniqueness under the Stieltjes assumption. For every $s\in(-1,1)$, the upper limit of $z(w)$ is the nonreal value $s-i\sqrt{1-s^2}$ and $z(w)$ extends holomorphically to a neighborhood of $s$. Consequently $G$ would extend holomorphically across every point of $(-1,1)$.

Whenever the local density is smooth, bounded, or logarithmically singular at $s$, dominated convergence yields the real upper-boundary value
```math
\operatorname{Re}G(s+i0)=\int_{t<s}(s-t)^{-1/2}\,d\mu(t).
```
All other contributions are bounded away from the denominator singularity. A failure of real analyticity of this real boundary value at any $s\in(-1,1)$ will contradict the preceding extension.

## 3. The regimes away from $x=1/4$

Put $s_0=1+8x-8\sqrt{x}$. For fixed $a$, the smallest possible value of $Z$ is $1+8h^2-8h=-1+8(h-1/2)^2$, where $h=\sqrt{x}|\cos a|$.

**If $0<x<1/4$**, this value is minimized at $h=\sqrt{x}$, so $s_0\in(-1,1)$ is the lower endpoint of the support. The real upper-boundary value of $G$ vanishes immediately left of $s_0$ and is strictly positive immediately right (every open neighborhood of a minimizing torus point has positive measure). Away from the endpoint the local density is smooth at nearby regular values, so the boundary formula applies there. A real-analytic function cannot have this behavior.

**If $1/4<x<1$**, the critical points of $Z$ at height $s_0\in(-1,1)$ are nondegenerate saddles. In fact the derivatives are
```math
Z_a=-8\sqrt{x}\sin a(2\sqrt{x}\cos a+\cos b),
\qquad Z_b=-8\sqrt{x}\cos a\sin b.
```
The only possible critical values other than $s_0$ are $-1$, $1$, and $1+8x+8\sqrt{x}$. At height $s_0$ one has $\sin a=\sin b=0$ and $\cos a\cos b=-1$. The Hessian eigenvalues there are $-8\sqrt{x}(2\sqrt{x}-1)$ and $8\sqrt{x}$.

Thus near $s_0$ the density of $\mu$ equals
```math
c\log(1/|t-s_0|)+r(t),\qquad c>0,
```
with $r$ continuous, including at $s_0$. Here is a local proof of the needed regularity. The Morse lemma puts the function near each saddle into the coordinates $Z-s_0=uv$, with smooth positive area density. Use smooth cutoffs in small squares around the saddles, equal to one near the center. For a cutoff density $h(u,v)$ supported on $|u|,|v|<\delta$, the pushforward at $y\ne0$ is $\int_{|y|/\delta<|u|<\delta}h(u,y/u)\,du/|u|$. Decompose
```math
h(u,v)=h(0,0)+(h(u,0)-h(0,0))+(h(0,v)-h(0,0))+uv\,H(u,v),
```
where $H$ is bounded. The constant contributes $2h(0,0)\log(\delta^2/|y|)$, the next two terms each have the same finite limit from both sides (change variables to $v=y/u$ in the third), and the last is $O(|y|\log(1/|y|))$. Away from the saddles all other contributions to the pushforward density near $s_0$ are smooth by the submersion theorem and compactness. The local positive coefficients add.

Translate $s_0$ to zero. In the integral for $\operatorname{Re}G(-h+i0)$ with $h>0$, the contribution from the local logarithm changes from its value at $h=0$ by
```math
-\sqrt h\int_0^\infty v^{-1/2}\log(1+1/v)\,dv+O(h)
=-2\pi\sqrt h+O(h)
```
per unit logarithmic coefficient. Indeed, restrict the integration to $[-\delta,-h]$, put $u=-h-t$, and compare with the integral over $[-\delta,0]$ at $h=0$. The moving upper cutoff after substitution costs $O(h)$. In the remaining difference, put $u=hv$ and extend to infinity, incurring another $O(h)$. The displayed integral is $2\pi$ by integration by parts. The continuous local remainder contributes $o(\sqrt h)$: its constant value at zero costs $O(h)$, its variation on an arbitrarily small neighborhood is uniformly small times the $O(\sqrt h)$ $L^1$ difference of the two Abel kernels, and on the complement the kernels differ by $O(h)$. Consequently the real boundary value has a nonzero one-sided square-root cusp, so it cannot be real analytic at $s_0$.

## 4. The parameter $x=1/4$

Here $\min Z=-1$. Set $U=Z+1\ge0$. Near $(a,b)=(0,\pi)$, writing $t=\tfrac12\cos a$, we have
```math
U=8(t-1/2)^2+8t(1+\cos b)\asymp a^4+(b-\pi)^2,
```
and the other minimizing torus point has the same local form. The probability of $0<U\le h$ is comparable to $h^{3/4}$ for sufficiently small $h>0$, as follows by enclosing the sublevel set between rectangles of side lengths proportional to $h^{1/4}$ and $h^{1/2}$ at each minimum. Therefore
```math
J(h):=\mathbb E(U+h)^{-1/2}
```
has finite $J(0)$, and $J(0)-J(h)\ge c h^{1/4}$ for some $c>0$: restrict the difference to $0<U\le h$, where the integrand difference is at least $(1-2^{-1/2})h^{-1/2}$. Finiteness follows, for example, by summing the $O(2^{-3j/4})$ sublevel probabilities against $O(2^{j/2})$ on dyadic shells.

On the real segment $z=-r$, $0<r<1$, the integral representation agrees with $F$ by analytic continuation along that segment, since its denominator is $(1-r)^2+2rU>0$. It gives
```math
F(-r)=(2r)^{-1/2}J\!\left(\frac{(1-r)^2}{2r}\right).
```
As $r\uparrow1$, the prefactor differs from its limit by $O(1-r)$, while the decrease in $J$ from $J(0)$ is bounded below by a positive multiple of $(1-r)^{1/2}$. This contradicts the analyticity of $F$ at $-1$ implied by the Stieltjes assumption and completes the proof.
