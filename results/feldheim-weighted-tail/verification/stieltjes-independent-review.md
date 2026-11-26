# Feldheim–Feldheim’s weighted tail conjecture

Independent review of the three Stieltjes comparison modules, 24 November 2026. This review made no source edits and ran no Lean compiler or kernel checker.

## Verdict and exact scope

The mathematical and statement review passes. The three modules prove the precise inequality needed in §4, equation (9), of the recorded proof, including arbitrary atoms and singular continuous probability laws. They introduce no density, continuity of the distribution function from the left, or atomlessness hypothesis. This is a supporting component of the weighted-tail entry, not a completed conjecture or an additional count.

The endpoint `Conjectures.FeldheimWeightedTail.log_tail_increment_le_inverse_tail_integral` takes an actual probability measure μ on the real line, the assumption that `μ.real (Ioi x)` is positive for every real x, and arbitrary real a < b. It proves

```math
-\log S(b)+\log S(a)
\;\le\;\int_{(a,b]}\frac{1}{S(x)}\,d\mu(x),
\qquad S(x)=\mu((x,\infty)).
```

With the recorded proof's `f(x) = -log S(x)`, this is exactly its equation (9). Positivity of every finite upper tail follows for the full conjecture's nonnegative laws with unbounded support. The component itself does not require nonnegative support. It asserts an inequality; it does not replace the atom-safe comparison by an equality.

The reviewed recorded argument is `results/feldheim-weighted-tail/PROOF.md`, cited at commit `2f800fa5191a1d747f126fa20f7e9c2b3730b085`. The supplied `SOURCE_PROOF.md` is byte-identical to that entry in the current accepted publication checkout; its SHA-256 is `f597851e42f4df26b5706dd9969d889ee6dc7ebbb5bb4cf028074ce027278fa3`. The review relies on the explicit proof of equation (9), so the numbering of the older Feldheim–Feldheim auxiliary lemma is not an assumed input.

## Endpoint and partition checks

`stieltjesGrid a b N i = a + (b-a)i/N`. For positive N and a < b, its values are strictly increasing, begin at a and end at b. The source uses the cells `(grid i, grid (i+1)]` for i < N.

The cell-existence lemma covers every x in `(a,b]`. The uniqueness lemma proves that no x can belong to two cells: if i < j, the upper endpoint of cell i is at most the lower endpoint of cell j, which is excluded from cell j. This proves disjointness at partition boundaries without discarding atoms. A point at b is retained; a point at a is excluded, as required by the source integral.

The step function is a finite sum of indicators of those cells, each with the value of f at the cell's right endpoint. Its value at a point inside `(a,b]` is exactly the single corresponding right-endpoint value; it is zero outside `(a,b]`. Measurability and integrability follow from the finite indicator sum and finiteness of μ. The integral identity computes each cell's contribution using the actual real measure of that cell.

## Convergence and domination

For each fixed x in `(a,b]`, the proof chooses the unique cell at mesh size `N = n+1` and calls its right endpoint q_n. The cell inequalities give

```math
x \le q_n \le x+\frac{b-a}{n+1}.
```

Thus q_n tends to x within `[x,∞)`. Right continuity, rather than left continuity, is exactly what is needed. The argument also covers the case that x coincides with a grid point for infinitely many n. Outside `(a,b]`, all step functions and the target indicator are zero. The convergence is pointwise everywhere, so there is no ignored atom set.

For the inverse-tail function, the finite probability law gives

```math
S(x)=1-\mathop{\mathrm{cdf}}\nolimits_\mu(x).
```

Mathlib's right continuity of the CDF proves right continuity of S. The positive-tail assumption permits inversion at every point. Since S is nonincreasing, `1/S(x) ≤ 1/S(b)` for x ≤ b. The bound is finite and nonnegative, and its constant extension is integrable against the probability measure. The dominated convergence theorem is applied to the step functions on the whole real line, with the limit equal to the indicator of `(a,b]` times the inverse tail. It therefore yields exactly the required restricted Bochner integral. No global integrability of the inverse tail is assumed or needed.

The separate theorem `stieltjes_inverse_tail_integrableOn` proves integrability directly on `(a,b]` from the same bound and measurable monotonic tail. Thus the limiting integral is not using Lean's default value for a nonintegrable function.

## Tail difference and logarithmic telescoping

For a ≤ b, `(a,∞) \ (b,∞) = (a,b]`. The finite-measure difference theorem gives

```math
\mu((a,b])=S(a)-S(b).
```

This is the correct orientation for strict upper tails. In particular an atom at b contributes to the cell measure and is absent from the denominator S(b), exactly as in the recorded right-endpoint sum.

For positive u and v, the standard inequality `log(u/v) ≤ u/v-1` gives

```math
\log u-\log v\le (u-v)/v.
```

The proof applies this with u and v equal to the left and right strict-tail values of each cell. Summing the logarithmic differences telescopes from log S(a) to log S(b). The right-hand side is the exact integral of the step function. Every partition integral is therefore at least the desired log-tail increment. Passing to the proved limit preserves this inequality. The last algebraic step only rewrites the difference of the two negative logarithms.

All directions are correct. In particular, an atom generally makes the comparison strict; no Stieltjes equality is used.

## Frozen source hashes

| Module | SHA-256 |
|---|---|
| `Conjectures.FeldheimWeightedTailStieltjesGrid` | `7b527870c305271d19cd5d169a23eafd611df2b465397b09422c2831ee5f7304` |
| `Conjectures.FeldheimWeightedTailStieltjesLimit` | `520e3f5d137517e990cc5fd6f15ac286b9596b915e0dda9bb29ee0ddbfe7eddc` |
| `Conjectures.FeldheimWeightedTailStieltjes` | `d6e46e15e4ccfd1c7d8189594d1bf0f15071878687a557b7671aea1fee372c7b` |

## Verification evidence and its limits

The component receipt SHA-256 is `3acdd92a5715417a9b79b3ab97cb9edbff7c801bf1cba9146561742e95a39edc`. I rehashed all three current sources, matched each strict-build record to the root compile log and its separate JSON record, and checked exit code zero, warnings-as-errors, two-thread elaboration, and unchanged source hashes. All three source logs are empty, as recorded.

I regenerated `Audit.lean` from the current repository auditor and the receipt's exact module/required lists. It matches the stored audit byte for byte. Re-parsing and validating `all-owned.log` gives exactly three modules, 26 owned declarations, 24 theorems, zero private declarations, and four required endpoints. Every recorded transitive axiom is one of `propext`, `Classical.choice`, and `Quot.sound`. The local import closure is exactly these three project modules. The raw kernel log's replay set is exactly the same set, with the recorded successful terminator. The currently installed checker matches the repository's pinned checker hash.

The small component receipt does not contain historical object hashes or compiler/checker hashes. I do not claim to have revalidated hashes that were never recorded. The accompanying validation JSON records current object hashes only as observations, and labels this limitation explicitly. The integrated full weighted-tail gate must produce its own complete source/object/control binding. No new source build, axiom-audit execution, kernel replay, repository-wide verification, or complete conjecture count is claimed by this review.

The independent artifact validation is `stieltjes-independent-verification.json`, SHA-256 `decea38f2a1cf0b95b41dab3f63163e303cf05f6025bc1cba438aeeebf357937`.
