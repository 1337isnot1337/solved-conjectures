# Erdős #450: the sharp order of uniform divisor-window density

Let \(D_n(y)\) be the supremum over integers \(x\ge0\) of the fraction, with denominator \(y\), of integers in the open window \((x,x+y)\) that have a divisor strictly between \(n\) and \(2n\). Put
\[
H=\min(n,y/n),\qquad
\delta=1-\frac{1+\log\log2}{\log2}.
\]
For all integers \(n,y\) with \(H\) sufficiently large, we prove the matching bounds
\[
\boxed{\displaystyle D_n(y)\asymp
 \frac{1}{(\log H)^\delta(\log\log H)^{3/2}}.}
\tag{1}
\]
The constants are absolute. The upper bound also holds for half-open windows with arbitrary nonnegative real translates, without restrictions relating \(x\) to \(n\) or \(y\). The lower bound follows from Ford at the origin. Thus the worst window has the same order as the window at the origin, including the iterated-logarithm factor.

For fixed sufficiently small \(\epsilon>0\), let \(Y_\epsilon(n)\) be the least integer \(y_0\) such that \(D_n(y)\le\epsilon\) for every integer \(y\ge y_0\). For all sufficiently large \(n\), with absolute implied constants,
\[
\log\!\left(\frac{Y_\epsilon(n)}n\right)\asymp
\epsilon^{-1/\delta}(\log(1/\epsilon))^{-3/(2\delta)}.
\tag{2}
\]
This determines the order in the exponent for the uniform large-\(n\), small-\(\epsilon\) reading. It does not give an exact threshold, a leading constant in (1) or (2), or the critical transition when \(\epsilon\) is of the same order as the global density and \(n\) is not sufficiently large relative to \(\epsilon\). It does not address a different quantifier on the starting point.

## 1. Two inputs from Ford

Write \(P^+(a)\) for the largest prime factor, with \(P^+(1)=1\), and define the divisor-log length
\[
L(a)=\operatorname{meas}\bigcup_{s\mid a}[\log s-\log2,\log s).
\]
We use the following known estimates.

