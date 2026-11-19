import Conjectures.LineSizeLatticeGaussian

/-!
# Reserving half of the lattice Gaussian

The slower Gaussian in this module leaves a factor available for Fourier
domination in the short-core region.
-/

noncomputable section

open Set MeasureTheory
open scoped Topology

namespace LineSize.Lattice

def halfGaussianEnvelope (C x : ℝ) : ℝ :=
  4 * C * Real.exp (1/2) * Real.exp (-x^2/8)

theorem abs_le_two_exp_eighth_sq (x : ℝ) : |x| ≤ 2 * Real.exp (x^2/8) := by
  calc
    |x| ≤ 2 * (x^2/8+1) := by nlinarith [sq_nonneg (|x|-2), sq_abs x]
    _ ≤ 2 * Real.exp (x^2/8) :=
      mul_le_mul_of_nonneg_left (Real.add_one_le_exp _) (by norm_num)

theorem half_gaussian_shift_bound {x y : ℝ} (hxy : |x-y| ≤ 1) :
    (1+|y|) * Real.exp (-y^2/2) ≤
      4 * Real.exp (1/2) * Real.exp (-x^2/8) := by
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
  have hexp : 1 ≤ Real.exp (x^2/8) := by
    have hs : 0 ≤ x^2/8 := by positivity
    linarith [Real.add_one_le_exp (x^2/8)]
  have hlinear : 1+|y| ≤ 4 * Real.exp (x^2/8) := by
    linarith [abs_le_two_exp_eighth_sq x]
  have hexpY : Real.exp (-y^2/2) ≤ Real.exp (1/2-x^2/4) :=
    Real.exp_le_exp.mpr (by linarith)
  calc
    (1+|y|) * Real.exp (-y^2/2) ≤
        (4 * Real.exp (x^2/8)) * Real.exp (1/2-x^2/4) :=
      mul_le_mul hlinear hexpY (Real.exp_pos _).le (by positivity)
    _ = 4 * Real.exp (x^2/8 + (1/2-x^2/4)) := by
      rw [Real.exp_add]
      ring
    _ = 4 * Real.exp (1/2) * Real.exp (-x^2/8) := by
      have he : x^2/8 + (1/2-x^2/4) = 1/2 + (-x^2/8) := by ring
      rw [he, Real.exp_add]
      ring

theorem halfGaussianEnvelope_nonneg {C : ℝ} (hC : 0 ≤ C) (x : ℝ) :
    0 ≤ halfGaussianEnvelope C x := by
  unfold halfGaussianEnvelope
  positivity

theorem integrable_halfGaussianEnvelope (C : ℝ) : Integrable (halfGaussianEnvelope C) := by
  have hi := (integrable_exp_neg_mul_sq (b := (1/8 : ℝ)) (by norm_num)).const_mul
    (4 * C * Real.exp (1/2))
  convert hi using 1
  funext x
  unfold halfGaussianEnvelope
  congr 2
  ring

theorem step_norm_le_halfGaussianEnvelope {h c C : ℝ} (hh : 0 < h) (hh1 : h ≤ 1)
    (hC : 0 ≤ C) (A : ℕ → ℂ)
    (hA : ∀ r : ℕ, ‖A r‖ ≤
      C * (1+|c+h*(r:ℝ)|) * Real.exp (-(c+h*(r:ℝ))^2/2)) (x : ℝ) :
    ‖step h c A x‖ ≤ halfGaussianEnvelope C x := by
  by_cases hx : x < c
  · rw [step_eq_zero_of_lt A hx, norm_zero]
    exact halfGaussianEnvelope_nonneg hC x
  · let n := ⌊(x-c)/h⌋₊
    let y := leftEndpoint h c x
    have hb := leftEndpoint_bounds hh (le_of_not_gt hx)
    have hxy : |x-y| ≤ 1 := by
      rw [abs_of_nonneg (by dsimp [y]; linarith [hb.1])]
      dsimp [y]
      linarith [hb.2]
    calc
      ‖step h c A x‖ = ‖A n‖ := by simp only [step, hx, ite_false, n]
      _ ≤ C * (1+|y|) * Real.exp (-y^2/2) := hA n
      _ = C * ((1+|y|) * Real.exp (-y^2/2)) := by ring
      _ ≤ C * (4 * Real.exp (1/2) * Real.exp (-x^2/8)) :=
        mul_le_mul_of_nonneg_left (half_gaussian_shift_bound hxy) hC
      _ = halfGaussianEnvelope C x := by unfold halfGaussianEnvelope; ring

theorem integrable_step_of_half_gaussian_bound {h c C : ℝ} (hh : 0 < h) (hh1 : h ≤ 1)
    (hC : 0 ≤ C) (A : ℕ → ℂ)
    (hA : ∀ r : ℕ, ‖A r‖ ≤
      C * (1+|c+h*(r:ℝ)|) * Real.exp (-(c+h*(r:ℝ))^2/2)) :
    Integrable (step h c A) := by
  apply (integrable_halfGaussianEnvelope C).mono' (measurable_step h c A).aestronglyMeasurable
  exact ae_of_all _ (step_norm_le_halfGaussianEnvelope hh hh1 hC A hA)

theorem summable_norm_of_half_gaussian_bound {h c C : ℝ} (hh : 0 < h) (hh1 : h ≤ 1)
    (hC : 0 ≤ C) (A : ℕ → ℂ)
    (hA : ∀ r : ℕ, ‖A r‖ ≤
      C * (1+|c+h*(r:ℝ)|) * Real.exp (-(c+h*(r:ℝ))^2/2)) :
    Summable (fun r : ℕ => ‖A r‖) :=
  summable_norm_of_integrable_step hh A
    (integrable_step_of_half_gaussian_bound hh hh1 hC A hA)

end LineSize.Lattice
