# Sagan–Swanson conjecture

The full asymptotic-normality statement in Sagan and Swanson, *q-Stirling numbers in type B*, Conjecture 7.8 is proved here. For every sequence of integers with $`n,k\to\infty`$ and $`k/n\to\alpha\in(0,1)`$, the coefficient distributions of all four polynomials

```math
S[n,k],\qquad c[n,k],\qquad S_B[n,k],\qquad c_B[n,k]
```

converge to the standard normal law after centering by their actual means and dividing by their actual standard deviations.

The [complete proof](PROOF.md) uses the elementary and complete homogeneous symmetric-function expressions. Each coefficient distribution is represented exactly as a sum of independent uniform marks attached to Bernoulli or geometric counts, conditioned on the total count. A direct Fourier argument controls this conditioning event and proves the normal limit. Exponential tilting proves convergence of the actual moments. The limiting variance is strictly positive and has order $`n^3`$.

This is a complete unrefereed result. Independent analytic, source/model, and root mathematical audits passed. The [literature and scope record](NOVELTY.md) describes the searches and distinguishes earlier results. No earlier resolution of the exact full conjecture was found; the search does not establish exclusive priority.

## Files and verification

- [PROOF.md](PROOF.md): self-contained conditional-limit proof and all four parameter specializations.
- [NOVELTY.md](NOVELTY.md): primary sources, later papers, older probability literature, search record, and audit status.
- [verify_model.py](verify_model.py): exact rational checks of the conditional models against the defining recurrences.

Run:

```sh
python3 results/sagan-swanson-normality/verify_model.py
```

The checker passes 168 exact identities across all four families and two auxiliary parameter choices. These finite checks verify algebraic models and indexing; the asymptotic conclusion is proved analytically.

## Scope and source

The target is the full proportional regime for all four families. The separate coefficient log-concavity, parity log-concavity, bottom-heaviness, and boundary-regime questions are not claimed solved here.

- [Published primary paper](https://users.math.msu.edu/users/bsagan/Papers/Old/qStB-pub.pdf), European Journal of Combinatorics **118** (2024), 103899; Conjecture 7.8 on printed page 32.
- [DOI](https://doi.org/10.1016/j.ejc.2023.103899)
- [arXiv:2205.14078](https://arxiv.org/abs/2205.14078)
- [Research and review issue 92](https://github.com/1337isnot1337/solved-conjectures/issues/92)

## Further results, not separate conjecture resolutions

The interior-proportion central limit theorem was already proved in issue #92. The stronger uniform lattice local limit, proved in Section 5, is retained here.

[Uniform lattice local limit](LOCAL-LIMIT.md) · [Supplement audit](LOCAL-LIMIT-AUDIT.md)
