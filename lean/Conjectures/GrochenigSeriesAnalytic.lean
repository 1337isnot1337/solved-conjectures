module

public import Conjectures.GrochenigGaussianBasic
public import Mathlib.Analysis.Complex.LocallyUniformLimit
public import Mathlib.Analysis.Normed.Group.FunctionSeries
public import Mathlib.Tactic.Linarith

/-!
# Entire Gaussian series with absolutely summable real coefficients

The complex translates have a common bound on every horizontal strip.
This gives the required locally uniform convergence directly from the
coefficient mass, independently of the locations of the nonzero coefficients.
-/

@[expose] public section

namespace Grochenig

open Set
open scoped Topology

theorem gaussian_shift_term_bound (c : ℤ → ℝ) (x : ℝ) (k : ℤ) :
    ‖c k * gaussian (x - (k : ℝ))‖ ≤ |c k| := by
  simpa only [norm_mul, Real.norm_eq_abs, abs_gaussian, mul_one] using
    mul_le_mul_of_nonneg_left (gaussian_le_one (x - (k : ℝ))) (abs_nonneg (c k))

theorem gaussian_shift_summable (c : ℤ → ℝ)
    (hc : Summable (fun k => |c k|)) (x : ℝ) :
    Summable (fun k : ℤ => c k * gaussian (x - (k : ℝ))) :=
  hc.of_norm_bounded (gaussian_shift_term_bound c x)

theorem gaussian_shift_tsum_bound (c : ℤ → ℝ)
    (hc : Summable (fun k => |c k|)) (x : ℝ) :
    |∑' k : ℤ, c k * gaussian (x - (k : ℝ))| ≤ ∑' k : ℤ, |c k| := by
  simpa only [Real.norm_eq_abs] using
    tsum_of_norm_bounded hc.hasSum (gaussian_shift_term_bound c x)

theorem gaussian_complex_shift_term_bound (c : ℤ → ℝ) (z : ℂ) (k : ℤ) :
    ‖(c k : ℂ) * gaussianComplex (z - (k : ℂ))‖ ≤
      |c k| * Real.exp (Real.pi * z.im ^ 2) := by
  rw [norm_mul, Complex.norm_real, Real.norm_eq_abs]
  exact mul_le_mul_of_nonneg_left (norm_gaussianComplex_sub_int_le z k) (abs_nonneg (c k))

theorem gaussian_complex_shift_summable (c : ℤ → ℝ)
    (hc : Summable (fun k => |c k|)) (z : ℂ) :
    Summable (fun k : ℤ => (c k : ℂ) * gaussianComplex (z - (k : ℂ))) :=
  (hc.mul_right (Real.exp (Real.pi * z.im ^ 2))).of_norm_bounded
    (gaussian_complex_shift_term_bound c z)

/-- The local strip bound proves complex differentiability everywhere.
No derivative series or additional decay condition is assumed. -/
theorem differentiable_gaussian_shift_tsum (c : ℤ → ℝ)
    (hc : Summable (fun k => |c k|)) :
    Differentiable ℂ (fun z : ℂ =>
      ∑' k : ℤ, (c k : ℂ) * gaussianComplex (z - (k : ℂ))) := by
  intro z
  let R : ℝ := |z.im| + 1
  let U : Set ℂ := {w | |w.im| < R}
  have hU : IsOpen U := isOpen_lt Complex.continuous_im.abs continuous_const
  have hz : z ∈ U := by
    dsimp [U, R]
    linarith
  have hu : Summable (fun k : ℤ => |c k| * Real.exp (Real.pi * R ^ 2)) :=
    hc.mul_right _
  have hf : ∀ k : ℤ, DifferentiableOn ℂ
      (fun w : ℂ => (c k : ℂ) * gaussianComplex (w - (k : ℂ))) U := by
    intro k
    exact ((differentiable_gaussianComplex.comp
      (differentiable_id.sub_const (k : ℂ))).const_mul (c k : ℂ)).differentiableOn
  have hbound : ∀ (k : ℤ) (w : ℂ), w ∈ U →
      ‖(c k : ℂ) * gaussianComplex (w - (k : ℂ))‖ ≤
        |c k| * Real.exp (Real.pi * R ^ 2) := by
    intro k w hw
    have hs : w.im ^ 2 ≤ R ^ 2 := by
      simpa only [sq_abs] using
        pow_le_pow_left₀ (abs_nonneg w.im) (show |w.im| ≤ R from hw.le) 2
    exact (gaussian_complex_shift_term_bound c w k).trans
      (mul_le_mul_of_nonneg_left
        (Real.exp_le_exp.mpr (mul_le_mul_of_nonneg_left hs Real.pi_pos.le))
        (abs_nonneg (c k)))
  exact (Complex.differentiableOn_tsum_of_summable_norm hu hf hU hbound).differentiableAt
    (hU.mem_nhds hz)

/-- Restriction of the literal complex shift sum to the real line. -/
theorem gaussian_shift_tsum_ofReal (c : ℤ → ℝ) (x : ℝ) :
    (∑' k : ℤ, (c k : ℂ) * gaussianComplex ((x : ℂ) - (k : ℂ))) =
      ((∑' k : ℤ, c k * gaussian (x - (k : ℝ)) : ℝ) : ℂ) := by
  calc
    _ = ∑' k : ℤ, ((c k * gaussian (x - (k : ℝ)) : ℝ) : ℂ) := by
      apply tsum_congr
      intro k
      rw [← Complex.ofReal_intCast k, ← Complex.ofReal_sub,
        gaussianComplex_ofReal, Complex.ofReal_mul]
    _ = _ := (Complex.ofReal_tsum _).symm

theorem continuous_gaussian_shift_tsum (c : ℤ → ℝ)
    (hc : Summable (fun k => |c k|)) :
    Continuous (fun x : ℝ => ∑' k : ℤ, c k * gaussian (x - (k : ℝ))) := by
  exact continuous_tsum
    (fun k => continuous_const.mul (gaussian_continuous.comp
      (continuous_id.sub continuous_const))) hc
    (fun k x => gaussian_shift_term_bound c x k)

end Grochenig