1. **Uniform rough-number sieve.** In any positive interval of length \(M\ge z^{100}\) with \(z\ge2\), the number of positive integers having no prime factor at most \(z\) is \(O(M/\log z)\), with an absolute constant. This follows in particular from [Ford, *The distribution of integers with a divisor in a given interval*, Lemma 2.3](https://annals.math.princeton.edu/wp-content/uploads/annals-v168-n2-p01.pdf); the stronger length requirement here is convenient.
2. **Divisor-log sum.** For \(z\ge3\),
\[
S(z):=\sum_{P^+(a)\le z}\frac{L(a)}a
 \ll \frac{(\log z)^{2-\delta}}{(\log\log z)^{3/2}} . \tag{3}
\]
For squarefree \(a\), this is the estimate at the end of §3 of [Ford, *Integers with a divisor in \((y,2y]\)*](https://ford126.web.illinois.edu/wwwpapers/hxy2y.pdf), using his \(T_k(y)\), Lemmas 3.5–3.6, and Stirling. Apply that estimate with \(y=z\), so the allowed prime bound \(2z\) also covers our sum. To extend to arbitrary \(a\), split off its powerful part \(b\) (all primes occurring to exponent at least two, with those full exponents) and write \(a=bc\) with \(c\) squarefree. The inequality
\[
L(uv)\le\tau(u)L(v) \tag{4}
\]
holds even without coprimality: every divisor of \(uv\) is a product of one divisor of each factor, so its interval is in the union of at most \(\tau(u)\) translates of the log union for \(v\). Finally \(\sum_{b\ {\rm powerful}}\tau(b)/b\) converges by its Euler product, as each local factor is \(1+O(1/p^2)\).

We also need the following elementary consequence of (4):
\[
\sum_{P^+(b)\le z}\frac{L(b)\log b}{b}\ll (\log z) S(z)\qquad (z\ge2). \tag{5}
\]
Indeed, \(\log b=\sum_{q^j\mid b,\ q\ {\rm prime},\,j\ge1}\log q\). Substitute \(b=q^j t\) and use \(L(q^j t)\le(j+1)L(t)\); the coefficient multiplying \(S(z)\) is at most
\[
\sum_{q\le z}\log q\sum_{j\ge1}\frac{j+1}{q^j}
\ll \sum_{q\le z}\frac{\log q}{q}\ll \log z.
\]
The final bound is a standard Chebyshev partial summation.

## 2. The local bound for one specified smooth part

Take \(I=(x,x+y]\), with \(x\ge0\). Assume \(H\) is sufficiently large. Let \(2\le z\le H^{1/1000}\), and let \(a\le H^{3/8}\) be a specified integer with all prime factors at most \(z\). We count marked \(m\in I\) whose part supported on primes at most \(z\), taking full prime-power exponents, is exactly \(a\). We claim this count is
\[
\ll \frac{y}{a(\log z)^2}L(a). \tag{6}
\]

If \(m=dk\) with \(n<d<2n\), write \(d=sD\) where \(s\mid a\) is its part supported on primes at most \(z\), and \(D\) has no prime factor at most \(z\). Similarly \(k=(a/s)K\) with \(K\) having no such prime factor. Thus
\[
 D\in\bigcup_{s\mid a}(n/s,2n/s),\qquad K\in(x/(aD),(x+y)/(aD)],\qquad m=aDK.
\]
For fixed \(D\), the \(K\)-interval has length \(y/(aD)\ge H/(2a)\) since \(D\le2n\). This exceeds \(z^{100}\) for large \(H\), so it contains \(O(y/(aD\log z))\) eligible \(K\).

The union of the allowed log intervals for \(D\) has length \(L(a)\), by translation and reflection of the defining union. Each connected component of this union has length at least \(\log2\); subdivide each into intervals of lengths between \((\log2)/2\) and \(\log2\), using \(O(L(a))\) intervals total. Endpoint conventions can only remove points or contribute a bounded number per interval. On the original scale each such interval has left endpoint \(R\ge n/a\) and right endpoint between \(\sqrt2 R\) and \(2R\). Its length is \(\gg n/a\ge H/a\), again above \(z^{100}\), so the sieve bounds its sum of \(1/D\) over eligible \(D\) by \(O(1/\log z)\). Summing gives \(O(L(a)/\log z)\). Counting \((D,K)\) rather than \(m\) can only overcount; their combined bound proves (6).

## 3. Stop at the first prime that makes the smooth part too large

Put \(P=H^{1/1000}\). Discard from \(I\) any integer divisible by a power \(p^j\ge H^{1/8}\) with \(p\le P\). It is enough to test the least such power for each \(p\). The total discarded count is \(O(P(yH^{-1/8}+1))\), which is negligible on the scale of (1), since \(y\ge Hn\ge H^2\).

For each remaining \(m\), multiply the full prime powers of \(m\) for primes at most \(P\), in increasing prime order.

- If their product is at most \(H^{1/4}\), use this as the specified \(a\) with cutoff \(z=P\). Summing (6) and using (3) costs
\[
\ll \frac{y S(P)}{(\log P)^2}
 \ll \frac{y}{(\log H)^\delta(\log\log H)^{3/2}} .
\]
- Otherwise stop at the first prime \(p\le P\) whose full prime-power factor makes the product exceed \(H^{1/4}\). Write \(a=bp^e\) for the stopped product. The part of \(m\) up to \(p\) is exactly \(a\), \(P^+(b)<p\), and
\[
H^{1/8}<b\le H^{1/4},\qquad a\le H^{3/8}.
\]
Indeed \(p^e<H^{1/8}\) by the discard step, and \(bp^e>H^{1/4}\). Use cutoff \(z=p\) in (6), then sum all possible \(b,e,p\).

For the latter sum, (4), \(\sum_{e\ge1}(e+1)p^{-e}\ll 1/p\), and \(\log b>(\log H)/8\) give
\[
\begin{aligned}
\sum_{p\le P}\ \sum_{\substack{e\ge1,\ P^+(b)<p\\ b>H^{1/8}}}
\frac{yL(bp^e)}{bp^e(\log p)^2}
&\ll y\sum_{p\le P}\frac{1}{p(\log p)^2}
  \sum_{\substack{P^+(b)<p\\ b>H^{1/8}}}\frac{L(b)}b\\
&\ll \frac{y}{\log H}\sum_{p\le P}\frac{S(p)}{p\log p},
\end{aligned}
\]
where (5) bounds the inner tail after inserting \(8\log b/\log H\). By (3), with bounded primes included in the constant, the final prime sum is
\[
\ll \frac{(\log P)^{1-\delta}}{(\log\log P)^{3/2}}.
\]
For example, partition into bands where \(\log p\) lies between successive powers of two. The prime reciprocal sum on each band is \(O(1)\) by Mertens' estimate, and the resulting sum of \(2^{j(1-\delta)}(1+j)^{-3/2}\) is bounded by a constant times its largest-scale term. Since \(\log P=(\log H)/1000\), this yields the same upper bound as the first case. This proves the upper bound of (1).

## 4. Lower bound and inversion

At \(x=0\), [Ford's Corollary 2](https://annals.math.princeton.edu/wp-content/uploads/annals-v168-n2-p01.pdf) counts positive integers \(m\le y\) with a divisor in \((n,2n]\), with scale parameter \(\min(n,y/n)+3=H+3\), and gives the desired order. Removing integers with divisor exactly \(2n\) and the right endpoint removes at most \(y/(2n)+1=o(y(\log H)^{-\delta}(\log\log H)^{-3/2})\), since \(n\ge H\) and \(y\ge H^2\). Thus the strict-open version has the same lower bound.

The function \(F(H)=(\log H)^{-\delta}(\log\log H)^{-3/2}\) is decreasing for large \(H\). With \(L_\epsilon=\log(1/\epsilon)\), its inverse scale has
\[
\log H\asymp \epsilon^{-1/\delta}L_\epsilon^{-3/(2\delta)}:
\]
substituting \(\log H=c\,\epsilon^{-1/\delta}L_\epsilon^{-3/(2\delta)}\) gives \(F(H)\asymp c^{-\delta}\epsilon\), with the ratio bounded above and below independently of sufficiently small \(\epsilon\) for fixed \(c>0\). A small choice of \(c\) gives a failing window at that length by (1), while a large choice of \(c\) guarantees that every larger length succeeds once \(n\ge H\). Integer rounding is harmless. This proves (2).

## 5. Attribution and exact scope

- [Erdős #450](https://www.erdosproblems.com/450) originates in [Erdős–Graham (1980), printed p. 89](https://mathweb.ucsd.edu/~ronspubs/80_11_number_theory.pdf). The wording does not settle the quantifier on \(x\), while [Erdős's 1982 companion, printed pp. 70–71](https://old.renyi.hu/~p_erdos/1982-32.pdf) retains an arbitrary translate. This note addresses the uniform-in-\(x\) interpretation, with all lengths from the threshold onward.
- [Snyder's July 2026 result](https://erdosproblems.ai/wiki/problems/divisors/E0450/claims/2026_07_15_snyder) establishes the fixed-\(\epsilon\) order \(\Theta_\epsilon(n)\), by a different period argument. Its bounds did not locate the dependence in (2).
- Ford supplies the entire origin-window lower bound, the uniform rough-number lemma, and the divisor-log sum. Ford's Theorem 2 concerns windows of length at least a polylogarithmic fraction of their endpoint. It does not give the upper half of (1) for translates far beyond \(y\) in this statement. The new step is making Ford's divisor-log analysis local in the quotient window via the adaptive cutoff in §3. Exact-priority searches for the unrestricted uniform density result found no earlier matching statement; this search is not exhaustive.
- Supersedes the weaker bound in the companion factorial-moment note. No Lean verification and no exact constant or critical-transition claim.
