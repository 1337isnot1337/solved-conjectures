# A uniform second term for primes in two-generator semigroup gaps

Let $b>a\ge3$ be coprime, $G=ab$, $g=ab-a-b$, and
$$
\pi^*(a,b)=|\{p\le g:p\text{ prime},\ p\notin a\mathbb Z_{\ge0}+b\mathbb Z_{\ge0}\}|.
$$
Put $L=\log G$ and
$$
J_a=\frac1{\varphi(a)}\sum_{\substack{1\le j<a\\(j,a)=1}}
   \frac ja \left(1-\log\frac ja\right).
$$
**Theorem.** Uniformly for all these coprime pairs as $G\to\infty$,
$$
\boxed{\displaystyle
\pi^*(a,b)=\frac{G}{2L}+\frac{G}{L^2}J_a+O\left(\frac{G}{L^3}\right).}
\tag{1}
$$
In particular both inequalities in [Chen–Zhu, Conjectures 1.3 and 1.4](https://arxiv.org/html/2506.03625#S1) hold strictly for all sufficiently large $g$, uniformly in $a\ge3$. This leaves a finite, uncertified range and is not a complete resolution. The published article is [*The number of primes not in a numerical semigroup*](https://doi.org/10.1142/S1793042126500181).

## 1. The range $a\le L^{64}$

For a unit residue modulo $a$, let $j$ be the unique integer $1\le j<a$ with $p\equiv bj\pmod a$. Then $p\in a\mathbb Z_{\ge0}+b\mathbb Z_{\ge0}$ if and only if $p\ge bj$: the smallest compatible nonnegative coefficient of $b$ is $j$, and increasing it by $a$ cannot help. Every $bj$ with $j\le a-2$ is at most $g$, since $b>a$. For $j=a-1$, the threshold is $g+a$, and the last integer in that residue strictly below the threshold is $g$. Consequently
$$
\pi^*(a,b)=\sum_{\substack{1\le j<a\\(j,a)=1}}\pi(bj;a,bj)+O(1+\omega(a)).
\tag{2}
$$
The error allows for the threshold itself when prime (only $j=1$ can contribute one) and the primes dividing $a$.

Here $b\ge G/L^{64}$, so $\log(bj)\ge L-64\log L$ uniformly. By Siegel–Walfisz, with a fixed exponent such as 65, the sum in (2) is
$$
\frac1{\varphi(a)}\sum_{(j,a)=1}\operatorname{Li}(bj)+O(G/L^4),
\qquad \operatorname{Li}(t)=\int_2^t\frac{du}{\log u}.
\tag{3}
$$
Indeed each exponential error is $O(bj e^{-c\sqrt{\log(bj)}})$, and summing at most $L^{64}$ terms absorbs only a fixed power of $L$. The small error in (2) is negligible.

With $v=j/a$ we have $bj=Gv$. The standard two-term expansion of $\operatorname{Li}$ by integration by parts gives
$$
\operatorname{Li}(Gv)=\frac{Gv}{L}
  +\frac{Gv(1-\log v)}{L^2}
  +O\!\left(\frac{Gv(1+|\log v|^2)}{L^3}\right).
$$
The denominators in the Taylor remainder are controlled since $|\log v|\le64\log L$. The function $v(1+\log^2 v)$ is bounded on $(0,1]$. Finally the mean of $j/a$ over reduced residues is $1/2$ by $j\leftrightarrow a-j$. This proves (1) in this range.

## 2. The range $a>L^{64}$

We adapt the circle-method estimates of [Ding–Zhai–Zhao, §3 and §4](https://arxiv.org/html/2309.09796), who obtained the first-order prime asymptotic. Here the principal arc must retain the unweighted prime density $1/\log t$ so that its second term is not discarded.

Write $e(t)=e^{2\pi it}$, $Q=\lfloor L^{20}\rfloor$, and
$$
f(\alpha)=\sum_{p\le g}e(p\alpha),\qquad
H(\alpha)=\sum_{0\le x\le b}\sum_{0\le y\le a}e((ax+by)\alpha).
$$
For $n\le g<ab$ there is at most one nonnegative representation of $n$: two representations would differ in $x$ and $y$ by a nonzero multiple of $(b,-a)$, forcing one of the summands to be at least $ab$. Thus the represented-prime count equals $\int_{\mathbb R/\mathbb Z} f(\alpha)H(-\alpha)\,d\alpha$.

We use the bound $\int_{\mathbb R/\mathbb Z}|H(\alpha)|\,d\alpha\ll L^2$ (Ding–Zhai–Zhao Lemma 3.2). For a direct proof use the geometric-series estimate on each factor and split the torus into the cells $\alpha=h/(ab)+t$, $|t|\le1/(2ab)$, indexed by $h\bmod ab$. In such a cell the two factors of $H$ are bounded by $O(b/(1+d_b(h)))$ and $O(a/(1+d_a(h)))$, where $d_j(h)=\min(h\bmod j,(-h)\bmod j)$. This follows since the change from $h/b$ or $h/a$ is at most $1/(2b)$ or $1/(2a)$, and if the residue is zero use the length bound. Integrating over the cell and summing using the Chinese remainder theorem gives a product of two harmonic sums.

Take major arcs $|\alpha-h/q|\le Q/(qg)$ about each reduced $h/q$ with $q\le Q$, modulo one. They are disjoint since $2Q^3<g$ for large $G$. On the complement Dirichlet approximation with $\lceil g/Q\rceil$ gives a reduced $h/q$ with $Q<q\le\lceil g/Q\rceil$ and error at most $1/q^2$. The usual Vinogradov–Vaughan bound used in [Ding–Zhai–Zhao, Lemma 3.1](https://arxiv.org/html/2309.09796#S3) gives
$$
\sup_{2\le u\le g}\left|\sum_{n\le u}\Lambda(n)e(n\alpha)\right|
\ll \frac{g L^4}{\sqrt Q}+g^{4/5}L^4 .
$$
To see the uniform endpoint statement, apply the bound with length $u$ and majorant $g$ whenever $q\le u$; otherwise use the trivial bound $u\log g\ll gL/Q$. Partial summation with $1/\log n$ and removal of the $O(\sqrt g\log g)$ proper prime-power terms bound $|f(\alpha)|$ by the same right side. The minor integral is therefore $O(g/L^4)$ by the $L^1$ bound for $H$ and $Q\asymp L^{20}$.

For each major arc with $q\ge2$, $q$ cannot divide both $a$ and $b$. If $q\nmid a$, then $\|a\alpha\|\ge 1/q-aQ/(qg)\ge1/(2q)$; if $q\nmid b$ the analogous inequality with $b$ holds. Here $Q=o(a)$ and $g\asymp ab$. One geometric-series factor is thus $O(q)$; the other is $O(b)$. Using $|f|\le g$ and summing arc lengths yields $O(bQ^3)=O(g/L^4)$ over all $q\ge2$ arcs.

On the principal arc set $F(\theta)=\sum_{2\le n\le g}e(n\theta)/\log n$. The ordinary prime number theorem with its de la Vallée Poussin error and partial summation give
$$
f(\theta)-F(\theta)\ll g(1+g|\theta|)e^{-c\sqrt{\log g}}
    \qquad(|\theta|\le Q/g).
$$
Indeed the prime count and smooth weights differ by $O(g e^{-c\sqrt{\log g}})$ at every upper endpoint $u\le g$, using the prime number theorem and splitting off $u<\sqrt g$. The resulting integral error is $O(g/L^4)$ even after the $(1+Q)L^2$ factor. By Abel summation $|F(\theta)|\ll \min(g,\|\theta\|^{-1})$; extending the integral of $FH$ from the principal arc to the full torus thus costs $O(gL^2/Q)=O(g/L^4)$. Orthogonality now yields the represented-prime count as
$$
\sum_{\substack{2\le n\le g\\ n\in a\mathbb Z_{\ge0}+b\mathbb Z_{\ge0}}}
 \frac1{\log n}+O(g/L^4).
\tag{4}
$$

The number of those representable integers at most $t\le g$ is
$$
\frac{t^2}{2ab}+O(t/a+t/b+1).
$$
Indeed count lattice points in the triangle $ax+by\le t$, or sum the integer parts of $(t-by)/a$ over $0\le y\le t/b$. The uniqueness of representation below $ab$ converts that count to an integer count. Partial summation in (4) therefore gives
$$
\frac1G\int_2^g\frac{t\,dt}{\log t}+O(g/L^4)
=\frac{G}{2L}+\frac{G}{4L^2}+O(G/L^3).
$$
The triangle-bound error in partial summation is $O(g/(a\log g)+1)$, using $\int_2^g dt/\log^2t=O(g/\log^2g)$. We also used $g/G=1+O(L^{-64})$, so replacing the upper endpoint $g$ by $G$ costs $O(G/L^{65})$. The last expansion follows by two integrations by parts. Subtracting (4) from $\pi(g)=G/L+G/L^2+O(G/L^3)$ gives $\pi^*(a,b)=G/(2L)+3G/(4L^2)+O(G/L^3)$.

To replace $3/4$ by $J_a$, let $h(v)=v(1-\log v)$ on $[0,1]$, with $h(0)=0$. This monotone function has total variation 1. Each Riemann sum over multiples of a divisor $d$ of $a$ differs from $(a/d)\int_0^1h$ by at most 1. Möbius inversion gives
$$
J_a=\int_0^1h(v)\,dv+O\big(2^{\omega(a)}/\varphi(a)\big)
=\frac34+O(a^{-1/4}).
$$
For the last bound, $\varphi(a)\ge\sqrt{a/2}$ follows on prime powers, and $2^{\omega(a)}\ll a^{1/4}$ since every prime $p\ge16$ satisfies $p^{1/4}\ge2$. As $a>L^{64}$ this loss is negligible. This completes (1).

## 3. Consequences for the two conjectures

For $v=j/a$ uniformly over reduced residues the mean is $1/2$. Möbius inversion on the ordinary sum of squares gives
$$
\mathbb E[v^2]=\frac13+
 \frac{\prod_{p\mid a}(1-p)}{6a\varphi(a)}
=\frac13+\frac{(-1)^{\omega(a)}\operatorname{rad}(a)}{6a^2}.
$$
Indeed summing $j^2$ over multiples of $d\mid a$ gives $a^3/(3d)+a^2/2+ad/6$ before the Möbius sum. Since $-\log v\ge1-v$, it follows that $J_a-1/2\ge\mathbb E[v(1-v)]\ge(1-1/a)/6\ge1/9$. As $\pi(g)\le\pi(G)$, its prime number theorem expansion and (1) show
$$
\pi^*(a,b)-\tfrac12\pi(g)\ge G/(9L^2)+O(G/L^3)>0
$$
for all sufficiently large $G$. This is the eventual strict assertion of Conjecture 1.4.

For Conjecture 1.3, $a g/(a-1)\le G$ and $g/G\ge5/12$ for $b>a\ge3$. Hence its threshold satisfies
$$
\left(\frac12+\frac1{2(a-1)}\right)\frac{g}{\log g}
\le \frac{G}{2L}+\tfrac12\log(12/5)\frac{G}{L^2}
    +O(G/L^3).
$$
Since $\tfrac12\log(12/5)<1/2<J_a$, (1) gives the strict inequality uniformly for large $G$.

The [companion conjecture on represented primes](https://www.aimsciences.org/article/doi/10.3934/fcnt.2026002) additionally asks for the lower bound $13\pi(g)/66$ for their number, for $a\ge3$. This also follows uniformly beyond a finite range: (1) gives the represented proportion $1-G/(2g)+O(1/L)$, and $g/G\ge2/3-1/b$ gives a uniform lower limit of at least $1/4>13/66$. Its upper bound is the same as Conjecture 1.4. These consequences are not additional complete resolutions.

The cases $a=1,2$ of Conjecture 1.4 already follow by elementary parity as noted by the authors. No explicit search threshold or proof for the remaining finite set is furnished here. The authors' Theorem 1.1 was already eventual for each fixed $a$ at the threshold of Conjecture 1.3, and their Theorem 1.5 proves both conjectures for $a\le10$. This note addresses the uniform regime. Searches for the exact conjectures and for a uniform signed second term found the first-order results and the fixed-$a$ estimates in the cited primary sources, but no earlier instance of (1); this is not a claim of exclusive priority.
