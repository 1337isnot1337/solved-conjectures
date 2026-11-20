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

## A deletion bound for all three cyclic constructions

**Theorem.** Let $D\subseteq[0,M-1]$ be the standard integer
representatives of any affine Singer, Bose–Chowla or Ruzsa
Sidon set. Let $A$ be an integer Sidon set that contains
some $a\in[0,M-1]\setminus D$. Then

```math
 |D\setminus A|\ge (1/8-o(1))|D|,
 \qquad M\longrightarrow\infty,
```

uniformly in $D$ and $a$. The [earlier deletion bound for
Singer sets](https://www.erdosproblemaday.com/day/44-sidon-density-completion)
gives the constant $1/16$ in that family. Here the count comes
from equidistribution of the two summands in a representation
of $a$ as a sum minus a third element.

First count modular solutions $x+y-z\equiv a\pmod M$ in $D$.
We will show that at least $(1/2-o(1))|D|$ of the ordered
solutions satisfy the same equality over the integers.
Since $a\notin D$, fixing a value as the first summand
determines at most one ordered difference $y-z$ in the
modular Sidon set. The same holds for the second summand.
Fixing $z$ determines at most two ordered pairs $x,y$.
Thus removing any one element destroys at most four
ordered solutions. Every genuine integer solution must
lose at least one of its three elements if we adjoin $a$.
The claimed lower bound follows.

### Character sums for Singer sets

Write $K=\mathbb F_q$, $E=\mathbb F_{q^3}$, and let $U$
be the trace-zero subspace of $E$. Under the affine
identification the indices of $D$ correspond to the classes
of $U\setminus\{0\}$ in $E^\times/K^\times$.
Let $\delta$ be a representative of the class for $a$.
It is outside $U$, and a modular solution corresponds to
classes $X,Y,Z$ with $XY/Z=\delta$ in the quotient.
Equivalently, $X,Y\in U$ satisfy
$\operatorname{Tr}(XY/\delta)=0$, with $Z$ determined.

The bilinear form $\operatorname{Tr}(XY/\delta)$ is
nondegenerate on $U$. Its radical would consist of the
vectors in $U$ for which $X/\delta$ is in the trace
annihilator of $U$, namely $K$. As $\delta\notin U$,
the radical is zero. Consequently each projective $X$
determines $Y$ by an invertible projective linear map of
$\mathbb P^1(K)$. Choose representatives for the finite
parameters of the projective line in the form

```math
 X(t)=a_0+a_1t,\qquad Y(t)=b_0+b_1t,\qquad t\in K,
```

where each pair of coefficients is linearly independent
over $K$. The parameter at infinity affects the counts
by at most one.

Let $\chi$ generate the characters of $E^\times/K^\times$
in the chosen exponent coordinate. For any fixed integer
frequencies $h,k$, the Fourier coefficient for the ordered
summands is, up to a constant of modulus one, the sum of
$\chi^{h}(X(t))\chi^{k}(Y(t))$ over $t\in K$.
Here and below the affine changes of the indices only change
the generator of the character group and the constant factor.
Put $\xi=-a_0/a_1$ and $\upsilon=-b_0/b_1$.
Both have degree three over $K$.

If their minimal polynomials are distinct, the character
sum is a sum over monic degree-one polynomials for
a Dirichlet character of $K[T]$ modulo the product of
those two cubics. This follows by identifying the quotient
at each cubic with $E$ by evaluation at its root.
For a nonzero fixed frequency pair and sufficiently
large $q$, at least one local character is nontrivial.
Weil's bound gives $O(\sqrt q)$ for this sum. In the
[function-field Dirichlet formulation](https://c.pgdm.ch/publications/roots-L-functions-characters.pdf),
the sum is the coefficient of degree one in the
$L$-polynomial, and the degree of the modulus is bounded.
A trivial local character can be removed from the modulus
since none of the tested linear polynomials vanishes there.

If $\upsilon=\xi^{q^j}$ for $j=1$ or $2$, the two
characters combine into a character at the same cubic
with exponent $h+q^j k$ modulo $M=q^2+q+1$.
This is nonzero modulo $M$ for a fixed nonzero pair
and sufficiently large $q$. For $j=2$ use
$q^2\equiv-q-1\pmod M$. The same square-root bound applies.
In the remaining case $\upsilon=\xi$, the two field
representatives are proportional by a fixed scalar.
This scalar preserves $U$, so it lies in $K^\times$ by
the trace annihilator property. The modular solutions then
have $x=y$. Their single coordinate is equidistributed,
since the nontrivial character sums of a Singer difference
set have magnitude $\sqrt q$.

### Character sums for Bose–Chowla sets

Now take $E=\mathbb F_{q^2}$, and identify $D$ with
$\vartheta+K\subseteq E^\times$ for $\vartheta\notin K$.
Write $L:E\to K$ for the linear functional with $L(1)=0$
and $L(\vartheta)=1$. Let $\delta\notin\vartheta+K$ be
the nonzero field element corresponding to $a$. With
$X=\vartheta+t$, the equations for $Y=\vartheta+s$ become

```math
 L(X\vartheta/\delta)+s L(X/\delta)=1.
```

For all but at most one $t$, the coefficient of $s$ is
nonzero, giving $s$ as a linear fractional function of $t$.
When the coefficient vanishes, $X/\delta$ lies in $K^\times$,
so the equation would force $X=\delta$, which is excluded.
The same argument with $X,Y$ exchanged proves that the
fractional function is nonconstant for large $q$. In
particular it has the form $s=(A+Bt)/(C+Dt)$ with
$BC-AD\ne0$ in $K$. Therefore

```math
 Y(t)=\frac{(\vartheta C+A)+(\vartheta D+B)t}{C+Dt}.
```

The numerator coefficients are independent over $K$.
The numerator and $X(t)$ give irreducible quadratics in
the function-field Dirichlet character argument, and a
nonconstant denominator gives a linear factor. The
multiplicative character now has order $q^2-1$ on
$E^\times$ and order $q-1$ on $K^\times$.

If the two quadratic factors are distinct, a nonzero
frequency gives a nontrivial character at at least one
factor. If the roots are distinct conjugates, the exponent
at their common quadratic is $h+qk$, which gives a nontrivial
character for any fixed nonzero pair and large $q$.
If the roots are equal and $C+Dt$
is nonconstant, the denominator factor is nontrivial
when $k\ne0$ for large $q$. When $k=0$ the first
frequency gives a nontrivial character. All three cases
give a square-root bound. Removing the possible pole
changes the bound by $O(1)$.

Finally, if the quadratic roots are equal and the
denominator constant, then $Y(t)$ is a fixed scalar
multiple of $X(t)$. Preservation of the affine line
forces the scalar to be in $K^\times$ by taking differences
and then to be $1$ by applying $L$. These are diagonal
solutions. The single summand coordinate is equidistributed
by the same character bound for one irreducible quadratic.

### Character sums for Ruzsa sets

Use the cyclic group model $\mathbb F_p\times\mathbb F_p^\times$,
with addition in the first coordinate and multiplication
in the second. The set is the diagonal $(x,x)$ with
$x\in\mathbb F_p^\times$. If the image of $a$ is
$(b,c)$, then $b\ne c$ and $c\ne0$. The modular equation
determines the second summand by

```math
 y(x)=\frac{c(x-b)}{x-c}.
```

There are only $O(1)$ excluded values where a denominator
or one of the required nonzero coordinates vanishes.
A generating character in the exponent coordinate
splits into a nontrivial additive character $\psi$ and
a generating multiplicative character $\chi$.
The sum for each fixed nonzero frequency pair $(h,k)$,
apart from a constant of modulus one, is

```math
 \sum_x \psi(hx+k y(x))\chi(x^h y(x)^k).
```

For sufficiently large $p$, the additive argument has a
simple pole at $x=c$ if $k\ne0$, and a simple pole at
infinity if $k=0$ and $h\ne0$. This excludes the
Artin–Schreier exceptional form, since the poles of
$H^p-H$ have orders divisible by $p$. Thus the mixed
[Weil character bound](https://www.mathnet.ru/eng/mzm6857)
gives $O_{h,k}(\sqrt p)$.

### From modular to integer solutions

In the cases with the two-dimensional character bounds,
the pairs $(x/M,y/M)$ are equidistributed in the unit square
by the Fourier criterion. The number of modular solutions
is $|D|+O(1)$ by the parameterizations. A modular solution
becomes an integer solution precisely when
$0\le x/M+y/M-a/M<1$. For $\alpha=a/M\in[0,1)$
the strip has area $1/2+\alpha-\alpha^2\ge1/2$.
In the diagonal cases, the corresponding interval for
$x/M$ has length $1/2$. These estimates are uniform in
the choice of $\alpha$. Indeed any subsequence of choices
has a further subsequence with $\alpha$ convergent, where
the strip or interval boundaries have limiting measure
zero. In every case at least $(1/2-o(1))|D|$ ordered
solutions are integer solutions, as claimed.

### Consequence for an infinite Sidon set

For every infinite integer Sidon set $A\subseteq\mathbb N$,
the fraction of agreement with these classical sets satisfies

```math
 \limsup_{M\to\infty}\ \sup_D\frac{|A\cap D|}{|D|}
   \le \frac78,
```

where the supremum is over these affine constructions
at the available moduli. Indeed, agreement above
$7/8+\epsilon$ along an unbounded sequence of moduli
would force every element of $A\cap[1,M-1]$ to be in $D$
for all sufficiently large members of the sequence.
The recurrence theorem would then bound these prefixes
by $O(\log M)$, contradicting the supposed agreement.
This rules out obtaining the conjectured infinite density
by modifications of size $o(\sqrt M)$ of these three
classical cyclic families. The infinite conjecture is open.
