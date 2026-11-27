# Lean verification: Cioba–Savvas shutout number conjecture

[Lean entry module](../../lean/Conjectures/CiobaSavvasShutout.lean) · [Written proof](PROOF.md) · [Independent audit](AUDIT.md) · [Exact regression](verify.py)

The four-module closure proves the exponential shutout-number lower bounds for [Conjecture 3.2 and Conjecture 3.3 of Cioba–Savvas (2015)](https://michailsavvas.github.io/documents/Shutout.pdf) over arbitrary finite simple graphs `G : SimpleGraph V` (`[Fintype V] [DecidableEq V] [DecidableRel G.Adj]`), clearly distinguishing the immediate $`s`$-shutout winning condition $`\tau(s)`$ from the free $`s`$-star winning condition checked after Breaker's reply $`\sigma(s)`$:

- `Conjectures.CiobaSavvasShutout.breaker_wins_immediate_of_degree_cond` and `Conjectures.CiobaSavvasShutout.breaker_wins_freeStar_of_degree_cond`: for every $`s \ge 2`$ and every finite simple graph $`G`$ with $`D = \Delta(G) \ge 1`$ satisfying $`2^{1-s} \le D^D / (D+1)^{D+1}`$, Breaker has a winning strategy in the immediate $`s`$-shutout game and hence also prevents Maker from obtaining a free $`s`$-star.
- `Conjectures.CiobaSavvasShutout.breaker_wins_immediate_of_maxDegree_le`: via Bernoulli's inequality at $`x = 1/(2D)`$, for every $`s \ge 3`$ and every finite simple graph $`G`$ with $`\Delta(G) \le 2^{s-3}`$, Breaker prevents even an immediate $`s`$-shutout.
- `Conjectures.CiobaSavvasShutout.maxDegree_gt_of_makerWinsImmediate` and `Conjectures.CiobaSavvasShutout.maxDegree_ge_of_makerWinsFreeStar`: universal contrapositive bounds showing $`\Delta(G) > 2^{s-3}`$ whenever Maker forces an immediate $`s`$-shutout ($`s \ge 3`$), and $`8 \Delta(G) \ge 2^s`$ whenever Maker forces a free $`s`$-star ($`s \ge 1`$, including $`s = 1, 2`$).
- `Conjectures.CiobaSavvasShutout.shutout_numbers_ge_three` and `Conjectures.CiobaSavvasShutout.sigma_ge_two_pow_div_eight`: unconditional `ℕ∞` (`ENat`) infimum formulations `((2 ^ (s - 3) : ℕ) : ℕ∞) < tau s` with `tau s ≤ sigma s` for $`s \ge 3`$, and `((2 ^ s : ℕ) : ℕ∞) ≤ 8 * sigma s` for all $`s \ge 1`$.
- `Conjectures.CiobaSavvasShutout.shutout_numbers_nat_ge_three` and `Conjectures.CiobaSavvasShutout.sigmaNat_ge_two_pow_div_eight`: explicit `ℕ`-valued `sInf` bridges under nonemptiness of `FreeStarWinningDegrees s`.

The separate numerical Conjecture 3.4 is outside this result. Likewise, the published preliminaries of Cioba–Savvas (2015) — equivalence of local and global shutout numbers (Lemma 2.3) and finiteness of $`\sigma(s)`$ (Theorem 2.1) — are not reproved here; all universal theorems over finite simple graphs and the `ℕ∞` infimum bounds are proved unconditionally.

## Module structure

1. [CiobaSavvasShutoutDefs.lean](../../lean/Conjectures/CiobaSavvasShutoutDefs.lean) — literal Maker–Breaker shutout game definitions on finite `SimpleGraph V` (fuel-indexed alternating legal play, immediate shutout vs. free $`s`$-star after Breaker's reply, finite determinacy, graph-isomorphism invariance, `ENat`/`Nat` shutout numbers $`\tau(s)`$ and $`\sigma(s)`$), multivariate independence polynomial $`Q_U(z)`$, and Shearer risk region $`\mathcal{R}(G)`$.
2. [CiobaSavvasShutoutRiskRegion.lean](../../lean/Conjectures/CiobaSavvasShutoutRiskRegion.lean) — deletion recurrence $`Q_{U \cup \{v\}}(z) = Q_U(z) - z_v Q_{U \setminus N(v)}(z)`$, Fact 1 initialization ($`0 \le z_v \le x(1-x)^D \implies z \in \mathcal{R}(G)`$), monotonicity of $`R_v(U) = Q_{U \setminus N(v)}(z)/Q_U(z)`$, Fact 2 exact linear clique test, coordinatewise downward monotonicity, and the 2-clique virtual reply averaging lemma.
3. [CiobaSavvasShutoutStrategy.lean](../../lean/Conjectures/CiobaSavvasShutoutStrategy.lean) — live vertices, risk vector $`z_v = 2^{r_v - (s-1)}`$, safety invariant $`z \in \mathcal{R}(G) \implies r_v + 2 \le s`$, Breaker's local reply step across 0, 1, or 2 live endpoints (including free incident edge existence and extra risk reduction on live neighbors), and fuel induction covering even and odd board sizes.
4. [CiobaSavvasShutout.lean](../../lean/Conjectures/CiobaSavvasShutout.lean) — main degree-condition theorems, direct Bernoulli bound at $`x = 1/(2D)`$, universal degree lower bounds, and `ENat`/`Nat` shutout-number corollaries.

## Reproduce the scoped gate

After installing the pinned Mathlib cache, run from the repository root:

```sh
python3 scripts/verify_lean_target.py \
  --root Conjectures.CiobaSavvasShutout \
  --require Conjectures.CiobaSavvasShutout.breaker_wins_immediate_of_degree_cond \
  --require Conjectures.CiobaSavvasShutout.breaker_wins_freeStar_of_degree_cond \
  --require Conjectures.CiobaSavvasShutout.breaker_wins_immediate_of_maxDegree_le \
  --require Conjectures.CiobaSavvasShutout.maxDegree_gt_of_makerWinsImmediate \
  --require Conjectures.CiobaSavvasShutout.maxDegree_ge_of_makerWinsFreeStar \
  --require Conjectures.CiobaSavvasShutout.shutout_numbers_ge_three \
  --require Conjectures.CiobaSavvasShutout.sigma_ge_two_pow_div_eight \
  --require Conjectures.CiobaSavvasShutout.shutout_numbers_nat_ge_three \
  --require Conjectures.CiobaSavvasShutout.sigmaNat_ge_two_pow_div_eight \
  --out /tmp/cioba-savvas-shutout-check
```

The [receipt](verification/receipt.json) binds the strict build (`-j1 -DwarningAsError=true`), the all-owned axiom audit (288 declarations, 241 theorems, 54 private declarations, only `propext`, `Classical.choice`, `Quot.sound`), and independent stock kernel replay (`leanchecker`) to the exact proof source and tools. It does not certify the repository-wide gate.
