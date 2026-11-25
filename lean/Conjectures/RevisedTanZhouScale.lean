import Conjectures.RevisedTanZhouStopping

/-!
# Quantitative favorable scales

A small power cutoff for the digits makes the exceptional Lebesgue measure
tend to zero while keeping the stopped cylinder denominator below `q`.
-/

open Filter Set MeasureTheory
open scoped Topology ENNReal

namespace RevisedTanZhou
noncomputable section

theorem eventually_power_dominates {a b : ℝ} (hab : a < b) (C : ℝ) :
    ∀ᶠ q : ℕ in atTop, C * (q : ℝ) ^ a < (q : ℝ) ^ b := by
  have h := (tendsto_rpow_atTop (sub_pos.mpr hab)).comp
    (tendsto_natCast_atTop_atTop (R := ℝ))
  filter_upwards [h.eventually (eventually_gt_atTop C), eventually_ge_atTop (1 : ℕ)] with q hq hq₁
  have hpos : (0 : ℝ) < q := by exact_mod_cast (show 0 < q by omega)
  apply (lt_div_iff₀ (Real.rpow_pos_of_pos hpos a)).mp
  rwa [← Real.rpow_sub hpos]

theorem eventually_small_power {v ε : ℝ} (hv : 0 < v) (hε : 0 < ε) :
    ∀ᶠ q : ℕ in atTop, (q : ℝ) ^ (-v) < ε :=
  ((tendsto_order.mp ((tendsto_rpow_neg_atTop hv).comp
    (tendsto_natCast_atTop_atTop (R := ℝ)))).2 ε hε)

