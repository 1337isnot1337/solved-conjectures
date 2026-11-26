# Density of the classical Ulam sequence

**Open problem with a verified partial upper bound.** Tracked in
[#913](https://github.com/1337isnot1337/solved-conjectures/issues/913).

Let $U$ start with 1 and 2 and then admit each integer with exactly one
representation as an unordered sum of two distinct smaller members. Write
$`A(N)=|U\cap[1,N]|`$. The target is to determine whether $A(N)/N$ converges and
whether the limit is positive. The positive upper-density question is also
open. See [Green, Problem 7](https://people.maths.ox.ac.uk/greenbj/papers/open-problems.pdf)
and the [formal statement](https://github.com/google-deepmind/formal-conjectures/blob/main/FormalConjectures/GreensOpenProblems/7.lean).

The [reverse spacing certificate](reverse-spacing.md) gives an upper Banach
density bound of 47/195 and an explicit bound for each translated interval.
The [larger-parent theorem](parents.md) bounds the proportion of terms
that can rely on four frequent summands. It yields an equivalent question
about uniquely represented sums after those four terms are removed.
The [lower-bound tests](lower-bound-tests.md) record the resulting moment
estimate, finite measurements and counterexamples to a one-sided argument.

## Uniform upper bound

**Theorem.** For every positive integer $M$ and $N$,

```math
|U\cap[M,M+N)|\le \frac{193}{800}N+8190.
```

In particular even the upper Banach density (the limsup over arbitrarily long
intervals, uniformly in their starting positions) is at most $193/800=0.24125$.
This improves the upper bound $6/17$ in
[Hinman, Kuca, Schlesinger and Sheydvasser, Theorem 2.6](https://msp.org/involve/2019/12-3/involve-v12-n3-p11-p.pdf).

Set $L=4096$ and $`S=U\cap[1,L-1]`$. A set of offsets
$`P\subseteq\{0,\ldots,L-1\}`$ is admissible if each $x\in P$ has at most
one $y\in P$ with $y<x$ and $x-y\in S$. If $a\ge L$ and
$`P=\{x\in[0,L):a+x\in U\}`$, this constraint follows from uniqueness.
Each such predecessor gives the representation $a+x=(a+y)+(x-y)$.
The summands are distinct since $a+y\ge L$ and $x-y<L$. Different
predecessors give different unordered pairs.

The exact finite search proves that every admissible $P$ containing $0$
has a prefix $[0,\ell)$, with $1\le\ell\le L$, satisfying

```math
800|P\cap[0,\ell)|\le193\ell.
```

To enumerate counterexamples, start with the selected offset $0$. With $r$
selected offsets, append $x$ in increasing order only if it has at most one
selected predecessor at a distance in $S$ and $193x<800r$. The latter
inequality is necessary because the prefix $[0,x)$ has $r$ points. It
also guarantees the strict inequality for every unchecked prefix ending
at or before $x$. A pattern with all prefixes above $193/800$ must reach
$\lfloor 193L/800\rfloor+1=989$ selected points. Conversely a branch
reaching that count can leave all later positions empty and still have
every prefix above the bound. All branches die before 989 points.

Starting at $M$, count at most $L-1$ positions below $L$ separately. At
each subsequent nonmember consume one position. At a member with at least
$L$ positions remaining, consume a prefix supplied by the finite search.
Each such consumed interval has density at most $193/800$. The final
unprocessed interval has at most $L-1$ positions. Summing yields the stated
bound with $2(L-1)=8190$.

## Verification

Run the replays from this directory.

```sh
c++ -std=c++20 -O3 verify.cpp -o /tmp/ulam-prefix-verify
/tmp/ulam-prefix-verify
python3 verify.py
c++ -std=c++20 -O3 probe_dilations.cpp -o /tmp/ulam-dilation-probe
/tmp/ulam-dilation-probe
```

The [C++ verifier](verify.cpp) computes each representation count by
testing all eligible smaller summands, then counts selected predecessors
at each append. The [Python verifier](verify.py) uses a sum sieve for the
prefix and propagates forbidden successors using integer masks. Each
enumeration exhausts 160,662,848 nodes.

The same admissibility test permits the periodic set
$`B=\{n:221n\bmod540<127\}`$. The multiplier is invertible modulo 540, so
$B$ has density $127/540$. In one period, the only shifts in $S$ that
can give a predecessor of a selected residue are 2 and 3. They apply
on disjoint sets of target residues, namely $0,\ldots,28$ and
$123,\ldots,126$ after multiplication by 221. The Python verifier checks
all 382 shifts in $S$ against the whole period. This gives a lower bound
of $127/540$ on any uniform upper-density constant derived solely from
these finite predecessor constraints.

## Lower density and convergence

[Two-dilation criterion and exact prefix tests](dilations.md) gives
sufficient one-sided inequalities for a positive natural density. The
all-scale inequalities remain open. The same probe measures two ways in
which the finite set of small shifts fails to decide the greedy recurrence.

[Phase confinement](phase-confinement.md) proves positive natural
density under exact eventual confinement to a sum-free phase band with
rational endpoints. It also checks how a single phase-boundary
correction can change a truncated model's limiting density.

## Source audit

- [Erdős Problem 342](https://www.erdosproblems.com/342) includes a zero-density
  question alongside gap and Fourier questions. The latter are distinct
  targets.
- [Kravitz, Theorem 1.1](https://arxiv.org/abs/2611.17584) proves
  $u_n\le \exp(O(\sqrt n))$, giving $A(N)\gg (\log N)^2$. This leaves
  positive density open.
- [Gibbs and McCranie](https://vixra.org/pdf/1711.0134v1.pdf) counted
  73,979,274,540 members below $10^{12}$. The resulting finite ratio is
  0.073979274540. [Steinerberger](https://arxiv.org/abs/1507.00267)
  and [Gibbs](https://vixra.org/pdf/1508.0045v2.pdf) describe numerical
  Fourier structure and a conjectured phase restriction.
- [Agama, arXiv:2007.02697v12](https://arxiv.org/pdf/2007.02697v12),
  Proposition 3.6, asserts a lower bound of order $n/\log n$ for the
  mean increment of an arbitrary addition chain. The chain $1,2,\ldots,n$
  has mean increment exactly 1. An upper bound on the *shortest* length
  supplies a lower bound for the *largest* mean increment, whereas the
  proof uses it for the smallest. Section 6 uses separate extra hypotheses.
  Its Theorem 6.8 counts pairs with at least one Ulam summand and non-Ulam
  sum at most $n$. Taking $x=1$ and $y=m-1$ for each non-Ulam $m$ from 4
  through $n$ gives at least $n-A(n)-3$ such pairs. The published $6/17$
  upper bound makes this grow linearly, contradicting the asserted
  sublinear counting hypothesis when applied to this sequence.
- [Agama, viXra:2501.0060v1](https://www.rxiv.org/pdf/2501.0060v1.pdf),
  Theorem 3.2, would bound the harmonic sum of the chain $1,2,\ldots,n$
  by $3/2+O((n-1)/n)$. The harmonic sum instead diverges. The
  logarithmic-density argument uses that estimate.

If you use this work, please cite [the project](https://itsdavis.com/)
and [this research package](https://github.com/1337isnot1337/solved-conjectures/tree/research/research/ulam-sequence-density).
