# Karp–Vishnyakova–Zhang's gamma-quotient conjecture

The all-order sign-regularity assertion is proved for every positive parameter difference. The proof also gives the exact signature and the integer-parameter rank cutoff. The source's proposed fixed order-three signature is corrected within the same theorem.

## Result

Set $`\delta=c-d>0`$. For every ordered grid with positive denominator arguments, the kernel

```math
K(x,y)=\frac{\Gamma(c+x+y)}{\Gamma(d+x+y)}
```

is sign regular of every order. If $`\delta`$ is not an integer, every order-$`r`$ determinant is nonzero with sign

```math
\varepsilon_r(\delta)
=\mathop{\mathrm{sgn}}\left[
(-1)^{\binom r2}\prod_{j=0}^{r-1}\delta^{\underline j}
\right].
```

Here the underlined exponent denotes a falling factorial and its order-zero value is one. For $`\delta=m`$ a positive integer, the signs through order $`m+1`$ are $`(-1)^{\binom r2}`$, and all larger minors vanish.

In particular, the third-order sign is positive when $`0<\delta<1`$, negative when $`\delta>1`$, and zero when $`\delta=1`$. The fixed signature $`(+,-,-)`$ suggested in the source is therefore incorrect on the first interval. This correction is not counted as a separate conjecture resolution.

## Proof mechanism

The gamma-density kernel

```math
G(a,u)=\frac{u^{a-1}e^{-u}}{\Gamma(a)}
```

is strictly totally positive. The power kernel $`(u+v)^\delta`$ has the stated sign sequence, as follows from an explicit Wronskian and Rolle's theorem. The exact identity

```math
\frac{\Gamma(x+y+\delta)}{\Gamma(x+y)}
=\int_0^\infty\int_0^\infty
G(x,u)(u+v)^\delta G(y,v)\,du\,dv
```

transfers those signs to the quotient through two continuous Cauchy–Binet formulas. The proof includes absolute-integrability and strictness arguments, so it applies to every order without a limiting numerical claim.

## Lean verification

Lean proves the literal kernel `Gamma(c+x+y) / Gamma(d+x+y)` for
arbitrary real `c`, `d`, and strictly increasing real node grids, assuming
only `c>d` and `d+x_i+y_j>0`. A proved translation to two positive grids
preserves every matrix entry. The empty determinant is included.

Write `delta=c-d`. For positive noninteger `delta`, every order is strict.
The determinant sign is the sign of
`(-1)^(r.choose 2) * product(j=0..r-1, falling(delta,j))`, with the empty
falling factorial equal to one. For a positive integer `delta=m`, minors
through order `m+1` are nonzero with sign `(-1)^(r.choose 2)`; every larger
minor vanishes. The third-order sign is the sign of `delta^2*(1-delta)`.
It is positive for `0<delta<1`, zero at `delta=1`, and negative for `delta>1`.
Thus the source's fixed third-order signature is corrected within this theorem.

The proof derives the all-order Wronskian criterion by exact mean-value
reductions, proves the power and gamma-density determinant signs, and
establishes the literal double gamma integral with its integrability
hypotheses. Two determinant composition arguments prove the final signs.
No unformalized Wronskian or composition theorem is assumed.

All 15 sources passed strict checks. The exact owned/private axiom audit
covers 195 declarations, 176 theorem declarations, and 54 private declarations, including all 62 required endpoints.
Only `propext`, `Classical.choice`, and `Quot.sound` occur. The pinned stock
checker replayed the exact frozen closure. The combined repository gate
and hosted validation remain separate pending checks.

See the [verification receipt](../../docs/verification/lean-kvz-20261121/receipt.json) and [formal theorem](../../lean/Conjectures/KVZGamma.lean).

## Files and verification

- [PROOF.md](PROOF.md) contains the complete proof, including the Wronskian criterion, translated domains, and integer rank.
- [NOVELTY.md](NOVELTY.md) records the exact source, related results, public-solution checks, and access limits.
- [verify.py](verify.py) is a standard-library exact rational diagnostic. Run `python results/kvz-gamma-quotient/verify.py` from the repository root.
- [Independent analysis audit](../../research/kvz-gamma-quotient/AUDIT-ANALYSIS.md) and [root audit](../../research/kvz-gamma-quotient/AUDIT-ROOT.md) record two separate internal reviews.

The verifier passes 115 exact rational checks. It verifies half-integer signs, integer rank cutoffs, and integer gamma-moment normalizations. As a small certificate for the order-three correction, at $`\delta=1/2`$ and $`x_i=y_i\in\{1/2,3/2,5/2\}`$, the determinant is $`5\pi^{3/2}/8192>0`$. Finite checks are supplementary to the general proof.

The target appears in Section 3, item 11 of [Karp–Vishnyakova–Zhang](https://arxiv.org/html/2408.01755v2), published in Results in Mathematics 80 (2025), 112, DOI [10.1007/s00025-025-02431-4](https://doi.org/10.1007/s00025-025-02431-4). No earlier complete resolution was found in the inspected sources. Internal reviews are complete; outside peer review is not claimed.

Coordination: [issue 97](https://github.com/1337isnot1337/solved-conjectures/issues/97).
