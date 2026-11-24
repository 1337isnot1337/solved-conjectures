# Erdős #931: sharper counting for unequal block lengths

**Status:** Partial result. The ordered finiteness conjecture is not proved. The bound below improves the exponent in the recent Venkat preprint whenever the fixed lengths differ. Equal lengths retain the previous exponent.

For \(h\ge 2\), write \(B_h(u)=\prod_{i=0}^{h-1}(u+i)\) and \(E_h(u)=B_h(u)/\operatorname{rad}(B_h(u))\). We count positive starts \(x<y\le X\) with \(\operatorname{rad}B_k(x)=\operatorname{rad}B_\ell(y)\). Dropping disjointness only increases the count.

**Theorem.** For fixed \(k>\ell\ge3\) and every \(\varepsilon>0\), the number of pairs is \(O_{k,\ell,\varepsilon}(X^{s+\varepsilon})\), where
\[
r=\frac{\ell-1}{k-1},\qquad
g=\gcd(k,\ell),\qquad
s=\max\left\{\frac35,\frac{1+r+rg/\ell}{3}\right\}<\frac23.
\]
For fixed \(2\le k<\ell\) the number is \(O_{k,\ell,\varepsilon}(X^{3/5+\varepsilon})\). These lengths are not part of the ordered problem.

## 1. The large-excess tail

For fixed \(h\ge2\), \(U\ge2\), \(1\le T\le U^{2/5}\), and \(\varepsilon>0\),
\[
\#\{u\in[U,2U)\cap\mathbb Z:E_h(u)>T\}
\ll_{h,\varepsilon} U^\varepsilon(U/T+TU^{1/5}+U^{3/5}). \tag{1}
\]
Set \(d_i=(u+i)/\operatorname{rad}(u+i)\). Since a prime dividing two block entries divides their fixed nonzero difference,
\[
1\le E_h(u)/\prod_i d_i
=\prod_i\operatorname{rad}(u+i)/\operatorname{rad}B_h(u)\le C_h
\]
for a fixed \(C_h\). Put \(L=T/C_h\). It suffices to count \(\prod d_i>L\); assume \(L\ge2\), since otherwise the \(U/T\) term handles all starts.

For \(a\mid d_i\) one has \(a\operatorname{rad}(a)\mid u+i\). The number of starts for which some \(d_i\ge L\) is at most
\[
O_h\left(U\sum_{a\ge L}\frac1{a\operatorname{rad}(a)}\right)
=O_{h,\varepsilon}(U L^{-1+\varepsilon}).
\]
There is no additive 1 because we count positive multiples up to \(2U+h\). The last inequality uses the convergent Euler product for \(\sum_a a^{-\varepsilon}/\operatorname{rad}(a)\).

Assume then that all \(d_i<L\). Call a prime *medium* if \(p>U^{1/5}\). First bound starts for which two different shifts \(u+i,u+j\) contain medium primes \(p,q\) with \(p^2\mid u+i\), \(q^2\mid u+j\). For sufficiently large \(U\) the primes are distinct, since \(p=q\) would force \(p^2\mid i-j\ne0\). Both primes are below \(L\le U^{2/5}\). Fix dyadic ranges \(p\asymp D,\ q\asymp E\) lying within these bounds up to fixed factors. If \(DE\le U^{1/2}\), CRT gives \(O_h(U/(DE)+DE)=O_h(U^{3/5})\) starts per range: each of at most \(O(DE)\) prime pairs has \(O(U/(D^2E^2)+1)\) starts.

