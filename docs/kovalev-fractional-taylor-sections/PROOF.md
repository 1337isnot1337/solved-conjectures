# Kovalev's zero-free Taylor polynomial conjecture

Principia Math in Progress proved Kovalev’s Conjecture 1.2 for the square root in September and posed fractional powers and sharp segment bounds as further questions. This supplement proves zero-freeness for exponents between zero and one-half and derives the stated segment bounds. [Earlier proof](https://github.com/PrincipiaMathOrg/math-solutions/blob/47371706c400c79d06e3fb62190fcf6f7a725c85/site-backup/mathdb-369171/mathdb-369171-solution.tex).

**Theorem.** Let \(D\) be a positive integer, \(0<\alpha\le\tfrac12\), and
\[
 f(z)=(1+z+\cdots+z^{D-1})^\alpha
     =(1-z^D)^\alpha(1-z)^{-\alpha},
\]
where the analytic branch is normalized by \(f(0)=1\). Every Taylor section \(P_n(z)=\sum_{k=0}^n[z^k]f(z)\,z^k\) is zero-free on the closed unit disk.

In particular, this proves Conjecture 1.2 of [Leonid V. Kovalev, *Sharp bounds for some segments of bounded power series*, §1](https://arxiv.org/html/2507.04544v1#S1), arXiv:2507.04544 (2025); *Arkiv för Matematik* 64 (2026), 273–282, [journal DOI](https://doi.org/10.4310/ARKIV.2026.v64.n2.a4). In the conjecture \(D=d+1\), \(\alpha=\tfrac12\), and \(d>2\). The original paper proves \(d=2\); our proof treats all \(D\) and all section degrees simultaneously. The adjacent trigonometric positivity statement (Conjecture 1.3) is not used or implied.

## 1. The correction as a beta average

Let
\[
 A_k=\frac{(\alpha)_k}{k!},\quad B_k=\frac{(1-\alpha)_k}{k!},\quad
 c_j=B_{j-1}-B_j=\frac{\alpha}{j}B_{j-1}>0
 \quad(j\ge1).
\]
Here \((u)_k=u(u+1)\cdots(u+k-1)\) and \((u)_0=1\). The binomial series are
\((1-z)^{-\alpha}=\sum_{k\ge0}A_kz^k\) and
\((1-u)^\alpha=1-\sum_{j\ge1}c_j u^j\).
Put \(J=\lfloor n/D\rfloor\) and \(A^{[M]}(z)=\sum_{k=0}^M A_kz^k\). Coefficient extraction gives
\[
 P_n(z)=A^{[n]}(z)-\sum_{j=1}^{J}c_j z^{jD}A^{[n-jD]}(z).
 \tag{1}
\]
Using \(kA_k=(k-1+\alpha)A_{k-1}\), differentiation gives
\[
 \frac{d}{dz}\left((1-z)^\alpha A^{[M]}(z)\right)
 =-(M+\alpha)A_M z^M(1-z)^{\alpha-1}.
\]
Integrate from \(0\) to \(z\), along the segment, to get
\[
 (1-z)^\alpha A^{[M]}(z)
 =1-z^{M+1}R_M(z),
 \quad
 R_M(z)=(M+\alpha)A_M\int_0^1 t^M(1-tz)^{\alpha-1}\,dt .
 \tag{2}
\]
The integral is continuous for \(|z|\le1\) by the dominating integrable weight \(t^M(1-t)^{\alpha-1}\). Letting \(z\to1\) in (2) shows \(R_M(1)=1\), so \((M+\alpha)A_M t^M(1-t)^{\alpha-1}\) is a probability density, that of \(T_M\sim\operatorname{Beta}(M+1,\alpha)\). With \(S_M=T_M/(1-T_M)\), \(\lambda=1-z\), and \(\beta=1-\alpha\), we can rewrite (2) as
\[
 R_M(z)=\mathbb E(1+\lambda S_M)^{-\beta}.
 \tag{3}
\]
For \(|z|\le1\), we have \(\Re\lambda\ge0\) and \(|R_M(z)|\le1\); if \(z\ne1\), then \(\Re\lambda>0\) and \(S_M>0\) almost surely, so \(|R_M(z)|<1\).

Substituting (2) into (1) gives the exact identity
\[
 (1-z)^\alpha P_n(z)=G_J(z)-z^{n+1}R(z),
 \quad
 G_J(z)=1-\sum_{j=1}^{J}c_jz^{jD},
 \quad
 R(z)=R_n(z)-\sum_{j=1}^{J}c_j R_{n-jD}(z).
 \tag{4}
\]
For \(|z|\le1\),
\[
 |G_J(z)|\ge 1-\sum_{j=1}^{J}c_j=B_J.
 \tag{5}
\]
We will show that the absolute value of the correction \(R(z)\) is strictly less than this same \(B_J\) away from \(z=1\).

## 2. A disk comparison for two beta averages

Write \(\mathcal D[a,b]\) for the closed disk with real diameter \([a,b]\). For \(0<v\le1\) and \(0<\beta<1\), the principal power \(u\mapsto u^\beta\) sends
\[
 \mathcal D[v,1]\ \text{into}\ \mathcal D[v^\beta,1].
 \tag{6}
\]
To see this, for \(\Re u>0\) use the integral identity
\[
 u^\beta=\frac{\sin(\pi\beta)}{\pi}
       \int_0^\infty \frac{u}{u+t}\,t^{\beta-1}\,dt .
\]
It follows by substitution and the beta integral for positive \(u\), and by analytic continuation on \(\Re u>0\). For \(t>0\), the Möbius map \(u/(u+t)\) sends the disk \(\mathcal D[v,1]\) onto \(\mathcal D[v/(v+t),1/(1+t)]\): its pole is outside the disk, the image circle is conjugation-symmetric, and its two real endpoints are the images of \(v,1\). Integrate the centers and bound the integral of the displacements by the integral of the radii. The new endpoints are \(v^\beta,1\) by the same integral identity, proving (6). The degenerate case \(v=1\) is immediate.

Fix \(0\le M<n\). Let \(X,Y,Z\) be independent unit-rate gamma random variables of respective shapes \(M+1,n-M,\alpha\). Then
\[
 S_n=\frac{X+Y}{Z},\qquad
 S_M=\frac{X}{Z}=V S_n,\qquad V=\frac{X}{X+Y}
\]
have the odds distributions in (3); \(V\) is independent of \(S_n\), has law \(\operatorname{Beta}(M+1,n-M)\), and \(\mathbb E(1-V)=(n-M)/(n+1)\). These beta–gamma facts follow directly by changing variables from \(X,Y\) to \(X+Y,X/(X+Y)\), whose density factors; the odds laws follow in the same way from \(X,Z\) and from \(X+Y,Z\).

Fix \(z\) in the closed unit disk and let \(a=(1+\lambda S_n)^{-\beta}\), \(b=(1+\lambda V S_n)^{-\beta}\). For each realization of \(V,S_n\), the ratio \(a/b\) is the principal \(\beta\)-power of
\[
 \frac{1+\lambda V S_n}{1+\lambda S_n}
 = V+\frac{1-V}{1+\lambda S_n}\ \in\ \mathcal D[V,1].
\]
The disk inclusion follows from \(\Re(\lambda S_n)\ge0\). The power identity follows using principal logarithms, since both \(1+\lambda V S_n\) and \(1+\lambda S_n\) have arguments in the same closed half of \((-\pi/2,\pi/2)\), and the displayed ratio has positive real part. By (6),
\[
 \left|p(V)\frac{a}{b}-1\right|\le p(V)-1,\qquad
 p(V)=\frac{2}{1+V^\beta}.
\]
As \(|b|\le1\), we also have \(|p(V)a-b|\le p(V)-1\). Taking expectations and using independence of \(V,S_n\) gives
\[
 |p_M R_n(z)-R_M(z)|\le p_M-1,\qquad
 p_M:=\mathbb E p(V).
 \tag{7}
\]
Since \(V^\beta\ge V\) and \(0<V<1\), we have \(p(V)-1=(1-V^\beta)/(1+V^\beta)\le1-V\). Thus
\[
 1\le p_M\le 1+\frac{n-M}{n+1}.
 \tag{8}
\]

## 3. The coefficient budget

For \(1\le j\le J\), set \(p_j=p_{n-jD}\) as in (7), and write \(W=\sum_{j=1}^J c_jp_j\). The binomial coefficients have the exact sum rule
\[
 \sum_{j=1}^J j c_j
 =\alpha\sum_{k=0}^{J-1}B_k
 =\frac{\alpha J}{1-\alpha}B_J.
\]
Indeed, the last equality holds by telescoping the coefficient recurrence \(k B_k=(k-\alpha)B_{k-1}\), or by the elementary binomial partial-sum identity. For \(J=0\) both sides are zero. Therefore by (8),
\[
 W\le 1-B_J+\frac{D}{n+1}\frac{\alpha J}{1-\alpha}B_J <1,
 \tag{9}
\]
because \(JD\le n\), \(B_J>0\), and \(\alpha/(1-\alpha)\le1\). Rewrite
\[
 R(z)=(1-W)R_n(z)+
      \sum_{j=1}^J c_j\bigl(p_jR_n(z)-R_{n-jD}(z)\bigr).
\]
For \(|z|\le1\) and \(z\ne1\), the first term uses \(|R_n(z)|<1\) with positive coefficient \(1-W\); (7) bounds the other terms. Hence
\[
 |R(z)|<1-W+\sum_{j=1}^J c_j(p_j-1)
       =1-\sum_{j=1}^J c_j=B_J.
\]
Equations (4) and (5) now show \(P_n(z)\ne0\) on the closed disk except possibly at \(1\). At \(z=1\), (1) and positivity of the \(A_k\) give
\[
 P_n(1)\ge\left(1-\sum_{j=1}^J c_j\right)A^{[n]}(1)
         =B_J A^{[n]}(1)>0.
\]
This completes the proof, with no finite-range verification.

## Sharp bounds for arbitrary segments

In the square-root case, put \(D=n-m+1\) for a segment \(\sum_{k=m}^n a_k z^k\) of a bounded analytic function \(g(z)=\sum_{k\ge0} a_k z^k\), \(\|g\|_\infty\le1\). Write \(b_k=[z^k](1+\cdots+z^{D-1})^{1/2}\). Applying Kovalev's Theorem 1.4 with the first \(D\) weights equal to one and the rest zero yields
\[
 \sup_{\|g\|_\infty\le1}\left\|\sum_{k=m}^n a_k z^k
ight\|_\infty
   =\sum_{k=0}^n b_k^2 .
\]
Indeed the upper bound applies at every \(|z|<1\) by replacing \(g(w)\) with \(g(zw)\). For sharpness, the denominator \(P_n\) just proved zero-free gives the admissible Blaschke quotient \(P_n^*/P_n\) in Theorem 1.4; the associated segment, evaluated at \(1\), attains the coefficient-sum bound. For fixed \(D\), as \(n	o\infty\), Parseval gives the limit
\[
 rac{1}{2\pi}\int_0^{2\pi}
      |1+e^{it}+\cdots+e^{i(D-1)t}|\,dt .
\]
This is a consequence, not a separate conjecture resolution.

## Scope and attribution

* Multiplying by \(\sqrt{1-z}\) appears in Kovalev's proof for \(D=3\), particularly his Proposition 3.2. That proof shows nonpositive nonconstant coefficients of the product in that case. The present all-order argument replaces this sign test by the beta-average comparison (7) and the budget (9); it does not assume that the analogous coefficient signs persist for \(D>3\).
* [Myeongjin Kang's October 2026 preprint](https://mathdb.com/abs/2610.00766) gives an exact counterexample to the adjacent Conjecture 1.3 on real parts, and expressly does not settle Conjecture 1.2. The two statements must not be conflated. An independent integer calculation reproduces the sign of Kang's instance.
* The earlier square-root proof appears in [Principia’s September manuscript](https://github.com/PrincipiaMathOrg/math-solutions/blob/47371706c400c79d06e3fb62190fcf6f7a725c85/site-backup/mathdb-369171/mathdb-369171-solution.tex).
