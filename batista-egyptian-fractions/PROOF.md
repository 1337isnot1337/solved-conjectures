# The congruence conjecture for three Egyptian fractions of numerator five

**Theorem.** Let $k$ be a positive integer for which
$$
\frac5k=\frac1x+\frac1y+\frac1z,\qquad 1\le x<y<z,
$$
has a solution. If $k\not\equiv1\pmod5$, the lexicographically first solution uniquely maximizes $z$. This proves David Batista's conjecture that every term of A398581 is $1$ modulo $5$. Batista records the case $k\equiv4\pmod5$ and gives a table through $k=1500$. [OEIS A398581](https://oeis.org/A398581)

## Proof using the best two-term underapproximation theorem

For $k>5$, write $5/k=p/q$ in lowest terms. Set
$$
m=\lfloor q/p\rfloor+1,\qquad h=pm-q,\qquad B=qm,\qquad
y=\lfloor B/h\rfloor+1,\qquad d=hy-B.
$$
These are the first two *strict* greedy steps. The error after taking $1/m$ is $h/B$, and the error after taking $1/m+1/y$ is $d/(By)$.

| $k\bmod5$ | $p$ | $q$ | $h$ |
|---|---:|---:|---:|
| 0 | 1 | $k/5$ | 1 |
| 2 | 5 | $k$ | 3 |
| 3 | 5 | $k$ | 2 |
| 4 | 5 | $k$ | 1 |

The error is always a unit fraction in these four cases. For $h=1$ we have $d=1$. For $h=2$ we have $d=1$ or $d=2\mid B$. For $h=3$ the identity $q=5m-3$ gives $B\equiv2m^2\pmod3$, so $B\equiv0$ or $2\pmod3$. Thus $d=3\mid B$ or $d=1$. In every case $z=By/d$ is integral.

The denominators are strictly increasing. The first greedy remainder is at most $1/[m(m-1)]$, which gives $y>m$ since $m\ge2$. The second remainder is at most $1/[y(y-1)]$, so $z\ge y(y-1)>y$. The triple is lexicographically first because any admissible first denominator is at least $m$ and, with that choice, any admissible second denominator is at least $y$.

Hùng Việt Chu's Theorem 1.3 says that the strict greedy pair gives the unique largest two-unit-fraction sum strictly below $p/q$ whenever the least positive $h$ with $p\mid q+h$ is at most three, apart from a possible tie at $10/17$. Our $h$ is exactly that integer. The table covers every required residue, and $5/k=10/17$ is impossible for integral $k$. Every competing triple has remaining fraction $1/z'$. Its first two terms sum to at most $1/m+1/y$, with strict inequality for a different ordered pair. Hence $z'\le z$, with equality only for the same triple. [Chu, Theorem 1.3](https://arxiv.org/abs/2306.12564)

For $k=1,2$, even $1+1/2+1/3$ is too small. For $k=3,4,5$ the optimal triples are respectively $(1,2,6)$, $(1,5,20)$ and $(2,3,6)$. The first denominator is forced in each case. For $k=4$, starting at two gives at most $1/2+1/3+1/4<5/4$. Once the first denominator is fixed, $z$ decreases strictly as $y$ increases. This completes the proof.

## Independent elementary comparison

The following argument replaces Chu's theorem for $k\ge100$. The finite cases below 100 can be enumerated with the accompanying verifier. Retain the preceding notation for the greedy triple and put $z_0=By/d$. Since $d\le h$, we have $z_0\ge (qm)^2/h^2$.

For a competing first denominator $x>m$, write $t=px-q$ and $b=qx$. If the second denominator is $v$ and the third is $w$, then $e=tv-b\ge1$ and
$$
w=\frac{b(b+e)}{t e}\le F(x),\qquad F(x)=\frac{qx(qx+1)}{px-q}.
$$
Also $x<3q/p$. The function $F$ is convex for $x>q/p$. Indeed, on substituting $x=(t+q)/p$, it is a linear function of $t$ plus a positive constant times $1/t$.

Here $m,q\ge20$. For $m+2\le x<3q/p$ it suffices by convexity to bound the two endpoints. At the first,
$$
 F(m+2)\le\frac{q^2(m+3)^2}{h+2p}<\frac{(qm)^2}{h^2},
$$
since $(m+3)/m<6/5$ and the table gives $(h+2p)/h^2\ge13/9>36/25$. At the other endpoint $x=3q/p<3m$, the numerator is at most $12(qm)^2$ and the denominator is $2q>12h^2$. The last inequality follows from $q\ge100$ when $p=5$, and from $q\ge20$, $h=1$ when $p=1$.

For $x=m+1$ and $h\le2$, the same estimate works with numerator at most $q^2(m+2)^2$ and $(h+p)/h^2\ge7/4$. If $h=3$, then $p=5$, $t=8$, and $b=(5x-8)x\equiv0,4,5\pmod8$. Thus $e=8v-b\ge3$, giving
$$
 w\le\frac{b(b+3)}{24}\le\frac{q^2(m+4)^2}{24}<\frac{(qm)^2}{9}.
$$
Here $(m+4)/m\le6/5$. This excludes every larger first denominator. At $x=m$ the third denominator decreases strictly as the second increases.

The finite enumeration ranges over $k/5<x<3k/5$ and $kx/(5x-k)<y<2kx/(5x-k)$ with $y>x$. It calculates $z=kxy/((5x-k)y-kx)$ and checks divisibility and $z>y$. These bounds follow directly from $x<y<z$, so the enumeration covers every solution. The verifier also compares against Batista's full published table through 1500. [Batista's table](https://oeis.org/A398581/b398581.txt)

## Prior work and scope

Chu proved the general best-two-term theorem in 2023–2024. The additional step here proves that his optimizing pair actually extends to an exact, strictly ordered three-term representation in all four required classes. A November 18, 2026 search by sequence number, author, and equivalent Egyptian-fraction formulations located no earlier proof specifically stating Batista's congruence. Historical priority remains unverified. The example $5/11=1/3+1/9+1/99=1/4+1/5+1/220$ in Batista's entry illustrates the behavior in the remaining class. [Batista](https://oeis.org/A398581) · [Chu](https://arxiv.org/abs/2306.12564v2)