If \(DE>U^{1/2}\), we count integer solutions
\[
e^2 v-d^2 w=j-i,\quad d\asymp D,\quad e\asymp E,\quad
w\asymp A:=U/D^2,\quad v\asymp B:=U/E^2,
\]
allowing any positive integers \(d,e\) in place of primes. Thomas Reuss's [*Pairs of \(k\)-free numbers, consecutive square-full numbers*, Theorem 1](https://arxiv.org/pdf/1212.3150v2) with exponents \((k,l)=(2,1)\) and fixed nonzero shift gives
\[
\ll_{h,\varepsilon} U^\varepsilon
\min\{(DEM)^{1/2}+D+E,\ (ABM)^{1/2}+A+B\},
\quad
\log M=\frac98\frac{\log(DE)\log(AB)}{\log U}.
\]
To match Reuss's strict dyadic boxes, split each of the ranges for \(d,e,u\) into a bounded number of multiplicative intervals of ratio at most \(11/10\), with lower endpoints \(D',E',Z\) taken slightly below any included endpoint. Use the theorem's size parameter \(U'=3Z/4\). For sufficiently large \(U\), \(w=(u+i)/d^2\) lies strictly between \(U'/D'^2\) and \(2U'/D'^2\), and similarly \(v\) lies between \(U'/E'^2\) and \(2U'/E'^2\). Thus the theorem applies on its literal boxes, and changing from \(U',D',E'\) to \(U,D,E\) in the displayed estimate costs only constant factors. All size conditions hold: \(\psi=\log(DE)/\log U\) lies in \((1/2,4/5+O(1/\log U)]\), so \(\log(DE)\), \(\log(AB)\) and \(\log U\) are comparable, and \(DE\gg U^{1/2}\). Taking the first entry in the minimum, its square-root term has exponent
\[
\frac{\psi}{2}+\frac9{16}\psi(2-2\psi)\le\frac{169}{288}<\frac35,
\qquad D+E\ll U^{2/5}.
\]
Summing over the shifts and dyadic ranges gives \(O_{h,\varepsilon}(U^{3/5+\varepsilon})\).

In the remaining starts, all medium prime factors of the \(d_i\) occur in at most one \(d_i\). Begin with the entire medium-prime part of that \(d_i\), which is less than \(L\), or with 1 if there is none. Multiply in the smaller primes with their positions and multiplicities until the product first reaches \(L\). This gives \(a_i\mid d_i\) with
\[
L\le\prod_i a_i\le LU^{1/5}.
\]
For any compatible vector, \(m_i=a_i\operatorname{rad}(a_i)\) satisfies \(\gcd(m_i,m_j)\mid |i-j|\) for \(i\ne j\). So the CRT modulus \(\operatorname{lcm}(m_i)\gg_h \prod_i m_i\). There are \(O_h(U/\prod_i m_i+1)\) starts per vector. Summing the first terms gives \(O_{h,\varepsilon}(U L^{-1+\varepsilon})\) by the same Euler product, applied independently to all \(a_i\). Summing the 1 terms costs \(O_{h,\varepsilon}(U^\varepsilon LU^{1/5})\) by the \(h\)-fold divisor bound. This completes (1).

## 2. A rectangular integral-point estimate for fixed ratios

Fix \(k>\ell\ge3\). Suppose \(K\le x<2K,\ Y\le y<2Y\), \(1\le K\le Y\), and \(B_k(x)/B_\ell(y)=a/b\), where \(a,b>0\). Uniformly in \(a,b,K,Y\), there are \(O_{k,\ell,\varepsilon}(K^{g/\ell}Y^\varepsilon)\) integer points in the box.

For a component \(P(X,Y)=0\) over \(\mathbb C\) of \(bB_k(X)-aB_\ell(Y)=0\), put \(d=\deg_Y P\). The top weighted part with weights \((\ell/g,k/g)\) of the full polynomial is \(bX^k-aY^\ell\). It is a product of \(g\) distinct irreducible binomials proportional to \(X^{k/g}-c_j Y^{\ell/g}\); irreducibility follows by a unimodular monomial change in \(\mathbb C[X^{\pm1},Y^{\pm1}]\). The top parts of all factors multiply, so the top part of \(P\) contains a positive number of these factors and has a pure \(Y\) power of degree at least \(\ell/g\). In particular \(d\ge\ell/g\).

Write \(u=x/K,\ v=y/Y\). Over the reals in the box, the equation determines \(v=v(u)\) uniquely since \(B_\ell\) is strictly increasing for \(y>0\). Its domain inside \([1,2]\) with \(v\in[1,2]\) is an interval. Assume the interval is nonempty; then \((a/b)Y^\ell/K^k\) is bounded above and below in terms of \(k,\ell\). The normalized equation \(K^{-k}B_k(Ku)=(a/b)(Y^\ell/K^k)Y^{-\ell}B_\ell(Yv)\) has uniformly bounded derivatives of each fixed order, and the derivative of its right hand side with respect to \(v\) is bounded below by a positive constant. Implicit differentiation gives \(\sup|v^{(j)}|\ll_{j,k,\ell}1\) on the whole interval.

