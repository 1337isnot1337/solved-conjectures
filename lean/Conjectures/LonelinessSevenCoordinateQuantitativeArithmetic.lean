import Mathlib.Data.Real.Sqrt
import Mathlib.Tactic.GCongr
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Positivity

/-! Exact inequalities for the seven-coordinate large-norm reduction.
The six variables are actual squared tail Gram--Schmidt lengths when this
module is applied. Their product, the adjacent ratios, and the first
two-term prefix bound remain explicit in this arithmetic layer. -/

namespace Loneliness.SevenCoordinateCritical.Quantitative

noncomputable section

def kappa : ℝ := 42 ^ 5

def normCutoff : ℝ := 7 * 42 ^ 10

theorem kappa_pos : 0 < kappa := by norm_num [kappa]

theorem normCutoff_eq : normCutoff = 7 * kappa ^ 2 := by
  norm_num [normCutoff, kappa]

theorem normCutoff_pos : 0 < normCutoff := by norm_num [normCutoff]

/-- At the published norm cutoff the first tail square is already small.
Only the adjacent ratios and the determinant identity are used here. -/
theorem first_tail_small
    (V x₀ x₁ x₂ x₃ x₄ x₅ : ℝ)
    (hV : normCutoff ≤ V)
    (h₀ : 0 < x₀) (h₁ : 0 < x₁) (h₂ : 0 < x₂)
    (h₃ : 0 < x₃) (h₄ : 0 < x₄) (h₅ : 0 < x₅)
    (hr₀ : 3*x₀ ≤ 4*x₁) (hr₁ : 3*x₁ ≤ 4*x₂)
    (hr₂ : 3*x₂ ≤ 4*x₃) (hr₃ : 3*x₃ ≤ 4*x₄)
    (hr₄ : 3*x₄ ≤ 4*x₅)
    (hdet : V^2 * (x₀*x₁*x₂*x₃*x₄*x₅) = 1) :
    x₀ < 1 / 1764 := by
  by_contra h
  have hx₀ : (1 / 1764 : ℝ) ≤ x₀ := le_of_not_gt h
  have hx₁ : (1 / 2352 : ℝ) ≤ x₁ := by linarith
  have hx₂ : (1 / 3136 : ℝ) ≤ x₂ := by linarith
  have hx₃ : (3 / 12544 : ℝ) ≤ x₃ := by linarith
  have hx₄ : (9 / 50176 : ℝ) ≤ x₄ := by linarith
  have hx₅ : (27 / 200704 : ℝ) ≤ x₅ := by linarith
  have hp : (3 / 4 : ℝ)^15 / 1764^6 ≤ x₀*x₁*x₂*x₃*x₄*x₅ := by
    calc
      _ = (1 / 1764 : ℝ) * (1 / 2352) * (1 / 3136) *
          (3 / 12544) * (9 / 50176) * (27 / 200704) := by norm_num
      _ ≤ _ := by gcongr
  have hVsq : normCutoff^2 ≤ V^2 := by
    have hVpos := normCutoff_pos.trans_le hV
    nlinarith [normCutoff_pos]
  have hpV := mul_le_mul_of_nonneg_left hp (sq_nonneg V)
  have hpC := mul_le_mul_of_nonneg_left hVsq
    (by norm_num : (0 : ℝ) ≤ (3 / 4)^15 / 1764^6)
  have hn : (1 : ℝ) < ((3 / 4)^15 / 1764^6) * normCutoff^2 := by
    norm_num [normCutoff]
  nlinarith

