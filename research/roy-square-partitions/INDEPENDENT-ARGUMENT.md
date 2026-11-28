# Roy’s square-partition inequality conjecture

**Priority correction.** [Myeongjin Kang's public exact sign table, MathDB:2611.00121v2](https://mathdb.com/abs/2611.00121v2), dated November 23, 2026, precedes the November 24 main-branch posting of this different injection argument. The square-case resolution is prior and is not included in the campaign tally. Section 3 remains a higher-power research extension.

**Result.** The equality and failure classification of Conjecture 3.2
in Roy's [*Log-Concavity and the Multiplicative Properties of
Restricted Partition Functions*](https://doi.org/10.1007/s00026-026-00847-5)
holds for all positive integers $m\le n$. This is the named
two-variable statement for partitions into squares, distinct from
the conjecture about partitions into powers of a fixed base.

Write $P(n)$ for the number of partitions of $n$ into perfect
squares, and let $D_m(n)=P(m)P(n)-P(m+n)$. The complete table of
exceptions to $D_m(n)>0$ is:

| $m$ | Equality values of $n$ | Failure values of $n$ |
| :-- | :-- | :-- |
| $1$ | $1,2,4,5,6,9,10,13,14,18,22$ | All other $n\ge1$ |
| $2$ | $4,5,9,13$ | All other $n\ge2$ |
| $3$ | $4$ | All other $n\ge3$ |
| $4$ | $5,6,7$ | None |
| $5$ | $5,6,8,11,15$ | $7$ |
| $6$ | $8,10,12,14$ | $6,7,11,15$ |
| $7$ | $8,9,12,13,19$ | $7,10,11,14,15$ |
| $m\ge8$ | None | None |

The source failure rows for $m=2,3$ can be read with their stated
convention $n\ge m$; the values below $m$ mentioned there have no
effect. If either argument is zero, there is trivial equality
because $P(0)=1$.

Gajdzica's [Theorem 5.2](https://arxiv.org/html/2401.16267v1#S5.Thmtheorem2)
already gives strict inequality when $m,n\ge12$. We prove the
remaining unbounded ranges. The same injection gives a general
one-small-argument result for every power-partition exponent
$d\ge3$, recorded below.

## 1. A square-partition injection with no fours

Let $H(n)$ count square partitions of $n$ with no part $4$.
For every $n\ge0$ we prove
```math
H(n+j)\le
\begin{cases}
 2H(n),&1\le j\le7,
 \\ 3H(n),&j=8,
 \\ 4H(n),&9\le j\le11.
\end{cases}
\tag{1}
```
For $1\le j\le8$, first consider input partitions with a part $9$.
Remove one $9$ and add $9-j$ ones. This is an injection into
the partitions counted by $H(n)$: reverse it by removing exactly
$9-j$ ones and adding a $9$.

Next consider inputs with no $9$. If there are at least $j$ ones,
remove exactly $j$ of them. This produces an output with no $9$,
and has a unique inverse in this class. If there are only $r<j$
ones, a square $q^2\ge16$ must be present: otherwise the input
would have size $r<n+j$. Choose one deterministically, say
the smallest such square. Remove it and all $r$ ones. Replace
their total minus $j$ by parts $9$ and $1$, using
```math
\left\lfloor\frac{q^2+r-j}{9}\right\rfloor
\quad\text{nines and}\quad
(q^2+r-j)\bmod9
\quad\text{ones}.
```
All other parts are left unchanged. Except for $j=8,q=4,r=0$,
at least one $9$ is created, so these images are disjoint from
the outputs of the preceding no-$`9`$ case. The map is injective:
the output's nines and ones determine $q^2+r-j$, and the
intervals $[q^2,q^2+j-1]$ for $q\ge4$ are disjoint (consecutive
squares there differ by at least $9$). Thus $q$ and $r$ are
recovered, and the remaining output parts are the untouched
input parts.

For $j=8$, place the exceptional inputs $q=4,r=0$ in a third
class. Replace one $16$ by eight ones, an injection into the
partitions counted by $H(n)$. The first two bounds of (1) now
follow. For $9\le j\le11$ apply the factor-two bound twice, with
shifts $\lfloor j/2\rfloor$ and $\lceil j/2\rceil$, both at most
seven. This proves (1).

## 2. The full classification

Partitioning according as a $4$ occurs gives
$P(t)=P(t-4)+H(t)$, with $P$ at negative indices interpreted as
zero. For $4\le m\le11$ the three bounds of (1) match $P(m)$:
these multipliers are $2$ for $m=4,5,6,7$, $3$ for $m=8$,
and $4$ for $m=9,10,11$. Hence for $n\ge4$,
```math
D_m(n)=D_m(n-4)+P(m)H(n)-H(n+m)\ge D_m(n-4).
\tag{2}
```
In particular strict positivity propagates along each of the
four residue classes of $n$.

The four seeds $n=20,21,22,23$ are all strictly positive:
```math
\begin{array}{c|rrrr}
m & 20&21&22&23\\\hline
4&8&7&8&7
\\ 5&5&6&7&5
\\ 6&4&5&5&2
\\ 7&3&3&2&1
\\ 8&13&13&15&14
\\ 9&22&25&28&25
\\ 10&21&24&25&22
\\ 11&20&21&22&19
\end{array}
```
Thus (2) handles every $n\ge20$ in these rows. For $m=1,2,3$,
$P(m)=1$ and $D_m(n)=P(n)-P(n+m)\le0$. Each $t\ge24$ is a
nonnegative sum of $4$ and $9$ (their Frobenius number is
$4\cdot9-4-9=23$). Therefore at least one square partition of
$t$ has no ones, so $P(t)>P(t-1)$. This gives strict failure
for $m=1,2,3$ and $n\ge23$.

For transparency, all finite entries used here follow by
multiplying $(1-z^u)^{-1}$ for $u=1,4,9,16,25$ and retaining
coefficients through degree 34. In sequence order from $0$ the
values are
```math
\begin{gathered}
1,1,1,1,2,2,2,2,3,4,4,4,5,6,6,6,8,9,10,10,
\\ 12,13,14,14,16,19,20,21,23,26,27,28,31,34,37.
\end{gathered}
```
Substitution into $D_m(n)$ covers all remaining $m\le11$ and
yields exactly the displayed table, while Gajdzica's theorem
covers $m,n\ge12$. No finite screen is used in lieu of an
unbounded argument.

## 3. The injection for every larger power

Let $P_d$ count partitions into $`d`$th powers for arbitrary
$d\ge3$. Put $s=2^d$, $t=3^d$, and let $H_d$ count those
partitions with no $s$. For every $1\le m<t$ the same marking
argument gives $H_d(n+m)\le2H_d(n)$: replace $9$ by $t$,
and replace the smallest larger allowed part and its $r<m$
ones by $t$-parts and ones. This always creates a $t$-part,
because the smallest larger part is $4^d>2\cdot3^d$. The
possible larger part is reconstructed uniquely from its value
plus $r$, because consecutive $`d`$th powers starting at $4^d$
have gap greater than $t$.

Moreover $H_d(n+m)\le2H_d(n)-1$ once $n$ is sufficiently large.
The class using a $t$-part maps into partitions with at least
$t-m>0$ ones. For all $n\ge(3^d-1)(4^d-1)$, however, there is a
partition of $n$ using only $3^d$ and $4^d$, since these are
coprime. The first image thus misses at least one target, while
the second image still has size at most $H_d(n)$.

For each $s\le m<t$, $P_d(m)\ge2$, and the recurrence
$P_d(n)=P_d(n-s)+H_d(n)$ now improves the difference
$P_d(m)P_d(n)-P_d(n+m)$ by at least one per step of size $s$,
for sufficiently large $n$. Thus it is eventually strictly
positive, with an effective threshold from the finite starting
values in each residue class. For both arguments at least $t$,
strict positivity is Gajdzica's Theorem 5.2; for $m<s$ the
multiplicative inequality is necessarily a failure or equality,
and the same Frobenius argument using $2^d,3^d$ makes it a
strict failure for every sufficiently large $n$. This extends
partial mixed-range control to arbitrarily large exponents,
without counting a new conjecture.

## Sources and priority

- A. Roy, [*Log-Concavity and the Multiplicative Properties of
  Restricted Partition Functions*](https://doi.org/10.1007/s00026-026-00847-5),
  Annals of Combinatorics, September 2026, Conjecture 3.2 and
  Table 2, PDF pages 11–12.
- K. Gajdzica, [*On the Bessenrodt–Ono type inequality for a wide
  class of A-partition functions*](https://arxiv.org/html/2401.16267v1),
  Ramanujan Journal 66 (2025), article 80, Theorem 5.2.
  The theorem explicitly covers both inputs at least 12 in
  the square case and both at least $3^d$ in the higher-power
  case. Its Proposition 5.1 employs a related injection for
  partitions without the smallest allowed non-one part.
  That result does not handle every small argument in Roy's
  table; the marked-part bound (1) and recurrence comparison (2)
  give this additional range.

A later direct MathDB priority check identified Kang’s earlier full square classification, as stated above. The already resolved ary
partition conjecture (fixed-base powers, Roy Conjecture 5.1)
and the different exact log-concavity thresholds (Conjecture 3.3)
are not part of this claim.
