module
public import Conjectures.PomeranceSarkozySourceSample
public import Conjectures.PomeranceSarkozyWindowWeakTransfer
import Mathlib.Analysis.SpecificLimits.Basic
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Linarith

@[expose] public section
namespace PomeranceSarkozy

open Filter MeasureTheory
open scoped Topology Classical

theorem sourceWindow_ceil_sqrt_fraction :
    Tendsto (fun X : ℕ ↦ (⌈Real.sqrt (X : ℝ)⌉₊ : ℝ) / X) atTop (𝓝 0) := by
  have hx : Tendsto (fun X : ℕ ↦ (X : ℝ)) atTop atTop := tendsto_natCast_atTop_atTop
  have hs := (Real.tendsto_sqrt_atTop.comp hx).inv_tendsto_atTop
  have hi := hx.inv_tendsto_atTop
  apply squeeze_zero' (Eventually.of_forall (fun _ ↦ by positivity))
    (g := fun X : ℕ ↦ (Real.sqrt (X : ℝ))⁻¹ + (X : ℝ)⁻¹)
  · filter_upwards [eventually_ge_atTop 1] with X hX
    have hXp : 0 < (X : ℝ) := by exact_mod_cast hX
    have hp := Real.sqrt_pos.2 hXp
    have he : Real.sqrt (X : ℝ) / X = (Real.sqrt (X : ℝ))⁻¹ := by
      field_simp
      nlinarith [Real.sq_sqrt hXp.le]
    calc
      _ ≤ (Real.sqrt (X : ℝ) + 1) / X :=
        div_le_div_of_nonneg_right (Nat.ceil_lt_add_one (Real.sqrt_nonneg _)).le hXp.le
      _ = _ := by rw [add_div, he, one_div]
  · simpa only [Function.comp_def, Pi.inv_apply, zero_add] using hs.add hi

/-- The uniform probabilities of any event on the full sample and the upper
window differ by at most the discarded fraction, uniformly in the event. -/
theorem sourceFullSample_window_error {X : ℕ} (hX : 0 < X) (A : Set ℕ) :
    |(sourceFullSample X : Measure ℕ).real A - (sourceWindowSample X : Measure ℕ).real A| ≤
      (⌈Real.sqrt (X : ℝ)⌉₊ : ℝ) / X := by
  rw [sourceFullSample_real hX, sourceWindowSample_real]
  let s := ⌈Real.sqrt (X : ℝ)⌉₊
  let N := X + 1 - s
  let U := (Finset.Icc 1 X).filter fun n ↦ n ∈ A
  let W := (Finset.Icc s X).filter fun n ↦ n ∈ A
  change |(U.card : ℝ) / X - (W.card : ℝ) / N| ≤ (s : ℝ) / X
  have hsX : s ≤ X := ceil_sqrt_le_nat X
  have hs : 0 < s := Nat.ceil_pos.mpr (Real.sqrt_pos.mpr (by exact_mod_cast hX))
  have hNX : N ≤ X := by dsimp [N]; omega
  have hN : 0 < N := by dsimp [N]; omega
  have hXs : X ≤ N + s := by dsimp [N]; omega
  have hWU : W ⊆ U := by
    intro n hn
    obtain ⟨hi, h⟩ := Finset.mem_filter.mp hn
    obtain ⟨hlo, hhi⟩ := Finset.mem_Icc.mp hi
    exact Finset.mem_filter.mpr ⟨Finset.mem_Icc.mpr ⟨hs.trans_le hlo, hhi⟩, h⟩
  have hwf := Finset.card_le_card hWU
  have hwN : W.card ≤ N := (Finset.card_filter_le ..).trans_eq (Nat.card_Icc ..)
  have hu : U ⊆ W ∪ Finset.range s := by
    intro n hn
    by_cases h : n < s
    · exact Finset.mem_union_right _ (Finset.mem_range.mpr h)
    · obtain ⟨hi, ha⟩ := Finset.mem_filter.mp hn
      exact Finset.mem_union_left _ (Finset.mem_filter.mpr
        ⟨Finset.mem_Icc.mpr ⟨le_of_not_gt h, (Finset.mem_Icc.mp hi).2⟩, ha⟩)
  have huw : U.card ≤ W.card + s := by
    simpa only [Finset.card_range] using
      (Finset.card_le_card hu).trans (Finset.card_union_le W (Finset.range s))
  have xp : 0 < (X : ℝ) := by exact_mod_cast hX
  have np : 0 < (N : ℝ) := by exact_mod_cast hN
  have nle : (N : ℝ) ≤ X := by exact_mod_cast hNX
  have xle : (X : ℝ) ≤ N + s := by exact_mod_cast hXs
  have wl : (W.card : ℝ) ≤ U.card := by exact_mod_cast hwf
  have wn : (W.card : ℝ) ≤ N := by exact_mod_cast hwN
  have ul : (U.card : ℝ) ≤ W.card + s := by exact_mod_cast huw
  rw [abs_le]
  constructor
  · apply (le_sub_iff_add_le).mpr
    rw [add_comm, ← le_sub_iff_add_le, sub_neg_eq_add, ← add_div]
    apply (div_le_div_iff₀ np xp).mpr
    calc
      (W.card : ℝ) * X = W.card * N + W.card * (X - N) := by ring
      _ ≤ U.card * N + N * (s : ℝ) := by
        gcongr
        linarith
      _ = (U.card + (s : ℝ)) * N := by ring
  · calc
      (U.card : ℝ) / X - W.card / N ≤ (W.card + (s : ℝ)) / X - W.card / X := by
        gcongr
      _ = _ := by ring

theorem sourceFullSample_window_event_error (A : ℕ → Set ℕ) :
    Tendsto (fun X ↦ (sourceFullSample X : Measure ℕ).real (A X) -
      (sourceWindowSample X : Measure ℕ).real (A X)) atTop (𝓝 0) := by
  rw [tendsto_zero_iff_norm_tendsto_zero]
  simp only [Real.norm_eq_abs]
  apply squeeze_zero' (Eventually.of_forall fun _ ↦ abs_nonneg _)
    _ sourceWindow_ceil_sqrt_fraction
  filter_upwards [eventually_ge_atTop 1] with X hX
  exact sourceFullSample_window_error hX (A X)

theorem sourceFullSample_weak_limit_of_window (f : ℕ → ℕ → ℝ) {Z : ProbabilityMeasure ℝ}
    (h : Tendsto (fun X ↦ (sourceWindowSample X).map (f X)) atTop (𝓝 Z)) :
    Tendsto (fun X ↦ (sourceFullSample X).map (f X)) atTop (𝓝 Z) := by
  apply weak_limit_of_event_error h
  intro A hA
  simpa only [measureReal_def, ProbabilityMeasure.map_apply' _ Measurable.of_discrete.aemeasurable hA]
    using sourceFullSample_window_event_error fun X ↦ f X ⁻¹' A

end PomeranceSarkozy
