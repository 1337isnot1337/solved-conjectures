# Hajdu–Sárközy’s shifted-product total primitivity conjecture

The complete formalization proves the original conjecture for every pair of exponents greater than one. It also proves the recorded summable-family theorem and the stronger two-variable perturbation theorem for every nonzero integer shift. It uses thirteen new Lean modules and the eleven unchanged modules from the shifted-power perturbation formalization.

This is one existing conjecture entry. Fixed exponent pairs, the equal-exponent reduction, the summable-family theorem, and supporting lemmas are not counted as additional results. The source's optional last sentence about products of more than two variables is not separately formalized.

## Exact statements

For a set of natural numbers, `count S X` is the number of its members in the real interval from 1 through X. In particular, it counts distinct values, not representations. `Sparse k S` means that this actual counting function is little-o of the real function X raised to the reciprocal of k, as X tends to positive infinity.

`HasNontrivialProduct R` means that there are sets A and B of positive integers, each containing at least two distinct elements, for which R is exactly their product set. The factors may be infinite. `TotallyMPrimitive R` excludes such a decomposition for every positive-integer set T whose symmetric difference with R is finite. These definitions are reused unchanged from the verified perturbation development.

### Original conjecture

`originalProducts k l` is the set

```math
\{x^k y^\ell+1:x,y\in\mathbb N,\ x>0,\ y>0\}.
```

The theorem `Conjectures.HajduSarkozy.Products.hajdu_sarkozy_shifted_products_conjecture` states that this set is totally m-primitive for every k and l at least two. `original_finite_modification_not_product` exposes the same conclusion with the finite modification and the two arbitrary candidate factor sets as explicit arguments.

This is Conjecture 1 on printed page 198 of Hajdu and Sárközy's [2018 paper](https://www.impan.pl/shop/en/publication/transaction/download/product/112684). The paper's Definition 1.3 supplies the finite-modification convention. Its Remark 2 already covers the non-coprime exponent cases; its Problem 2′ highlights the remaining exponent-two family. The Lean theorem includes every exponent pair and does not substitute that highlighted family for the conjecture. Both roots are positive, matching the original paper.

### Nonzero shifts and perturbations

`shiftedProducts k l c` consists of the positive values of the integer expression x to the kth power times y to the lth power, plus c, with positive roots x and y. Restricting to positive values matters when c is negative.

The theorem `shifted_product_perturbations` states that for all k and l at least two, every nonzero integer c, and every set R,

```math
|(R\mathbin{\triangle}P)\cap[1,X]|
=o\!\left(X^{1/\min(k,\ell)}\right)
\quad\Longrightarrow\quad R\text{ is totally m-primitive},
```

where P is `shiftedProducts k l c`. The error condition is over all real thresholds. The conclusion includes every finite modification of R.

### Full summable-family theorem

For positive coefficients q, `scaledPowers k c q` is the set of positive values q times u to the kth power plus c, for positive u. `coefficientFamilyPowers k c Q` is their union over the coefficient set Q.

The theorem `summable_family` quantifies over every k at least two, every nonzero integer c, and every nonempty set Q of positive integers for which

```math
\sum_{q\in Q}q^{-1/k}<\infty.
```

Its assumptions on R are precisely

```math
|(R\setminus P)\cap[1,X]|=o(X^{1/k}),
\qquad
\limsup_{X\to\infty}
\frac{|R\cap P\cap[1,X]|}{X^{1/k}}>0.
```

The conclusion is `TotallyMPrimitive R`. The limsup is applied to the actual real-threshold quotient. The formal proof first establishes the stronger reusable contradiction that a nontrivial product with sparse added error must have sparse retained values. The positive-limsup assumption then contradicts convergence of the normalized retained count to zero.

The internal indexed-family representation permits coefficient zero as a disabled index. Its weight and value set are both empty or zero. `setCoefficients` assigns coefficient i when i belongs to Q and zero otherwise. `indexed_set_family_eq` and `setCoefficients_summable` prove the exact set and series bridges, so the endpoint is about an arbitrary coefficient set as in the source. No enumeration assumption or uniqueness of representations is imposed.

