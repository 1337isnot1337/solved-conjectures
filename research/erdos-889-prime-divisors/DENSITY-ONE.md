# The density-one scale for Erdős–Selfridge new-prime counts

For integers \(n\ge1\) and \(k\ge0\), let \(v(n,k)\) count distinct primes dividing \(n+k\) and none of \(n,\ldots,n+k-1\), and put \(v_0(n)=\max_{k\ge0}v(n,k)\). Equivalently \(v(n,k)\) counts the distinct prime divisors of \(n+k\) that exceed \(k\). Erdős and Selfridge ask whether \(v_0(n)\to\infty\) for every sufficiently large \(n\); see [Erdős Problem #889](https://www.erdosproblems.com/889) and [their original paper, *Some problems on the prime factors of consecutive integers*, Illinois J. Math. 11 (1967), pp. 428–429](https://doi.org/10.1215/ijm/1256054564).

**Theorem.** On a set of natural density one,
\[
(1-o(1))\sqrt{\frac{\log n}{\log\log n}}
\ \le v_0(n)\le\
(\sqrt2+o(1))\sqrt{\frac{\log n}{\log\log n}}.
\]
This determines the order of magnitude in natural density. It does not prove the pointwise conjecture, or a leading constant.

For the equivalence in the definition, a prime \(p\mid n+k\) divides an earlier integer in the block if and only if \(n+k-p\) lies in \([n,n+k-1]\), or equivalently \(p\le k\).

## Upper bound

Choose a large integer \(X\) and write \(S=\log X\), \(L=\log\log X\). Take fixed \(c>\sqrt2\) and set \(r=\lceil c\sqrt{S/L}\rceil\). If \(v(n,k)\ge r\) for \(n\le X\), then \(k^r<n+k\), by multiplying the \(r\) distinct prime divisors bigger than \(k\) (and this inequality also holds when \(k=0\)). This forces \(k<X\) for large \(X\): otherwise \(k^r\ge k^2>X+k\). It follows that \(k\le (2X)^{1/r}\).

For any such fixed \(k\), uniform \(n\in[1,X]\) satisfies
\[
\Pr\bigl(\omega(n+k)\ge r\bigr)
\le 2\frac{\bigl(\sum_{p\le2X}1/p\bigr)^r}{r!},
\]
by expanding the \(r\)th factorial moment and counting multiples up to \(2X\) of each squarefree product of \(r\) primes. Mertens’ theorem and Stirling’s formula bound this probability by
\[
\exp\bigl(-(c/2+o(1))\sqrt{SL}\bigr).
\]
The number of eligible \(k\)'s is \(\exp((1/c+o(1))\sqrt{SL})\), so the union bound yields an exceptional proportion tending to zero, since \(c/2>1/c\).

## Lower bound

Fix \(0<c<1\) and \(a\) strictly between \(c/2\) and \(1/(2c)\). Set
\[
r=\lceil c\sqrt{S/L}\rceil,\qquad
K=\lfloor\exp(a\sqrt{SL})\rfloor,\qquad
Z=K^{1+1/L},\qquad
\mathcal P=\{p:K<p\le Z,\ p\text{ prime}\}.
\]
For uniform \(n\in[1,X]\) let \(W_k(n)=\#\{p\in\mathcal P:p\mid n+k\}\) for \(1\le k\le K\). Any occurrence \(W_k(n)\ge r\) gives \(v(n,k)\ge r\). All \(p\in\mathcal P\) exceed the difference of any two offsets in this range.

Write \(\mu=\sum_{p\in\mathcal P}1/p\), and \(e_j=\sum_{|A|=j,\ A\subseteq\mathcal P}\prod_{p\in A}1/p\). The quantitative Mertens estimate \(\sum_{p\le u}1/p=\log\log u+B+O(1/\log u)\) gives \(\mu\sim 1/L\). Also
\[
e_r=(1+o(1))\mu^r/r!
=\exp\bigl(-(c/2+o(1))\sqrt{SL}\bigr).
\tag{1}
\]
For the first equality, sample \(r\) primes independently with probability \(1/(p\mu)\). The probability of any repeated prime is at most \(\binom r2\sum_p(1/(p\mu))^2\le r^2/(2K\mu)=o(1)\). The second equality is Stirling’s formula.

Counting one congruence class per squarefree product gives
\[
\mathbb E\binom{W_k}{j}=e_j+O(Z^j/X),
\qquad j=r,r+1,
\tag{2}
\]
uniformly in \(k\), with the error bounded by the number of summands times the per-modulus error \(1/X\). For nonnegative integer \(w\) the bounds
\[
\binom wr-(r+1)\binom w{r+1}\ \le\ \mathbf 1_{w\ge r}\ \le\ \binom wr
\]
follow by inspecting \(w<r\), \(w=r\), and \(w\ge r+1\). Also \((r+1)e_{r+1}\le\mu e_r\), by allowing a repeated prime when multiplying \(e_r\) by \(\mu\). The errors in (2), even with the factor \(r+1\), are \(o(e_r)\): indeed \(Z^{2r}/X=X^{2ac-1+o(1)}\) decays by a fixed power of \(X\), while \(e_r=X^{-o(1)}\). Thus uniformly in \(k\),
\[
\Pr(W_k\ge r)=(1+o(1))e_r.
\tag{3}
\]

For distinct \(i,k\le K\), consider \(\mathbb E[\binom{W_i}r\binom{W_k}r]\). The prime sets at the two offsets cannot share a prime, since that would force \(p\mid i-k\) with \(p>K\). For disjoint prime sets, the Chinese remainder theorem gives one residue class modulo their combined product. Summing the main terms over disjoint pairs gives at most \(e_r^2\), and the total error is \(O(Z^{2r}/X)=o(e_r^2)\) by \(2ac<1\). Consequently
\[
\Pr(W_i\ge r,\ W_k\ge r)\le(1+o(1))e_r^2
\tag{4}
\]
uniformly.

Let \(N(n)=\sum_{k=1}^K\mathbf 1_{W_k(n)\ge r}\). By (1) and (3), \(\mathbb E N\sim Ke_r\to\infty\) since \(a>c/2\). Equations (3)–(4) give \(\mathbb E N^2\le (1+o(1))(\mathbb E N)^2+\mathbb E N\). Hence \(\Pr(N=0)=o(1)\), by the second moment inequality. This proves the density-one lower bound for each fixed \(c<1\).

## Transfer to natural density and prior scope

Restricting to \(X/2<n\le X\) changes \(\sqrt{\log n/\log\log n}\) from \(\sqrt{S/L}\) by a factor \(1+o(1)\) uniformly. Thus the dyadic exceptional proportions tend to zero for every constant strictly outside either endpoint in the displayed theorem. Dyadic summation and a density-one diagonal argument yield the stated simultaneous result.

The [current source survey for #889](https://erdosproblemaday.com/report/889) traces the original pointwise conjecture and its finite and density-one partial results. In particular it records only the immediate Hardy–Ramanujan lower bound \(v_0(n)\ge\omega(n)\sim\log\log n\) for a density-one set. Focused searches for the exact statistic and its normal order found no prior two-sided bound at the scale in this note. This is a partial result for the question as posed.

## Fixed-count exceptional sets

For each fixed integer \(r\ge1\),
\[
\#\{n\le X:v_0(n)<r\}\ll_r X\exp\!\left(-c_r\,\frac{\log X}{\log\log X}\right)
\tag{5}
\]
for some \(c_r>0\). This uses the growing-window Bonferroni comparison in the [Pomerance–Sárközy note](pomerance-sarkozy-omega-fluctuations.md), and negative association instead of approximating all shifted counts by iid counts.

Take \(K=\lfloor\gamma\log X/\log\log X\rfloor\), \(y=K\), and \(z=K^e\), with a small absolute \(\gamma>0\) chosen below. The primes \(y<p\le z\) have harmonic mass \(\lambda=1+o(1)\) by Mertens’ theorem. For each \(1\le k\le K\) record the divisibilities \(p\mid n+k\) for these primes. Different offsets cannot have the same such prime, and all such primes are eligible for \(v(n,k)\). As in that note, the comparison with independent uniform residues modulo each prime has total-variation error at most
\[
O\left(\frac{(2Kz+1)^{R+1}}{X}
+2^{R+2}\frac{(K\lambda)^{R+1}}{(R+1)!}\right)
\]
for a truncation order \(R\), by the CRT inclusion errors and the Bonferroni remainder. Set \(R=\lceil A K\rceil\) with an absolute \(A\) sufficiently large. The second term then decays exponentially in \(K\) by Stirling; the first term is \(X^{A(1+e)\gamma-1+o(1)}\), which decays by a fixed power if \(\gamma\) is sufficiently small. So the joint law differs from the independent-prime model by \(O(e^{-cK})\).

The model's \(K\) occupancy counts are negatively associated: for any two increasing functions of disjoint coordinate groups, their covariance is nonpositive. For one prime its incidence vector has at most one nonzero coordinate. If \(f,g\) increase on disjoint groups of coordinates and \(f_0=f(0),g_0=g(0)\), then \(f-f_0,g-g_0\) are nonnegative and have zero product, proving the property. Independently concatenating two negatively associated families preserves the property by conditioning on the second family: apply the covariance inequality first in the coordinates of the first family, then to the resulting two conditional means, which increase in disjoint groups of coordinates of the second family. Finally taking the sum of the incidences at each offset preserves negative association, since these sums are increasing functions of pairwise disjoint groups.

For each model offset the count is a sum of independent Bernoulli variables of mean \(\lambda=1+o(1)\), and its one-coordinate total-variation distance from Poisson\((\lambda)\) is \(O(\sum_{p>K}p^{-2})=o(1)\) by comparison to independent Poisson variables of the same small means. Thus it reaches \(r\) with probability at least a fixed \(\rho_r>0\) for large \(X\). Negative association also holds for decreasing functions of disjoint groups by negating both functions. Applying it successively to the products of nonnegative indicators that counts are less than \(r\), the probability that all \(K\) counts are less than \(r\) is at most \((1-\rho_r)^K\). Adding the exponentially small CRT comparison error proves (5).
