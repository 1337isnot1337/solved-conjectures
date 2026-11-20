# Erdős–Krückeberg conjecture

Research log for [issue #61](https://github.com/1337isnot1337/solved-conjectures/issues/61).
The conjecture asks if there is a Sidon set $A\subseteq\mathbb N$
with

```math
 \limsup_{N\to\infty} \frac{|A\cap[1,N]|}{\sqrt N}=1 .
```

In a Sidon set, equality of two pair sums forces the pairs
to agree as multisets, allowing repeated summands.

## Literature

- [Erdős's 1980 survey](https://combinatorica.hu/~p_erdos/1980-03.pdf)
  attributes the conjecture to Erdős and Krückeberg. The finite
  Erdős–Turán bound gives the universal upper limit $1$.
  [Krückeberg](https://doi.org/10.1515/crll.1961.206.53)
  attains $1/\sqrt2$.
- [Alexeev and Mixon, Conjecture 4](https://arxiv.org/abs/2510.19804)
  state the infinite problem separately from the finite
  perfect-difference-set extension conjecture. They disprove
  that finite extension conjecture and identify Hall's earlier
  counterexample.
- [O'Bryant](https://arxiv.org/abs/2606.28651) and the November
  2026 preprint of [Wang and Yang](https://arxiv.org/abs/2611.01871)
  distinguish the upper limit from lower-limit bounds and
  constructions with bounded multiplicities or higher-order sums.
  The Wang–Yang construction treats $B_h$ sets for $h\ge3$.
- [Erdős Problem 329](https://www.erdosproblems.com/history/329)
  and the [Erdős Problems wiki](https://erdosproblems.ai/wiki/problems/integer_sequences/E0329)
  record the exact infinite conjecture. The source search through
  November 2026 found no proof or disproof of it.
- [Eberhard and Manners](https://arxiv.org/abs/2107.05744)
  identify the common finite-projective-plane structure of
  many dense modular Sidon sets. The [Erdős Problem a Day report on #44](https://www.erdosproblemaday.com/day/44-sidon-density-completion)
  records explicit finite seeds that fail to embed in certain
  classical constructions and a deletion bound for Singer sets.

## An obstruction to preserving prefixes in the classical constructions

**Theorem.** Let $A\subseteq\mathbb N$. Suppose that there
are cutoffs $N_i\to\infty$ and cyclic Sidon sets
$S_i\subseteq\mathbb Z/M_i\mathbb Z$ with $M_i\to\infty$.
Suppose membership in $S_i$ is the vanishing of a linear
recurrence of order at most $d$, over a field $K_i$, with
the same bound $d\ge2$ for all $i$. More precisely, for all
$n\ge0$, the recurrence term at $n$ vanishes exactly when
$n\bmod M_i\in S_i$. Assume that all but at most $B$ elements
of $A\cap[1,N_i]$ lie in $S_i$ upon reduction modulo $M_i$,
for a fixed $B$.

Then $|A\cap[1,N]|=O(1+(\log N)^{d-2})$. If the fields can
be taken of characteristics tending to infinity, or of
characteristic zero, then $A$ is finite.

To prove this, pad the recurrences to order $d$ if necessary.
In the polynomial ring
$R=\mathbb Z[c_0,\ldots,c_{d-1},u_0,\ldots,u_{d-1}]$,
define the universal recurrence terms $P_n$ by

```math
 P_j=u_j\quad(0\le j<d),\qquad
 P_{n+d}=\sum_{j=0}^{d-1}c_jP_{n+j}.
```

Each individual sequence is an evaluation of these polynomials
into $K_i$. The ring is countable. By successive subsequences
and diagonal selection, arrange that each polynomial either
vanishes eventually in the evaluations or is eventually
nonzero. The eventually vanishing polynomials form a prime
ideal $\mathfrak p$. Indeed $1$ never vanishes, and if neither
factor vanishes eventually then their product is eventually
nonzero in the fields. Take the universal recurrence in the
fraction field $K$ of $R/\mathfrak p$, and let $Z$ be its set
of zero indices.

At most $B$ elements of $A$ can lie outside $Z$. Otherwise
$B+1$ fixed such elements would be excluded together for all
large $i$. The zero set $Z$ is itself Sidon over the integers.
Any nontrivial equality of two pair sums in $Z$ would occur
in the finite models eventually. For large $i$, all the
distinct indices appearing in the equality remain distinct
modulo $M_i$, contradicting that $S_i$ is Sidon. In particular,
$Z$ contains no infinite arithmetic progression.

In characteristic zero, the Skolem–Mahler–Lech theorem now
makes $Z$ finite. In characteristic $p$, [Derksen's Corollary 1.11](https://arxiv.org/abs/math/0510583)
gives $|Z\cap[1,N]|=O(1+(\log N)^{d-2})$.
If the input characteristics tend to infinity, each nonzero
integer polynomial of degree zero is eventually nonzero,
so $K$ has characteristic zero. This also holds if all input
fields have characteristic zero.

### Three families of order at most three

In each formula below an affine change of the exponents
$n\mapsto un+v$, with $u$ invertible modulo the cyclic group
order, is allowed.

- In the [Singer construction](https://doi.org/10.1090/s0002-9947-1938-1501951-4)
  the set is given by
  $\operatorname{Tr}_{\mathbb F_{q^3}/\mathbb F_q}(c g^n)=0$,
  where the class of $g$ generates
  $\mathbb F_{q^3}^\times/\mathbb F_q^\times$.
  Multiplication by $g$ acts linearly on a three-dimensional
  space. Applying the trace functional to its orbit gives
  the recurrence by Cayley–Hamilton.
- In the [Bose–Chowla construction](https://www.cs.umd.edu/users/gasarch/COURSES/858/S13/BoseChowla.pdf)
  a power of a primitive element of $\mathbb F_{q^2}$ belongs
  to an affine line. This is a condition $L(c g^n)-1=0$ for a
  linear functional $L$ and a primitive $g$. The homogeneous
  term has order at most two and the constant increases the
  order by at most one.
- In the [Ruzsa construction](https://bibliotekanauki.pl/articles/1391676.pdf)
  in $\mathbb Z/(p(p-1))\mathbb Z$, the membership condition
  after an affine change is $g^n c-\bar u n-\bar v=0$ over
  $\mathbb F_p$, with $g\in\mathbb F_p^\times$.
  The exponential satisfies a first-order recurrence and
  the affine polynomial has second forward difference zero.
  In this family unbounded moduli force $p\to\infty$.

Thus any fixed infinite set whose successive prefixes are
contained in a mixture of these three families, up to a fixed
number of omissions, grows at most logarithmically. The
conclusion also applies to incidence along a cyclic projective
linear orbit in dimension three whenever the modular incidence
set is Sidon: a linear equation of the projective line gives
the same recurrence after choosing a matrix representative
of the generator.

### The logarithmic scale is attained

Let $A=\{2^j:j\ge0\}$. This is Sidon because the positive
difference $2^j-2^i$ for $j>i$ determines $i$ by its
2-adic valuation and then determines $j$. For every sufficiently
large $q$ of characteristic $2$, a Singer difference set
contains a generator of its cyclic group of order $M=q^2+q+1$.
To see this, every nontrivial character sum over the difference
set has magnitude $\sqrt q$, by the equation for its
difference multiplicities. Detecting multiples of divisors of
$M$ by characters, and then applying Möbius inversion, counts

```math
 (q+1)\frac{\varphi(M)}{M}+O(\tau(M)\sqrt q)
```

generators in the set. This is positive for large $q$.
Take a representative $g\in\mathbb F_{q^3}^\times$ of
such a generator with trace zero. Then each $g^{2^j}$ has
trace zero by Frobenius. Using $g$ as the projective generator
puts every fixed prefix of $A$ into Singer sets of arbitrarily
large modulus.

The prefix theorem concerns exact modular embeddings with a
uniform bound on the number of omitted points. A general
integer Sidon set can have collisions after reduction modulo
a number close to the length of its containing interval.
That is an additional gap between this obstruction and
the full infinite conjecture.
