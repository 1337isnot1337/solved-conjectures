# Erdős #468: average size and tails of new divisor prefixes

Write \(D_m\) for the sums of nonempty initial segments of the increasing list of divisors of \(m\) larger than 1, as in [Erdős #468](https://www.erdosproblems.com/468). Put
\[
D'_m=D_m\setminus\bigcup_{u<m}D_u,\qquad b_m=|D'_m|.
\]

**Theorem.** There are absolute \(c,C>0\) such that, for all sufficiently large \(X\),
\[
cX\le\sum_{m\le X}b_m\le CX,\qquad
\#\{m\le X:b_m>0\}\ge cX.
\]
Moreover, for every \(\varepsilon>0\), uniformly in \(X\ge2\), \(K\ge2\),
\[
\#\{m\le X:b_m\ge K\}\ll_\varepsilon XK^{-2+\varepsilon}.
\]
In particular, the average of \(b_m^p\) stays bounded for every fixed \(p<2\), \(p>0\).

This gives the sharp average order, not the pointwise size or a limiting distribution. The other question in #468, whether its minimum \(f(N)\) satisfies \(f(N)=o(N)\), was already answered negatively by Tao, including on a density-one set, and quantitatively strengthened by Kovač. Here \(f(N)\) excludes divisor 1; the closely related #1054 includes 1, which amounts to shifting the target by one.

## 1. Uniform tails for relatively large prefixes

For a real \(c>0\), define
\[
K_c(m)=\#\{N\in D_m:N\ge cm\}.
\]
For every integer \(q\ge1\) and every \(0<\alpha<1\), uniformly in \(X\ge2\), \(j\ge1\),
\[
\#\{m\le X:K_c(m)\ge j\}
 \ll_{q,\alpha} X c^{-q} j^{-q(1-\alpha)}. \tag{1}
\]
Here \(c\) is allowed to vary.

Write the divisors of \(m\), this time including 1, as \(r_1<\cdots<r_{\tau(m)}\). Let \(s_i(m)\) be the sum of all divisors except the \(i\) largest, for \(0\le i<\tau(m)\). The prefixes in \(D_m\) are the values \(s_i(m)-1\) for \(0\le i\le\tau(m)-2\). If \(K_c(m)\ge j\), then \(s_{j-1}(m)/m\ge c\). Reflection of the divisor list by \(r\mapsto m/r\), and \(r_{j-1}\ge j-1\) when \(j\ge2\), imply
\[
\sum_{\substack{d\mid m\\d>j-1}}1/d\ge c.
\]
For \(j=1\) this is the full reciprocal-divisor sum. Expand the \(q\)-th moment and count multiples of each least common multiple. The result is
\[
\begin{aligned}
\sum_{m\le X}\left(\sum_{\substack{d\mid m\\d>j-1}}1/d\right)^q
&\le X\sum_{d_1,\ldots,d_q\ge j}
 \frac{1}{d_1\cdots d_q\,[d_1,\ldots,d_q]}\\
&\le Xj^{-q(1-\alpha)}
 \sum_{d_1,\ldots,d_q\ge1}
 \frac{1}{(d_1\cdots d_q)^\alpha[d_1,\ldots,d_q]}.
\end{aligned}
\]
The last multiple series converges for each fixed \(q,\alpha>0\). It is an Euler product whose local factor at \(p\) is
\[
\sum_{e_1,\ldots,e_q\ge0}
p^{-\max(e_1,\ldots,e_q)-\alpha\sum_i e_i}
=1+O_{q,\alpha}(p^{-1-\alpha}),
\]
because the terms with maximum \(r\ge1\) are bounded by \((r+1)^q p^{-(1+\alpha)r}\). Markov's inequality proves (1).

Consequently for every fixed \(c>0\), \(K_c(m)\) has uniformly bounded mean and is uniformly integrable over \(m\le X\). For example take \(q=3,\alpha=1/4\) in (1); summing the resulting tails gives
\[
\sum_{\substack{m\le X\\K_c(m)\ge M}}K_c(m)
\ll_c X M^{-5/4},\qquad M\ge1. \tag{2}
\]

## 2. Sharp mean and positive density of first witnesses

All the \(D'_m\) are pairwise disjoint. The contribution of target values \(N\le X\) to their union up to \(X\) is at most \(X\). Any \(N>X\) that first appears at \(m\le X\) is a prefix exceeding \(m\), hence eligible for \(K_1(m)\). The bounded mean in (2) proves the claimed \(O(X)\) upper bound.

For the lower bound use [Luca–Pomerance, *The range of the sum-of-proper-divisors function*, §3](https://math.dartmouth.edu/~carlp/rangeofs7.pdf). The proof of their theorem gives \(\gg X\) distinct values of the aliquot sum \(s(n)=\sigma(n)-n\) among even deficient \(n\le X\); see in particular their displayed bound on \(\#s(\mathcal A(x))\). This is stronger than merely having \(\gg X\) distinct outputs at most \(X\) from potentially very large inputs. Since those \(n\) are deficient, \(s(n)<n\le X\). After discarding \(n=2\), each value \(s(n)-1\) is a nonempty prefix of the divisors greater than 1, omitting only the largest divisor. Thus \(\bigcup_{m\le X}D_m\) contains \(\gg X\) distinct target values, which also occur in the disjoint union of \(D'_m\) for \(m\le X\).

Choose a sufficiently small fixed \(c>0\) so that \(\gg X\) of these distinct shifted values are at least \(cX\). At their first witnesses \(m\le X\), they count towards \(K_c(m)\). By (2), after discarding all \(m\) with \(K_c(m)\ge M\), for sufficiently large absolute \(M\) a positive proportion of these target values remain. Each remaining index introduces at most \(M\) of the chosen values. Therefore \(\gg X\) distinct indices introduce at least one value, proving the positive lower density assertion.

## 3. Near-quadratic tail of the actual new counts

For \(K\ge2\) and a parameter \(c>0\), partition an index with \(b_m\ge K\) according to whether it introduces at least \(K/2\) targets below \(cX\) or at least \(K/2\) targets at least \(cX\). Because of first occurrence there are at most \(cX\) small targets in total, so the first case has \(O(cX/K)\) indices. In the second case, \(K_c(m)\ge K/2\) since \(m\le X\). By (1),
\[
\#\{m\le X:b_m\ge K\}
\ll_{q,\alpha} X\left(\frac cK+c^{-q}K^{-q(1-\alpha)}\right).
\]
Take \(c=K^{-(q(1-\alpha)-1)/(q+1)}\), with \(q(1-\alpha)>1\). This bounds the count by
\[
O_{q,\alpha}\!\left(X K^{-q(2-\alpha)/(q+1)}\right).
\]
Given \(\varepsilon>0\), sufficiently large \(q\) and sufficiently small \(\alpha>0\) give \(q(2-\alpha)/(q+1)>2-\varepsilon\). This proves the stated tail and, by summation, the bounded moments below two.

## 4. Priority and limitations

- [Erdős #468](https://www.erdosproblems.com/468) asks the pointwise question about new prefixes and the minimum-witness question. The [original discussion thread](https://www.erdosproblems.com/forum/thread/468) includes empirical averages, and credits Tao's answer to the minimum-witness question under #1054. [Kovač's primary note](https://web.math.pmf.unizg.hr/~vjekovac/files/Erdos_problem_1054.pdf) supplies a much sharper small-ratio bound. The use of reciprocal tails and LCM averaging is already fundamental to that work; the elementary fixed-\(j\) Rankin bound here is applied to the *number* of new outputs, not to a new disproof of the minimum-witness conjecture.
- [Luca–Pomerance](https://math.dartmouth.edu/~carlp/rangeofs7.pdf) supply the positive-density aliquot-output input. The conclusions for the union of divisor-prefix sums follow by the shift and by tracking where each witnessed value first appears.
- Search for exact earlier average-order, positive-density-first-index, and moment statements found the original comments and later numerical investigations but no matching result. This is provisional; the \(O(X)\) upper bound is also an easy consequence of Tao–Kovač, and the lower bound uses a published theorem without claiming novelty for that input. No pointwise formula, second-moment estimate at exponent exactly two, or limiting distribution is claimed.
