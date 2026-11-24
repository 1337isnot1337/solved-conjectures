# An effective rate for the exact-degree Borcea asymptotic

With \(C_{p,n}\) denoting the optimal ratio for polynomials of **exact** degree \(n\), as in [the qualitative result](ASYMPTOTIC-SHARP.md), we obtain
\[
 1\le C_{p,n}\le C_{1,n}
 \le 1+O\!\left(\sqrt{\frac{\log\log n}{\log n}}\right)
 \qquad(n\to\infty),
 \quad 1\le p\le\infty.
 \tag{1}
\]
The implied constant is absolute. This gives an effective bound, not the exact finite-degree inequality or the at-most-degree quantifier printed in the original Conjecture 3. The proof replaces the subsequence extraction in the large-distance part of the qualitative argument by a Rouché comparison with a uniform lower bound on a circle.

## Explicit degree threshold

Fix \(0<\epsilon\le1\). Write
\[
 \delta=\epsilon^2/200,\qquad
 K=\left\lceil 2/\delta\right\rceil,\qquad
 d=\epsilon/(16K),\qquad
 W=4K^2+2,\qquad
 \kappa=\tfrac12\left(\frac{d}{d+W}\right)^{2K},\qquad
 L=2+\frac{8K}{\kappa}.
\]
Then \(C_{1,n}\le1+\epsilon\) whenever \(n\) is an integer satisfying
\[
 n\ \ge\
 N(\epsilon):=
 \max\!\left\{
     4,\ 1+\frac{2\log4}{\epsilon},\
     \frac{80}{\delta^2\kappa},\
     \frac{8 L}{\delta\epsilon}
 \right\}.
 \tag{2}
\]

To see this, suppose a root of a degree-\(n\) polynomial were at distance greater than \(r=1+\epsilon\) from every critical point. Normalize the mean deviation to one. Write \(a\) for the chosen root's distance to a fixed geometric median. Inequality (6) in [the qualitative proof](ASYMPTOTIC-SHARP.md) gives, for \(m=n-1\),
\[
 1\le r^{-m}+r^{-n}
     +\frac{e\,m\,a(r^{-1}+r^{-2})}{(m-1)^2(1-1/r)^2}.
\]
The first two terms sum to at most \(1/2\) by (2), since \(\log(1+\epsilon)\ge\epsilon/2\). The last term is less than \(96a/(n\epsilon^2)\): use \(m/(m-1)^2\le4/n,\ e<3,\ r^{-1}+r^{-2}\le2\), and \(1-1/r\ge\epsilon/2\). Consequently \(a\ge\delta n\).

