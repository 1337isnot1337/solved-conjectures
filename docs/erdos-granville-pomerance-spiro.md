# Erdős–Granville–Pomerance–Spiro conjecture

Research log for [issue #47](https://github.com/1337isnot1337/solved-conjectures/issues/47). The full conjecture remains open.

Let $s(n)=\sigma(n)-n$ be the sum of the proper divisors of $n$.
If $A$ is a set of positive integers of natural density zero, the
conjecture says that $\{n\ge2:s(n)\in A\}$ also has natural density
zero.

## Literature

- [Erdős, Granville, Pomerance, and Spiro, Conjecture 4](https://math.dartmouth.edu/~carlp/iterate.pdf)
  pose the statement in their 1990 paper on iterations of arithmetic
  functions.
- [Pollack, Pomerance, and Thompson, Theorems 1.2 and 1.4](https://arxiv.org/abs/1706.03120)
  prove the conjecture for arbitrary sets with counting function
  $X^{1/2+o(1)}$. They refute a separate proposed uniform bound on
  individual fibers. A sparse family of large fibers can coexist
  with the density-zero conjecture.
- [Luca and Pomerance, §3](https://math.dartmouth.edu/~carlp/LucaPomeranceAA2.pdf)
  bound the second moment of the fibers on a chosen positive-density
  set of even deficient inputs with three large prime factors in
  prescribed windows. This proves positive lower density of their
  even outputs. The same moment bound gives the density-zero
  preimage implication on those inputs by Cauchy–Schwarz.
- [Pollack and Troupe](https://arxiv.org/abs/2106.10756) prove the
  Erdős–Kac law for $s(n)$. [Lebowitz-Lockard, Pollack, and Singha Roy](https://arxiv.org/abs/2105.12850)
  establish equidistribution modulo individual primes up to fixed
  powers of $\log X$. These distribution statements address
  specific kinds of sparse sets.
- [Pollack and Singha Roy](https://arxiv.org/abs/2106.14953) prove
  agreement of $k$-free status almost everywhere for $k\ge4$.
  [Benli et al.](https://arxiv.org/abs/2307.12859) prove the EGPS
  conclusion for missing-digit sets. [A 2026 follow-up](https://arxiv.org/abs/2607.18981)
  develops further digit-distribution results.
- [Erdős Problem 955](https://www.erdosproblems.com/955) and
  [the fiber-tightness audit](https://www.erdosproblemaday.com/report/955)
  record the same full statement and the equivalent question of
  uniform control of the mass of large finite fibers.

The November 2026 search covered the original papers, later
preprints and their references, and the problem discussion.
No proof or counterexample for arbitrary density-zero sets was found.

The proof route uses Luca and Pomerance's second moment after
separating inputs by their small-prime parts. The new calculation
retains quadratic congruences modulo prime powers, so it avoids
the use of squarefreeness in the original collision count.
