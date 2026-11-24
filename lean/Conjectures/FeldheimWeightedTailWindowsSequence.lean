import Mathlib.Analysis.SpecificLimits.Normed
import Mathlib.Analysis.SumOverResidueClass
import Mathlib.Topology.Algebra.InfiniteSum.Real
import Mathlib.Tactic

/-!
# Feldheim–Feldheim's weighted tail conjecture

The inverse-unit-increment selection in Section 3 of the recorded proof,
`results/feldheim-weighted-tail/PROOF.md`, commit
`2f800fa5191a1d747f126fa20f7e9c2b3730b085`, recorded by Cinna Davis.
The source credits the inverse-increment idea to N. D. Feldheim and
O. N. Feldheim, Lemma 2.7. This module is a component of the arbitrary-law
and arbitrary-positive-weight proof, not a separate completed conjecture.
-/

namespace Conjectures.FeldheimWeightedTail

open Filter Finset

theorem window_increment_not_summable {q : ℕ → ℝ} (hq : StrictMono q)
    (htop : Tendsto q atTop atTop) :
    ¬ Summable (fun n => q (n + 1) - q n) := by
  apply (not_summable_iff_tendsto_nat_atTop_of_nonneg
    (fun n => sub_nonneg.mpr (hq.monotone (by omega)))).mpr
  simp_rw [Finset.sum_range_sub]
  simpa only [sub_eq_add_neg] using
    tendsto_atTop_add_const_right atTop (-q 0) htop

/-- A decreasing divergent series cannot decay geometrically on every fixed-step block. -/
theorem window_exists_slow_increment {δ : ℕ → ℝ}
    (hδ : ∀ n, 0 ≤ δ n) (hmono : Antitone δ) (hdiv : ¬ Summable δ)
    {k : ℕ} (hk : 0 < k) {r : ℝ} (hr : r < 1) (N : ℕ) :
    ∃ n, N ≤ n ∧ r * δ n ≤ δ (n + k) := by
  by_contra h
  push Not at h
  let _ : NeZero k := ⟨by omega⟩
  have habs : ∀ n, |δ n| = δ n := fun n => abs_of_nonneg (hδ n)
  have hs : Summable (fun n : ℕ => δ (k * n + N)) := by
    apply summable_of_ratio_norm_eventually_le hr
    filter_upwards [] with n
    simp only [Real.norm_eq_abs, habs]
    have hn := (h (k * n + N) (by omega)).le
    have heq : k * (n + 1) + N = k * n + N + k := by ring
    rw [heq]
    exact hn
  have hind : Summable ({n : ℕ | (n : ZMod k) = (N : ZMod k)}.indicator δ) :=
    (summable_indicator_mod_iff_summable k N δ).mpr hs
  exact hdiv ((summable_indicator_mod_iff hmono (N : ZMod k)).mp hind)

theorem window_sum_increments (q : ℕ → ℝ) (n k : ℕ) :
    (∑ i ∈ range k, (q (n + i + 1) - q (n + i))) = q (n + k) - q n := by
  simpa only [Nat.add_zero, Nat.add_assoc] using
    (Finset.sum_range_sub (fun i => q (n + i)) k)

theorem window_increment_sum_upper {q : ℕ → ℝ}
    (hmono : Antitone (fun n => q (n + 1) - q n)) (n k : ℕ) :
    q (n + k) - q n ≤ (k : ℝ) * (q (n + 1) - q n) := by
  rw [← window_sum_increments]
  calc
    (∑ i ∈ range k, (q (n + i + 1) - q (n + i))) ≤
        ∑ _i ∈ range k, (q (n + 1) - q n) := by
      apply sum_le_sum
      intro i _
      exact hmono (by omega)
    _ = _ := by simp [mul_sub]

theorem window_increment_sum_lower {q : ℕ → ℝ}
    (hmono : Antitone (fun n => q (n + 1) - q n)) (n k : ℕ) :
    (k : ℝ) * (q (n + k) - q (n + k - 1)) ≤ q (n + k) - q n := by
  rw [← window_sum_increments]
  calc
    (k : ℝ) * (q (n + k) - q (n + k - 1)) =
        ∑ _i ∈ range k, (q (n + k) - q (n + k - 1)) := by simp [mul_sub]
    _ ≤ _ := by
      apply sum_le_sum
      intro i hi
      have hi' : i < k := mem_range.mp hi
      have hn : n + k - 1 + 1 = n + k := by omega
      simpa only [hn] using hmono (show n + i ≤ n + k - 1 by omega)

/-- The source's asymmetric inverse-level window fits around its middle level. -/
theorem window_exists_balanced_levels {q : ℕ → ℝ}
    (hq : StrictMono q) (htop : Tendsto q atTop atTop)
    (hmono : Antitone (fun n => q (n + 1) - q n))
    {j : ℕ} (hj : 1 ≤ j) (N : ℕ) :
    ∃ n, N ≤ n ∧
      q (n + j) - q n ≤ q (n + 2 * j + 1) - q (n + j) := by
  have hjpos : (0 : ℝ) < j := by exact_mod_cast (show 0 < j by omega)
  have hr : (j : ℝ) / (j + 1) < 1 := by
    apply (div_lt_one (by positivity)).mpr
    linarith
  obtain ⟨n, hn, hslow⟩ := window_exists_slow_increment
    (fun i => (sub_pos.mpr (hq (by omega))).le) hmono
    (window_increment_not_summable hq htop) (by omega : 0 < 2 * j) hr N
  refine ⟨n, hn, ?_⟩
  have hupper := window_increment_sum_upper hmono n j
  have hlower := window_increment_sum_lower hmono (n + j) (j + 1)
  have heq₁ : n + j + (j + 1) = n + 2 * j + 1 := by omega
  have heq₂ : n + j + (j + 1) - 1 = n + 2 * j := by omega
  rw [heq₂, heq₁] at hlower
  push_cast at hlower
  have hs : (j : ℝ) * (q (n + 1) - q n) ≤
      (j + 1) * (q (n + 2 * j + 1) - q (n + 2 * j)) := by
    have hs' : (j : ℝ) * (q (n + 1) - q n) / (j + 1) ≤
        q (n + 2 * j + 1) - q (n + 2 * j) := by
      convert hslow using 1
      ring
    nlinarith [(div_le_iff₀ (show (0 : ℝ) < j + 1 by positivity)).mp hs']
  linarith

end Conjectures.FeldheimWeightedTail