theorem eventually_stopping_parameters {v ε : ℝ} (hv : 0 < v) (hv1 : v < 1)
    (hε : 0 < ε) (K : ℕ) :
    ∀ᶠ q : ℕ in atTop, ∃ N M : ℕ,
      volume (badPrefix N M) ≤ ENNReal.ofReal ε ∧
      (q : ℝ) ^ v < (2 : ℝ) ^ N ∧
      (((M : ℝ) + 2) ^ 2) ^ K ≤ (q : ℝ) ^ v ∧
      (q : ℝ) ^ v * ((M : ℝ) + 2) ^ 2 ≤ q := by
  let η := min (v / (4 * ((K : ℝ) + 1))) ((1 - v) / 4)
  have hη : 0 < η := lt_min (div_pos hv (by positivity)) (by linarith)
  have hηK : η * (2 * (K : ℝ)) < v := by
    have hη' : η ≤ v / (4 * ((K : ℝ) + 1)) := min_le_left _ _
    have h := (le_div_iff₀ (by positivity : 0 < 4 * ((K : ℝ) + 1))).mp hη'
    nlinarith [mul_nonneg hη.le (Nat.cast_nonneg (α := ℝ) K)]
  have hηv : v + 2 * η < 1 := by
    have h : η ≤ (1 - v) / 4 := min_le_right _ _
    linarith
  have hl := isLittleO_log_rpow_atTop (show 0 < η / 2 by linarith)
  have hlog2 := Real.log_pos (by norm_num : (1 : ℝ) < 2)
  have hlog := (tendsto_natCast_atTop_atTop (R := ℝ)).eventually
    (hl.bound (show 0 < Real.log 2 / 4 by positivity))
  have hlarge := ((tendsto_rpow_atTop (show 0 < η / 2 by linarith)).comp
    (tendsto_natCast_atTop_atTop (R := ℝ))).eventually (eventually_ge_atTop (2 : ℝ))
  filter_upwards [eventually_ge_atTop (1 : ℕ), eventually_small_power (show 0 < η / 2 by linarith) hε,
    hlog, hlarge, eventually_power_dominates hηK ((3 : ℝ) ^ (2 * K)),
    eventually_power_dominates hηv 9] with q hq he hlogq hqbig hK hvq
  let X := (q : ℝ) ^ (η / 2)
  let Y := (q : ℝ) ^ η
  let N := ⌊X⌋₊
  let M := ⌊Y⌋₊
  have hq1 : (1 : ℝ) ≤ (q : ℝ) := by exact_mod_cast hq
  have hq0 : 0 < (q : ℝ) := zero_lt_one.trans_le hq1
  have hX : 0 < X := Real.rpow_pos_of_pos hq0 _
  have hY : 0 < Y := Real.rpow_pos_of_pos hq0 _
  have hN_upper : (N : ℝ) ≤ X := Nat.floor_le hX.le
  have hN_lower : X < (N : ℝ) + 1 := Nat.lt_floor_add_one _
  have hM_upper : (M : ℝ) ≤ Y := Nat.floor_le hY.le
  have hM_lower : Y < (M : ℝ) + 1 := Nat.lt_floor_add_one _
  have hY1 : 1 ≤ Y := Real.one_le_rpow hq1 hη.le
  have hMb : (M : ℝ) + 2 ≤ 3 * Y := by linarith
  have hsq : ((M : ℝ) + 2) ^ 2 ≤ (3 * Y) ^ 2 := pow_le_pow_left₀ (by positivity) hMb _
  refine ⟨N, M, ?_, ?_, ?_, ?_⟩
  · apply (volume_badPrefix N M).trans (ENNReal.ofReal_le_ofReal _)
    calc
      _ ≤ X / Y := (div_le_div_of_nonneg_left (by positivity) hY hM_lower.le).trans'
        (div_le_div_of_nonneg_right hN_upper (by positivity))
      _ = (q : ℝ) ^ (-(η / 2)) := by
        dsimp [X, Y]
        rw [← Real.rpow_sub hq0]
        congr 1
        ring
      _ ≤ ε := he.le
  · have hlog0 : 0 ≤ Real.log (q : ℝ) := Real.log_nonneg hq1
    have hlogq' : Real.log (q : ℝ) ≤ Real.log 2 / 4 * X := by
      change ‖Real.log (q : ℝ)‖ ≤ Real.log 2 / 4 * ‖X‖ at hlogq
      simpa only [Function.comp_apply, Real.norm_eq_abs, abs_of_nonneg hlog0, abs_of_pos hX] using hlogq
    have hhalf : X / 2 ≤ (N : ℝ) := by change 2 ≤ X at hqbig; linarith
    have hh := mul_le_mul_of_nonneg_right hhalf hlog2.le
    have hstrict : Real.log 2 / 4 * X < (N : ℝ) * Real.log 2 := by
      nlinarith [mul_pos hlog2 hX]
    apply (Real.log_lt_log_iff (Real.rpow_pos_of_pos hq0 _) (by positivity)).mp
    rw [Real.log_rpow hq0, Real.log_pow]
    exact ((mul_le_of_le_one_left hlog0 hv1.le).trans hlogq').trans_lt hstrict
  · have hh := pow_le_pow_left₀ (by positivity : 0 ≤ ((M : ℝ) + 2) ^ 2) hsq K
    apply hh.trans
    have heq : ((3 * Y) ^ 2) ^ K = (3 : ℝ) ^ (2 * K) * (q : ℝ) ^ (η * (2 * (K : ℝ))) := by
      rw [← pow_mul, mul_pow]
      dsimp [Y]
      rw [← Real.rpow_natCast ((q : ℝ) ^ η) (2 * K), ← Real.rpow_mul hq0.le]
      push_cast
      rfl
    rw [heq]
    exact hK.le
  · apply (mul_le_mul_of_nonneg_left hsq (Real.rpow_nonneg hq0.le _)).trans
    have hh : (q : ℝ) ^ v * (3 * Y) ^ 2 = 9 * (q : ℝ) ^ (v + 2 * η) := by
      rw [mul_pow]
      have hYsq : Y ^ 2 = (q : ℝ) ^ (η * 2) := by
        dsimp [Y]
        rw [← Real.rpow_natCast, ← Real.rpow_mul hq0.le]
        norm_num
      rw [hYsq]
      calc
        _ = 9 * ((q : ℝ) ^ v * (q : ℝ) ^ (η * 2)) := by ring
        _ = _ := by rw [← Real.rpow_add hq0]; congr 2; ring
    rw [hh]
    exact hvq.le.trans_eq (Real.rpow_one _)

end
end RevisedTanZhou
