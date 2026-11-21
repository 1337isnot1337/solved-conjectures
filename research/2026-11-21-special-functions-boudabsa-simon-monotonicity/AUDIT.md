# Independent audit

Date: 2026-11-21. Reviewer: graph/number-theory worker, independently of the proof author. Target: Boudabsa–Simon's parameter-monotonicity question, journal Remark 3.

**Mathematical verdict: pass.** The argument proves the entire stated range and strengthens the requested monotonicities to strict monotonicities away from zero. This audit does not certify historical priority; that is recorded separately by the proof author.

**Material priority overlap found during this audit:** an earlier Principia manuscript gives the same full interior exponential-functional representation. The target comparison is an immediate coupling consequence of that representation. This audit must not be read as recommending promotion or a new-result count; see the final section.

## Exact statement and conventions

The [primary journal article](https://www.mdpi.com/2227-7390/9/3/217), *Some Properties of the Kilbas–Saigo Function*, Mathematics 9 (2021), 217, was inspected directly. Proposition 1 fixes $0<\alpha\le1$ and proves the two special cases with third parameters $m-1$ and $m-1/\alpha$. Remark 3 asks for the same directions of monotonicity with third parameter $m-l$, for every $l\le1/\alpha$ and $m>0$.

The proof uses exactly the article's series convention. Its third parameter is $r=m-l$, so the $n$th coefficient is

```math
\prod_{j=0}^{n-1}
\frac{\Gamma(1+\alpha(jm+m-l))}
{\Gamma(1+\alpha(jm+m-l+1))}.
```

The article's defining condition $r>-1/\alpha$ is automatic, since $m-l\ge m-1/\alpha>-1/\alpha$. No lower bound on the fixed $l$ is silently added. The point $\alpha=0$ is outside this question and is not needed. At $x=0$, equality of all functions to one is correctly retained.

## Laplace exponent and the fixed coupling

For $0<\alpha<1$, independent differentiation of $h(t)=(e^t-1)^{-\alpha}$ gives

```math
-h'(t)=\alpha e^{-\alpha t}(1-e^{-t})^{-1-\alpha}.
```

Integration by parts and the beta integral therefore give the claimed representation of $\phi_\alpha(s)=\Gamma(s+\alpha)/\Gamma(s)$, with

```math
\nu_\alpha(dt)
=\frac{\alpha}{\Gamma(1-\alpha)}
e^{-\alpha t}(1-e^{-t})^{-1-\alpha}\,dt.
```

The boundary term at zero is of order $t^{1-\alpha}$ and vanishes; the term at infinity also vanishes. This is a valid Lévy measure because its density is of order $t^{-1-\alpha}$ near zero and decays exponentially at infinity. Its total mass is infinite.

Write $c=1-\alpha l\ge0$. Tilting the measure by $e^{-ct}$ gives the ordinary, unkilled subordinator exponent

```math
\psi_c(s)=\phi_\alpha(c+s)-\phi_\alpha(c).
```

Adding an independent exponential killing time of rate $q=\phi_\alpha(c)$ produces the desired shifted exponent. Both the ordinary process and killing time depend only on the fixed $\alpha,l$, so they can indeed be used for every $m$ simultaneously. This independence from $m$ is the necessary point for the pathwise comparison.

At $c=0$, the convention $\phi_\alpha(0)=0$ follows continuously from the gamma ratio, and the killing time is infinite. At $\alpha=1$, the separate process $S_t=t$, with $q=c$, is correct. The singular formula for the Lévy density is not used at $\alpha=1$.

## Moments and identification

The moment calculation can be performed before knowing finiteness, because Tonelli applies to nonnegative integrands and permits extended values. On the ordered time simplex, the coefficient of the increment $S_{t_j}-S_{t_{j-1}}$ is $\alpha m(n-j+1)$. Survival to $t_n$ contributes $q$ to every increment interval. Consequently,

```math
q+\psi_c(\alpha mk)=\phi_\alpha(c+\alpha mk),
```

and the independent-increment integral gives

```math
\mathbb E[I_m^n]
=n!\prod_{k=1}^n\frac{\Gamma(c+\alpha mk)}
{\Gamma(c+\alpha mk+\alpha)},
\qquad
I_m=\int_0^\zeta e^{-\alpha mS_t}\,dt.
```

Every denominator exponent is strictly positive, even if $c=0$, since $m>0$. The first moment proves almost-sure finiteness. The successive coefficient ratio is asymptotic to $(\alpha mn)^{-\alpha}$ and tends to zero. Thus the series has infinite radius of convergence. Applying Tonelli first to $e^{rI_m}$ for $r\ge0$ gives finite exponential moments of every positive order. The integrable majorant $e^{|z|I_m}$ then justifies the complex exponential expansion. Reindexing $k=j+1$ agrees exactly with the primary Kilbas–Saigo series, yielding

```math
\mathbb E[e^{zI_m}]=E_{\alpha,m,m-l}(z)
\qquad(z\in\mathbb C).
```

There is no moment-determinacy assumption or unjustified interchange of an alternating series and expectation.

## Strictness and simultaneous parameter range

For each fixed positive time, the unboundedness of $\psi_c$ implies

```math
\mathbb P(S_t=0)
=\lim_{s\to\infty}e^{-t\psi_c(s)}=0.
```

Intersecting over positive rational times and using monotone sample paths gives $S_t>0$ for every $t>0$ on one event of probability one. At $\alpha=1$ the same assertion is deterministic. The ordinary subordinator has finite values on finite time intervals.

Likewise, intersecting finiteness of $I_m$ over positive rational $m$ gives finiteness for every real $m>0$, since one can choose a rational $r$ with $0<r<m$ and use $I_m\le I_r$. This handles the uncountable parameter family without intersecting uncountably many probability-one events.

The killing time is strictly positive almost surely, including the case where it is infinite. On the common event just described, for every $m_1<m_2$ the integrands satisfy a strict inequality throughout $0<t<\zeta$. Their positive difference has positive integral, and both integrals are finite. Hence $I_{m_1}>I_{m_2}$ almost surely. Taking expectations of the strictly monotone function $u\mapsto e^{xu}$ gives the required decreasing direction for $x>0$ and increasing direction for $x<0$.

As a direct endpoint check, when $\alpha=1$ the integral equals $(1-e^{-m\zeta})/m$ for finite $\zeta$, and $1/m$ when $c=0$. The asserted strict order holds in both cases.

## Scope and evidence boundary

This is a proof for all $0<\alpha\le1$, all fixed $l\le1/\alpha$, and all $m>0$, not a finite computation or a restriction to the two previously established curves. The gamma-ratio Bernstein function and the general subordinator moment formula are classical ingredients, correctly credited in the manuscript; they are reconstructed to verify the application. No Lean verification was performed. No additional numerical tests are needed for the checked argument.

## Earlier full representation

After completing the independent mathematical check, the proof author found the [Principia manuscript for MathDB 348998](https://github.com/PrincipiaMathOrg/math-solutions/blob/main/site-backup/mathdb-348998/mathdb-348998-solution.tex), dated 17 September 2026. The reviewer then fetched and read the complete manuscript independently; the inspected content blob is `e758dfe0dd9eff2adce5240336f9f85ee8da747f`.

That manuscript concerns hyperbolic bounds, but its representation is not restricted to those bounds. It proves the entire moment-generating identity for all $b>0,d>0$ with exponent

```math
\phi_{b,d}(s)=\frac{\Gamma(b+ds+\alpha)}{\Gamma(b+ds)},
```

using precisely the positive gamma-ratio kernel, independent killing at rate $\phi_{b,d}(0)$, ordered-time moments, and infinite-radius exponential series used above. In its original third-parameter notation $r$, its substitutions are $b=1+\alpha(r-m)$ and $d=\alpha m$.

Setting $r=m-l$ makes $b=1-\alpha l=c$ fixed as $m$ varies. The earlier process with scale $d$ has the law of $dS_t$ for one unscaled process whose Lévy measure depends only on $b,\alpha$. Thus its already proved representation directly gives the common coupling used here whenever $c>0$. The missing endpoint $c=0$ is already Proposition 1 of the primary paper. Its strict-positivity argument for all times is also the same as the one used above.

The Principia manuscript does not separately state the unnormalized Remark 3 comparison. Its proposed Task 3 concerns normalized convex orders, which are a different question. Nevertheless, the exact representation overlap is sufficient to make a new-resolution claim unsafe under this project's strict priority requirement. This mathematical audit therefore remains valid, while the result should be treated conservatively as a consequence of earlier work unless the coordinating priority audit establishes a materially different basis.
