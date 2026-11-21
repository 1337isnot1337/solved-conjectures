# McCrea's conjecture

For every integer $`k\ge3`$, there is exactly one transition density between $`2^{-k-1}`$ and $`1/(4k)`$ in the comparison of the two fixed-perimeter Franklin statistics. For each fixed density below the transition, the multiplicity statistic eventually has more partitions; above it, the divisibility statistic eventually has more. The proof covers the full interval and every allowed modulus.

This proves Conjecture 9.2 of Marcus McCrea, *Fixed-Perimeter Franklin Statistics and an Eventual Inequality*, [arXiv:2609.12005v2](https://arxiv.org/abs/2609.12005v2), 5 November 2026, Section 9. The [full source PDF](https://arxiv.cnoctave.top/pdf/2609.12005) distinguishes this conjecture from the earlier fixed-number theorem.

Positive generating-function factorizations give exact local coefficient asymptotics when the marked count is $`\lfloor xn\rfloor`$. The two strictly concave growth exponents attain the same maximum at different means. Between those means, one decreases and the other increases, so their difference has a unique zero. The sign of that difference gives the eventual strict inequalities.

- [Complete proof](PROOF.md)
- [Source and priority audit](NOVELTY.md)
- [Independent mathematical review](REVIEW.md)
- [Exact diagnostic checks](verify.py)
- [Issue 168](https://github.com/1337isnot1337/solved-conjectures/issues/168)

Run from the repository root:

```bash
python3 results/mccrea-single-crossover/verify.py
```

The standard-library verifier enumerates profile words directly, compares the two statistics with both generating-function forms, and checks the exact saddlepoint means. These are finite consistency checks; the written Fourier and concavity arguments prove the unrestricted result.

Status: complete proposed proof, independently reviewed internally; unrefereed. No prior crossover resolution was found in the documented search. No statement at the transition, outside the specified density interval, or about a uniform finite-perimeter threshold is claimed. No Lean work was performed.
