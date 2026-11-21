# Erdős–Graham’s reciprocal-sum conjecture

Erdős and Graham ask whether a rational reciprocal sum and $a_{n+1}/a_n^2\to1$ force the eventual recurrence $a_{n+1}=a_n^2-a_n+1$. We prove an irrationality criterion and a restriction on arbitrarily long stretches of a rational tail. The unrestricted problem remains open. [Bounty statement](https://conjectures.io/problems/erdos243-erdos-243) · [Koizumi](https://arxiv.org/abs/2504.05933)

**Theorem.** For every strictly increasing sequence of positive integers satisfying

```math
\frac{a_n^2}{a_{n+1}}=1+\frac{2}{n}+o(n^{-2}),
```

the sum of the reciprocals is irrational. More generally, for any rational reciprocal sum, its product-cleared tail numerator disagrees with each fixed polynomial $A(n+h)(n+h+1)+B$ on a set with bounded gaps, where $A>0$, $A,B$ are rational and $h$ is an integer. This second assertion requires only that the positive integer denominators are eventually greater than one and the series converges.

The method adds a second backward step to Cook's square condition at a polynomial root. It works for polynomials of any degree. For these quadratics, the two possible square classes give two elliptic curves with known integral points. The final contradictions take place over three finite fields. Cook's papers give the numerator recurrence, regular-rate extraction, and the corresponding irrationality theorem at the cubic rate. [Short paper](https://github.com/wcook04/plectis-erdos/blob/main/paper/243/erdos-243-reciprocal-tail-rigidity.tex) · [Companion, §2](https://github.com/wcook04/plectis-erdos/blob/main/paper/243/erdos243-reciprocal-tail-reasoning-surface.tex)

## Exact tails and polynomial agreement

Write the rational sum as $b/q$ and set

```math
D_n=q\prod_{j<n}a_j,\qquad C_n=D_n\sum_{j\ge n}\frac1{a_j}.
```

Then $C_n,D_n$ are positive integers and

```math
C_{n+1}=a_n C_n-D_n,\qquad D_{n+1}=a_n D_n.
```

Suppose that $C_n$ agrees on arbitrarily long consecutive intervals with the fixed quadratic in the theorem. Translate the time coordinate by $h$. Each $G_n=\gcd(C_n,D_n)$ divides all subsequent numerators and denominators. Thus it divides the second difference $2A$ on a later interval of length three. In particular $2A$ is a positive integer and this divisibility chain stabilizes, say at $g$. Write $u_n=C_n/g$, $v_n=D_n/g$ on the tail. They obey the same updates and are coprime. On arbitrarily long intervals,

```math
u_n=Q(n),\qquad Q(X)=a X(X+1)+c,\qquad 2a\in\mathbb Z_{>0},\quad c\in\mathbb Z.
```

Indeed $2a=2A/g$ is the second difference, and $a n(n+1)$ is integral. Also $\gcd(u_n,u_{n+1})=1$ by the first update. Consecutive indices congruent to $-1,0$ modulo $2p$ give two values of $Q$ congruent to $c$ modulo $p$ on any sufficiently long agreement interval. No prime divides $c$, so $c=\pm1$.

The reduced multipliers $a_n$ are pairwise coprime on this tail. A prime dividing both $a_n$ and $v_n$ would divide $u_{n+1},v_{n+1}$, and all earlier multipliers divide $v_n$. Infinitely many distinct primes therefore enter the denominators and persist. If $Q$ had a rational root, choose one of these primes outside the finite set of denominators of the root and coefficients. On a later agreement interval of length at least that prime, some $u_n=Q(n)$ would vanish modulo the prime while $v_n$ was divisible by it. This contradicts reducedness. Hence $Q$ is irreducible.

## Two backward steps at a root

For this argument $Q$ can be any rational polynomial agreeing with a reduced exact tail on arbitrarily long intervals. Let $\alpha$ be a root, let $K=\mathbb Q(\alpha)$, and assume $Q(\alpha-1)Q(\alpha+1)\ne0$. There exists an $h_0\in K$ such that both

```math
h_0^2=-Q(\alpha-1)Q(\alpha+1),\qquad
Q(\alpha-1)^2+4Q(\alpha-2)h_0\ \text{is a square in }K.
```

To prove this, eliminate the multiplier from the two updates:

```math
v_j(v_j+u_{j+1})=u_jv_{j+1}.
```

For every sufficiently good prime $p$ and every root $r$ of $Q$ modulo $p$, take four successive agreeing indices ending at $k+1$ with $k\equiv r\pmod p$. Such a block occurs inside any sufficiently long interval. Then $v_k=-Q(r+1)$, $v_{k-1}^2=-Q(r-1)Q(r+1)$, and

```math
(2v_{k-2}+Q(r-1))^2=Q(r-1)^2+4Q(r-2)v_{k-1}\pmod p.
```

If the first radicand were a nonsquare in $K$, take the nonidentity automorphism of its quadratic extension, extend it to a normal closure over $\mathbb Q$, and use Chebotarev to realize it as Frobenius at a good prime above a rational $p$. It fixes $\alpha$, so its reduction is an $\mathbb F_p$-root, and exchanges the distinct roots of the first square equation. This contradicts the modular formula. Now write its square roots in $K$ as $\pm h$. If both second radicands were nonsquares, their quadratic characters on the Galois group over $K$ would have two proper kernels. Two proper subgroups cannot cover a group. An element outside both kernels reverses both pairs of square roots. Extending that element and applying the same Frobenius argument contradicts the second modular formula for either sign of $h$. Zero is already a square. The finitely many primes of ramification, nonintegrality and collision can be omitted in both applications. [Chebotarev and its Frobenius formulation](https://doi.org/10.1007/BF03027290)

## Two elliptic curves

Return to the irreducible quadratic. Set $z=2a\alpha+a$, so $z^2=a^2-4ac$ and $K=\mathbb Q(z)$. For integer $j$ we have $Q(\alpha-j)=aj^2-jz$. The first square condition reads $h_0^2=-4ac$. An element of a quadratic field whose square is rational is either rational or a rational multiple of $z$. The second condition requires a rational square as the norm of

```math
S=(a-z)^2+4(4a-2z)h_0.
```

* If $h_0$ is rational, then $c=-1$, $a=s^2$, $h_0=2s$ for a signed integer $s$. Here $s^2$ is half-integral, which forces a rational $s$ to be integral. Expansion gives
  $N(S)/(16a^2)=4s^3+48s^2-63$.
* Otherwise $t=2z/h_0$ is rational and $t^2=4-ca$. This half-integral square again gives $t\in\mathbb Z$. Substitute $z=t h_0/2$ and take the conjugate by negating both $z$ and $h_0$. Then
  $N(S)/(16a^2)=4t^3-48t^2-24t+257$.

In each case the displayed integer must be an integer square $w^2$. It is odd. In the first case $(X,Y)=(s+4,(w-1)/2)$ satisfies $Y^2+Y=X^3-48X+112$. In the second, $(X,Y)=(t-4,(w-1)/2)$ satisfies $Y^2+Y=X^3-54X-88$. The complete integral $X$-coordinate lists are respectively $\{-4,8\}$ and $\{-6,-2,12,40,48\}$. Cremona's tables contain both rows. The LMFDB documents independent rigorous computations in Magma and SageMath. [Pinned integral-point data, labels 5859d1 and 189b2](https://github.com/JohnCremona/ecdata/blob/25cec5ecfec8b9f016eb1631ac633194c2bed39f/intpts/intpts.00000-09999) · [Second curve](https://www.lmfdb.org/EllipticCurve/Q/189/b/2) · [Data reliability](https://www.lmfdb.org/EllipticCurve/Q/Reliability)

Thus $s\in\{-8,4\}$ or $t\in\{-2,2,16,44,52\}$. Since $a>0$ and $ca=4-t^2$, every remaining polynomial has $c=-1$ and

```math
a\in\{16,64,252,1932,2700\}.
```

Fix a root $r$ of $Q$ modulo the indicated prime. Start with the singleton $V_0=\{-Q(r+1)\}$. Given $V_{j-1}$, take for $V_j$ every $v\in\mathbb F_p$ satisfying $v(v+Q(r-j+1))=Q(r-j)w$ for some $w\in V_{j-1}$. A long agreement interval must contain an index $k\equiv r$ with $v_{k-j}\in V_j$ at every tabulated step.

| $a$ | $p$ | $r$ | Cardinalities starting at the root |
|---:|---:|---:|:---|
| 16 | 11 | 4 | 1, 2, 4, 5, 2, 0 |
| 64 | 13 | 3 | 1, 2, 1, 0 |
| 252 | 19 | 6 | 1, 2, 2, 0 |
| 1932 | 11 | 5 | 1, 0 |
| 2700 | 11 | 4 | 1, 2, 4, 5, 2, 0 |

The empty sets exclude every remaining coefficient. This proves bounded gaps between disagreements.

## From the rate to a quadratic

Under the theorem's growth hypothesis $a_n$ grows at least geometrically, and the reciprocal tail is $a_n^{-1}(1+O(a_n^{-1}))$. Indeed $a_{n+1}\ge a_n^2/2$ and the subsequent denominators eventually at least double. Taking the ratio of two tails gives

```math
\frac{C_{n+1}}{C_n}
=\frac{a_n^2}{a_{n+1}}(1+O(a_n^{-1}))
=1+\frac2n+o(n^{-2}).
```

Set $F_n=n(n+1)$, whose successive ratio is exactly $1+2/n$. The logarithmic increments of $C_n/F_n$ are $o(n^{-2})$. Summing the tail shows $C_n/F_n=A+o(1/n)$ for some $A>0$. Hence $e_n=C_n-AF_n=o(n)$ and the ratio formula gives $e_{n+1}-e_n=(2/n)e_n+C_n o(n^{-2})=o(1)$. Taking two further differences shows $\Delta^3 C_n\to0$. These are integers, so $C_n$ is eventually a rational quadratic polynomial. Its difference from $AF_n$ is $o(n)$, forcing equality of the quadratic and linear coefficients. Thus $C_n=A n(n+1)+B$ eventually, contradicting the theorem on agreement intervals.

The first-order condition $a_{n+1}/a_n^2\to1$ alone supplies no such quadratic model. That is the remaining gap to the bounty.
