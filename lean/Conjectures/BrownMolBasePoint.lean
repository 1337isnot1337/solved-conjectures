import Mathlib.Analysis.Complex.Polynomial.Basic
import Mathlib.Analysis.SpecialFunctions.Complex.Log
import Mathlib.Tactic.Continuity
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Ring
import Mathlib.Tactic.Positivity

noncomputable section
namespace BrownBase

def f (t : ℝ) : ℝ := (t+1/4)^4+3*t-1/4

theorem f_continuous : Continuous f := by
  unfold f
  continuity

theorem exists_t : ∃ t : ℝ, 0 < t ∧ t < 1/12 ∧ f t = 0 := by
  have h0 : f 0 < 0 := by norm_num [f]
  have h1 : 0 < f (1/12) := by norm_num [f]
  have hmem : (0 : ℝ) ∈ Set.Icc (f 0) (f (1/12)) := ⟨h0.le,h1.le⟩
  obtain ⟨t,ht,hft⟩ := intermediate_value_Icc (show (0 : ℝ) ≤ 1/12 by norm_num)
    f_continuous.continuousOn hmem
  have ht0 : 0 < t := by
    by_contra hn
    have he : t = 0 := le_antisymm (le_of_not_gt hn) ht.1
    subst t
    linarith
  have ht1 : t < 1/12 := by
    by_contra hn
    have he : t = 1/12 := le_antisymm ht.2 (le_of_not_gt hn)
    subst t
    linarith
  exact ⟨t,ht0,ht1,hft⟩

def a (z : ℂ) : ℂ := 1+z*(1+z)^4
def b (z : ℂ) : ℂ := (1+z)^4+4
def aprime (z : ℂ) : ℂ := (1+z)^3*(1+5*z)
def point (t : ℝ) : ℂ := -(1/2 : ℂ) + (Real.sqrt t : ℂ)*Complex.I

theorem norm_identity (t : ℝ) (ht : 0 ≤ t) :
    Complex.normSq (a (point t)) - 1 = (t+1/4)*f t := by
  have hs : (Real.sqrt t)^2 = t := Real.sq_sqrt ht
  simp [a, point, Complex.normSq_apply, Complex.mul_re, Complex.mul_im,
    Complex.add_re, Complex.add_im, Complex.I_re, Complex.I_im, pow_succ]
  dsimp [f]
  rw [← hs]
  rw [Real.sqrt_sq (Real.sqrt_nonneg t)]
  ring

theorem point_normsq (t : ℝ) (ht : 0 ≤ t) :
    Complex.normSq (point t + (1/2 : ℂ)) = t := by
  simp [point, Complex.normSq_apply, Complex.mul_re, Complex.mul_im]
  nlinarith [Real.sq_sqrt ht]

theorem one_add_normsq (t : ℝ) (ht : 0 ≤ t) :
    Complex.normSq (1+point t) = t+1/4 := by
  simp [point, Complex.normSq_apply, Complex.add_re, Complex.add_im, Complex.mul_re, Complex.mul_im]
  nlinarith [Real.sq_sqrt ht]

theorem base_properties (t : ℝ) (ht0 : 0 < t) (ht1 : t < 1/12) (hf : f t = 0) :
    ‖a (point t)‖ = 1 ∧ aprime (point t) ≠ 0 ∧ b (point t) ≠ 0 ∧
      ‖point t + (1/2 : ℂ)‖ < 1/2 := by
  have ht : 0 ≤ t := ht0.le
  have hs : 0 < Real.sqrt t := Real.sqrt_pos.mpr ht0
  have hnormsq := norm_identity t ht
  rw [hf] at hnormsq
  simp only [mul_zero, sub_eq_zero] at hnormsq
  have hanorm : ‖a (point t)‖ = 1 := by
    rw [Complex.normSq_eq_norm_sq] at hnormsq
    have hn := norm_nonneg (a (point t))
    nlinarith
  have h1 : 1+point t ≠ 0 := by
    intro heq
    have hi := congrArg Complex.im heq
    simp [point, Complex.add_im, Complex.mul_im] at hi
    linarith
  have h2 : 1+5*point t ≠ 0 := by
    intro heq
    have hi := congrArg Complex.im heq
    simp [point, Complex.add_im, Complex.mul_im] at hi
    linarith
  have hprime : aprime (point t) ≠ 0 := mul_ne_zero (pow_ne_zero _ h1) h2
  have hone : ‖1+point t‖ < 1 := by
    have hsq := one_add_normsq t ht
    rw [Complex.normSq_eq_norm_sq] at hsq
    have hn := norm_nonneg (1+point t)
    nlinarith
  have hpow : ‖(1+point t)^4‖ < 1 := by
    rw [norm_pow]
    exact pow_lt_one₀ (norm_nonneg _) hone (by norm_num)
  have hb : b (point t) ≠ 0 := by
    intro heq
    have he : (1+point t)^4 = (-4 : ℂ) := by
      dsimp [b] at heq
      linear_combination heq
    rw [he] at hpow
    norm_num at hpow
  have hdisk : ‖point t + (1/2 : ℂ)‖ < 1/2 := by
    have hsq := point_normsq t ht
    rw [Complex.normSq_eq_norm_sq] at hsq
    have hn := norm_nonneg (point t + (1/2 : ℂ))
    nlinarith
  exact ⟨hanorm,hprime,hb,hdisk⟩

theorem exists_base : ∃ z : ℂ, ‖a z‖ = 1 ∧ aprime z ≠ 0 ∧ b z ≠ 0 ∧ ‖z+(1/2 : ℂ)‖ < 1/2 := by
  obtain ⟨t,ht0,ht1,hf⟩ := exists_t
  exact ⟨point t, base_properties t ht0 ht1 hf⟩

end BrownBase
end
