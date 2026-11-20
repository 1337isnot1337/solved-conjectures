# Erdős–Granville–Pomerance–Spiro conjecture

If $\mathcal A$ is a set of positive integers of natural density zero,
the conjecture asserts that the inputs $n\ge2$ whose proper-divisor
sum $s(n)=\sigma(n)-n$ belongs to $\mathcal A$ also have natural density
zero. The full conjecture remains open. [Original paper, Conjecture 4](https://math.dartmouth.edu/~carlp/iterate.pdf) · [Erdős Problem 955](https://www.erdosproblems.com/955)

The written proofs establish the preimage conclusion for every
density-zero target set on a fixed union of input families of
natural density approximately **53.46%**.

| Inputs | Density added to the union | Proof |
| :--- | :---: | :--- |
| $n=pq\ell$ with $p>q\ell$ and $q>\ell$ | $(\log 2)^2$ | [Two dominant primes](PROOF.md) |
| Largest prime $p\le\sqrt n$, with the cofactor and second prime satisfying the logarithmic size inequalities | About 3.91 percentage points | [Bilinear collision count and prime sieve](SMALL-COFACTOR.md#refinement-using-the-cofactor-and-prime-exponents) |
| $n=pqrw$ with $p>q>r$ prime, $p>\sqrt n$, $r>w^3$, and $q\le rw$ | About 1.50 percentage points | [Rational cofactor ratios and quadratic norms](THIRD-PRIME.md) |

The proofs use second-moment estimates for divisor-sum collisions
after discarding an arbitrarily small upper proportion of inputs.
The [reproducible checks](verify.py) exercise some of the algebraic
and congruence steps on finite ranges.

```bash
python3 results/erdos-granville-pomerance-spiro/verify.py
```

**Lean status:** None.

[Research discussion](https://github.com/1337isnot1337/solved-conjectures/issues/47)
