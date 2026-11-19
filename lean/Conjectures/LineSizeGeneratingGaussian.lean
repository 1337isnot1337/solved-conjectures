import Mathlib.Analysis.SpecificLimits.Normed
import Mathlib.Tactic.Ring
import Mathlib.Tactic.NormNum

/-! A geometric factor times a quadratic power is summable. This gives
the uniform majorant for the sum over core lengths. -/
noncomputable section
namespace LineSize.Generating

open Filter
open scoped Topology

def gaussianWeight (C R : ℝ) (n : ℕ) : ℝ := C^n*R^(n^2)

theorem gaussianWeight_nonneg (C R : ℝ) (hC : 0 ≤ C) (hR : 0 ≤ R) (n : ℕ) :
    0 ≤ gaussianWeight C R n :=
  mul_nonneg (pow_nonneg hC _) (pow_nonneg hR _)

theorem gaussianWeight_succ (C R : ℝ) (n : ℕ) :
    gaussianWeight C R (n+1)=gaussianWeight C R n*((C*R)*(R^2)^n) := by
  unfold gaussianWeight
  rw [pow_succ C n,show (n+1)^2=n^2+2*n+1 by ring,
    pow_add R (n^2+2*n) 1,pow_add R (n^2) (2*n),pow_mul R 2 n,pow_one]
  ring

theorem summable_gaussianWeight (C R : ℝ) (hC : 0 ≤ C) (hR : 0 ≤ R) (hR1 : R < 1) :
    Summable (gaussianWeight C R) := by
  have hR2 : R^2 < 1 := pow_lt_one₀ hR hR1 (by omega)
  have hpow : Tendsto (fun n : ℕ => (R^2)^n) atTop (𝓝 0) :=
    tendsto_pow_atTop_nhds_zero_of_lt_one (sq_nonneg R) hR2
  have hratio : Tendsto (fun n : ℕ => (C*R)*(R^2)^n) atTop (𝓝 0) := by
    simpa only [mul_zero] using hpow.const_mul (C*R)
  have hsmall : ∀ᶠ n : ℕ in atTop, (C*R)*(R^2)^n ≤ (1/2 : ℝ) :=
    hratio.eventually_le_const (by norm_num)
  apply summable_of_ratio_norm_eventually_le (r := (1/2 : ℝ)) (by norm_num)
  filter_upwards [hsmall] with n hn
  calc
    ‖gaussianWeight C R (n+1)‖ = gaussianWeight C R n*((C*R)*(R^2)^n) := by
      rw [Real.norm_eq_abs,abs_of_nonneg (gaussianWeight_nonneg C R hC hR (n+1)),
        gaussianWeight_succ]
    _ ≤ gaussianWeight C R n*(1/2) :=
      mul_le_mul_of_nonneg_left hn (gaussianWeight_nonneg C R hC hR n)
    _ = (1/2)*‖gaussianWeight C R n‖ := by
      rw [Real.norm_eq_abs,abs_of_nonneg (gaussianWeight_nonneg C R hC hR n)]
      ring

end LineSize.Generating
