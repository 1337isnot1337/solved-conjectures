# Hamburger moment classification for real Apéry parameters

There is precisely one Hamburger-but-not-Stieltjes Apéry parameter: $x=1/4$. Namely $A_n(x)$ is a Hamburger moment sequence (moments of a nonnegative Borel measure on the real line) if and only if $`x\in\{0,1/4\}\cup[1,\infty)`$. For $x=0$ this is trivial and for $x\ge1$ the known Stieltjes theorem suffices. The exclusion proof for $0<x<1$ uses only analyticity of a compact moment series off the real line except when $x=1/4$, so all other parameters in that interval also fail Hamburger. We construct a compact Hamburger measure at the exceptional parameter and give the short deduction for all negative parameters from Neuschel’s prior asymptotic formula.

## The interior Legendre density

Use the same torus Legendre representation and notation as the positive branch proof. At $x=1/4$ and $-1<t<1$, put $s=(1+t)/2$, $q=\sqrt s$, and $a_q=(1-q)/2$, $b_q=(1+q)/2$. The argument $Z$ has density $H(s)/(8\pi^2)$, now with the upper endpoint of the quartic integral equal to $x$:
```math
 H(s)=\int_{a_q^2}^{1/4}\frac{dv}{\sqrt{v(v-a_q^2)(1/4-v)(b_q^2-v)}}=4q^{-1/2}K(m(q)),
\qquad m(q)=\frac{2+3q-q^3}{4}.
```
The ordered roots are $0<a_q^2<1/4<b_q^2$, so this is the same standard real quartic substitution as in the positive branch, with the third and fourth roots exchanged relative to their parameter names.

Let $K$ have its usual parameter convention. The function $H$ has a single-valued continuation on the plane cut along $(-\infty,0]$ and $[1,\infty)$: choose the principal $q=\sqrt s$, and continue the hypergeometric period from $0<q<1$. Only the preimages of $m=0,1,\infty$ can be singular, and all finite preimages are real: factor $m=(2-q)(1+q)^2/4$ and $1-m=(q-1)^2(q+2)/4$. In the $`q`$-domain with $\Re q>0$ and $[1,\infty)$ removed there are no such points; it is simply connected. The continuation obeys conjugation symmetry.

## Opposite signs on the two cuts

On the upper bank at $s=-r^2<0$ we have $q=ir$ and $m=1/2+i(3r+r^3)/4$. The period here is the principal elliptic integral: one can first rotate a small $`q`$ to the positive imaginary axis while $m$ stays near $1/2$, then move up that axis, staying in the upper $m$ half-plane. In the integrand of $K(m)$, $1-m\sin^2\phi$ has positive real part and nonpositive imaginary part. Its inverse square root therefore has argument in $[0,\pi/4)$, and multiplication by $q^{-1/2}$ contributes argument $-\pi/4$. It follows that
```math
 \mathop{\mathrm{Im}}H(-r^2+i0)<0.
```

On the other upper bank, $q>1$. When $`q`$ crosses 1 through the upper half-plane, $1-m=(q-1)^2(q+2)/4$ makes one clockwise turn. The exact logarithmic term of $K(m)$ at $m=1$ is $-K(1-m)\log(1-m)/\pi$, so the period afterward is
```math
 H(q^2+i0)=4q^{-1/2}\bigl(K(m(q))+2iK(1-m(q)+i0)\bigr),
 \qquad q>1,\;q\ne2.
```
This identity holds first just past 1 and then on the whole upper bank by taking $`q`$ in a thin upper neighborhood of the positive real interval $q>1$, where $\mathop{\mathrm{Im}}m(q)<0$ because $m'(q)<0$. There $K(m)$ is its principal branch, as is $K(1-m)$ approaching from the upper side. For real $q>1$, $m(q)<1$ gives real $K(m(q))$, and $\Re K(1-m(q)+i0)>0$: the usual integrand is strictly positive on a nonempty interval from $\phi=0$, and if its denominator crosses the negative real axis it contributes a nonnegative imaginary term. Thus
```math
 \mathop{\mathrm{Im}}H(q^2+i0)>0.
```

## Cauchy decomposition and signed support

