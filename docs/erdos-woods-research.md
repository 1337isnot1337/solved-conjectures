# Erdős–Woods conjecture

Research log for [issue #46](https://github.com/1337isnot1337/solved-conjectures/issues/46). The conjecture is open.

Write $\operatorname{rad}(n)$ for the product of the distinct primes
dividing a positive integer $n$. The conjecture asserts that an absolute
positive integer $k$ exists such that

```math
\operatorname{rad}(x+i)=\operatorname{rad}(y+i)\quad(0\le i\lt k)
\quad\Longrightarrow\quad x=y.
```

A matching block means these equalities for positive $x\lt y$.
[Erdős Problem 850](https://www.erdosproblems.com/history/850)
asks for the stronger statement that $k=3$ suffices.

## Literature

- [Erdős, 1963, Problem 60](https://static.renyi.hu/~p_erdos/1963-14.pdf)
  gives the two-term family with starts $2^h-2$ and $2^h(2^h-2)$,
  for $h\ge2$. Makowski's pair $(75,1215)$ is another two-term
  example, as recorded by [Hercher](https://cs.uwaterloo.ca/journals/JIS/VOL28/Hercher3/hercher15.pdf).
- [Balasubramanian, Shorey, and Waldschmidt, 1989](https://webusers.imj-prg.fr/~michel.waldschmidt/articles/pdf/ActaMathHungar54-1989.pdf)
  bound the possible length in terms of the smaller start and give
  lower bounds on the separation. Neither bound is absolute.
- [Shorey and Tijdeman, §9](https://arxiv.org/abs/1612.05438)
  recount the earlier conditional finiteness under ordinary
  abc and prove the three-term statement under Baker's explicit
  version. [Waldschmidt's 2026 lecture](https://webusers.imj-prg.fr/~michel.waldschmidt/articles/pdf/PuneIECM2026abc.pdf)
  still presents the general problem as a consequence of abc.
- [Lebowitz-Lockard, 2025, Theorems 4 and 6](https://arxiv.org/abs/2507.09899)
  studies unconditional bounds on the length and on the count of
  termwise matching blocks. The count bound is the comparison for
  the averaging argument in this project.
- [Hercher, 2025](https://cs.uwaterloo.ca/journals/JIS/VOL28/Hercher3/hercher15.pdf)
  proves a finite two-term census. A [November 2026 computation](https://research.muzz.in/erdos-woods/)
  reports a larger census and no three-term witness through its
  cutoff. The present research does not rely on either enumeration.
- [Venkat, 2026](https://hexagonmath.org/2611.00599v1) studies
  equality of radicals of whole block products. That differs from
  equality of each aligned term. A construction with whole-product
  equality does not provide the termwise equalities above.

The primary sources, recent preprints, problem discussion and related
claims were checked in November 2026. No unconditional proof of a
universal length and no family with unbounded matching length were found.

## Every fixed algebraic curve contains finitely many matches

**Theorem.** For any nonzero polynomial $P\in\mathbb{Q}[X,Y]$ and
any $k\ge3$, there are only finitely many positive integer pairs
$x\lt y$ with $P(x,y)=0$ and matching blocks of length $k$.

### Proof

Suppose an irreducible component of the plane curve contains infinitely
many matching pairs. We can work over a number field over which that
component is geometrically irreducible. Let $C$ be its smooth projective
normalization, and write $f,g$ for the two coordinate functions.
Discard the finitely many singular points of the original curve so
that the remaining pairs lift to points on $C$.

If one coordinate is constant, the radicals of the first two terms
of the other coordinate are supported on a fixed finite set of primes.
The pair of consecutive terms is then a solution of an $S$-unit
equation, of which there are finitely many. Assume both coordinates
are nonconstant. The function $f-g$ is nonzero since all pairs have
$x\lt y$.

Let $D_0$ be the union of the geometric poles of $f$ and $g$, and
let $t=|D_0|$. For each $i$ with $0\le i\lt k$, mark every point
outside $D_0$ which is a zero of exactly one of $f+i$ and $g+i$.
Let $D_1$ be the union of these marked points.

The matching pairs give $S$-integral points on
$C\setminus(D_0\cup D_1)$ for a fixed finite set of places $S$.
To see this, enlarge the number field to split the finitely many
poles and zeros involved. Choose a smooth proper model outside
finitely many places, so that distinct special points have disjoint
reductions and the zero and pole divisors of the functions have no
vertical components. At any place outside that set, reducing to
a pole would give a nonintegral coordinate. Reducing to a point of
$D_1$ would make exactly one of the two corresponding integers
divisible by the underlying rational prime. This contradicts
the aligned equality of their radicals. Therefore all reductions
outside $S$ avoid the deleted points.

By [Siegel's theorem for $S$-integral points](https://math.berkeley.edu/~vojta/cime/cime.pdf)
the normalization has genus zero and $t+|D_1|\le2$, since $t>0$.
Take $d=\max(\deg f,\deg g)$ and exchange the functions in the proof
if needed so that $\deg f=d$. If $f$ has $t_f$ distinct poles, the
ramification contribution over infinity is $d-t_f$.
Riemann–Hurwitz leaves at most $d+t_f-2$ ramification units on
the finite fibers. Thus the $k$ fibers over $0,-1,\ldots,-(k-1)$
contain at least $(k-1)d+2-t_f$ distinct points. At most $t-t_f$
of them lie in $D_0$. Of the remaining points, at most $2-t$ lie
in $D_1$. Consequently at least $(k-1)d\ge 2d$ distinct points
are shared with the corresponding fibers of $g$. Each is a zero
of $f-g$.

There is a common pole of $f$ and $g$. In fact, since both coordinate
maps are nonconstant, only finitely many curve points can have either
coordinate in a given finite set. The infinitely many distinct positive
integer pairs therefore have a subsequence along which both coordinates
tend to infinity. A limit point on the compact complex curve is a pole
of both maps. At a common pole the order of the pole of $f-g$ is at most
the maximum of the two pole orders. It follows that the total pole
degree of $f-g$ is at most $\deg f + \deg g -1\le2d-1$.
A nonzero rational function cannot have more distinct zeros than
its pole degree. This contradicts the shared-fiber count.

### Consequence

If there are infinitely many length-three matches, their pairs are
Zariski dense in the affine plane. The proof also gives a sufficient
route to finiteness: an unconditional algebraic constraint placing
all but finitely many matches on a proper closed subset would finish
that step. The existing radical divisibility argument gives
congruence constraints and does not establish such a containment.

## Multiplicative dependence is excluded at every aligned position

Suppose the length is at least three. Then no aligned pair of terms
can be two powers of a common positive integer base. In particular,
neither block contains a prime power.

To prove this, consider aligned terms $a^u,a^v$ for integers $a\ge2$
and $1\le u\lt v$. If they have a matching successor,
a primitive prime divisor of $a^{2v}-1$ divides $a^v+1$ and cannot
divide $a^u+1$. By [Zsigmondy's theorem](https://doi.org/10.1007/BF01692444)
the only applicable exception for $2v\ge4$ is $a=2,v=3$.
In that case the only equal successor radicals occur at $u=1$,
giving aligned terms 2 and 8. Their predecessors 1 and 7 have
different radicals. Their second successors 4 and 10 also have
different radicals. Thus they cannot be part of a longer match.

If the aligned terms are last, use their predecessors. A primitive
prime divisor of $a^v-1$ distinguishes the predecessor radicals
except when $v=2$ and $a+1$ is a power of two, or when $a=2,v=6$.
In the latter case the support of 63 is $\{3,7\}$, different from
each of the supports of $2^u-1$ for $1\le u\lt6$. In the former
case $u=1$, $a$ is odd, and
$\gcd(a-2,a^2-2)=\gcd(a-2,2)=1$.
The second predecessors therefore have different radicals because
$a^2-2>1$. These cases exhaust all positions. A term equal to 1
also cannot occur in a matching pair of distinct starts because
its partner would have radical 1.

## Counting matches by averaging both coordinates

Let $P_k(X)$ count pairs of positive integers $x\lt y\le X$ with
matching blocks of length $k$. For fixed $k\ge2$,

```math
P_k(X)\ll_k X^{1/k}
  \exp\!\left(O\!\left(
       \left(\frac{\log X}{\log\log X}\right)^{2/3}
        \right)\right).
```

This gives a smaller subexponential factor than the one in
[Lebowitz-Lockard, Theorem 6](https://arxiv.org/abs/2507.09899).
The power $X^{1/k}$ is the same.

For a matched pair, put $r_i=\operatorname{rad}(y+i)$.
The least common multiple of the $r_i$ divides $y-x$.
A prime $p$ occurs in at most $1+\lfloor(k-1)/p\rfloor$ terms.
Consequently the product of the $r_i$ is at most $X C_k$, where

```math
C_k=\prod_{p\le k-1}p^{\lfloor(k-1)/p\rfloor}.
```

There is at least one shift $i$ with $r_i\le B=(X C_k)^{1/k}$.
Put $Y=X+k$. For a fixed choice of shift, the number of candidate pairs
is at most $\sum_{r\le B} N(Y,r)^2$, where $N(Y,r)$ counts positive
integers at most $Y$ with radical exactly $r$. The full count is
at most $k$ times that sum.

For squarefree $r$ and $\eta>0$, multiplying the geometric series
for the exponents of its primes gives

```math
N(Y,r)\le Y^\eta \prod_{p\mid r}(p^\eta-1)^{-1}.
```

Using $1\le B/r$ in the sum and then expanding an Euler product
gives the following bound for the candidate pairs at a fixed shift.

```math
\sum_{r\le B}N(Y,r)^2
 \le B Y^{2\eta}\prod_p\left(1+\frac{1}{p(p^\eta-1)^2}\right).
```

The product converges for every fixed positive $\eta$. For small
$\eta$, put $Z=1/\eta$. The logarithms of factors for $p\le Z$
sum to $O(Z)$: each is $O(\log Z)$, and Chebyshev's bound gives
$O(Z/\log Z)$ such primes. For $p>Z$, use
$p^\eta-1\ge\eta\log p$. Partial summation with Chebyshev's
bound gives $\sum_{p>Z}1/(p(\log p)^2)=O((\log Z)^{-2})$.
The logarithm of the product is therefore
$O(\eta^{-2}/\log^2(1/\eta))$. Taking
$\eta=(\log Y\,(\log\log Y)^2)^{-1/3}$ proves the estimate.

This bound controls the number of candidates below a height cutoff.
A proof of an absolute upper bound on matching length still requires
an argument covering arbitrarily sparse, unbounded pairs.
