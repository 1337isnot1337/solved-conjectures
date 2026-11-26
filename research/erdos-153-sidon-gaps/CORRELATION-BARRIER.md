# Erdős–Sárközy–Sós conjecture: a barrier for four-point correlation methods

Research note for [#783](https://github.com/1337isnot1337/solved-conjectures/issues/783). The target is [Erdős 153](https://www.erdosproblems.com/153). This proves a limitation of the method from [LATTICE-PROFILES.md](LATTICE-PROFILES.md), not a counterexample to the conjecture. The earlier [continuous cusp profile](PROFILES.md) passed the one-point and difference-capacity tests. The construction below supplies actual integer occupancy sets with bounded gap cost that pass the sum/difference four-point tests even uniformly over *all* nonzero shifts and with marked endpoints. They are not sums and differences of one common set.

## A marked relaxation

Fix a large integer $\kappa$. Let $f$ be the probability density on $[0,\kappa]$ proportional to $[x(\kappa-x)]^{-1/4}$ and zero elsewhere; take $\kappa$ large enough that $\|f\|_2^2\le 1$. This is possible by dilating the probability density for $\kappa=1$. Set
\[
 r(s)=\tfrac12(f*f)(s),\qquad w(u)=(f*\check f)(u).
\]
Both are continuous, and $0\le r\le1/2$, $0\le w\le1$. Choose a large integer scale $N$. Independently at each integer sum site $i$ in $[0,2\kappa N]$, put one point there with probability $r(i/N)$. If occupied, attach an endpoint pair $(a,b)$ with $a+b=i/N$; the conditional density of $a$ is $f(a)f(i/N-a)/(2r(i/N))$. One can use either a randomly ordered pair or the symmetric average of its two orderings. Denote the resulting occupancy set by $S_N$ and its endpoint mark by $s_i$.

Independently at each positive integer difference site $j\le\kappa N$, put a point with probability $w(j/N)$. If occupied, assign mark $(c,a)$ with $c-a=j/N$, drawing $a$ with conditional density $f(a+j/N)f(a)/w(j/N)$. Also put the point at $-j$, with the reversed mark. There is no point at zero. Denote the symmetric occupancy set by $D_N$ and its marks by $d_j$. A conditional density at a zero-probability site is never needed. In what follows, sums outside the corresponding spans and unoccupied sites contribute zero.

Then there are realizations with the following properties as $N\to\infty$:

1. $|S_N|/N\to 1/2$ and $|D_N|/N\to 1$. Their unmarked weak densities are $r$ and $w$. In each residue class modulo a fixed $q$ the respective limiting densities are $r/q$ and $w/q$ with normalization $1/N$, and the marks have their prescribed weak limits. The diameter of $S_N$ can be made exactly $2\kappa N$.
2. The mean squared consecutive gap of $S_N$ is bounded by a constant depending only on $\kappa$.
3. For every bounded continuous test $F(a,b,c,d)$ of the four endpoint values,
\[
 \sup_{h\ge1}\left|
 4\sum_{i:\,i,i+h\in S_N} F(s_i,s_{i+h})-
 \sum_{j:\,j,j-h\in D_N} F(a,b,c,d)
 \right|=o(N). \tag{A}
\]
In the second sum the ordered marks are $d_j=(c,a)$ and $d_{j-h}=(b,d)$. In the first sum concatenate the two ordered sum marks in the displayed order. The same holds for restrictions to an arbitrary interval $I$ by requiring all four endpoints in $I$.

These are the leading-order marked four-point identities for a Sidon set. In a genuine set, each unordered sum is counted twice in its ordered version, apart from diagonal sums, and the zero difference has multiplicity $n$. At nonzero lag those two effects change each bounded-test count by $O(n)$, not by a term of order $n^2$. The proof below does not assert an error of order $\sqrt N$ for the relaxed model or impose compatibility of marks across different sites.

## Why the two expectations agree asymptotically

Set $\eta=h/N$. On the sum side divide by $N$ and use the joint law at two occupied sites. Its expectation, after the factor four, is a Riemann sum in $s=i/N$ for the integral
\[
 \int_{\mathbb R^3} f(a)f(s-a)f(c)f(s+\eta-c)\,
       F(a,s-a,c,s+\eta-c)\,da\,dc\,ds. \tag{B}
\]
On the difference side the expectation is the Riemann sum in $u=j/N$ for
\[
 \int_{\mathbb R^3} f(a)f(a+u)f(d)f(d+u-\eta)\,
       F(a,d+u-\eta,a+u,d)\,da\,dd\,du. \tag{C}
\]
Sites $0$ and $h$ on the difference side are omitted. For $h>0$ the only possible pair of reflected sites in the same term has $j=h/2$. These at most three exceptional terms have uniformly bounded expected weight. The change of variables $u=c-a$, $d=s+\eta-c$, with $a$ unchanged, has absolute Jacobian one and identifies (B) and (C) for every $\eta$.

The Riemann-sum convergence is uniform in $\eta\in[0,2\kappa]$. Indeed, as $s$ varies, the $L^1(da)$ distance between the subprobability densities $f(a)f(s-a)$ at two parameters is at most $\|f\|_2$ times the $L^2$ translation modulus of $f$. The same bound holds for $f(a)f(a+u)$. Take products of these $L^1$-bounded densities and also use uniform continuity of $F$ on the compact endpoint domain. This makes the inner integrals equicontinuous as functions of the sampled coordinate, uniformly in $\eta$, with bounded support. Boundary tests requiring all endpoints in $I$ follow by replacing $f$ with $f\mathbf1_I$ in the same calculations. Shifts larger than $2\kappa N$ have no pairs on either side.

For a fixed test of supremum norm at most one, changing the random variable of one sum site changes the corresponding unnormalized pair count by at most a constant: only the two pairs involving that site can change. Changing one positive difference site changes at most four pairs because its negative counterpart moves together. The bounded-differences inequality gives a probability at most $2e^{-c\sqrt N}$ for deviation above $N^{3/4}$, uniformly over individual shifts. A union bound over $O(N)$ shifts and the first $N$ members of a fixed countable dense set of norm-bounded continuous tests makes the failure probability tend to zero. Uniform approximation in the supremum norm extends the conclusion to all continuous tests. Boundary-restricted tests can be included for rational endpoint intervals at the same stage. They extend to all intervals because the four endpoint marginals of the limiting weighted counts assign zero mass to a point, uniformly in the shift: a change in membership near an endpoint can be majorized by continuous bump tests of the four coordinates; for (B) or (C) the mass of such a strip is at most a constant times the integral of $f$ over the strip, using the $L^\infty$ bound on $f*f$ or $f*\check f$. The same independent-variable concentration, now on single-site marked counts, proves property 1 including the fixed-modulus statements. The expected sums on a residue lattice converge to $1/q$ times the integral by the same Riemann argument.

## Bounded gap cost

Force the endpoints $0,2\kappa N$ into $S_N$, with arbitrary admissible marks. This changes each pair count or weak statistic by $O(1)$. For the estimate temporarily insert the midpoint $\kappa N$ as well. Undoing that insertion merges two gaps at most, and $(u+v)^2\le2(u^2+v^2)$ shows it increases the total squared gap cost by at most a factor two.

For some $c_0>0$,
\[
 r(s)\ge c_0\min(s,2\kappa-s)^{1/2}\qquad(0<s<2\kappa).
\]
Near zero restrict the convolution integral to $a\in[s/4,3s/4]$; both $f(a)$ and $f(s-a)$ are bounded below by a constant times $s^{-1/4}$. Reflection gives the other endpoint and compactness gives the interior estimate.

On the left half, for each integer $x\in[0,\kappa N-1]$, let $W_x$ be the distance to the closest occupied integer strictly to its right. For a gap of length $g$ the $W_x$ over its integer positions run from $g$ down to $1$. Therefore the sum of squared gap lengths equals $\sum_x(2W_x-1)$. If $x\ge1$, all future candidate sites before the inserted midpoint have inclusion probability at least $c_0(x/N)^{1/2}$. Independence and the forced midpoint give $\mathbb EW_x\le c_0^{-1}(N/x)^{1/2}$. At $x=0$ use the deterministic bound $\kappa N$. Thus
\[
 \sum_{x=0}^{\kappa N-1}\mathbb E W_x=O(N).
\]
On the right half search to the left and use the analogous identity; this yields the same bound. After removing the midpoint, the expected total squared gap cost is still $O(N)$. By Markov's inequality it is at most a suitable constant times $N$ with probability at least $3/4$. All the required concentration events simultaneously have probability tending to one. Select a realization in their intersection for each sufficiently large $N$. Since $|S_N|\sim N/2$, this gives property 2.

## Scope

This is not a Sidon construction, because the marks at different sites need not be built from a common finite list of endpoints. Rather, it shows that strengthening the simple profile $f$ by the full list of leading-order nonzero-lag four-point identities and bounded lattice gap energy still admits a counterexample model. Any proof using only these statistics at this accuracy must fail. It does not preclude an argument using sharper errors, genuinely coupled endpoint incidences, higher-order identities, or a new forced spatial concentration inequality.
