# Gessel–Zhuang’s pinnacle-set gamma-positivity conjecture

## Source and result

This formalization proves Conjectures 7.3 and 7.2 of Ira M. Gessel and Yan Zhuang, *Two-sided permutation statistics via symmetric functions*, [arXiv:2306.15785v3, Section 7.2](https://arxiv.org/html/2306.15785v3#S7.SS2), [published article](https://doi.org/10.1017/fms.2024.89). It follows Sections 1–3 of the existing repository entry `results/gessel-zhuang-pinnacle-gamma/PROOF.md`, published at commit `0db9cab29b0181685a2555f0e8f17cb9ac437fb8` through PR #412.

For every positive size `N` and every pinnacle set `S`, the literal polynomial

```math
\sum_{\pi\in\mathfrak S_N,\ \mathop{\mathrm{Pin}}(\pi)=S}
 t^{\mathop{\mathrm{ides}}(\pi)+1}
```

has a nonnegative real expansion in

```math
t^j(1+t)^{N+1-2j},\qquad 0\le j\le\lfloor(N+1)/2\rfloor.
```

The same conclusion holds when permutations are selected by their literal number of interior peaks. These are two source conjectures in one existing result entry and count as one completed formalization.

## Exact statement audit

| Source object | Formal object and checked meaning |
| --- | --- |
| Permutations of `1,…,N` | `SourcePermutation N` consists of all lists that are permutations of `List.range N`. Adding one to each entry gives the source labels. No pattern or other restriction is imposed. |
| Positive size | Both `conjecture_7_3` and `conjecture_7_2` have the explicit hypothesis `1 ≤ N`. The path parameter is one less than the source size; `HeightPath.start` represents size one. No size-zero convention is claimed. |
| Pinnacle set | `wordPinnacles` records the middle value plus one in every consecutive triple with a strict local maximum. `mem_wordPinnacles_iff` proves the literal adjacent-triple characterization. |
| Number of peaks | `wordPeakCount` counts those adjacent triples. Its equality to the cardinality of `wordPinnacles` is proved for lists with no repeated values, including every permutation word. |
| Inverse descents | `wordInverseDescents` counts `k` for which the actual list position of `k+1` is smaller than that of `k`. The range has exactly `N-1` comparisons for a size-`N` permutation. |
| Weight | The exponent is `wordInverseDescents + 1`, exactly as in the source. |
| Gamma center | `GammaPositive (N+1)` is the explicit nonnegative expansion with exponents `N+1-2*j`, hence center `(N+1)/2`. It allows zero outer coefficients. |
| Pinnacle-set scope | The theorem permits every finite set of natural numbers, so it includes every source set `S ⊆ [N]`; impossible sets contribute the zero polynomial. |
| Peak-count scope | The theorem permits every natural `k`; there is no upper-bound assumption that could omit a source case. |

The root source is `lean/Conjectures/GesselZhuangTheorem.lean`. Its principal endpoints are:

- `GesselZhuang.conjecture_7_3`;
- `GesselZhuang.conjecture_7_2`;
- `GesselZhuang.pinnacle_gamma_expansion`, which exposes the coefficients and basis directly.

## Proof audit

The internal gaps are represented by separators between nonempty blocks. Inserting the next maximum creates a singleton block, extends a block at either end, or joins two adjacent blocks around the maximum. All length, nonemptiness, permutation, and delete-maximum identities are proved on literal lists.

The history-to-word map is proved both injective and surjective. Injectivity follows from deleting the maximum and recovering its insertion choice. Surjectivity splits the block containing the maximum into the four exhaustive cases: singleton, left endpoint, right endpoint, and strict interior. `closedHistoryPermutationEquiv` is therefore an actual equivalence with all permutation words, not a supplied enumeration hypothesis.

The statistic lemmas prove that down-step labels are exactly the one-based pinnacle values. They also prove that insertion preserves every old inverse comparison and contributes exactly the new comparison with the previous maximum. The peak-count bridge uses the literal adjacent-triple statistic and the proved absence of repeated pinnacle values in permutation words.

The finite enumeration is then proved directly. `refinedPolynomial_eq_historyRefined` identifies every refined state polynomial with its sum over finite histories; `pathPolynomial_eq_historyPolynomial` identifies the complete path polynomial with its inverse-descent weighted history sum. Up, flat, and down transitions are established by finite-product sums and the precise reversed block-position inequalities.

For root preservation, the formalization reuses the existing unchanged `ChowCone` algebraic inequalities. New lemmas prove that a nonzero vector in this cone has a nonzero sum in the upper half-plane; every threshold transform and every adjacent-sum group remains nonzero. The overlap of adjacent groups is handled explicitly. Complex conjugation excludes lower-half-plane roots, and the fundamental theorem of algebra gives actual splitting over the reals.

Coefficient nonnegativity and the degree bound are proved inductively from the same recurrence. Reflection reverses the refined state index. This proves fixed-path symmetry at the prescribed center directly from the recurrence, with no assumed reversal formula or implicit replacement of the center by the ordinary degree.

The generic gamma theorem proves all factorization steps. It handles the zero polynomial and removes initial powers of `X`. Nonzero roots are negative. A root at `-1` gives a factor `1+X`; other roots occur in reciprocal pairs, giving

```math
(1+X)^2+(-r-r^{-1}-2)X
```

with a nonnegative second coefficient. The quotient's real splitting, coefficient nonnegativity, degree bound, and reflection identity are derived from the original polynomial, not assumed. Finite sums and the final multiplication by `X` preserve the required gamma expansion.

Finally, the source polynomials are reindexed through the proved history/permutation equivalence. Both statistic equalities and the history enumeration identity are used in the transfer. There is no remaining project-specific hypothesis in either conjecture endpoint beyond positive size and the freely quantified set or count.

## Verification receipt

The complete closure of `Conjectures.GesselZhuangTheorem` passed on **2026-11-24 at 17:30:16 UTC**:

- Fresh strict source compilation of all **25 project modules**, with `-DwarningAsError=true`.
- The unchanged repository all-owned audit over **641 declarations**, including **479 theorems** and **185 private declarations**.
- All **17 required endpoints**, including both source conjectures, the literal permutation equivalence, injectivity, surjectivity, both statistics, the finite enumeration, real splitting, and gamma factorization.
- The unchanged stock-kernel replay over the entire project import closure.
- Only the standard foundational axioms `propext`, `Classical.choice`, and `Quot.sound`; no `sorry`, `admit`, or unproved project-specific axiom.

The machine-readable [receipt](../../docs/verification/gessel-zhuang-20261124/receipt.json) records the complete target closure. It records every source hash, the pinned Lean version and manifest hash, the unchanged verification-script hashes, every command, exit code, and log. This is the complete target-closure gate; it does not claim that every unrelated module in the repository was rebuilt.

The final theorem-source SHA-256 is `6869d10a8386891e1dfe860078e78c71d4e4d2f73b44e645ea91ef61caa676d7`.

## Attribution and limits

Gessel and Zhuang are credited as the original proposers. The existing repository proof is credited to Cinna Davis and GPT-6.2 Astra, in the repository's stated order. The entry's credit to Fang's earlier unweighted path refinement and to Savage–Visontai and Chudnovsky–Seymour for the compatibility background is preserved. The formalization does not strengthen the entry's stated uncertainty about worldwide priority or claim external refereeing.

Conjecture 7.1 concerns a different inverse-peak statistic and is not asserted. Real-rootedness is proved for each fixed full path, not for the sum over all paths of a pinnacle set. The gamma-positivity conclusion for that sum follows from nonnegative coefficient addition. No finite numerical enumeration or external checker is used as a proof step.

## Repository integration

All new modules and the 17 required endpoints are registered in the repository build and axiom audit. The dedicated `lean-gessel-zhuang.yml` workflow repeats the target verification. The [unchanged exact path checker](check-path.py) was rerun through size nine; its [output](../../docs/verification/gessel-zhuang-20261124/supplementary-check.log) is supplementary and supplies no proof premise.

The full repository gate remains a separate open obligation. The latest [actual aggregate attempt](../../docs/verification/rowland-20261124/aggregate-attempt.json) failed while Lake tried to rebuild missing dependency artifacts in the protected shared cache, before the repository-wide audit. That failure is not a target-proof failure and is not reported as a repository-wide pass. Hosted aggregate checks and deployment are tracked in [issue #563](https://github.com/1337isnot1337/solved-conjectures/issues/563) and [issue #352](https://github.com/1337isnot1337/solved-conjectures/issues/352).
