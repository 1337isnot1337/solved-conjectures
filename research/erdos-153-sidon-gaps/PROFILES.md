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
