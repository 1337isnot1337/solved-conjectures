# Németh–Seberry–Shu conjecture

The arbitrary-prime congruence and final counting reduction in §3 have a [verified partial Lean formalization](LEAN_STATUS.md). The construction in §§1–2 remains unformalized.

Let $V(p)$ be the number of distinct permanent values of all binary circulant matrices of prime order $p$. Németh, Seberry and Shu conjectured that $V(p)=O(p)$ ([original paper, p. 181](https://documents.uow.edu.au/~jennie/WEBPDF/071_1979.pdf)). We prove that $V(p)/p\to\infty$ along the primes. This proof uses the uniform permanent asymptotic as stated by Divoux and Wang, not an extracted convergence rate. The [quadratic refinement](../../docs/nss/quadratic-refinement.md) strengthens the bound to $V(p)=\Omega(p^2)$.

## 1. Binary circulants with a prescribed Fourier mode

Fix an integer $k$ between $p/3$ and $2p/3$, put $\rho=k/p$, and choose a real amplitude $a\in[1/24,1/12]$. Write $\zeta=\exp(2\pi i/p)$. Independently include each $s\in\mathbb Z/p\mathbb Z$ with probability $\rho+2a\cos(2\pi s/p)$, which is in $[1/6,5/6]$. The expected unnormalized Fourier coefficients are $k$ at zero, $pa$ at $1,-1$, and zero elsewhere by character orthogonality.

Hoeffding's inequality on the real and imaginary parts, followed by a union bound over $p$ frequencies, gives a realization in which all coefficients differ from their means by at most $2\sqrt{p\log p}$. Indeed, at a single frequency the failure probability for complex error exceeding $t$ is at most $4\exp(-t^2/p)$. Add or delete elements until the support $S$ has size $k$. The zeroth coefficient bounded the number of such edits, and each edit changes every coefficient by at most one.

Let $C$ be the circulant with entry $C_{ij}=\mathbf 1_{\{j-i\in S\}}$ and let $D=C/k$. The Fourier eigenvalues $\lambda_\ell$ of $D$ consequently satisfy
```math
\lambda_0=1,\qquad
\lambda_{\pm1}=a/\rho+O\!\left(\sqrt{\log p/p}\right),\qquad
\max_{\ell\notin\{0,1,-1\}}|\lambda_\ell|=O\!\left(\sqrt{\log p/p}\right).
```
All errors are uniform in $k$ and $a$.

## 2. Separation within a row sum

Put $J=\mathbf 1\mathbf 1^T/p$ and $B=D-J$. The matrix $D$ is doubly stochastic and its entries are nonnegative. We have $\|B\|_{\max}\le2/p$. Fourier diagonalization gives $\|B\|_{\mathrm{op}}=\max_{\ell\ne0}|\lambda_\ell|\le1/2$ for all sufficiently large $p$. The uniform permanent asymptotic of McCullagh, in the form stated by [Divoux and Wang, Proposition 3.1 and Remark 2.1](https://arxiv.org/html/2610.23755v1#S3), gives
```math
\frac{p^p}{p!}\operatorname{per}(D)=(1+o(1))\det(I-B^TB)^{-1/2}.
```
The uniform relative error becomes an additive $o(1)$ after taking logarithms. Since $B$ is real and unitarily diagonalized by Fourier modes, the eigenvalues of $B^TB$ are zero and the $|\lambda_\ell|^2$ for $\ell\ne0$. By Parseval,
```math
\sum_{\ell\ne0}|\lambda_\ell|^2=\frac pk-1=\rho^{-1}-1.
```
Write $h(x)=-\log(1-x)-x$. Since $h(x)=O(x^2)$ uniformly for $0\le x\le1/4$, the sum of these remainders over the bulk modes is $o(1)$: it is bounded by a constant times their maximum squared modulus times their total squared modulus. The two exceptional eigenvalues are conjugate. Consequently
```math
\log\!\left(\frac{p^p}{p! k^p}\operatorname{per}(C)\right)
=F(\rho,a)+o(1),\qquad
F(\rho,a)=\tfrac12(\rho^{-1}-1)+h((a/\rho)^2),
```
uniformly in $k$ and $a$.

Fix any positive integer $M$ and choose $M$ distinct increasing amplitudes in $[1/24,1/12]$. The function $F(\rho,a)$ is strictly increasing in $a$, since $h'(x)=x/(1-x)>0$ for $x>0$. For these finitely many amplitudes the adjacent gaps have a positive minimum over $\rho\in[1/3,2/3]$ by continuity. For sufficiently large $p$, the uniform error is smaller than half that minimum. Thus each $k$ gives at least $M$ distinct permanents.

## 3. Separation across row sums

The permanent counts permutations $\sigma$ such that $\sigma(i)-i\in S$ for all $i$. Conjugation by translations partitions these permutations into orbits of size one or $p$. Fixed permutations commute with translation by one, so exactly the $k$ translations by elements of $S$ are fixed. Thus $\operatorname{per}(C)\equiv k\pmod p$, the binary case of [Brualdi–Newman, Theorem 3.2](https://nvlpubs.nist.gov/nistpubs/jres/69B/jresv69Bn3p159_A1b.pdf). Distinct row sums in the dense interval give disjoint sets of permanents. It follows that
```math
V(p)\ge M\bigl(\lfloor2p/3\rfloor-\lceil p/3\rceil+1\bigr)
```
for every sufficiently large prime $p$ depending on $M$. Since $M$ was arbitrary, $V(p)/p\to\infty$. This contradicts the conjecture. $\square$
