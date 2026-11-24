# Hajdu–Sárközy’s shifted-power perturbation conjecture

## Scope

The target is the existing entry `results/hajdu-sarkozy-shifted-power-perturbations/`, tracked by issue #416. The complete formalization treats every integer exponent `k ≥ 2`, every nonzero integral shift `c`, and every set whose symmetric-difference count from the positive values `m^k+c`, `m ≥ 1`, is `o(X^(1/k))`. Its conclusion excludes a product decomposition into two sets of positive integers each containing at least two distinct elements, including after any finite modification. The original conjecture's nonnegative-root convention, which adds the value `0^k+1 = 1`, is handled explicitly.

The Lean counting function `count S X` is the cardinality of the actual finite set of positive natural numbers in `S` that are at most the real number `X`. `Sparse k S` is Mathlib's `Asymptotics.IsLittleO` for that counting function and the real function `X ↦ X^(1/k)` along `atTop`. `HasNontrivialProduct` quantifies over arbitrary sets of positive natural numbers, with `Set.Nontrivial` for each factor. `TotallyMPrimitive` quantifies over every positive-integer set with finite symmetric difference from the original set. These definitions do not impose finiteness, a numerical cutoff, a fixed exponent, an ordering of the factors, or an unproved analytic hypothesis.

The final public endpoints are:

- `no_product_of_sparse_error`: no nontrivial product decomposition under the full general-shift error hypothesis.
- `shiftedPowerPerturbations`: the same result after every finite modification.
- `hajdu_sarkozy_conjecture`: the original Conjecture 1.2, with roots `m ≥ 0`, shift `c = 1`, all `k ≥ 2`, and total multiplicative primitivity.

The written proof also states a stronger supplement using only a little-oh count of added values together with a positive retained-count limsup. That weaker-hypothesis supplement is not separately formalized here. The complete scope claimed here is the original conjecture and the main symmetric-difference general-shift theorem. The stronger supplement is not an additional completed result.

## Recorded argument and attribution