## Recorded argument and formal proof

The argument is the existing [PROOF.md](PROOF.md), recorded by Cinna Davis at [commit 83c325ae559864ec0b5e916d90a342b50a81de7f](https://github.com/1337isnot1337/solved-conjectures/blob/83c325ae559864ec0b5e916d90a342b50a81de7f/results/hajdu-sarkozy-shifted-products/PROOF.md). The formalization follows its mixed-coefficient obstruction, geometric interval decomposition, two fixed multiplication maps, finite coefficient head, and summable tail.

The mixed-coefficient arithmetic is essential. For two rows with fixed coefficients q and r, respectively, the four shifted products give the exact integer identity

```math
qr(s^k-t^k)=-c(a'-a)(b'-b).
```

The positive roots and the actual product cutoff give the hypotheses of the already verified scaled power-gap lemma. This excludes a thin four-cycle uniformly in both row coefficients. The proof includes k equal to two and either sign of c.

For each coefficient, the formalization selects a root for every value in the actual finite prefix. Equal selected roots force equal values. The resulting injection into a positive root interval proves the bound

```math
|P_q\cap[1,X]|\le (X+|c|)^{1/k}q^{-1/k}.
```

For the coefficient tail, it selects one representing coefficient index per actual value. The finite image of this selection supplies a finite union bound. Its total weight is at most the full nonnegative series tail. This handles arbitrarily many overlapping representations and introduces no additive cost per coefficient.

Fixing two distinct members of one factor gives a common-neighbor bound uniform in the two coefficients. A head of T indexed coefficients costs at most T squared times a linear function of the geometric interval index. Values outside the head map injectively, at either fixed multiplier, into added errors or the coefficient tail. The factor estimate fixes T first, lets the geometric index tend to infinity, and then lets the tail weight tend to zero. The multiplier-dependent constant does not depend on T. Exchanging the factors proves that both have little-o root growth.

For each fixed coefficient, thin geometric rectangles give a four-cycle-free bipartite graph. The formalization reuses the proved elementary estimate that the number of edges is at most the square of the first part's size plus the second part's size, together with its transpose. The already verified double-prefix summation shows that this estimate is sufficient for the retained-product little-o bound. This replaces the stronger square-root incidence estimate used in the written exposition. No unproved graph bound or analytic estimate is imported as a hypothesis.

Actual distinct products are covered by images of the finite bin-edge sets. A finite coefficient head is therefore little-o. The same uniform tail argument handles the remaining infinite family. `sparse_of_grid` then passes from the geometric grid to every real threshold using monotonicity of the actual counting function. Finite modifications preserve both sparse added error and non-sparse retention, completing the total-primitivity conclusion.

For unequal exponents, the indexed coefficients are the lth powers of the positive integers when k is smaller than l. Their weights form a shifted real p-series with exponent minus l divided by k, which is strictly below minus one. The required convergence is a theorem of Mathlib. Equal exponents reduce exactly to a single power using the product of the two positive roots. Exchanging the roots covers the opposite ordering. The subfamily obtained by setting one root to one supplies non-sparse retained values after a symmetric-difference perturbation.

## Lean modules

All new declarations are in the namespace `Conjectures.HajduSarkozy.Products`.

| Module | Role |
| --- | --- |
| `HajduSarkozyProductsArithmetic` | Mixed row coefficients and the exact thin four-cycle obstruction. |
| `HajduSarkozyProductsCounts` | Actual scaled-power values and the coefficient-weighted root count. |
| `HajduSarkozyProductsSeries` | Nonnegative series tails and the ordered two-limit argument. |
| `HajduSarkozyProductsTails` | Actual infinite coefficient unions and tail counting. |
| `HajduSarkozyProductsLimits` | All-real-threshold transfer, literal limsup, and finite modifications. |
| `HajduSarkozyProductsCommon` | Uniform mixed-coefficient common-neighbor bounds. |
| `HajduSarkozyProductsGrowth` | Scaled geometric tail bounds with cutoff-independent constants. |
| `HajduSarkozyProductsFactors` | Injective multiplier maps and both-factor sparsity. |
| `HajduSarkozyProductsBins` | Fixed-coefficient thin-bin incidence bound. |
| `HajduSarkozyProductsProduct` | Actual retained-product image cover and incidence summation. |
| `HajduSarkozyProductsFamily` | Full indexed and set-indexed summable-family theorems. |
| `HajduSarkozyProductsPowers` | P-series specialization and all-pair, all-shift perturbations. |
| `HajduSarkozyProducts` | Original positive-root conjecture and explicit finite-modification endpoint. |

The eleven unchanged dependency modules belong to the completed [shifted-power perturbation entry](../hajdu-sarkozy-shifted-power-perturbations/FORMALIZATION.md). They are reused, not counted again.

## Attribution and limits

The original proposers are L. Hajdu and A. Sárközy. The proof recorded in this repository is credited to Cinna Davis. The existing entry and its [written-proof audit](AUDIT.md) also credit Gyarmati's crossed-products method and Hajdu–Sárközy's earlier non-coprime cases and C. H. Yip's graph and geometric-bin methods for single shifted powers, [arXiv:2501.16620](https://arxiv.org/abs/2501.16620), published in Combinatorica 46 (2026), article 1. Yip's single-variable result is not treated as a resolution of the bivariate conjecture or as an unproved axiom.

The source's search through 24 November 2026 did not locate an earlier proof of the complete bivariate statement. That bounded search is preserved as a qualification, not a guarantee of priority.

The final informal observation about an arbitrary finite number of power factors would require an additional finite-product series bridge. It is not separately stated here and is not included in the completion claim. The original conjecture, the full two-variable perturbation theorem, and the full summable-family theorem are complete.

## Verification

The frozen formalization has 2,678 source lines in its complete twenty-four-module local import closure. Verification uses the repository's pinned Lean 4.35.0 toolchain, Mathlib manifest, complete all-owned/private axiom auditor, and stock kernel checker. Only `propext`, `Classical.choice`, and `Quot.sound` are allowed transitively. Source and audit elaboration use two threads; stock replay uses one thread. Dependencies are mounted read-only during the local gate, and all generated objects are isolated from the shared package cache.

The [full frozen proof receipt](verification/receipt.json) passed strict builds of all twenty-four modules, the complete all-owned/private transitive axiom audit, and exact stock-kernel replay. Its SHA-256 is `7e4fcf8ae68dbfdac616ec763d407ccd87db22693422ff620001b219ed586124`. The generated [declaration inventory](verification/declaration-inventory.json) records the complete audit counts. There are fifty-three required endpoints, including twenty reused dependency endpoints and thirty-three new endpoints. The [independent review](LEAN_REVIEW.md) checks the exact source scope, argument, frozen source hashes, and complete verification evidence.

The [portable verifier](../../scripts/verify_hajdu_sarkozy_products.py) performs the same full proof gate, with current root/audit/kernel registration checks and isolated outputs. From the pinned Lean package and complete dependency installation, run:

```sh
cd lean
lake env python3 ../scripts/verify_hajdu_sarkozy_products.py
```

The [dedicated workflow](../../.github/workflows/lean-hajdu-sarkozy-shifted-products.yml) runs that full command. All twenty-four modules and fifty-three required endpoints are registered in the aggregate package gate.

The [publication binding](verification/publication-binding.json) checks that the publication has exactly the same proof source hashes and local import closure as the successful frozen proof receipt. It separately checks the portable verifier's registrations, pinned checker, and control hashes. This registration preflight is not described as a second source rebuild, axiom audit, or kernel replay. The complete proof evidence is reused without changing any proof source.
 A scoped pass does not imply that the repository-wide aggregate gate or the hosted public deployment has passed. Those obligations remain separately tracked in [#563](https://github.com/1337isnot1337/solved-conjectures/issues/563).
