module

public import Conjectures.PomeranceSarkozyGrowingCutoffs
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Positivity

@[expose] public section
namespace PomeranceSarkozy

open Filter Topology

@[simp] theorem psOffsets_card (X : ℕ) : (psOffsets X).card = psH X := by
  simp [psOffsets]

theorem psLength_half_le : ∀ᶠ X : ℕ in atTop, (X : ℝ) / 2 ≤ (psLength X : ℝ) := by
  filter_upwards [eventually_ge_atTop 4] with X hX
  have hx : (4 : ℝ) ≤ X := by exact_mod_cast hX
  have hs : Real.sqrt X ≤ (X : ℝ) / 2 := (Real.sqrt_le_left (by positivity)).2 (by
    nlinarith [mul_nonneg (by positivity : (0:ℝ) ≤ X) (sub_nonneg.mpr hx)])
  have hc := Nat.ceil_lt_add_one (Real.sqrt_nonneg (X : ℝ))
  have hle : psStart X ≤ X + 1 := by
    apply Nat.ceil_le.mpr
    push_cast
    linarith
  rw [psLength, Nat.cast_sub hle, Nat.cast_add_one]
  change _ ≤ _ - (⌈Real.sqrt (X : ℝ)⌉₊ : ℝ)
  linarith

theorem psH_le_psStart : ∀ᶠ X : ℕ in atTop, psH X ≤ psStart X := by
  have h := (isLittleO_log_rpow_atTop (by norm_num : (0 : ℝ) < 1 / 2)).bound
    (by norm_num : (0 : ℝ) < 1 / 10)
  filter_upwards [tendsto_natCast_atTop_atTop.eventually h,
    psL_tendsto.eventually_ge_atTop 0, eventually_ge_atTop 1] with X hx hL hX
  have hlog := Real.log_nonneg (show (1 : ℝ) ≤ X by exact_mod_cast hX)
  simp only [Real.norm_eq_abs, abs_of_nonneg hlog, ← Real.sqrt_eq_rpow,
    abs_of_nonneg (Real.sqrt_nonneg _)] at hx
  have h₁ := Real.log_le_self hlog
  have h₂ := Nat.floor_le (show 0 ≤ 10 * psL X by positivity)
  have h₃ := Nat.le_ceil (Real.sqrt (X : ℝ))
  change Real.log (Real.log X) ≤ Real.log X at h₁
  change psL X ≤ Real.log X at h₁
  exact_mod_cast (show (⌊10 * psL X⌋₊ : ℝ) ≤ (⌈Real.sqrt (X : ℝ)⌉₊ : ℝ) by linarith)

theorem psH_le_psY : ∀ᶠ X : ℕ in atTop, psH X ≤ psY X := by
  filter_upwards [psL_tendsto.eventually_ge_atTop 10] with X hx
  apply Nat.floor_mono
  have h : 10 * psL X ≤ psL X ^ 2 := by nlinarith [mul_nonneg (sub_nonneg.mpr hx) (by linarith : 0 ≤ psL X)]
  exact h.trans (pow_le_pow_right₀ (by linarith) (by norm_num : 2 ≤ 6))

theorem psPrimes_card_le (X : ℕ) : ((psPrimes X).card : ℝ) ≤ psZ X := by
  have h : (psPrimes X).card ≤ ⌊psZ X⌋₊ := by
    exact (Finset.card_le_card (Finset.filter_subset _ _)).trans (by simp)
  exact (Nat.cast_le.mpr h).trans (Nat.floor_le (Real.rpow_nonneg (by positivity) _))

/-- The categorical and Poisson replacement errors vanish at the specified prime cutoff. -/
theorem growing_replacement_error_tendsto :
    Tendsto (fun X : ℕ => 2 * ((psOffsets X).card : ℝ)^2 / (psY X : ℝ)) atTop (𝓝 0) := by
  apply squeeze_zero' (.of_forall fun X => by positivity) _
    (show Tendsto (fun X : ℕ => 200 / psL X) atTop (𝓝 0) from
      tendsto_const_nhds.div_atTop psL_tendsto)
  filter_upwards [psL_tendsto.eventually_ge_atTop 10] with X hx
  have hpos : 0 < psL X := by linarith
  have hH : (psH X : ℝ) ≤ 10 * psL X := Nat.floor_le (by positivity)
  have hc : (10:ℝ)^3 ≤ psL X ^ 3 := pow_le_pow_left₀ (by norm_num) hx 3
  have hf := Nat.lt_floor_add_one (psL X ^ 6)
  have hy : psL X ^ 3 ≤ (psY X : ℝ) := by
    change _ ≤ (⌊psL X ^ 6⌋₊ : ℝ)
    nlinarith [sq_nonneg (psL X ^ 3 - 1)]
  have hp : 0 < (psY X : ℝ) := lt_of_lt_of_le (pow_pos hpos _) hy
  rw [psOffsets_card, div_le_div_iff₀ hp hpos]
  have hb := mul_le_mul_of_nonneg_right
    (pow_le_pow_left₀ (by positivity : (0:ℝ) ≤ psH X) hH 2) hpos.le
  nlinarith

end PomeranceSarkozy
