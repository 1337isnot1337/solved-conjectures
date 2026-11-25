module

public import Conjectures.GesselZhuangPermutations
public import Conjectures.GesselZhuangStatisticsHistory
public import Conjectures.GesselZhuangHistoryGamma

/-!
# Gessel–Zhuang's pinnacle-set gamma-positivity conjecture

The literal all-permutation statements of Conjectures 7.3 and 7.2 in Ira
Gessel and Yan Zhuang, *Two-sided permutation statistics via symmetric
functions*, arXiv:2306.15785v3, Section 7.2.

The source size is `N`, with the explicit hypothesis `1 ≤ N`. Words contain
`0,…,N-1`; pinnacle values are shifted by one to give the source's labels
`1,…,N`. The statistic `wordInverseDescents` compares actual positions of
successive values, and `wordPeakCount` counts actual adjacent-triple peaks.
The weight is `X^(ides+1)` and the prescribed gamma center is `(N+1)/2`.

The proof follows the existing entry
`results/gessel-zhuang-pinnacle-gamma/PROOF.md`, Sections 1–3. The finite
history/permutation equivalence and both statistics are proved before the
sum is reindexed. No counting correspondence or root-preservation statement
is assumed. The zero-size convention and the different Conjecture 7.1 are
outside the asserted scope.

The recorded proof is credited to Cinna Davis and GPT-6.2 Astra. The entry's
credit to Fang's earlier path refinement and to the Savage–Visontai and
Chudnovsky–Seymour compatibility arguments is preserved. The formalization
does not strengthen the entry's stated uncertainty about worldwide priority.
-/

@[expose] public section

namespace GesselZhuang

open Polynomial
open scoped BigOperators

/-- Literal permutations of the source's size `N`, with zero-based entries. -/
abbrev SourcePermutation (N : ℕ) := {w : List ℕ // w.Perm (List.range N)}

noncomputable instance (N : ℕ) : Fintype (SourcePermutation N) :=
  Fintype.subtype (List.range N).permutations.toFinset
    (fun _ => by simp only [List.mem_toFinset, List.mem_permutations])

/-- The polynomial in Conjecture 7.3, for positive source size. -/
noncomputable def pinnaclePolynomial (N : ℕ) (S : Finset ℕ) : ℝ[X] :=
  ∑ w : SourcePermutation N,
    if wordPinnacles w.val = S then X ^ (wordInverseDescents w.val + 1) else 0

/-- The polynomial in Conjecture 7.2, with the literal number of peaks. -/
noncomputable def peakPolynomial (N k : ℕ) : ℝ[X] :=
  ∑ w : SourcePermutation N,
    if wordPeakCount w.val = k then X ^ (wordInverseDescents w.val + 1) else 0

theorem pinnaclePolynomial_succ_eq_history_sum (n : ℕ) (S : Finset ℕ) :
    pinnaclePolynomial (n + 1) S =
      ∑ H : ClosedHistory n,
        if H.1.downLabels = S then
          (X : ℝ[X]) ^ (History.inverseDescents H.1 H.2 + 1) else 0 := by
  classical
  unfold pinnaclePolynomial
  rw [← Equiv.sum_comp (closedHistoryPermutationEquiv n)
    (fun w : PermutationWord n =>
      if wordPinnacles w.val = S then (X : ℝ[X]) ^ (wordInverseDescents w.val + 1) else 0)]
  apply Finset.sum_congr rfl
  intro H _
  simp only [closedHistoryPermutationEquiv_apply, History.word_pinnacles,
    History.word_inverseDescents]

theorem peakPolynomial_succ_eq_history_sum (n k : ℕ) :
    peakPolynomial (n + 1) k =
      ∑ H : ClosedHistory n,
        if H.1.downLabels.card = k then
          (X : ℝ[X]) ^ (History.inverseDescents H.1 H.2 + 1) else 0 := by
  classical
  unfold peakPolynomial
  rw [← Equiv.sum_comp (closedHistoryPermutationEquiv n)
    (fun w : PermutationWord n =>
      if wordPeakCount w.val = k then (X : ℝ[X]) ^ (wordInverseDescents w.val + 1) else 0)]
  apply Finset.sum_congr rfl
  intro H _
  simp only [closedHistoryPermutationEquiv_apply, History.word_peakCount,
    History.word_inverseDescents]

/-- Gessel–Zhuang Conjecture 7.3 for every positive size and every pinnacle set. -/
theorem conjecture_7_3 (N : ℕ) (hN : 1 ≤ N) (S : Finset ℕ) :
    GammaPositive (N + 1) (pinnaclePolynomial N S) := by
  cases N with
  | zero => omega
  | succ n =>
      rw [pinnaclePolynomial_succ_eq_history_sum]
      exact history_set_sum_gammaPositive n S

/-- Gessel–Zhuang Conjecture 7.2 for every positive size and every peak count. -/
theorem conjecture_7_2 (N : ℕ) (hN : 1 ≤ N) (k : ℕ) :
    GammaPositive (N + 1) (peakPolynomial N k) := by
  cases N with
  | zero => omega
  | succ n =>
      rw [peakPolynomial_succ_eq_history_sum]
      exact history_count_sum_gammaPositive n k

/-- The explicit nonnegative expansion of the literal source polynomial. -/
theorem pinnacle_gamma_expansion (N : ℕ) (hN : 1 ≤ N) (S : Finset ℕ) :
    ∃ γ : ℕ → ℝ, (∀ j, 0 ≤ γ j) ∧
      pinnaclePolynomial N S =
        ∑ j ∈ Finset.range ((N + 1) / 2 + 1),
          C (γ j) * X ^ j * (1 + X) ^ (N + 1 - 2 * j) :=
  conjecture_7_3 N hN S

end GesselZhuang
