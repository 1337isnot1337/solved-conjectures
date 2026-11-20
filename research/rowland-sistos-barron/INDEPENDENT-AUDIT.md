# Independent audit of the Rowland–Sistos Barrón candidate

Date: 20 November 2026. Primary source: [arXiv:2501.14643v1, Conjecture 5.3](https://arxiv.org/html/2501.14643v1). Companion proof: [PROOF.md](PROOF.md).

**Verdict: the rank formula is mathematically correct under the stated minimum tail-recurrence definition.** This is an informal mathematical audit, not external peer review or a Lean verification. The mapping from the authors' undefined term *pseudo-polynomial* to eventual quasipolynomiality remains an interpretation requiring explicit disclosure.

## Independent check of recurrence minimality

For a nonzero polynomial $p(n)$ and $\lambda\ne0$, the finite-difference operator $E-\lambda$ reduces its degree exactly by one. Each $E-\mu$ for $\mu\ne\lambda$ preserves that degree. Therefore every annihilator of $\sum_i p_i(n)\lambda_i^n$, with distinct nonzero bases, is divisible by $\prod_i(X-\lambda_i)^{\deg p_i+1}$. The reverse divisibility follows by annihilation. This argument applies to recurrences holding on a tail. The four terms of $s(n)=n(1+8^n)+2^n-16^n$ have multiplicities $2,2,1,1$, giving initial rank six.

## Independent coefficient partition

Write $S(t,x)=t(1+x^3)+x(1-x^3)$. After raising to exponent $M$, the coefficient of $t^{M-r}x^{r+3j}$ is $\binom Mr[z^j](1+z)^{M-r}(1-z)^r$. This equals $\binom Mj K_r(j;M)$, where $K_r=[z^r](1+z)^{M-j}(1-z)^j$. Different admissible $r$ give different degrees in $t$, preventing cross-degree cancellation.

For $k\le3M$, the first admissible $r$ is $k\bmod3$; for $3M<k\le4M$, it is $k-3M$. Assuming no zero coefficient, the sum of the $\deg P_{M,k}+1$ values is

$$
(M+1)^2+M^2+M(M-1)+M(M+1)/2=(7M^2+3M+2)/2.
$$

The upper-tail leading coefficient equals $\binom Mr(-1)^r\ne0$.

For residue $1$, the leading Krawtchouk coefficient $K_1=M-2j$ vanishes at exactly one $k$ for even $M$. The next admissible $r=4$ has

$$
K_4(j=M/2-1;M)=(M-2)(M-8)/8\ne0
$$

for even $M\ge50$. Hence the loss is exactly three.

For residue $2$, $K_2=((M-2j)^2-M)/2$ vanishes only for square $M=m^2$. For every $m\ge7$ there are exactly two admissible $j=(M\pm m)/2$. The next admissible $r=5$ has, on substitution,

$$
K_5(D=m+2,M=m^2)=\frac{(m-6)(m-2)(m+1)(m+2)(3m+5)}{60},
$$

$$
K_5(D=2-m,M=m^2)=-\frac{(m-2)(m-1)(m+2)(m+6)(3m-5)}{60}.
$$

These factorizations have been checked independently by symbolic substitution and are nonzero for all $m\ge7$; both leading-degree losses are exactly three. The residue classes cannot overlap. Thus, for every $M\ge49$,

$$
R(M)=\frac{7M^2+3M+2}{2}-3\mathbf1_{2\mid M}-6\mathbf1_{M\text{ is a square}}.
$$

If $R$ were eventually quasipolynomial, subtraction of a polynomial and a parity term would make the square indicator eventually quasipolynomial, and hence eventually periodic because it is bounded. For any period $q$, choosing a square $m^2$ with $2m+1>q$ gives a non-square $m^2+q$; contradiction.

## Independent finite check

A separate scratch implementation (not importing the repository checker) repeatedly multiplied the four terms `t + t*x**3 + x - x**4` in the bivariate integer-polynomial ring. All 126 exponents $49\le M\le174$ matched the formula. Finite checks support the proof, but the preceding algebra supplies the all-exponent result.

## Source, terminology, priority, and remaining obligations

The primary statement says exactly “Every general rank sequence is eventually polynomial. Every particular rank sequence is eventually pseudo-polynomial.” It does **not** define pseudo-polynomial. The note establishes failure of eventual *quasipolynomiality*; we should not silently claim to have refuted any nonstandard weaker meaning of “pseudo-polynomial.” The example is an actual integer sequence with repeated characteristic roots, permitted by Section 2.

A separate prior result (Omega Institute) disproves the introductory fixed-rank finiteness conjecture but explicitly leaves 5.3 open. A previously posted MathDB Hilbert-polynomial argument concerns the general no-cancellation clause and expressly does not handle the particular clause. These results must be credited. Search cannot rule out unindexed solutions or establish priority conclusively. It is appropriate to register this as a complete **unrefereed proof candidate**, with an external author/referee check outstanding; it is not a published or externally validated discovery.
