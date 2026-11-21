import Mathlib.Analysis.Real.Pi.Bounds
import Mathlib.Analysis.SpecialFunctions.Integrals.Basic
import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Positivity
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Ring

namespace LopezPousoSegura

noncomputable def root : ℝ := 1 / Real.sqrt 3

theorem root_pos : 0 < root := by
  unfold root
  positivity

theorem root_square : root^2 = 1/3 := by
  have hs : (Real.sqrt 3)^2 = 3 := Real.sq_sqrt (by norm_num)
  have hn : Real.sqrt 3 ≠ 0 := by positivity
  unfold root
  field_simp
  nlinarith

theorem root_bound : (7 : ℝ)/4 > Real.sqrt 3 := by
  have hs : (Real.sqrt 3)^2 = 3 := Real.sq_sqrt (by norm_num)
  have hp := Real.sqrt_nonneg 3
  nlinarith

theorem pi_bound : Real.pi^2 / 75 < (1 : ℝ)/7 := by
  have hp := Real.pi_pos
  have hu := Real.pi_lt_d2
  nlinarith

theorem witness_inequality : Real.pi^2 / 75 < 2*root-1 := by
  have hs : (0 : ℝ) < Real.sqrt 3 := by positivity
  have hb := root_bound
  have hp := pi_bound
  have hfrac : (1 : ℝ)/7 < 2/Real.sqrt 3 - 1 := by
    apply (lt_sub_iff_add_lt).2
    apply (lt_div_iff₀ hs).2
    linarith
  unfold root
  simp only [div_eq_mul_inv, one_mul] at hfrac ⊢
  linarith

noncomputable def P2 (x : ℝ) : ℝ := (3*x^2-1)/2

noncomputable def gaussWeight (x : ℝ) : ℝ := 2 / ((1-x^2)*(3*x)^2)

noncomputable def lowerNode : ℝ := -root
noncomputable def upperNode : ℝ := root
noncomputable def lowerWeight : ℝ := gaussWeight lowerNode
noncomputable def upperWeight : ℝ := gaussWeight upperNode
noncomputable def zbarOne : ℝ := -1 + lowerWeight
noncomputable def zbarTwo : ℝ := zbarOne + upperWeight
noncomputable def zTwo : ℝ := (zbarOne+zbarTwo)/2
noncomputable def alphaOne : ℝ := -2*lowerNode*lowerWeight

theorem nodes_are_roots : P2 lowerNode = 0 ∧ P2 upperNode = 0 ∧ lowerNode < upperNode := by
  have hs := root_square
  have hp := root_pos
  simp only [P2, lowerNode, upperNode]
  constructor <;> [nlinarith; constructor <;> nlinarith]

theorem weights_are_one : lowerWeight = 1 ∧ upperWeight = 1 := by
  have hden : (1-root^2)*(3*root)^2 = 2 := by
    ring_nf
    rw [show root^4 = (root^2)^2 by ring, root_square]
    norm_num
  have hdenneg : (1-(-root)^2)*(3*(-root))^2 = 2 := by
    simpa only [neg_sq, mul_neg] using hden
  simp only [lowerWeight, upperWeight, gaussWeight, lowerNode, upperNode, hden, hdenneg]
  norm_num

theorem derived_values : zbarOne = 0 ∧ zTwo = 1/2 ∧ alphaOne = 2*root := by
  obtain ⟨hl, hu⟩ := weights_are_one
  simp [zbarOne, zbarTwo, zTwo, alphaOne, lowerNode, hl, hu]

theorem both_upper_bounds_fail :
    Real.pi^2 / (12*(5/2 : ℝ)^2) < upperNode / zTwo - 1 ∧
    Real.pi^2 / (12*(5/2 : ℝ)^2) < alphaOne / (1-zbarOne^2) - 1 := by
  obtain ⟨hbar, hz, ha⟩ := derived_values
  have hw := witness_inequality
  simp only [upperNode, hz, hbar, ha]
  norm_num at hw ⊢
  constructor <;> linarith

theorem all_roots (x : ℝ) : P2 x = 0 ↔ x = lowerNode ∨ x = upperNode := by
  have hs := root_square
  simp only [P2, lowerNode, upperNode]
  constructor
  · intro h
    have hf : (x-root)*(x+root) = 0 := by nlinarith
    rcases mul_eq_zero.mp hf with h1 | h2
    · right; linarith
    · left; linarith
  · rintro (rfl | rfl) <;> nlinarith

theorem quadrature_cubic_moments (a b c d : ℝ) :
    (a+b*lowerNode+c*lowerNode^2+d*lowerNode^3) * lowerWeight +
      (a+b*upperNode+c*upperNode^2+d*upperNode^3) * upperWeight =
      2*a+2*c/3 := by
  obtain ⟨hl, hu⟩ := weights_are_one
  have hs := root_square
  simp only [lowerNode, upperNode, hl, hu]
  ring_nf
  rw [root_square]
  ring

theorem quadrature_exact (a b c d : ℝ) :
    (∫ x in (-1:ℝ)..1, (a+b*x+c*x^2+d*x^3)) =
      (a+b*lowerNode+c*lowerNode^2+d*lowerNode^3) * lowerWeight +
      (a+b*upperNode+c*upperNode^2+d*upperNode^3) * upperWeight := by
  rw [quadrature_cubic_moments]
  have h1 : IntervalIntegrable (fun x : ℝ => a+b*x) MeasureTheory.volume (-1) 1 := by
    apply Continuous.intervalIntegrable
    fun_prop
  have h2 : IntervalIntegrable (fun x : ℝ => c*x^2) MeasureTheory.volume (-1) 1 := by
    apply Continuous.intervalIntegrable
    fun_prop
  have h3 : IntervalIntegrable (fun x : ℝ => a+b*x+c*x^2) MeasureTheory.volume (-1) 1 := h1.add h2
  have h4 : IntervalIntegrable (fun x : ℝ => d*x^3) MeasureTheory.volume (-1) 1 := by
    apply Continuous.intervalIntegrable
    fun_prop
  have h5 : IntervalIntegrable (fun x : ℝ => a) MeasureTheory.volume (-1) 1 := by
    apply Continuous.intervalIntegrable
    fun_prop
  have h6 : IntervalIntegrable (fun x : ℝ => b*x) MeasureTheory.volume (-1) 1 := by
    apply Continuous.intervalIntegrable
    fun_prop
  rw [intervalIntegral.integral_add h3 h4, intervalIntegral.integral_add h1 h2,
    intervalIntegral.integral_add h5 h6]
  have hb : (∫ x in (-1:ℝ)..1, b*x) = b * (∫ x in (-1:ℝ)..1, x) :=
    intervalIntegral.integral_const_mul b (fun x : ℝ => x)
  rw [hb, integral_id]
  norm_num [intervalIntegral.integral_const_mul, integral_pow]
  ring

end LopezPousoSegura
