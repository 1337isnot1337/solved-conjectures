module

public import Conjectures.PomeranceSarkozyGrowingGeometry
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Positivity
import Mathlib.Tactic.Ring

@[expose] public section
namespace PomeranceSarkozy

open Filter Topology

private theorem growing_crt_card_numerator_le_sqrt (M : ℕ → ℕ)
    (hM : ∀ᶠ X in atTop, (M X : ℝ) ≤ (psH X : ℝ) * psZ X) :
    ∀ᶠ X in atTop, ((4 * M X + 4 : ℕ) : ℝ) ^ (psR X + 1) ≤ Real.sqrt (X : ℝ) := by
  have hlog := Real.tendsto_log_atTop.comp (tendsto_natCast_atTop_atTop (R := ℝ))
  have hpoly := ((Real.isLittleO_pow_log_id_atTop (n := 4)).comp_tendsto hlog).bound
    (show (0 : ℝ) < 1 / 352 by norm_num)
  filter_upwards [hM, psL_tendsto.eventually_ge_atTop 2, eventually_ge_atTop (1 : ℕ), hpoly]
    with X hMX hL hX hpolyX
  have hX1 : (1 : ℝ) ≤ X := by exact_mod_cast hX
  have hX0 : (0 : ℝ) < X := by linarith
  have hlogX : 0 ≤ Real.log (X : ℝ) := Real.log_nonneg hX1
  have hL0 : 0 < psL X := by linarith
  have hL3 : 8 ≤ psL X ^ 3 := by
    simpa only [show (2 : ℝ) ^ (3 : ℕ) = 8 by norm_num] using
      pow_le_pow_left₀ (by norm_num : (0 : ℝ) ≤ 2) hL 3
  change ‖psL X ^ 4‖ ≤ (1 / 352 : ℝ) * ‖Real.log (X : ℝ)‖ at hpolyX
  simp only [Real.norm_eq_abs, abs_of_nonneg (pow_nonneg hL0.le _), abs_of_nonneg hlogX]
    at hpolyX
  have hH : (psH X : ℝ) ≤ 10 * psL X := Nat.floor_le (by positivity)
  have hZ : 1 ≤ psZ X := Real.one_le_rpow hX1 (by positivity)
  have hZ0 : 0 < psZ X := by linarith
  let B : ℝ := ((4 * M X + 4 : ℕ) : ℝ)
  have hB1 : 1 ≤ B := by
    unfold B
    exact_mod_cast (show 1 ≤ 4 * M X + 4 by omega)
  have hB0 : 0 < B := by linarith
  have hB : B ≤ (44 * psL X) * psZ X := by
    have hm := hMX.trans (mul_le_mul_of_nonneg_right hH hZ0.le)
    have hLZ : 1 ≤ psL X * psZ X := one_le_mul_of_one_le_of_one_le (by linarith) hZ
    dsimp [B]
    push_cast
    nlinarith only [hm, hLZ]
  have hlogZ : Real.log (psZ X) = (1 / psL X ^ 6) * Real.log (X : ℝ) :=
    Real.log_rpow hX0 _
  have hlogB : Real.log B ≤ 44 * psL X + (1 / psL X ^ 6) * Real.log (X : ℝ) := by
    calc
      Real.log B ≤ Real.log ((44 * psL X) * psZ X) := Real.log_le_log hB0 hB
      _ ≤ _ := by
        rw [Real.log_mul (by positivity : 44 * psL X ≠ 0) hZ0.ne', hlogZ]
        exact add_le_add (Real.log_le_self (by positivity : 0 ≤ 44 * psL X)) le_rfl
  have hr : ((psR X + 1 : ℕ) : ℝ) ≤ 2 * psL X ^ 3 := by
    have hr' : (psR X : ℝ) ≤ psL X ^ 3 := Nat.floor_le (pow_nonneg hL0.le _)
    rw [Nat.cast_add, Nat.cast_one]
    linarith
  have hcoeff : 2 / psL X ^ 3 ≤ (1 / 4 : ℝ) :=
    (div_le_iff₀ (pow_pos hL0 _)).mpr (by linarith)
  have hlogbound : Real.log (B ^ (psR X + 1)) ≤ (1 / 2) * Real.log (X : ℝ) := by
    rw [Real.log_pow]
    calc
      _ ≤ (2 * psL X ^ 3) * (44 * psL X + (1 / psL X ^ 6) * Real.log (X : ℝ)) :=
        mul_le_mul hr hlogB (Real.log_nonneg hB1) (by positivity)
      _ = 88 * psL X ^ 4 + (2 / psL X ^ 3) * Real.log (X : ℝ) := by
        field_simp
        ring
      _ ≤ (1 / 2) * Real.log (X : ℝ) := by
        have h := mul_le_mul_of_nonneg_right hcoeff hlogX
        linarith only [hpolyX, h]
  change B ^ (psR X + 1) ≤ Real.sqrt (X : ℝ)
  apply (Real.log_le_log_iff (by positivity) (Real.sqrt_pos.2 hX0)).mp
  rw [Real.sqrt_eq_rpow, Real.log_rpow hX0]
  exact hlogbound

/-- The CRT cardinality error vanishes with the growing offsets, prime cutoff and order. -/
theorem growing_crt_card_error_tendsto (M : ℕ → ℕ)
    (hM : ∀ᶠ X in atTop, (M X : ℝ) ≤ (psH X : ℝ) * psZ X) :
    Tendsto (fun X : ℕ => ((4 * M X + 4 : ℕ) : ℝ) ^ (psR X + 1) / (psLength X : ℝ))
      atTop (𝓝 0) := by
  have hsqrt : Tendsto (fun X : ℕ => Real.sqrt (X : ℝ)) atTop atTop := by
    simpa only [Real.sqrt_eq_rpow, Function.comp_def] using
      (tendsto_rpow_atTop (show (0 : ℝ) < 1 / 2 by norm_num)).comp
        (tendsto_natCast_atTop_atTop (R := ℝ))
  have hbound : Tendsto (fun X : ℕ => 2 * (Real.sqrt (X : ℝ))⁻¹) atTop (𝓝 0) := by
    simpa using (tendsto_const_nhds (x := (2 : ℝ))).mul hsqrt.inv_tendsto_atTop
  refine squeeze_zero' (Eventually.of_forall fun _ => by positivity) ?_ hbound
  filter_upwards [growing_crt_card_numerator_le_sqrt M hM, psLength_half_le,
    eventually_gt_atTop (0 : ℕ)] with X hnum hlength hX
  have hX0 : (0 : ℝ) < X := by exact_mod_cast hX
  have hlength0 : (0 : ℝ) < psLength X := (half_pos hX0).trans_le hlength
  calc
    _ ≤ Real.sqrt (X : ℝ) / (psLength X : ℝ) := div_le_div_of_nonneg_right hnum hlength0.le
    _ ≤ Real.sqrt (X : ℝ) / ((X : ℝ) / 2) :=
      div_le_div_of_nonneg_left (Real.sqrt_nonneg _) (half_pos hX0) hlength
    _ = _ := by rw [div_div_eq_mul_div, mul_comm, mul_div_assoc, Real.sqrt_div_self]

end PomeranceSarkozy