Translate the chosen root to \(0\) and rotate the median to \(a>0\). Put \(\alpha=a/n\in[\delta,1]\). The normalized roots \(z_i\) satisfy \(\sum_i|z_i-a|=n\). Bulk roots are those with \(|z_i-a|\le a/2\); there are at most \(K\) nonbulk roots. Let \(Q\) be the monic product of factors from all the roots with \(|z_i|\le L\), and write the full monic polynomial as \(P=Q B\). By (2), \(L/a\le\epsilon/8<1/2\), so none of these roots is bulk. The degree \(k=\deg Q\) lies in \([1,K]\). Since every root in \(Q\) uses at least \(a-L\) units of the cost \(n\),
\[
 k\alpha\le (1-L/a)^{-1}\le 1+\epsilon/4.
 \tag{3}
\]
The constant-field calculation of §3 in [the qualitative proof](ASYMPTOTIC-SHARP.md#3-linear-median-distance) therefore gives a zero of \(Q'-Q/\alpha\) in \(|z|\le1+\epsilon/4\).

## A uniform contour lower bound

Define the rational function
\[
 H(z)=Q'(z)/Q(z)-1/\alpha.
\]
Let \(\xi_i\) be the \(k\) roots of \(Q\), and \(\eta_i\) the \(k\) roots of \(Q'-Q/\alpha\), both with multiplicities. If the numerator and denominator have common factors, keep them in both lists. A circle \(\Gamma=\{|z|=s\}\) can be chosen with \(1+\epsilon/2<s<1+\epsilon\) and
\[
 \big|s-|\xi_i|\big|\ge d,\qquad \big|s-|\eta_i|\big|\ge d
 \quad(1\le i\le k).
\]
Indeed, removing intervals of radius \(d\) about the at most \(2K\) forbidden radii removes length at most \(4Kd=\epsilon/4\) from an interval of length \(\epsilon/2\).

Find a point \(|z_*|\le4K^2\) at distance at least \(2K\) from every \(\xi_i\). The union of their excluded disks has area at most \(4\pi K^3\), strictly less than the area \(16\pi K^4\) of the search disk. Hence
\[
 |H(z_*)|\ge 1/\alpha-k/(2K)\ge1/2.
\]
For any \(z\in\Gamma\), \(|z-z_*|\le W\). The exact product formula gives
\[
 \frac{|H(z)|}{|H(z_*)|}
 =\prod_{i=1}^k
       \frac{|z-\eta_i|}{|z_*-\eta_i|}
       \frac{|z_*-\xi_i|}{|z-\xi_i|}
 \ge
 \left(\frac{d}{d+W}\,\frac{2K}{2K+W}\right)^k
 \ge \left(\frac{d}{d+W}\right)^{2K}.
\]
For the first inequality, apply the triangle inequality in each denominator, using \(|z-\eta_i|\ge d\) and \(|z_*-\xi_i|\ge2K\). The last follows from \(d\le2K\) and \(k\le K\). This proves \(|H(z)|\ge\kappa\) on \(\Gamma\), regardless of \(L\).

## Comparison with the true field

For \(|z|\le2\) the nonbulk roots not in \(Q\) contribute at most \(K/(L-2)=\kappa/8\) to \(B'/B\). The bulk terms differ from \(1/(z-a)\) per root by a total of at most \(8n/a^2\), as in the qualitative proof. Replacing the bulk count by \(n\) changes their reference terms by at most \(K/(a-2)\le2K/a\). Finally
\[
 \left|\frac{n}{z-a}+\frac1\alpha\right|\le4n/a^2.
\]
The last three bounds use \(a\ge8\), which follows from (2). Since \(K\le3/\delta\), the bulk field differs from \(-1/\alpha\) by at most \(18/(\delta^2 n)\le\kappa/4\) via (2). Thus \(|B'/B+1/\alpha|<\kappa\) on \(\Gamma\).

Both \(P'/B\) and \(Q'-Q/\alpha\) are holomorphic inside \(\Gamma\), since all \(B\)-roots have modulus greater than \(L>2\). On \(\Gamma\),
\[
 \big|P'/B-(Q'-Q/\alpha)\big|
 = |Q|\,|B'/B+1/\alpha|
 < |Q|\,|H|
 = |Q'-Q/\alpha|.
\]
By (3) the comparison polynomial already has a zero inside \(\Gamma\); Rouché's theorem gives a zero of \(P'/B\) there too. This contradicts the distance assumption and proves (2).

## From the threshold to the rate

As \(\epsilon\downarrow0\), \(K=O(\epsilon^{-2})\), \(W=O(\epsilon^{-4})\), and \(d^{-1}=O(\epsilon^{-3})\), so
\[
 \log\kappa^{-1}=O\!\left(\epsilon^{-2}\log(2/\epsilon)\right),
 \qquad
 \log N(\epsilon)=O\!\left(\epsilon^{-2}\log(2/\epsilon)\right).
\]
For a sufficiently large absolute \(A\) and all sufficiently large \(n\), setting \(\epsilon=A\sqrt{\log\log n/\log n}\) gives \(\epsilon\le1\) and \(N(\epsilon)\le n\). This proves (1) for \(p=1\). The other \(p\) and sharp lower bound follow as in the qualitative proof.

The absolute-moment reciprocal bound and the effective large-distance localization are the additional arguments here. The reciprocal integration identity goes back to [Bouthat and Fallat, §3.2](https://arxiv.org/html/2610.12499v1#S3.SS2); the constant-field root displacement is a special case of [Ćurgus and Mascioni, Theorem 9.1 and Proposition 10.1](https://faculty.curgus.wwu.edu/Papers/RootsOperFinal.pdf). No rate optimality is claimed.

## Exact bound for a wider range of distant roots

The same contour method gives a sharp, non-asymptotic constant for a restricted set of roots in each sufficiently large degree. There is an absolute \(A\) such that whenever
\[
 |a_0-c|
 \ \ge\ A n\frac{\log\log n}{\log n}\,\sigma_1(P)
 \tag{4}
\]
for a root \(a_0\) and a geometric median \(c\) of its degree-\(n\) polynomial, some critical point is within \(\sigma_1(P)\) of \(a_0\). This strengthens the fixed-multiple-of-\(n\) range in [the macroscopic outlier result](MACROSCOPIC-OUTLIERS.md). No statement is made here on exactness for smaller distances.

First, let \(R_k\) be the largest zero modulus of \(\sum_{j=0}^k w^j/j!\). For \(k\ge2\) we claim
\[
 R_k\le k\left(1-\frac{1}{16k^4}\right).
 \tag{5}
\]
Write \(b_j=k^j/j!\) and \(c_0=b_0,\ c_j=b_j-b_{j-1}=(1-j/k)b_j\) for \(1\le j\le k\). Thus \(c_j\ge0\), \(\sum_j c_j=b_k\), and \(c_{k-2},c_{k-1}\ge b_k/k\), also for \(k=2\). A zero \(z=\rho e^{i\theta}\) of \(\sum_j b_jz^j\) has \(\rho\le1\) by Eneström–Kakeya, and \(|\theta|\ge\pi/k\) for the principal angle: for smaller angles all terms can be rotated into the open right half-plane. Suppose \(\rho\ge1-1/(16k^4)\). In
\[
 \sum_{j=0}^k c_jz^j=b_k z^{k+1}
\]
the two adjacent terms \(j=k-2,k-1\) have lengths \(U,V\ge b_k/(2k)\), by \(\rho^{k-1}\ge1-(k-1)/(16k^4)\ge1/2\). Their triangle-inequality loss is
\[
 U+V-\sqrt{(U+V)^2-4UV\sin^2(\theta/2)}
 \ge \min(U,V)\sin^2(\theta/2)
 \ge \frac{b_k}{2k^3}.
\]
Here \(\sin(\pi/(2k))\ge1/k\) by concavity of sine. Thus the modulus on the left is at most \(b_k(1-1/(2k^3))\). The modulus on the right is at least \(b_k(1-(k+1)/(16k^4))\), strictly larger, a contradiction. This proves (5).

For clarity, a quantitative implication giving (4) is as follows. Normalize \(\sigma_1=1\), translate the prescribed root to \(0\), put its median at a positive real \(a\), and suppose \(a\ge\delta n\), for \(0<\delta\le1\). Set
\[
 K=\lceil 2/\delta\rceil,\quad
 \eta=1/(16K^4),\quad d=\eta/(32K),\quad W=4K^2+2,\quad
 \kappa=\tfrac12(d/(d+W))^{2K},\quad L=2+8K/\kappa.
\]
Assume \(n\ge\max\{80/(\delta^2\kappa),4L/(\delta\eta)\}\). As before let \(Q\) consist of roots at modulus at most \(L\), with degree \(1\le k\le K\), and let \(P=QB\). If \(k=1\), every other root has modulus greater than \(L>2\); the [exact isolation result](COLLINEAR-AND-ISOLATED.md#a-sufficient-complex-isolation-condition) applies. If \(k\ge2\), the Grace–Walsh–Szegő argument in [the qualitative proof](ASYMPTOTIC-SHARP.md#3-linear-median-distance), with \(R_k\) used in place of its upper bound \(k\), gives a zero of \(Q'-Q/\alpha\) at modulus at most \(\alpha R_k\), where \(\alpha=a/n\). The cost constraint and \(L/a\le\eta/4\) give
\[
 \alpha R_k\le\frac{1-\eta}{1-\eta/4}\le1-\eta/2.
\]
Now choose the contour radius in \((1-\eta/4,1)\), still avoiding each root radius of \(Q\) and \(Q'-Q/\alpha\) by at least \(d\), since the forbidden intervals remove at most \(4Kd=\eta/8\) of that interval. The preceding uniform contour bound \(|H|\ge\kappa\) and the field error estimate \(|B'/B+1/\alpha|<\kappa\) remain valid without change, as their only radius restriction was \(|z|\le2\). Rouché gives a critical point inside this radius, strictly less than 1.

The logarithm of the displayed threshold is \(O(\delta^{-1}\log(2/\delta))\) as \(\delta\downarrow0\). Taking \(\delta=A\log\log n/\log n\) with a sufficiently large absolute \(A\) proves (4). For any \(\sigma_1=0\) the roots all coincide and the conclusion already holds.
