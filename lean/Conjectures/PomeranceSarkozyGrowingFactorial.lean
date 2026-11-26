module

public import Conjectures.PomeranceSarkozyGrowingCutoffs
public import Mathlib.Analysis.SpecificLimits.Basic

@[expose] public section
namespace PomeranceSarkozy

open Filter Topology

private theorem factorial_error_le_geometric {a : ℝ} {k : ℕ}
    (ha : 0 ≤ a) (hk : 0 < k) (hcontrol : 4 * a * Real.exp 1 ≤ (k : ℝ)) :
    ((2 : ℝ)^k + 1) * (2 * (a^k / (k.factorial : ℝ))) ≤ 4 * (1 / 2 : ℝ)^k := by
  have hkR : (0 : ℝ) < k := by exact_mod_cast hk
  have htwo : 1 ≤ (2 : ℝ)^k := one_le_pow₀ (by norm_num)
  have hbase : (2 * a / k) * Real.exp 1 ≤ (1 / 2 : ℝ) := by
    rw [div_mul_eq_mul_div, div_le_iff₀ hkR]
    linarith
  calc
    ((2 : ℝ)^k + 1) * (2 * (a^k / (k.factorial : ℝ)))
        ≤ (2 * (2 : ℝ)^k) * (2 * (a^k / (k.factorial : ℝ))) :=
          mul_le_mul_of_nonneg_right (by linarith) (by positivity)
    _ = 4 * ((2 * a)^k / (k.factorial : ℝ)) := by rw [mul_pow]; ring
    _ = 4 * ((2 * a / k)^k * ((k : ℝ)^k / k.factorial)) := by
      rw [div_pow]
      field_simp
    _ ≤ 4 * ((2 * a / k)^k * Real.exp k) := by
      exact mul_le_mul_of_nonneg_left
        (mul_le_mul_of_nonneg_left (Real.pow_div_factorial_le_exp k hkR.le k) (by positivity))
        (by norm_num)
    _ = 4 * (((2 * a / k) * Real.exp 1)^k) := by
      rw [mul_pow, ← Real.exp_nat_mul, mul_one]
    _ ≤ 4 * (1 / 2 : ℝ)^k :=
      mul_le_mul_of_nonneg_left (pow_le_pow_left₀ (by positivity) hbase _) (by norm_num)

/-- The factorial cutoff absorbs the combinatorial amplification for mean `O((log log X)²)`. -/
theorem growing_factorial_error_tendsto (a : ℕ → ℝ) (ha : ∀ᶠ X in atTop, 0 ≤ a X)
    (hA : ∃ C : ℝ, ∀ᶠ X in atTop, a X ≤ C * (psL X)^2) :
    Tendsto (fun X : ℕ => ((2 : ℝ)^(psR X + 1) + 1) *
      (2 * ((a X)^(psR X + 1) / ((psR X + 1).factorial : ℝ)))) atTop (𝓝 0) := by
  obtain ⟨C, hC⟩ := hA
  have hfloor (X : ℕ) : (psL X)^3 < ((psR X + 1 : ℕ) : ℝ) := by
    simpa [psR] using Nat.lt_floor_add_one ((psL X)^3)
  have hk : Tendsto (fun X => psR X + 1) atTop atTop := by
    refine tendsto_atTop.2 fun N => ?_
    filter_upwards [psL_tendsto.eventually_ge_atTop (max 1 (N : ℝ))] with X hX
    have hL : 1 ≤ psL X := (le_max_left _ _).trans hX
    have hN : (N : ℝ) ≤ psL X := (le_max_right _ _).trans hX
    exact_mod_cast hN.trans ((le_self_pow₀ hL (by decide : (3 : ℕ) ≠ 0)).trans (hfloor X).le)
  have hgeo := ((tendsto_pow_atTop_nhds_zero_of_lt_one (show (0 : ℝ) ≤ 1 / 2 by norm_num)
    (by norm_num : (1 / 2 : ℝ) < 1)).comp hk).const_mul (4 : ℝ)
  rw [mul_zero] at hgeo
  refine tendsto_of_tendsto_of_tendsto_of_le_of_le' tendsto_const_nhds hgeo ?_ ?_
  · filter_upwards [ha] with X hX using by positivity
  · filter_upwards [ha, hC, psL_tendsto.eventually_ge_atTop (4 * C * Real.exp 1)]
      with X hX hCX hL
    apply factorial_error_le_geometric hX (Nat.succ_pos _)
    calc
      4 * a X * Real.exp 1 ≤ 4 * (C * (psL X)^2) * Real.exp 1 :=
        mul_le_mul_of_nonneg_right (mul_le_mul_of_nonneg_left hCX (by norm_num))
          (Real.exp_pos _).le
      _ = (4 * C * Real.exp 1) * (psL X)^2 := by ring
      _ ≤ psL X * (psL X)^2 := mul_le_mul_of_nonneg_right hL (sq_nonneg _)
      _ = (psL X)^3 := by ring
      _ ≤ ((psR X + 1 : ℕ) : ℝ) := (hfloor X).le

end PomeranceSarkozy