Choose a fixed positive integer \(m\), use monomials \(x^i y^j\) with \(0\le i<m,\ 0\le j<d\), and let \(D=md\ge2\). For any \(D\) integer points in a length-\(\delta\) interval of the normalized \(u\) coordinate, the monomial evaluation matrix has integer determinant and, by the Vandermonde divided-difference estimate, absolute value at most
\[
C_{k,\ell,m}K^{d m(m-1)/2}Y^{m d(d-1)/2}\delta^{D(D-1)/2}.
\]
Indeed factor \(K^iY^j\) from each column, then apply the standard divided-difference identity (or [Pila's Lemma 2](https://people.maths.ox.ac.uk/pila/alcurves.pdf)) to the functions \(u^iv(u)^j\), whose first \(D-1\) derivatives are bounded. Take \(\delta=c_{k,\ell,m}K^{-(m-1)/(md-1)}Y^{-(d-1)/(md-1)}\) with a sufficiently small \(c\). Every such determinant vanishes. Consequently the points of this component in the interval lie on one nonzero auxiliary polynomial of \(Y\)-degree \(<d\) and total degree at most \(m+d-2\), by the rank bound on the evaluation matrices. It cannot contain \(P\) as a factor, so Bézout gives \(O_{k,\ell,m}(1)\) intersections. There are \(O_{k,\ell,m}(K^{1/d}Y^\varepsilon)\) intervals for \(m\) sufficiently large, because \((m-1)/(md-1)\le1/d\) and \((d-1)/(md-1)<\varepsilon\). Summing the at most \(k\) components gives the claimed bound.

## 3. Counting pairs

We use Venkat's dyadic ratio method from [*Equal prime divisors in disjoint blocks of consecutive integers*, §2](https://hexagonmath.org/pdf/2611.00599v1), replacing his repeated-prime estimate by (1) and his square-box integral-point estimate by the rectangular estimate above.

A fixed block with start at most \(Z\) has \(O(\log Z/\log\log Z)\) distinct prime divisors in its product. If their set is \(S\), then for any fixed \(\eta>0\) the number of positive \(S\)-smooth integers up to \(Z\) is at most
\[
Z^\eta\prod_{p\in S}(1-p^{-\eta})^{-1}=Z^{\eta+o(1)}.
\]
Since a partner's first term must be \(S\)-smooth, this gives \(O_\varepsilon(Z^\varepsilon)\) partners in either direction. Use \(Z=2Y+\max(k,\ell)\) on each dyadic \(y\)-scale. This also handles bounded starts.

### Earlier block shorter

When \(k<\ell\), \(Y\le y<2Y\) and \(x<y\), equality of radicals gives \(E_\ell(y)\gg_{k,\ell}Y^{\ell-k}\). For large \(Y\) use (1) with \(T=Y^{2/5}\), giving \(O(Y^{3/5+\varepsilon})\) possible late starts. Multiply by the partner bound and sum the scales.

### Earlier block longer

Fix \(K\le x<2K,\ Y\le y<2Y\) dyadic, \(K\le Y\). Set \(N=Y^s\). If \(K\le N\) the partner bound handles the entire box. Otherwise put \(A=K/N,\ B=Y/N\). For either start scale \(U\in\{K,Y\}\), the cutoff \(T=U/N\) is in \([1,U^{2/5}]\), because \(s\ge3/5\). The right side of (1) is \(O_\varepsilon(Y^{s+\varepsilon})\): \(U/T=N\) and both \(TU^{1/5}\) and \(U^{3/5}\) are at most \(Y^{3/5}\le N\). Thus discarding pairs where \(E_k(x)>A\) or \(E_\ell(y)>B\) costs \(O(Y^{s+\varepsilon})\) using the partner bound and smaller intermediate error exponents.

For retained pairs the reduced ratio \(a/b=B_k(x)/B_\ell(y)=E_k(x)/E_\ell(y)\) satisfies \(a\le A,\ b\le B,\ a/b\asymp_{k,\ell}R:=K^k/Y^\ell\). There are \(O_{k,\ell}(\min(B^2R,A^2/R))\) such ratios: for fixed \(b\) at most \(O(Rb)\) positive \(a\) can occur, or vice versa. Each ratio contributes \(O_{\varepsilon,k,\ell}(K^{g/\ell}Y^\varepsilon)\) by §2. As functions of \(K>0\), \(K^{g/\ell}B^2R\) increases and \(K^{g/\ell}A^2/R\) decreases (since \(2-k+g/\ell<0\)). Their common value is at \(K=Y^r\), and equals \(Y^{1+r-2s+rg/\ell}\). The retained count is therefore \(O(Y^{s+\varepsilon})\) by the definition of \(s\). Sum over the dyadic boxes and absorb the logarithms into \(\varepsilon\).

Finally \(r/\ell<1/k\) and \(g\le k-\ell\) imply \(r+rg/\ell<r+g/k\le1-(k-\ell)/(k(k-1))<1\). So \(s<2/3\) for every fixed unequal ordered pair. Examples: \(s(4,3)=17/27\), \(s(5,3)=3/5\).

## 4. Literature and scope

- The [catalog statement of Erdős #931](https://www.erdosproblems.com/931) fixes \(k\ge\ell\ge3\), requires disjoint blocks in this order, and asks finiteness. Erdős's 1976 printed statement did not require \(k\ge\ell\).
- [Jonah Lebowitz-Lockard](https://arxiv.org/abs/2507.09899) proved an \(X^{1+o(1)}\) counting bound and stated finiteness for all fixed length pairs other than \((2,2)\) as Conjecture 11.
- [Sunay Venkat](https://hexagonmath.org/2611.00599v1) gives \(X^{2/3+\varepsilon}\) and an infinite Pell family with earlier length three and later length four. This refutes Erdős's historical unqualified formulation and Lebowitz-Lockard's Conjecture 11, but not the ordered catalog question or the historical equal-length conjecture. Venkat's §2 is the basis for the present counting method. The new ingredient is a large-excess tail using Reuss's pre-existing determinant theorem for two different shifts within one block; the remaining calculation also uses a rectangular rather than square box.
- Targeted searches combining the problem number and title, both recent authors, Reuss, and the improved exponents did not locate an exact earlier bound. This is provisional priority, not proof of novelty. The present result gives neither finiteness nor an improvement for equal lengths. No Lean verification.

## 5. Equal lengths: savings at separated scales or in a narrow slope range

The global equal-length exponent remains \(2/3+\varepsilon\). The following bounds apply to all fixed equal lengths \(h\ge3\), and are not finite verifications.

**(i)** If \(0<\rho<1\) is fixed, the number with \(x\le y^\rho\) is
\[
O_{h,\rho,\varepsilon}(X^{s_\rho+\varepsilon}),\qquad
s_\rho=\max\{3/5,(2-h(1-\rho))/3\}.
\]
**(ii)** Fix \(\delta>0\), \(c>0\), and \(C>0\). For every dyadic scale \(Y\) one may specify an interval \(I_Y\subseteq[c,1]\) of length at most \(C Y^{-\delta}\). The count with \(x/y\in I_Y\) on \(Y\le y<2Y\), summed to \(X\), is
\[
O_{h,\delta,c,C,\varepsilon}(X^{s_\delta+\varepsilon}),\qquad
s_\delta=\max\{3/5,(2-\delta)/3\}.
\]
The constant is uniform in the choice of intervals. In particular this bounds the pairs with \(0<y-x\le C y^{1-\delta}\), using a suitable interval with right endpoint 1. Neither statement includes all possible equal-length pairs.

### Refine the fixed-ratio bound

On \(K\le x<2K,\ Y\le y<2Y,\ x<y\), use the reduced ratio \(a/b=B_h(x)/B_h(y)<1\), and write \(\theta=(a/b)^{1/h}\asymp_h K/Y\). With \(u=2x+h-1\), \(v=2y+h-1\), set
\[
H(t)=\prod_{i=0}^{h-1}(t+2i-h+1).
\]
Then \(H(u)/H(v)=a/b\). The shifts sum to zero, and the coefficient of \(t^{h-2}\) is nonzero because it is minus one-half the sum of squared shifts. For the positive arguments considered, \(H(t)^{1/h}=t+O_h(1/t)\) and \(H(t)^{1/h}\asymp_h t\). Thus
\[
|u/v-\theta|\ll_h 1/(\theta Y^2).
\]
Also, each fixed reduced fraction \(u/v=p/q\) yields at most \(h\) pairs: substituting \(u=pw,v=qw\) gives \(bH(pw)-aH(qw)=0\); if the polynomial vanished identically, comparing coefficients of degrees \(h\) and \(h-2\) would force \(p=q\) and \(a=b\), a contradiction. This part is Venkat's §2.3.

Now every prime dividing \(a b\) divides both \(B_h(x)\) and \(B_h(y)\), because \(a/b=E_h(x)/E_h(y)\) and the two radicals agree. At each such prime choose one divisible term on each side; there are at most \(h^{2\omega(ab)}=Y^{o(1)}\) choices of these positions when \(a,b\le Y\). Within one pattern all pairs give the same residues of \(u,v\) modulo \(M=\operatorname{rad}(ab)\). For two distinct fractions, the nonzero numerator of their difference, \(u_1v_2-u_2v_1\), is divisible by \(M\). Since \(v_1,v_2\ll_h Y\), their distance is at least \(M/(C_hY^2)\). There are therefore
\[
O_{h,\varepsilon}\bigl(Y^\varepsilon(1+1/(\theta M))\bigr) \tag{2}
\]
admissible pairs per ratio, including the at most \(h\) points per fraction. No cancellation or coprimality of \(u,v\) modulo these primes is required.

### Proof of (i)

Put \(s=s_\rho\), \(N=Y^s\) and discard the same rare starts as in §3, with \(T=U/N\). If \(K\le N\) there is nothing more to show, by the partner bound. For \(K>N\), the retained ratios have \(b\le B=Y/N\), \(a/b\asymp_h R:=(K/Y)^h\). Sum (2) over these ratios. The term 1 has sum \(O_h(B^2R)\). For the other term \(\theta\asymp_h K/Y\) and \(M\ge\operatorname{rad}(b)\), so before the \(Y^\varepsilon\) factor its sum is at most
\[
O_h\biggl(\frac{RY}{K}\sum_{b\le B}\frac{b}{\operatorname{rad}(b)}\biggr)
=O_{h,\varepsilon}\bigl((RY/K)B^{1+\varepsilon}\bigr).
\]
Indeed, \(b/\operatorname{rad}(b)=\sum_{d\mid b/\operatorname{rad}(b)}\phi(d)\), where \(\phi\) is Euler's totient. The divisibility condition is equivalent to \(d\,\operatorname{rad}(d)\mid b\). Summing the positive multiples yields
\[
\sum_{b\le B}\frac{b}{\operatorname{rad}(b)}
\le B\sum_{d\le B}\frac1{\operatorname{rad}(d)}
\ll_\varepsilon B^{1+\varepsilon}
\]
by the Euler product used in §1. Finally \(KB/Y=K/N>1\), so the second term costs at most \(O_{h,\varepsilon}(B^2RY^\varepsilon)\) as well. Since \(K\le (2Y)^\rho\) in the boxes that matter, this is \(O_{h,\varepsilon}(Y^{2-2s-h(1-\rho)+\varepsilon})=O_{h,\varepsilon}(Y^{s+\varepsilon})\). Summation proves (i).

### Proof of (ii)

Set \(s=s_\delta\) and discard rare starts as before, so in retained pairs \(b\le Y^{1-s}\) and \(\theta\gg_{h,c}1\). Thus each fixed ratio has \(O_{h,c}(1)\) pairs by the same fraction-spacing argument even without the modular refinement. Moreover \(u/v=x/y+O_h(1/Y)\), so \(\theta\) lies in an interval obtained by enlarging \(I_Y\) by \(O_h(1/Y)\) at both ends. The values \(a/b=\theta^h\) lie in an interval of width \(O_{h,C}(Y^{-\delta}+Y^{-1})\). For each positive denominator \(b\) there are at most \(O_{h,C}(1+b(Y^{-\delta}+Y^{-1}))\) numerators. Summing through \(B=Y^{1-s}\) gives
\[
O_{h,C}(B+B^2Y^{-\delta}+B^2/Y)=O_{h,C}(Y^s).
\]
Here \(1-s\le s\) and \(2-2s-\delta\le s\) by the choice of \(s\). Multiplying by the per-ratio count and summing scales proves (ii).