At $s=0$, $H=O(|s|^{-1/4})$. At $s=1$ and $4$ the singularities are at worst logarithmic by the same hypergeometric expansions (at $4$ the extra period has a logarithm at $1-m=1$). At infinity $H=O(\log|s|/|s|)$ uniformly off the cuts. In fact in the first quadrant of large $`q`$, $-m(q)=(q^3/4)(1-3/q^2-2/q^3)$ has a logarithm with uniformly bounded argument, using the principal $\log q$. The two local hypergeometric solutions at infinity are $m^{-1/2}$ times an analytic function of $1/m$ and a logarithmic partner with the same prefactor. Compose those solutions with the indicated logarithm in the whole large-$`q`$ quadrant and determine their two fixed coefficients by matching in an overlapping sector. This gives $K(m(q))=O(|q|^{-3/2}(1+\log|q|))$ there; conjugation gives the other half.

Cauchy's slit-domain formula therefore represents $H(s)$ as the sum of its two cut integrals, each with integrand $\mathop{\mathrm{Im}}H(U+i0)/(\pi(U-s))$. The upper-bank signs show that this is a positive sum of Stieltjes kernels of opposite orientation:
```math
 H(s)=\int_0^1\frac{d\tau_+(\lambda)}{1-\lambda s}+\int_0^1\frac{d\tau_-(\lambda)}{1-\lambda(1-s)}.
```
Specifically on the positive cut use $\lambda=1/U$ and weight $1/U$; on the negative cut $U=-v$ use $\lambda=1/(1+v)$ and weight $1/(1+v)$. The endpoint and tail estimates give finite measures; both have positive mass by the strict signs.

The beta-to-Legendre-Poisson mixture in the positive branch converts the first integral into a positive moment measure on $[0,1]$. The second yields a positive moment measure on $[-1,0]$: replace $s=(1+t)/2$ by $1-s=(1-t)/2$ and apply $P_n(-t)=(-1)^nP_n(t)$. It gives strictly positive mass to $(-1,0)$ because $\tau_-$ is nonzero and is supported on $\lambda>0$, and the beta law has no atom at zero. The torus portion $Z\ge1$ contributes a nonnegative compactly supported measure by the usual Legendre arcsine moment formula, while $Z<-1$ is absent. This proves the claimed Hamburger classification on the nonnegative parameter axis.


## Negative real parameters

Fix $x<0$. [Neuschel, Theorem 4.2](https://arxiv.org/pdf/1307.0341#page=13) gives, for constants $C,R>0$, $f\in\mathbb R$ and $0<\theta<1$ depending on $x$,
```math
A_n(x)=C R^n n^{-3/2}\bigl(\cos(f+n\pi\theta)+o(1)\bigr).
```
Let $F(z)=\sum_{n\ge0}A_n(x)z^n$ and $z_0=R^{-1}\exp(-i\pi\theta)$, a nonreal point. Inside the convergence disk, at $z=rz_0$ with $0<r<1$, coefficientwise differentiation and the cosine decomposition give
```math
zF'(z)=\frac{C e^{if}}2\sum_{n\ge1}\frac{r^n}{\sqrt n}
+\frac{C e^{-if}}2\sum_{n\ge1}\frac{r^n e^{-2in\pi\theta}}{\sqrt n}
+o\left(\sum_{n\ge1}\frac{r^n}{\sqrt n}\right).
```
For the remainder, use a fixed finite prefix and an arbitrarily small multiple of the displayed diverging sum on its complement. The second sum is bounded up to $r=1$ by summation by parts, since $e^{-2i\pi\theta}\ne1$. The first diverges with nonzero coefficient. Thus $F'$ is unbounded along this approach to $z_0$.

If the sequence were Hamburger, the bound $`|A_n(x)|\le (n+1)(64\max\{1,|x|\})^n`$ on even moments would force a compactly supported representing measure. Its ordinary moment series would therefore extend analytically at every nonreal point by the Cauchy kernel $\int (1-qz)^{-1}d\nu(q)$, contradiction. No negative $x$ is Hamburger. This step is a consequence of Neuschel's earlier theorem, not a new asymptotic.