The formalization follows [the existing repository proof at commit 83c325ae559864ec0b5e916d90a342b50a81de7f](https://github.com/1337isnot1337/solved-conjectures/blob/83c325ae559864ec0b5e916d90a342b50a81de7f/results/hajdu-sarkozy-shifted-power-perturbations/PROOF.md), committed by Cinna Davis on 24 November 2026 at 11:03:45 UTC. It uses the exact crossed-product determinant, thin geometric bins, incidence counting, the two fixed multiplication maps, and the sparse-factor contradiction recorded there.

The original proposers are Lajos Hajdu and András Sárközy. Their [*On multiplicative decompositions of polynomial sequences, III*](https://math.unideb.hu/sites/default/files/inline-files/poly3_revised.pdf), Acta Arithmetica 193 (2020), 193–216, states the target in Conjecture 1.2. Definition 1.6 specifies total m-primitivity. The paper's Section 6 already uses geometric bins in a smaller-error result.

C. H. Yip's [*Multiplicative irreducibility of small perturbations of the set of shifted k-th powers*](https://arxiv.org/abs/2501.16620), [Combinatorica 46 (2026), article 1](https://doi.org/10.1007/s00493-025-00193-9), proves the general nonzero-shift result for `k ≥ 3` in Theorem 1.3 and explicitly leaves the square case outside that argument. Its graph method and crossed-product gap inequality are prior components credited by the existing entry. The formalization does not assume Yip's theorem, an unformalized Diophantine finiteness statement, or a conjectural density result.

The existing entry reports a bounded priority search through 24 November 2026. This formalization preserves that uncertainty. It claims neither a new mathematical discovery nor a guarantee of priority for the documented argument.

## Proof structure

| Module | Verified mathematical role |
|---|---|
| `HajduSarkozyArithmetic` | Exact determinant and a gap between distinct integer powers for every exponent at least two; no four-cycle in a thin multiplicative rectangle. |
| `HajduSarkozyIncidence` | A finite four-cycle-free bipartite graph has at most `m²+n` edges, proved by an explicit injective encoding. |
| `HajduSarkozyAsymptotics` | Geometric prefix sums and double prefix sums preserve little-oh bounds; squared half-index sequences satisfy the required scale. |
| `HajduSarkozyCounts` | Actual real-threshold counting functions, the precise error condition, finite-error stability, and symmetric-difference transitivity. |
| `HajduSarkozyBins` | Actual finite geometric bins, coverage and unique indices, product-index bounds, and four-cycle exclusion in every relevant bin. |
| `HajduSarkozyMatrix` | The full triangular bin sum, with explicit injections for the quadratic and linear edge contributions. |
| `HajduSarkozyProduct` | Distinct actual products are covered by finite edge images; sparse factor bins force a sparse retained shifted-power count. |
| `HajduSarkozyCommon` | Two fixed distinct positive multipliers have only a linear number of common shifted-power neighbors along any geometric grid. |
| `HajduSarkozyDensity` | An injective family of actual values `m^k+c` supplies a positive proportion at the required root scale. |
| `HajduSarkozyFactors` | Actual error-map injections force both factor bin counts to be little-oh; scaling uses the exact real power function. |
| `HajduSarkozy` | The contradiction, every finite modification, and the original root-zero convention. |

The recorded proof uses the stronger incidence estimate `E ≤ m√n+n`. The Lean argument proves and uses the weaker elementary estimate `E ≤ m²+n`. This suffices because the smaller-side bin counts are themselves little-oh. For `i ≤ j` and `i+j ≤ L`, the quadratic contribution is embedded by `(i,j) ↦ (i+j,2i)` into a double prefix sum of `m_(⌊s/2⌋)^2`; the linear contribution is embedded by `(i,j) ↦ (i+j,j)` into a double prefix sum of `n_s`. Both sums are `o(q^L)`. Exchanging the factors handles the other triangle. This preserves the full sparse-factor conclusion without a logarithmic loss.

The graph is restricted to shifted-power products at least `2|c|`. Its four-cycle obstruction therefore applies in every thin-bin rectangle, even at small bin indices. The excluded product values contribute at most the fixed cutoff to the count of distinct products. No finite-screen result substitutes for the asymptotic theorem.

## Verification status

The frozen lane passed at 2026-11-24 17:30:33 UTC. [The original lane receipt](verification/lane/receipt.json) records successful fresh strict source builds of all eleven modules, the repository's complete all-owned/private transitive axiom audit, and exact stock-kernel replay of the eleven-module local closure. The audit includes 185 declarations, 157 theorems, zero private declarations, and twenty required public endpoints. Every transitive axiom is one of `propext`, `Classical.choice`, and `Quot.sound`. The exact eleven-module stock replay passed in 21.3 seconds. The source comprises 1,378 lines.

Receipt SHA-256: `198ef65047e16977e2f74e9e3b0eef2bc541a4321b0be91a206f7ad4d9aa0103`. The earlier interrupted source rebuild is preserved separately in [the interrupted source-build receipt](verification/interrupted-source-build/receipt.json) and is explicitly marked failed. It is not used as completion evidence. No repository-wide gate or publication status is inferred from these lane checks alone.

A publication sandbox startup attempt is retained in [the failed sandbox-startup receipt](verification/publication-environment-failure/receipt.json). It failed at `lean --version` because the sandbox had not mounted `/dev/urandom`; no proof source ran. The local sandbox wrapper was corrected to expose the device filesystem while keeping all dependency files read-only.

The [portable verifier](../../scripts/verify_hajdu_sarkozy.py) rebuilds exactly these eleven sources, checks their root/audit/kernel registrations, audits every owned declaration including private declarations, and replays the exact closure with the pinned stock checker. Source and audit elaboration use `-j2`; stock replay uses `LEAN_NUM_THREADS=1`. The [publication receipt](verification/receipt.json) binds the source, object, compiler, checker, verification-control, audit, inventory, and log hashes.

From the pinned Lean package and complete dependency installation, run:

```sh
cd lean
lake env python3 ../scripts/verify_hajdu_sarkozy.py
```

The [dedicated workflow](../../.github/workflows/lean-hajdu-sarkozy-shifted-power.yml) runs the same gate. All eleven modules and twenty required endpoints are also registered in the repository's aggregate gate. The [independent Lean review](LEAN_REVIEW.md) checks the complete statement and proof chain and separately validates the frozen lane evidence. The optional retained-limsup supplement remains unformalized.

Scoped verification does not assert an aggregate repository pass. The shared dependency-cache limitation and hosted/public-site obligations are tracked in [#563](https://github.com/1337isnot1337/solved-conjectures/issues/563) and the publication PR. Their results are reported separately from the completed mathematical and scoped Lean verification.
