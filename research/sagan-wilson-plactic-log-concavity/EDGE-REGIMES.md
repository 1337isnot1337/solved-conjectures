# Two growing log-concave edge regimes for plactic centralizer coefficients

Let \(c_{n,m}\) count length-\(n\) words over \([m]\) in the plactic centralizer of \(1\), and write \(c_{n,m}=\sum_k a_{n,k}\binom{m}{k}\) as in [Sagan–Wilson, published Conjecture 7.3(c)](https://users.math.msu.edu/users/bsagan/Papers/Old/cpm-pub.pdf#page=19). [Sagan–Zhao](https://doi.org/10.1007/s00233-026-10652-4) proved nonnegativity and showed that the number \(b_{n,k}\) of these words using all \(k\) letters satisfies \(b_{n,k}=a_{n,k-1}+a_{n,k}\). Their question at the end of Section 4 (Conjecture 4.6 in the [author preprint](https://arxiv.org/abs/2512.21401)) asks in turn for the log-concavity of the packed counts. The earlier mode counterexample to Sagan–Wilson 7.3(d) does not decide either log-concavity question.

**Results.** For the original binomial coefficients, each fixed positive index \(k\), and each fixed positive deficit \(r\), has the exponential limits
\[
 a_{n,k}^{1/n}\to k,\qquad  a_{n,n-r}^{1/n}\to r^2.
\]
The log-concavity inequality is strict in both growing regimes
\[
 2\le k\le (n/(2\log(n+1)))^{1/3},
 \qquad
 2\le n-k\le (n/(100\log(n+1)))^{1/4}.
\]
These claims do not prove log-concavity in the middle or for all rows. Targeted searches for the source question, coefficient asymptotics, and the small-alphabet regime found the original sources and related results, not these uniform ranges.

## 1. Left edge

By Sagan–Zhao's Proposition 2.5, a word belongs to the centralizer precisely when its longest weakly increasing subsequence has length equal to the number of \(1\)'s. Under the usual word RSK correspondence, the insertion tableau is semistandard, and its first row length is that longest length. Every \(1\) appears in the first row, so the condition is that this row consist entirely of \(1\)'s. A semistandard tableau on \([k-1]\) of the tail shape  \(\lambda^-=(\lambda_2,\lambda_3,\ldots)\) gives exactly one such insertion tableau by increasing every entry by one and attaching the all-\(1\) first row. This recovers Sagan–Wilson’s counting formula (2):
\[
 c_{n,k}=\sum_{\lambda\vdash n,\,\ell(\lambda)\le k}
 f^\lambda s_{\lambda^-}(1^{k-1}),
 \qquad
 k^n=\sum_{\lambda\vdash n,\,\ell(\lambda)\le k}
 f^\lambda s_\lambda(1^k).
\]
Pad \(\lambda\) by zeros as usual. In the Weyl dimension formula all pairs of indices at least two cancel in the ratio, giving
\[
 \frac{s_\lambda(1^k)}{s_{\lambda^-}(1^{k-1})}
  =\prod_{j=2}^k\frac{\lambda_1-\lambda_j+j-1}{j-1}
  \le\binom{n+k-1}{k-1}\le(n+1)^{k-1}.
\]
The last bound follows factorwise from \(1+n/(j-1)\le1+n\). Therefore \(k^n/(n+1)^{k-1}\le c_{n,k}\le k^n\). For \(n\ge2\), Sagan–Zhao's Theorem 4.2 gives \(a_{n,0}=0\) and nonnegativity. Thus \(0\le a_{n,j}\le c_{n,j}\le j^n\). Consequently
\[
 a_{n,k}=c_{n,k}-\sum_{j<k}\binom kj a_{n,j}
 \ge k^n(n+1)^{-(k-1)}-2^k(k-1)^n .
\]
This proves the fixed-index limit. If \(2k^3\log(n+1)\le n\) and \(k\ge2\), then
\(n/k\ge 2k^2\log(n+1)>(k-1)\log(n+1)+(k+1)\log2\).
In that range \(a_{n,k}\ge k^n/[2(n+1)^{k-1}]\). The desired log-concavity ratio is at least
\[
 \frac{(k^2/(k^2-1))^n}{4(n+1)^{2(k-1)}}>1,
\]
since \(\log(k^2/(k^2-1))\ge k^{-2}\).

## 2. Right edge

Write \(P(N,p)\) for the number of size-\(N\) permutations with longest increasing subsequence at most \(p\). Recording the column in which each label of a standard Young tableau occurs determines the tableau: the labels in any column increase from top to bottom. Permutation RSK then gives \(P(N,p)\le p^{2N}\).

For a lower bound take the partition with \(p\) rows all of sizes \( \lfloor N/p\rfloor\) or \(\lceil N/p\rceil\), then transpose it to get width at most \(p\). For the untransposed partition the multinomial coefficient \(N!/\prod_i\lambda_i!\) is maximal over weak \(p\)-compositions: if two entries differ by more than one, moving one unit from the larger to the smaller increases it. Since these coefficients sum to \(p^N\) and there are at most \((N+1)^p\) compositions, it is at least \(p^N/(N+1)^p\). In each row of the hook-length formula, the ratio of the hook product to the row factorial is at most \((N+p)^{p-1}\), by using at most \(p-1\) cells below each and cancelling the two resulting factorials. Squaring the resulting lower bound for the number of standard tableaux, we obtain
\[
 P(N,p)\ \ge\ \frac{p^{2N}}{(N+1)^{2p}(N+p)^{2p(p-1)}}.
\]

In a packed word with \(k\) letters and \(r=n-k\) extra copies, the number of \(1\)'s is at most \(r+1\). For a fixed multiplicity composition, standardize by increasing ranks in occurrence order within each letter; that is injective and preserves the longest weakly increasing subsequence as an ordinary increasing subsequence. The composition can be chosen in \(\binom{n-1}{r}\) ways. For a lower bound, start with a permutation of the other \(k-1\) letters of longest increasing subsequence at most \(r+1\), then append \(r+1\) ones. A weakly increasing subsequence cannot follow any preceding larger letter by a one, so the resulting word belongs to the centralizer. Setting \(p=r+1\) gives
\[
 P(n-p,p)\le b_{n,n-p+1}\le\binom{n-1}{p-1}p^{2n}.
\]
In particular \(b_{n,n-p+1}^{1/n}\to p^2\) at each fixed \(p\). Since \(a_{n,n}=0\) and
\(b_{n,k+1}-b_{n,k+2}\le a_{n,k}\le b_{n,k+1}\) when \(k\le n-1\), taking \(b_{n,n+1}=0\), the right-edge limit for \(a\) follows by setting \(k=n-p\).

For a uniform bound suppose \(p\ge2\) and \(100p^4\log(n+1)\le n\). For the middle term, the lower bound on \(P(n-p,p)\) gives
\[
 b_{n,n-p+1}\ge p^{2n}(n+1)^{-2p^2-2p}
\]
using \(p\le n\). Its error \(b_{n,n-p+2}\) is at most \(n^{p-2}(p-1)^{2n}\), which is less than half the lower bound: their log ratio is at most
\((2p^2+3p)\log(n+1)-2n/p<-\log2\).
The neighboring \(a\) terms at deficits \(p-1,p+1\) have upper bounds \(n^{p-2}(p-1)^{2n}\) and \(n^p(p+1)^{2n}\), respectively. The ratio of the middle square to this product is thus at least
\[
 \frac{(p^2/(p^2-1))^{2n}}{4(n+1)^{4p^2+6p}}\,>\,1 ;
\]
the last inequality follows from \(2n/p^2\ge200p^2\log(n+1)\). This proves the asserted growing right-hand range.

## 3. Parallel bounds for packed counts

The same two edge regimes hold for the packed sequence in Sagan–Zhao's distinct conjecture. For the left edge use \(b_{n,k}\ge a_{n,k}\) and \(b_{n,j}\le j^n\). For the right edge set \(p=n-k+1\) (rather than \(p=n-k\)). The lower bound for the middle \(b\) is already valid without subtracting the next packed count; its two neighboring upper bounds again have product at most \(n^{2p-2}(p^2-1)^{2n}\). Thus strictness follows under the same sufficient bound \(100p^4\log(n+1)\le n\), with the edge endpoint \(p=1\) omitted because it has no two positive neighbors. The exponential limits are \(b_{n,k}^{1/n}\to k\) at fixed \(k\) and \(b_{n,n-p+1}^{1/n}\to p^2\) at fixed \(p\).
