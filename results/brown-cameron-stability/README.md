# Brown–Cameron’s independence-root sector and stability problems

**Contribution and proof:** [@adamben04](https://github.com/adamben04), 26 November 2026. **Verification:** written proof with exact computational cross-checks; no registered Lean formalization or independent human review.

For every fixed edge probability $`0\lt p<1`$, let $`G\sim G(n,p)`$ and let $`I_G(z)=\sum_j i_j(G)z^j`$ count independent sets by size. Then

```math
\limsup_{n\to\infty}\mathop{\mathrm{Pr}}\big(I_G\text{ has a zero with positive real part}\big)\ge 1-e^{-(1-p)^2}.
```

This answers **Problem 2**, “Are almost all graphs stable?”, of Brown and Cameron’s *On the Stability of Independence Polynomials*, Electronic J. Combin. 25(1) (2018), P1.46 ([DOI 10.37236/7280](https://doi.org/10.37236/7280), [arXiv:1802.02478](https://arxiv.org/abs/1802.02478)), in the negative for every fixed density in the question. At $p=1/2$ it also disproves their **Conjecture 3.2** in the separate preprint [*On the Unimodality of Independence Polynomials of Very Well-Covered Graphs*, arXiv:1709.08236v1](https://arxiv.org/abs/1709.08236v1): for almost every graph, all roots lie within the sector of half-angle $`\pi/3`$ about the negative real axis. The limsup probability of failing even the conjecture’s log-concavity consequence is at least $`1-e^{-(1-p)}`$.

Choose graph orders where the expected number of independent $k$-sets is a small positive constant. With probability bounded away from zero at least one exists. Larger sets disappear with high probability, and the counts in the three preceding sizes concentrate. The top four coefficients then violate a necessary inequality for polynomials whose roots lie in the closed left half-plane. At $p=1/2$ the lower bounds are about 22.1% for a right-half-plane zero and 39.3% for failure of log-concavity. These are **subsequential** bounds; the proof does not give a limit or show typical failure of unimodality.

| File | Contents |
| --- | --- |
| [Proof](PROOF.md) | Deterministic root obstruction, overlap estimates, and the probability bounds; includes the labelled and unlabelled conventions. |
| [Review](REVIEW.md) | Separate mathematical review, author checks, and exact replay output. |
| [Source and priority audit](AUDIT.md) | Primary statements, nearby results, and bounded literature and repository searches. |
| [Python verifier](verify.py) · [Optional Z3 verifier](verify_z3.py) | Exact finite counting and separate symbolic identities. Neither script is needed for the asymptotic proof. |

From the repository root, run the standard-library check used in CI:

```sh
python3 results/brown-cameron-stability/verify.py
```

For an optional local Z3 check of the four algebraic claims, run:

```sh
python3 -m pip install z3-solver==4.16.0.0
python3 results/brown-cameron-stability/verify_z3.py
```

The [maintainer’s mathematical review and exact replay](https://github.com/1337isnot1337/solved-conjectures/pull/838#pullrequestreview-6077450143) is recorded on the original submission. If you use this proof, please credit [@adamben04](https://github.com/adamben04) and cite [the project](https://itsdavis.com/) and [the specific proof](https://github.com/1337isnot1337/solved-conjectures/blob/main/results/brown-cameron-stability/PROOF.md).
