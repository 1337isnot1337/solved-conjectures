import Conjectures.LineSizeLatticeCells
import Mathlib.Analysis.SpecialFunctions.Gaussian.GaussianIntegral
import Mathlib.Tactic.NormNum

/-!
# A Gaussian bound independent of the shifted lattice

If the lattice coefficients are bounded by `C (1+|y|) exp(-y²)` at their
left endpoints, the associated step functions have a common integrable
majorant for all origins and all cell widths in `(0,1]`.
-/

noncomputable section

open Set MeasureTheory
open scoped Topology

namespace LineSize.Lattice

def gaussianEnvelope (C x : ℝ) : ℝ :=
  3 * C * Real.exp 1 * Real.exp (-x^2/4)

theorem abs_le_exp_quarter_sq (x : ℝ) : |x| ≤ Real.exp (x^2/4) := by
  calc
    |x| ≤ x^2/4 + 1 := by nlinarith [sq_nonneg (|x|-2), sq_abs x]
    _ ≤ Real.exp (x^2/4) := Real.add_one_le_exp _

theorem gaussian_shift_bound {x y : ℝ} (hxy : |x-y| ≤ 1) :
    (1+|y|) * Real.exp (-y^2) ≤
      3 * Real.exp 1 * Real.exp (-x^2/4) := by
  have hdiff : (x-y)^2 ≤ 1 := by
    have hs := pow_le_pow_left₀ (abs_nonneg (x-y)) hxy 2
    simpa only [sq_abs, one_pow] using hs
  have hsq : x^2/2-1 ≤ y^2 := by
    nlinarith [sq_nonneg (y-(x-y))]
  have hyabs : |y| ≤ |x|+1 := by
    calc
      |y| = |x-(x-y)| := by congr 1; ring
      _ ≤ |x|+|x-y| := abs_sub _ _
      _ ≤ |x|+1 := add_le_add_left hxy _
  have hexp : 1 ≤ Real.exp (x^2/4) := by
    have hs : 0 ≤ x^2/4 := by positivity
    linarith [Real.add_one_le_exp (x^2/4)]
  have hlinear : 1+|y| ≤ 3 * Real.exp (x^2/4) := by
    linarith [abs_le_exp_quarter_sq x]
  have hexpY : Real.exp (-y^2) ≤ Real.exp (1-x^2/2) :=
    Real.exp_le_exp.mpr (by linarith)
  calc
    (1+|y|) * Real.exp (-y^2) ≤
        (3 * Real.exp (x^2/4)) * Real.exp (1-x^2/2) :=
      mul_le_mul hlinear hexpY (Real.exp_pos _).le (by positivity)
    _ = 3 * Real.exp (x^2/4 + (1-x^2/2)) := by
      rw [Real.exp_add]
      ring
    _ = 3 * Real.exp 1 * Real.exp (-x^2/4) := by
      have he : x^2/4 + (1-x^2/2) = 1 + (-x^2/4) := by ring
      rw [he, Real.exp_add]
      ring

theorem gaussianEnvelope_nonneg {C : ℝ} (hC : 0 ≤ C) (x : ℝ) :
    0 ≤ gaussianEnvelope C x := by
  unfold gaussianEnvelope
  positivity

theorem integrable_gaussianEnvelope (C : ℝ) : Integrable (gaussianEnvelope C) := by
  have hi := (integrable_exp_neg_mul_sq (b := (1/4 : ℝ)) (by norm_num)).const_mul
    (3 * C * Real.exp 1)
  convert hi using 1
  funext x
  unfold gaussianEnvelope
  congr 2
  ring

theorem step_norm_le_gaussianEnvelope {h c C : ℝ} (hh : 0 < h) (hh1 : h ≤ 1)
    (hC : 0 ≤ C) (A : ℕ → ℂ)
    (hA : ∀ r : ℕ, ‖A r‖ ≤
      C * (1+|c+h*(r:ℝ)|) * Real.exp (-(c+h*(r:ℝ))^2)) (x : ℝ) :
    ‖step h c A x‖ ≤ gaussianEnvelope C x := by
  by_cases hx : x < c
  · rw [step_eq_zero_of_lt A hx, norm_zero]
    exact gaussianEnvelope_nonneg hC x
  · let n := ⌊(x-c)/h⌋₊
    let y := leftEndpoint h c x
    have hb := leftEndpoint_bounds hh (le_of_not_gt hx)
    have hxy : |x-y| ≤ 1 := by
      rw [abs_of_nonneg (by dsimp [y]; linarith [hb.1])]
      dsimp [y]
      linarith [hb.2]
    calc
      ‖step h c A x‖ = ‖A n‖ := by simp only [step, hx, ite_false, n]
      _ ≤ C * (1+|y|) * Real.exp (-y^2) := hA n
      _ = C * ((1+|y|) * Real.exp (-y^2)) := by ring
      _ ≤ C * (3 * Real.exp 1 * Real.exp (-x^2/4)) :=
        mul_le_mul_of_nonneg_left (gaussian_shift_bound hxy) hC
      _ = gaussianEnvelope C x := by unfold gaussianEnvelope; ring

theorem integrable_step_of_gaussian_bound {h c C : ℝ} (hh : 0 < h) (hh1 : h ≤ 1)
    (hC : 0 ≤ C) (A : ℕ → ℂ)
    (hA : ∀ r : ℕ, ‖A r‖ ≤
      C * (1+|c+h*(r:ℝ)|) * Real.exp (-(c+h*(r:ℝ))^2)) :
    Integrable (step h c A) := by
  apply (integrable_gaussianEnvelope C).mono' (measurable_step h c A).aestronglyMeasurable
  exact ae_of_all _ (step_norm_le_gaussianEnvelope hh hh1 hC A hA)

theorem summable_norm_of_gaussian_bound {h c C : ℝ} (hh : 0 < h) (hh1 : h ≤ 1)
    (hC : 0 ≤ C) (A : ℕ → ℂ)
    (hA : ∀ r : ℕ, ‖A r‖ ≤
      C * (1+|c+h*(r:ℝ)|) * Real.exp (-(c+h*(r:ℝ))^2)) :
    Summable (fun r : ℕ => ‖A r‖) :=
  summable_norm_of_integrable_step hh A
    (integrable_step_of_gaussian_bound hh hh1 hC A hA)

theorem integral_step_of_gaussian_bound {h c C : ℝ} (hh : 0 < h) (hh1 : h ≤ 1)
    (hC : 0 ≤ C) (A : ℕ → ℂ)
    (hA : ∀ r : ℕ, ‖A r‖ ≤
      C * (1+|c+h*(r:ℝ)|) * Real.exp (-(c+h*(r:ℝ))^2)) :
    (∫ x : ℝ, step h c A x) = (h : ℂ) * ∑' r : ℕ, A r :=
  integral_step hh A (summable_norm_of_gaussian_bound hh hh1 hC A hA)

end LineSize.Lattice
