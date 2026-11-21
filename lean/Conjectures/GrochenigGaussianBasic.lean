module

public import Mathlib.Analysis.SpecialFunctions.Gaussian.GaussianIntegral
public import Mathlib.Analysis.SpecialFunctions.ExpDeriv
public import Mathlib.Order.Filter.AtTopBot.Field
public import Mathlib.Order.Filter.AtTopBot.Ring
public import Mathlib.Tactic.FunProp
public import Mathlib.Tactic.Ring

/-!
# The Gaussian used in Gröchenig's zero-density problem

These are the literal real Gaussian and its complex extension. The elementary
bounds and decay lemmas are shared by the finite-block and infinite-series
construction. No total-positivity classification is assumed.
-/

@[expose] public section

namespace Grochenig

open Filter MeasureTheory
open scoped Topology

noncomputable section

def gaussian (x : ℝ) : ℝ := Real.exp (-Real.pi * x ^ 2)

theorem gaussian_eq (x : ℝ) : gaussian x = Real.exp (-Real.pi * x ^ 2) := by
  simp only [gaussian]

def gaussianComplex (z : ℂ) : ℂ := Complex.exp (-(Real.pi : ℂ) * z ^ 2)

theorem gaussianComplex_eq (z : ℂ) :
    gaussianComplex z = Complex.exp (-(Real.pi : ℂ) * z ^ 2) := by
  simp only [gaussianComplex]

theorem gaussian_pos (x : ℝ) : 0 < gaussian x := Real.exp_pos _

theorem gaussian_le_one (x : ℝ) : gaussian x ≤ 1 := by
  apply Real.exp_le_one_iff.mpr
  exact mul_nonpos_of_nonpos_of_nonneg (neg_nonpos.mpr Real.pi_pos.le) (sq_nonneg x)

@[simp] theorem gaussian_neg (x : ℝ) : gaussian (-x) = gaussian x := by
  simp only [gaussian, neg_sq]

@[simp] theorem abs_gaussian (x : ℝ) : |gaussian x| = gaussian x :=
  abs_of_pos (gaussian_pos x)

theorem gaussian_continuous : Continuous gaussian := by
  unfold gaussian
  fun_prop

theorem gaussian_tendsto_atTop : Tendsto gaussian atTop (𝓝 0) := by
  have hp : Tendsto (fun x : ℝ => Real.pi * x ^ 2) atTop atTop :=
    Tendsto.const_mul_atTop Real.pi_pos (tendsto_pow_atTop (by decide : 2 ≠ 0))
  have h := Real.tendsto_exp_atBot.comp (tendsto_neg_atTop_atBot.comp hp)
  change Tendsto (fun x : ℝ => Real.exp (-(Real.pi * x ^ 2))) atTop (𝓝 0) at h
  change Tendsto (fun x : ℝ => Real.exp (-Real.pi * x ^ 2)) atTop (𝓝 0)
  simpa only [neg_mul] using h

theorem gaussian_tendsto_atBot : Tendsto gaussian atBot (𝓝 0) := by
  have h := gaussian_tendsto_atTop.comp tendsto_neg_atBot_atTop
  change Tendsto (fun x : ℝ => gaussian (-x)) atBot (𝓝 0) at h
  simpa only [gaussian_neg] using h

theorem gaussian_integrable : Integrable gaussian :=
  integrable_exp_neg_mul_sq Real.pi_pos

theorem gaussianComplex_ofReal (x : ℝ) :
    gaussianComplex (x : ℂ) = (gaussian x : ℂ) := by
  rw [gaussianComplex, gaussian, ← Complex.ofReal_pow, ← Complex.ofReal_neg,
    ← Complex.ofReal_mul, ← Complex.ofReal_exp]

theorem differentiable_gaussianComplex : Differentiable ℂ gaussianComplex := by
  unfold gaussianComplex
  fun_prop

theorem norm_gaussianComplex (z : ℂ) :
    ‖gaussianComplex z‖ = Real.exp (Real.pi * z.im ^ 2) * gaussian z.re := by
  rw [gaussianComplex, Complex.norm_exp, gaussian, ← Real.exp_add]
  congr 1
  simp only [pow_two, Complex.mul_re, Complex.mul_im, Complex.neg_re,
    Complex.neg_im, Complex.ofReal_re, Complex.ofReal_im, neg_zero, zero_mul,
    sub_zero]
  ring

/-- The complex Gaussian translates have a common bound on each horizontal
strip, independently of the integer translate. -/
theorem norm_gaussianComplex_sub_int_le (z : ℂ) (k : ℤ) :
    ‖gaussianComplex (z - (k : ℂ))‖ ≤ Real.exp (Real.pi * z.im ^ 2) := by
  rw [norm_gaussianComplex]
  simp only [Complex.sub_im, Complex.intCast_im, sub_zero]
  exact mul_le_of_le_one_right (Real.exp_pos _).le (gaussian_le_one _)

end

end Grochenig
