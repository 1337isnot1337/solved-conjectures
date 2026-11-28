# Prime-power and dyadic families for Sun's Apéry irreducibility conjecture

[Zhi-Wei Sun, OEIS A005259 comment of March 21, 2013](https://oeis.org/A005259/internal) asks whether
```math
 A_n(X)=\sum_{j=0}^n\binom nj^2\binom{n+j}j^2 X^j
```
is irreducible over $\mathbb Q$ for every $n\ge1$. This note proves the conjecture for **every power of two**, for **every power of an odd non-Wieferich prime to base $2$**, and for **all sufficiently large $n=k2^a$ for each fixed odd $k$**. We do not claim the remaining indices or priority beyond the bounded searches described at the end.

## 1. The odd prime-power family

Let $N=p^a$ for an odd prime $p$ and $a\ge1$. For $0<j<N$, $\binom Nj$ is divisible by $p$, so every intermediate coefficient of $A_N$ is divisible by $p^2$. Also
```math
 \binom{2N}{N}
 =2\prod_{j=1}^{N-1}\left(1+\frac Nj\right)\equiv2\pmod{p^2}
```
in $\mathbb Z_p$: all factors with $v_p(j)\le a-2$ are $1$ modulo $p^2$, and the others are $1+p/r$ for $1\le r\le p-1$. Their linear contributions cancel because $\sum_{r=1}^{p-1}r^{-1}\equiv0\pmod p$.

Put $G(Y)=A_N((Y-1)/4)\in\mathbb Z_p[Y]$. Modulo $p$, Frobenius and $4^N\equiv4$ give $G(Y)\equiv Y^N$. The constant term modulo $p^2$ is
```math
 G(0)\equiv 1-4^{1-N}\equiv p\,q_p(4)\pmod{p^2},
 \qquad q_p(4)=\frac{4^{p-1}-1}{p}.
```
The last equality follows by raising $4^{p-1}=1+p q_p(4)$ to the power $1+p+\cdots+p^{a-1}\equiv1\pmod p$. Since $q_p(4)\equiv2q_p(2)\pmod p$, if $p$ is non-Wieferich to base $2$ then $G$ is Eisenstein at $p$, and $A_N$ is irreducible.

## 2. A two-prime criterion for even $n$

Write $a=v_2(n)\ge1$. If there is a prime $p\equiv3\pmod4$ such that
```math
 n\lt p<2n,\qquad p-n-1<2^{a-1},
\tag{1}
```
then $A_n$ is irreducible.

**The $2$-adic constraint.** Let the binary expansion of $n$ have one-bits $b_1>b_2>\cdots>b_s=a$ and put $k_i=\sum_{t=1}^i2^{b_t}$, including $k_0=0$. Write $a_j$ for the coefficient of $X^j$ in $A_n$. The binomial identity
```math
 \binom nj\binom{n+j}j=\binom{2j}j\binom{n+j}{2j}
```
and the factorial formula $v_2(N!)=N-s_2(N)$, where $s_2$ is the binary digit sum, give $v_2(a_j)\ge2s_2(j)$. At a binary prefix $j=k_i$, the binary digits of $2j$ and $n-j$ are disjoint, so $\binom{n+j}{2j}$ is odd and equality holds: $v_2(a_{k_i})=2i$. For $k_{i-1}<j<k_i$, all integers $j\le n$ of binary weight at most $i-1$ are at most $k_{i-1}$ (greedily retaining the $i-1$ highest one-bits of $n$ maximizes such an integer). Thus $v_2(a_j)\ge2i$ there.

The lower Newton polygon therefore has consecutive vertices $(k_i,2i)$, with slopes $2/2^{b_i}$. Every root has $2$-adic valuation one of the negative slopes, hence valuation denominator divisible by $2^{a-1}$. Its local field degree is divisible by that denominator, by the ramification-index formula. Factoring a rational factor over $\mathbb Q_2$ consequently shows:
```math
 \text{every nonconstant rational factor has degree divisible by }2^{a-1}.
\tag{2}
```

**The large-$`p`$ constraint.** Let $p$ satisfy (1) and put $H=p-n-1$. Then $v_p(a_j)=0$ for $j\le H$ and $v_p(a_j)=2$ for $j>H$: the only possible factor $p$ in $\binom{n+j}j$ comes from $n+1,\ldots,n+j$, and $p>n$. Vieta's product of roots has valuation $-2$, so at least one root $\alpha$ has negative valuation. In $A_n(\alpha)=0$, among indices $j\le H$ the smallest term valuation occurs only at $j=H$, and among $j>H$ it occurs only at $j=n$. The two must tie, giving
```math
 v_p(\alpha)=-2/(n-H)=-1/D,\qquad D=(n-H)/2\in\mathbb Z_{>0}.
```
After dividing the equation by $\alpha^{H}$ and reducing in the residue field of $\mathbb Q_p(\alpha)$, one obtains
```math
 \overline{a_H}+\overline{a_n/p^2}\,\overline{(p\alpha^D)}^{\,2}=0.
```
Both displayed nonzero coefficients are squares in $\mathbb F_p$. Since $p\equiv3\pmod4$, the residue field must contain a square root of a nonsquare of $\mathbb F_p$, so its degree is at least $2$. The ramification index is at least $D$ from the valuation of $\alpha$. Thus the local field degree is at least $2D=n-H$. Any rational factor containing $\alpha$ has at least that degree. If there is another nonconstant rational factor, its degree is at most $H$, contradicting (2) and (1). This proves the criterion.

**Fixed odd parts.** For fixed odd $k$ and $n=k2^a$, the prime number theorem modulo $4$ gives a prime $p\equiv3\pmod4$ in $(n,(1+1/(2k))n)$ for all sufficiently large $a$. Such a prime satisfies (1), proving irreducibility for the claimed family.

## 3. Every power of two, without unknown exceptions

For $n=2^a\ge1024$ there is a prime $p\equiv3\pmod4$ in $(n,3n/2]$. In fact [Bennett–Martin–O'Bryant–Rechnitzer, Corollary 1.6](https://arxiv.org/abs/1802.00085) gives for $t\ge800$
```math
 \frac{t}{2\log t}<\pi(t;4,3)<\frac{t}{2\log t}\left(1+\frac{5}{2\log t}\right).
```
For $L=\log n\ge 20/3$ and $c=\log(3/2)<1/2$, compare the lower bound at $3n/2$ with the upper bound at $n$ using
```math
 \frac{(3/2)L}{L+c}\ \ge\ \frac{60}{43}\ >\ \frac{11}{8}\ \ge\ 1+\frac{5}{2L}.
```
Here $\log 2\ge2/3$ follows directly from Jensen's inequality for $1/t$ on $[1,2]$. These primes satisfy (1). For the small powers $n=2,8,16,32,64,128,256,512$, use the respective primes $3,11,19,43,67,131,263,523$ in (1). The case $n=1$ is linear.

For $n=4$, the reciprocal polynomial is
```math
 B(Y)=Y^4+400Y^3+8100Y^2+19600Y+4900.
```
Its Newton polygon in §2 shows that every root $\gamma$ has $v_2(\gamma)=1/2$. Write $\beta=\gamma^2/2$ and divide the equation for $\gamma$ by $4$. Completing the square gives
```math
 (\beta+45^2)^2=45^4-35^2-100\gamma^3-4900\gamma.
```
The three terms on the right have valuations at least $3$, exactly $7/2$, and exactly $5/2$, respectively. Therefore $v_2(\beta+45^2)=5/4$, forcing ramification index at least $4$ in $\mathbb Q_2(\gamma)$. Thus $B$, and hence $A_4$, is irreducible.

## Scope and prior work

This does not settle Sun's original conjecture for arbitrary $n$. It does not presume the scarcity of Wieferich primes or claim to cover all their powers. The proofs use standard Newton polygon, ramification, Eisenstein, and prime-distribution results. Searches for the exact conjecture and these same families found Sun's original question but not a primary source with the reported irreducibility theorems; priority remains provisional.
