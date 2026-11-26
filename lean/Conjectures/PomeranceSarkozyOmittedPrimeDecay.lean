module

public import Conjectures.PomeranceSarkozyGrowingCutoffs

@[expose] public section
namespace PomeranceSarkozy

open Filter Topology

noncomputable def psBandWidth (X : ℕ) : ℕ := ⌈(Real.log (psL X))^2⌉₊

/-- The omitted-prime band is negligible at the arithmetic fluctuation scale. -/
theorem psBandWidth_quarter :
    Tendsto (fun X => ((psBandWidth X : ℝ) + 1) / (psL X)^(1 / 4 : ℝ)) atTop (𝓝 0) := by
  have hquarter : (0 : ℝ) < 1 / 4 := by norm_num
  have hsquare : Tendsto (fun X => (Real.log (psL X))^2 / (psL X)^(1 / 4 : ℝ))
      atTop (𝓝 0) := by
    simpa only [Function.comp_def, Real.rpow_two] using
      ((isLittleO_log_rpow_rpow_atTop 2 hquarter).tendsto_div_nhds_zero).comp psL_tendsto
  have hconstant : Tendsto (fun X => 2 / (psL X)^(1 / 4 : ℝ)) atTop (𝓝 0) := by
    simpa only [Function.comp_def, Pi.inv_apply, div_eq_mul_inv, mul_zero] using
      (((tendsto_rpow_atTop hquarter).comp psL_tendsto).inv_tendsto_atTop).const_mul (2 : ℝ)
  have hupper := hsquare.add hconstant
  rw [add_zero] at hupper
  refine tendsto_of_tendsto_of_tendsto_of_le_of_le' tendsto_const_nhds hupper ?_ ?_
  · filter_upwards [psL_tendsto.eventually_ge_atTop 0] with X hX using by positivity
  · filter_upwards [psL_tendsto.eventually_ge_atTop 0] with X hX
    rw [← add_div]
    apply div_le_div_of_nonneg_right _ (Real.rpow_nonneg hX _)
    have hceil := Nat.ceil_lt_add_one (sq_nonneg (Real.log (psL X)))
    change (psBandWidth X : ℝ) < (Real.log (psL X))^2 + 1 at hceil
    linarith

private theorem factorial_le_scaled_exp (a : ℝ) (k : ℕ) (ha : 0 ≤ a) :
    a^k / (k.factorial : ℝ) ≤ Real.exp (2 * a - (k : ℝ) * Real.log 2) := by
  have hpow : a^k = ((2 : ℝ)⁻¹)^k * (2 * a)^k := by
    rw [← mul_pow]
    congr 1
    ring
  calc
    a^k / (k.factorial : ℝ) = ((2 : ℝ)⁻¹)^k * ((2 * a)^k / k.factorial) := by
      rw [hpow, mul_div_assoc]
    _ ≤ ((2 : ℝ)⁻¹)^k * Real.exp (2 * a) :=
      mul_le_mul_of_nonneg_left (Real.pow_div_factorial_le_exp (2 * a) (by positivity) k)
        (by positivity)
    _ = Real.exp (2 * a - (k : ℝ) * Real.log 2) := by
      rw [← Real.exp_log (by norm_num : 0 < (2 : ℝ)⁻¹), ← Real.exp_nat_mul, ← Real.exp_add,
        Real.log_inv]
      congr 1
      ring

/-- Summing the omitted-prime factorial bound over all offsets still gives a vanishing error. -/
theorem omitted_prime_factorial_decay (a : ℕ → ℝ) (ha : ∀ᶠ X in atTop, 0 ≤ a X)
    (hA : ∃ C : ℝ, ∀ᶠ X in atTop, a X ≤ C * Real.log (psL X)) :
    Tendsto (fun X => (psH X : ℝ) *
      (2 * (a X)^(psBandWidth X) / ((psBandWidth X).factorial : ℝ))) atTop (𝓝 0) := by
  obtain ⟨C, hC⟩ := hA
  let t (X : ℕ) := Real.log (psL X)
  have ht : Tendsto t atTop atTop := Real.tendsto_log_atTop.comp psL_tendsto
  have hbound := (Real.tendsto_exp_neg_atTop_nhds_zero.comp ht).const_mul (20 : ℝ)
  rw [mul_zero] at hbound
  have hlog2 : 0 < Real.log 2 := Real.log_pos (by norm_num)
  refine tendsto_of_tendsto_of_tendsto_of_le_of_le' tendsto_const_nhds hbound ?_ ?_
  · filter_upwards [ha] with X hX using by positivity
  · filter_upwards [ha, hC, psL_tendsto.eventually_ge_atTop 1,
      ht.eventually_ge_atTop (max 0 ((2 * C + 2) / Real.log 2))] with X hX hCX hLX htX
    have hL : 0 < psL X := zero_lt_one.trans_le hLX
    have ht0 : 0 ≤ t X := (le_max_left _ _).trans htX
    have hthreshold : 2 * C + 2 ≤ t X * Real.log 2 :=
      (div_le_iff₀ hlog2).mp ((le_max_right _ _).trans htX)
    have hceil : (t X)^2 ≤ (psBandWidth X : ℝ) := Nat.le_ceil _
    have hexponent : t X + (2 * a X - (psBandWidth X : ℝ) * Real.log 2) ≤ -t X := by
      have hm1 := mul_le_mul_of_nonneg_right hthreshold ht0
      have hm2 := mul_le_mul_of_nonneg_right hceil hlog2.le
      change a X ≤ C * t X at hCX
      nlinarith
    have hH : (psH X : ℝ) ≤ 10 * psL X := Nat.floor_le (by positivity)
    calc
      _ = ((psH X : ℝ) * 2) * ((a X)^(psBandWidth X) / (psBandWidth X).factorial) := by ring
      _ ≤ ((psH X : ℝ) * 2) * Real.exp (2 * a X - (psBandWidth X : ℝ) * Real.log 2) :=
        mul_le_mul_of_nonneg_left (factorial_le_scaled_exp (a X) (psBandWidth X) hX)
          (by positivity)
      _ ≤ (10 * psL X * 2) * Real.exp (2 * a X - (psBandWidth X : ℝ) * Real.log 2) := by
        gcongr
      _ = 20 * Real.exp (t X + (2 * a X - (psBandWidth X : ℝ) * Real.log 2)) := by
        rw [Real.exp_add, show Real.exp (t X) = psL X from Real.exp_log hL]
        ring
      _ ≤ 20 * Real.exp (-t X) :=
        mul_le_mul_of_nonneg_left (Real.exp_le_exp.mpr hexponent) (by norm_num)

end PomeranceSarkozy