/-- The first two-dimensional Gram determinant is less than half of the
paper's squared area bound. This spare factor supplies the rational gap. -/
theorem first_plane_area_small
    (V x₀ x₁ x₂ x₃ x₄ x₅ : ℝ)
    (hV : normCutoff ≤ V)
    (h₀ : 0 < x₀) (h₁ : 0 < x₁) (h₂ : 0 < x₂)
    (h₃ : 0 < x₃) (h₄ : 0 < x₄) (h₅ : 0 < x₅)
    (hr₀ : 3*x₀ ≤ 4*x₁) (hr₁ : 3*x₁ ≤ 4*x₂)
    (hr₂ : 3*x₂ ≤ 4*x₃) (hr₃ : 3*x₃ ≤ 4*x₄)
    (hr₄ : 3*x₄ ≤ 4*x₅)
    (hprefix : (1 / 441 : ℝ) ≤ x₀ + x₁)
    (hdet : V^2 * (x₀*x₁*x₂*x₃*x₄*x₅) = 1) :
    V^2 * x₀ < kappa^2 / 2 := by
  have hx₀ := first_tail_small V x₀ x₁ x₂ x₃ x₄ x₅ hV
    h₀ h₁ h₂ h₃ h₄ h₅ hr₀ hr₁ hr₂ hr₃ hr₄ hdet
  have hx₁ : (1 / 588 : ℝ) < x₁ := by linarith
  have hx₂ : (1 / 784 : ℝ) < x₂ := by linarith
  have hx₃ : (3 / 3136 : ℝ) < x₃ := by linarith
  have hx₄ : (9 / 12544 : ℝ) < x₄ := by linarith
  have hx₅ : (27 / 50176 : ℝ) < x₅ := by linarith
  have hp : (3 / 4 : ℝ)^10 / 588^5 < x₁*x₂*x₃*x₄*x₅ := by
    calc
      _ = (1 / 588 : ℝ) * (1 / 784) * (3 / 3136) *
          (9 / 12544) * (27 / 50176) := by norm_num
      _ < _ := by gcongr
  have hVpos := normCutoff_pos.trans_le hV
  have harea : 0 < V^2*x₀ := mul_pos (sq_pos_of_pos hVpos) h₀
  have hpA := mul_lt_mul_of_pos_left hp harea
  have hn : (1 : ℝ) < ((3 / 4)^10 / 588^5) * (kappa^2 / 2) := by
    norm_num [kappa]
  have hcoef : (0 : ℝ) < (3 / 4)^10 / 588^5 := by norm_num
  nlinarith

/-- The two distinct small-error requirements needed by the finite plane
argument follow from the area estimate and the full norm cutoff. -/
theorem area_error_bounds (V A x : ℝ)
    (hV : normCutoff ≤ V) (hA : 0 < A) (hx : 0 ≤ x)
    (harea : A^2 = V^2*x) (hsmall : A^2 < kappa^2/2) :
    14*A^2 < V ∧ A / (2*V) < 1 / (28*A) ∧
      (1 / 2 : ℝ) * Real.sqrt x < 1 / 1596 := by
  have hVpos := normCutoff_pos.trans_le hV
  have hcut : 14*A^2 < V := by
    rw [normCutoff_eq] at hV
    linarith
  have hgap : A / (2*V) < 1 / (28*A) := by
    apply (div_lt_div_iff₀ (by positivity : 0 < 2*V)
      (by positivity : 0 < 28*A)).mpr
    nlinarith
  have hVsq : normCutoff^2 ≤ V^2 := by
    nlinarith [normCutoff_pos]
  have hxsmall : x < (1 / 798 : ℝ)^2 := by
    by_contra hn
    have hxlower : (1 / 798 : ℝ)^2 ≤ x := le_of_not_gt hn
    have hm := mul_le_mul hVsq hxlower (by positivity : (0 : ℝ) ≤ (1 / 798)^2)
      (sq_nonneg V)
    have hnum : kappa^2 / 2 < normCutoff^2 * (1 / 798 : ℝ)^2 := by
      norm_num [kappa, normCutoff]
    nlinarith
  have hs := Real.sq_sqrt hx
  have hsnonneg := Real.sqrt_nonneg x
  refine ⟨hcut, hgap, ?_⟩
  nlinarith

theorem plane_value_bounds (V A x L W : ℝ)
    (hV : normCutoff ≤ V) (hA : 0 < A) (hx : 0 ≤ x)
    (harea : A^2 = V^2*x) (hsmall : A^2 < kappa^2/2)
    (hL : L < (1 / 7 : ℝ))
    (hW : W ≤ L + (1 / 2 : ℝ)*Real.sqrt x) :
    W < 1 / 7 + 1 / (28*A) ∧ W < 229 / 1596 ∧ W < 1 / 6 := by
  obtain ⟨_, hgap, hround⟩ := area_error_bounds V A x hV hA hx harea hsmall
  have hVpos := normCutoff_pos.trans_le hV
  have hs := Real.sq_sqrt hx
  have hsnonneg := Real.sqrt_nonneg x
  have hroot : V * Real.sqrt x = A := by
    have hnonneg : 0 ≤ V * Real.sqrt x := mul_nonneg hVpos.le hsnonneg
    have hsq : (V * Real.sqrt x)^2 = A^2 := by rw [mul_pow, hs, ← harea]
    nlinarith
  have herror : (1 / 2 : ℝ)*Real.sqrt x = A/(2*V) := by
    apply (eq_div_iff (by positivity : 2*V ≠ 0)).mpr
    nlinarith
  rw [← herror] at hgap
  refine ⟨by linarith, by linarith, by linarith⟩

end

end Loneliness.SevenCoordinateCritical.Quantitative
