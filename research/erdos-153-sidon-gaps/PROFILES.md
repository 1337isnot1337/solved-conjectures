# Erdős–Sárközy–Sós Sidon sumset gaps: a weak-limit obstruction

[Problem 2 in Erdős–Sárközy–Sós, *On Sum Sets of Sidon Sets, I* (1994), p. 345](https://real.mtak.hu/110604/1/1-s2.0-S0022314X84710407-main.pdf#page=17), now [Erdős Problem 153](https://erdosproblems.ai/wiki/problems/additive_bases/E0153), asks whether the mean squared consecutive gap in the sumset of any finite Sidon family tends to infinity as its cardinality grows. Here Sidon means that the unordered sums including the diagonal are distinct. The full question remains open. The original paper proves a logarithmic lower bound for the *largest* gap; the record tracks a withdrawn full argument and two partial proofs for asymptotically minimum diameter. The obstruction below applies also at a nonminimal fixed diameter ratio, but is conditional on a limiting endpoint profile. No exact antecedent for the reciprocal-convolution bound or the endpoint criteria was found.

## The profile theorem

Let $A_j$ be finite Sidon sets with $n_j=|A_j|\to\infty$. Translate each minimum to zero, put $D_j=\max A_j$, and write
\[
 A_j+A_j=\{s_{j,1}<\cdots<s_{j,t_j}\},\qquad
 t_j=n_j(n_j+1)/2,
\]
and $Q_j=t_j^{-1}\sum_i(s_{j,i+1}-s_{j,i})^2$. Suppose along a subsequence that $Q_j$ has a finite limit $Q$,
\[
 D_j/n_j^2\to\kappa,\qquad
 \mu_j=\frac1{n_j}\sum_{a\in A_j}\delta_{a/n_j^2}\ \Longrightarrow\ \mu.
\]
Such further subsequences always exist if $Q_j$ is bounded: Cauchy–Schwarz bounds $D_j/n_j^2$ by a constant and the measures are then tight. Then $\mu$ has a probability density $f$ supported on $[0,\kappa]$ with $\|f\|_2^2\le1$ (hence $\kappa\ge1$), and
\[
 Q\ \ge\ 4\int_0^{2\kappa}\frac{dx}{(f*f)(x)}.
 \tag{1}
\]
The reciprocal is interpreted as $+\infty$ at zeros; the integral is Lebesgue. This is a lower bound, not an assertion that a Sidon family realizes a specified profile.

### Sidon differences give the $L^2$ bound

For each nonzero integer difference, the Sidon property allows at most one ordered pair realizing it. Therefore $\mu_j*\check\mu_j$ puts at most $\ell+O(n_j^{-1})$ mass in any interval of length $\ell$: the diagonal has mass $1/n_j$, and the off-diagonal atoms are at distinct grid points of mesh $1/n_j^2$. Here $\check\mu_j(E)=\mu_j(-E)$. Passing to a weak limit yields the domination $\mu*\check\mu\le dx$. Convolve $\mu$ with any nonnegative smooth, compactly supported approximate identity $\eta_\epsilon$ of mass one. By Tonelli,
\[
 \|\mu*\eta_\epsilon\|_2^2
 =\int (\eta_\epsilon*\check\eta_\epsilon)(x)\,d(\mu*\check\mu)(x)
 \le1.
\]
Weak compactness in $L^2$ and the approximate identity identify the original measure with an $L^2$ density of norm at most one. Also $g=f*f$ is continuous, by $L^2$ translation continuity, and $0\le g\le1$ by Cauchy–Schwarz.

### Gap interpolation and its dual lower bound

Let $x_{j,i}=s_{j,i}/n_j^2$. On each half-open gap interval $[x_{j,i},x_{j,i+1})$ place constant density $g_j=1/(t_j(x_{j,i+1}-x_{j,i}))$, and set it zero outside the sum span. Since any one gap is at most $\sqrt{t_j Q_j}$ in unscaled units, the largest scaled gap is $O(n_j^{-1})$. Thus $g_j\,dx$ and the point measure assigning mass $1/t_j$ to each sum have the same weak limit. The latter converges to $\mu*\mu$: the ordered convolution gives weight $2/n_j^2$ to all off-diagonal sums and $1/n_j^2$ to the $n_j$ diagonal sums, so their total variation difference tends to zero. Consequently $g_j\,dx\Rightarrow g\,dx$.

The exact interpolation identity is
\[
 \int_0^{2D_j/n_j^2}\frac{dx}{g_j(x)}
 =t_j\sum_i(x_{j,i+1}-x_{j,i})^2
 =\left(\frac{t_j}{n_j^2}\right)^2Q_j\longrightarrow Q/4.
\]
For every continuous nonnegative $\phi$ compactly supported in $(0,2\kappa)$, its support lies inside those spans for large $j$, and $g_j^{-1}\ge 2\phi-\phi^2 g_j$ there. Integration and weak convergence give
\[
 Q/4\ge 2\int\phi(x)\,dx-\int\phi(x)^2g(x)\,dx.
\]
Take the supremum over such $\phi$. To see that this gives $\int 1/g$, use continuous compact cutoffs with value 1 on an increasing sequence of compact subintervals, times the continuous function $\min(M,1/g)$ (defined as $M$ at zeros). For $0\le\phi\le1/g$ the expression is monotone increasing pointwise in $\phi$; the increasing cutoffs and $M\to\infty$ give the result by monotone convergence, including zeros of $g$. This proves (1).

## Endpoint implications

Set $\epsilon_k=2^{-k-1}$. Cauchy–Schwarz on the disjoint intervals $(\epsilon_k/2,\epsilon_k)$ gives
\[
 \int_{\epsilon_k/2}^{\epsilon_k}\frac{dx}{g(x)}
 \ge \frac{\epsilon_k^2}{4\int_{\epsilon_k/2}^{\epsilon_k}g(x)\,dx}
 \ge \frac{\epsilon_k^2}{4\mu([0,\epsilon_k])^2},
\]
because a sum of two nonnegative points at most $\epsilon_k$ requires both points to lie in $[0,\epsilon_k]$. Applying the same argument after reflecting $A_j$ proves
\[
 \sum_{k\ge0}\left(\frac{\epsilon_k}{\mu([0,\epsilon_k])}\right)^2<\infty,
 \qquad
 \sum_{k\ge0}\left(\frac{\epsilon_k}{\mu([\kappa-\epsilon_k,\kappa])}\right)^2<\infty.
 \tag{2}
\]
In particular both endpoint-average densities tend to infinity, first along the dyadic scales and then everywhere by monotonicity and comparison of neighboring scales. A profile with either endpoint mass $O(\epsilon(\log(1/\epsilon))^{1/2})$ is already impossible under bounded gaps, because (2) would dominate the harmonic series. This includes any limiting profile bounded near just one endpoint, not only uniform profiles. Quantitatively, Hölder in (2) and (1) yield $Q\gg p/\|f\|_p^2$ for every $p\ge2$ with $f\in L^p$, since the sum of $\epsilon_k^{2/p}$ has order $p$. Consequently $\|f\|_p=o(\sqrt p)$ along an unbounded sequence of $p$ also precludes a finite $Q$.

## Why the constraints do not yet resolve the question

The basic continuum restrictions above are simultaneously feasible at every $\kappa>1$. On $[0,\kappa]$ let $u$ be the uniform probability density and let $b$ be the probability density proportional to $[x(\kappa-x)]^{-1/4}$. Take $f=(1-\lambda)u+\lambda b$ for sufficiently small fixed $\lambda>0$. Both functions are in $L^2$, and
\[
 \|f\|_2^2=1/\kappa+\lambda^2\|b-u\|_2^2\le1.
\]
In particular $f*\check f\le1$, exactly as required by the Sidon difference relaxation. But $f*f(x)\gg_\kappa\lambda^2 x^{1/2}$ near zero and $f*f(x)\gg_\kappa\lambda^2(2\kappa-x)^{1/2}$ near the other endpoint, by direct integration over the two endpoint cusps. It is positive and continuous on the compact intermediate range. Therefore $\int_0^{2\kappa}1/(f*f)<\infty$. This is a barrier to proving the conjecture purely from weak scaling, Sidon autocorrelation capacity, and gap interpolation; it is not a discrete counterexample. The remaining question is to rule out these concentration profiles for actual Sidon sumsets or find an additional discrete obstruction.

## A universal constant: the asymptotic mean squared gap is at least 20

In the notation of the original problem,
\[
 \liminf_{n\to\infty}\;\inf_{|A|=n,\;A\;\mathrm{Sidon}} Q(A)\ \ge\ 20.
 \tag{3}
\]
This is a bounded lower bound, not divergence. [Kapoor's prior August 2026 note](https://github.com/RajveerKapoor/erdos-work/blob/main/papers/erdos-153.tex) claimed a lower constant near $16.13$, dyadic nonconcentration results and a discrete pair-count relaxation barrier. The present proof uses the full reciprocal-convolution functional; (2) permits weaker, one-sided logarithmic nonconcentration and the cusp construction gives a different continuum barrier. In particular finite reciprocal cost alone does not force a fixed-power endpoint profile.

To prove (3), any violating subsequence would have bounded $Q_j$ and admit a limit as above. If $\kappa=1$, $f$ is uniform by Cauchy–Schwarz and $1/(f*f)$ is not integrable at the ends, a contradiction. For $\kappa>1$ write $f=u+h$, with $u$ uniform on $[0,\kappa]$ and $\|h\|_2^2\le1-1/\kappa$. If $x$ is the distance from the closer endpoint of the sum span, $0<x\le\kappa$, expansion of the convolution and Cauchy–Schwarz yield
\[
 g\le E(x):=\left(\frac{\sqrt{x}}\kappa+\sqrt{1-1/\kappa}\right)^2.
\]
Indeed $u*u=x/\kappa^2$, the two mixed terms together are at most $2\sqrt{x}\|h\|_2/\kappa$, and $h*h\le\|h\|_2^2$. In the variational inequality $1/g\ge 2\phi-\phi^2g$ put $c=2\kappa$, $\phi=\max(c,1/E)$. The base test $\phi=c$ yields $\int 1/g\ge4\kappa^2$, since $g$ has mass one. On the extra region $cE<1$, the improvement over this base is at least $1/E-2c+c^2E$. Put $t=\sqrt{2(\kappa-1)}$. For $0<t<1$, integrating the two identical endpoint improvements, and multiplying by 4 as in (1), gives
\[
 Q\ge16(1+t^2/2)^2\left(1+\int_t^1(v-t)(v^{-2}-2+v^2)\,dv\right)
 =16(1+t^2/2)^2\left(-\log t+\frac83t-\frac34-t^2+\frac{t^4}{12}\right).
\tag{4}
\]
For the substitution, $cE(x)=(\sqrt{2x/\kappa}+t)^2$ and $v=\sqrt{2x/\kappa}+t$. If $t\ge1/2$, already the base $16\kappa^2\ge20.25$ suffices.

For a fully analytic verification when $0<t\le1/2$, Taylor's inequality with $(-\log t)''\ge4$ gives
\[
-\log t\ge \frac{3977}{4000}-\frac{t-t_0}{t_0}+2(t-t_0)^2,\qquad t_0=37/100.
\]
Here $\log(100/37)>3977/4000$ follows by the first seven positive terms of $2\sum_{j\ge0}(63/137)^{2j+1}/(2j+1)$. Substituting in the factor on the right of (4) divided by 16 gives the rational polynomial
\[
 P(t)=\frac{t^8}{48}+\frac{t^6}{3}-\frac{4207t^5}{11100}
 +\frac{351083t^4}{240000}-\frac{4207t^3}{2775}
 +\frac{50361t^2}{20000}-\frac{4207t}{2775}+\frac{30361}{20000}.
\]
On $[0,1/2]$ its second derivative is at least $4-10t+17t^2>2$ (bound the negative cubic term in the second derivative by $-1$ and keep the positive quadratic). Direct rational substitution gives $P(t_0)>1.2506$ and $|P'(t_0)|<0.001$. Therefore $P(t)\ge P(t_0)+P'(t_0)(t-t_0)+(t-t_0)^2>1.25$, proving (3) without a numerical minimizer.

## A leading logarithmic coefficient near the minimal diameter

For any finite Sidon family with $n\to\infty$ and $\kappa=\operatorname{diam}(A)/n^2=1+o(1)$, one has
\[
 Q(A)\ge(8-o(1))\log\frac1{(\kappa-1)_++n^{-1/2}}.
 \tag{5}
\]
This gives an explicit leading coefficient in the near-extremal logarithmic result; it does not include independently unbounded diameter regimes. Here are the smoothing details, which also replace the otherwise qualitative weak convergence.

Normalize $\min A=0$, let $\epsilon=n^{-1/2}$, and let $f_\epsilon$ be the empirical density uniformly smoothed to the right over scale $\epsilon$. Its support is $[0,L]$, $L=\kappa+\epsilon$. Summing overlap lengths over distinct nonzero grid differences gives
\[
 \|f_\epsilon\|_2^2
 \le \frac1{n\epsilon}+\frac2{n^2\epsilon^2}\sum_{d\ge1}(\epsilon-d/n^2)_+
 \le1+\epsilon.
\]
The last sum is bounded by the integral of the decreasing triangular function. Hence if $u$ is uniform on $[0,L]$ and $\rho=(\kappa-1)_++2\epsilon$, then
$\|f_\epsilon-u\|_2^2\le\rho$. The smoothed ordered-sum density $g_\epsilon=f_\epsilon*f_\epsilon$ consequently satisfies
\[
 g_\epsilon(x)\le (\sqrt{x}/L+\sqrt\rho)^2
 \quad(0<x<L).
\]

Assume $Q(A)\le10\log n$, since larger values satisfy (5) already. The largest scaled gap is $r=O(\sqrt{\log n}/n)=o(\epsilon)$. Use the gap-interpolating density $G$ from above and a nonnegative test $\phi$, equal to $L^2/x$ on $[2a,b/2]$, zero off $[a,b]$, and bounded by $L^2/x$ throughout, where $b=1/4$ and $a=\rho\log^2(1/\rho)$. Then
\[
 2\int\phi(x)\,dx\ge2L^2\bigl(\log(1/a)-O(1)\bigr).
\]
To compare the square-test integrals, each off-diagonal sum has original interpolation mass $1/t_n\le2/n^2$, and corresponds to mass $2/n^2$ in the ordered empirical sum density prior to smoothing. Every interpolation location for that sum and every twice-smoothed location differs by at most $\Delta=r+2\epsilon=o(a)$. Thus, by comparing the value at every point of each pair of intervals and then averaging, its contribution to $\int\phi^2G$ is at most its ordered mass times the smoothed average of
$(1+O(\Delta/a))L^4x^{-2}\mathbf1_{[a-\Delta,b+\Delta]}$. For the diagonal sums one can allow the excess total mass $1/n$, costing $O(1/(na^2))=O(1)$. Therefore
\[
 \int\phi^2G\le (1+o(1))L^4\int_{a-\Delta}^{b+\Delta}\frac{g_\epsilon(x)}{x^2}\,dx+O(1)
 \le (1+o(1))L^2\log(1/a).
\]
The second inequality uses $\rho=o(a)$, so the pointwise bound for $g_\epsilon$ is $(1+o(1))x/L^2$ uniformly over the relevant range. Apply the pointwise reciprocal lower bound with this test on the left end and with its reflection on the right (equivalently, apply the same calculation to $\max A-A$). Their supports are disjoint, and each contributes at least $(1-o(1))L^2\log(1/a)$. Therefore the exact gap-interpolation functional is at least $(2-o(1))L^2\log(1/a)$. It equals $(t_n/n^2)^2 Q(A)$, $t_n/n^2\to1/2$, and $\log(1/a)\sim\log(1/\rho)$, proving (5).
