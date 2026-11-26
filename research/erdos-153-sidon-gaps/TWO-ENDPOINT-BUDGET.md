# Erdős–Sárközy–Sós conjecture: sharing the two endpoint budgets

Partial progress for [#783](https://github.com/1337isnot1337/solved-conjectures/issues/783). The two-endpoint refinement was independently proposed in a research checkpoint by the assisting agent and audited here. It strengthens the [earlier profile theorem](PROFILES.md) by charging each end of the sum interval to a disjoint portion of the endpoint profile. It gives a uniform bound of $22.13$, not divergence and not a resolution of [Erdős 153](https://www.erdosproblems.com/153).

Use the earlier notation. A bounded-gap subsequence has a limiting normalized diameter $\kappa\ge1$, probability density $f$ on $[0,\kappa]$, and $Q\ge4\int_0^{2\kappa}1/(f*f)$. The case $\kappa=1$ makes $f$ uniform by equality in Cauchy–Schwarz and gives an infinite integral. For $\kappa>1$ write $h=f-\mathbf1_{[0,\kappa]}/\kappa$. Put $r_L=\int_0^{\kappa/2}h^2$, $r_R=\int_{\kappa/2}^\kappa h^2$. Then
\[
 r_L+r_R=\|f\|_2^2-\frac1\kappa\le\frac{\kappa-1}{\kappa}.
\]
For $0<x\le\kappa/2$, Cauchy–Schwarz on the convolution, restricted to $[0,x]$, gives
\[
 (f*f)(x)\le E(x,r_L),\qquad(f*f)(2\kappa-x)\le E(x,r_R),\qquad
 E(x,r)=\left(\frac{\sqrt x}{\kappa}+\sqrt r\right)^2 .
\]
For $c=2\kappa$ the constant dual test in $1/g\ge2\phi-\phi^2g$ gives $\int 1/g\ge4\kappa^2$, with $g=f*f$. On either half-endpoint strip take $\phi=\max(c,1/E)$; this improves the integrand estimate by at least
\[
 \Psi(E)=
 \begin{cases} E^{-1}-2c+c^2 E,&E<1/c,\\0,&E\ge1/c.\end{cases}
\]
Indeed the coefficient of $g$ in the difference of the tests is nonpositive, so substitute $g\le E$. The function $\Psi$ is convex and nonincreasing (its left derivative at $1/c$ is zero), while $E(x,r)$ is concave and increasing in $r$. Therefore $\Psi(E(x,r))$ is convex and nonincreasing in $r$. Combining the endpoint gains and using Jensen gives at least $2\Psi(E(x,(\kappa-1)/(2\kappa)))$, pointwise on $0<x\le\kappa/2$.

Let $t=\sqrt{\kappa-1}$, so $cE(x,(\kappa-1)/(2\kappa))=(\sqrt{2x/\kappa}+t)^2$. For $0<t<1$, put $v=\sqrt{2x/\kappa}+t$ in the two gains. Their positive region is wholly in the two disjoint half-endpoint strips. Adding the constant estimate and multiplying by four gives
\[
 Q\ge16(1+t^2)^2
 \left[1+\int_t^1(v-t)(v^{-2}-2+v^2)\,dv\right]
 =16(1+t^2)^2\left(-\log t+\frac83t-\frac34-t^2+\frac{t^4}{12}\right).
\]
The constant estimate alone is $Q\ge16(1+t^2)^2$ for all $t$. The difference from [the earlier one-budget estimate](PROFILES.md) is that the two ends now share the total available squared deviation.

## Exact certificate for the uniform bound

For $t\ge T=21/50$, the constant estimate exceeds $2213/100$. For $0<t\le T$, $(-\log t)''>5$. At $t_0=3/10$ the first ten positive terms of $2\sum_{j\ge0}(7/13)^{2j+1}/(2j+1)$ exceed $12039/10000$ and give a lower bound for $-\log t_0$. Taylor's inequality now gives $Q\ge16P(t)$, where
\[
 P(t)=(1+t^2)^2\left(\frac{16789}{10000}-\frac{13}{6}t+\frac32t^2+\frac1{12}t^4\right).
\]
Expanding $P''$, bound the negative cubic by $-130Tt^2/3$ and omit the remaining nonnegative powers. Thus
\[
 P''(t)\ge\frac{24289}{2500}-26t+\frac{97367}{2500}t^2>5
\]
by completing the square. Direct substitution gives $P(t_0)=553452623/400000000>13836/10000$ and $P'(t_0)=87091/3000000$, of absolute value below $3/100$. A final Taylor lower bound yields
\[
 16P(t)>16\left(\frac{13836}{10000}-\frac{(3/100)^2}{10}\right)>\frac{2213}{100}.
\]
The inequalities here are rational. If the asymptotic lower bound $22.13$ failed, a violating family would admit the bounded subsequence used at the start, a contradiction. No fixed universal lower bound is a solution of the original asymptotic divergence question.
