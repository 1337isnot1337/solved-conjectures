module
public import Conjectures.PomeranceSarkozyBoundedCharacteristic
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Ring

@[expose] public section
namespace PomeranceSarkozy

open MeasureTheory Finset
open scoped BigOperators

theorem bounded_centered_charFun_normal_error (μ : Measure ℝ) [IsProbabilityMeasure μ]
    (θ M : ℝ) (hM : 0≤M) (hθ : |θ| * M≤1) (hθ' : |θ|≤1)
    (hBound : ∀ᵐ x ∂μ,|x|≤M) (hMean : ∫ x : ℝ,x ∂μ=0) :
    let V := ∫ x : ℝ,x^2 ∂μ
    ‖charFun μ θ-Complex.exp (↑(-(θ^2*V/2):ℝ):ℂ)‖≤
      (3*M+M^2)*|θ| ^3*V := by
  let V := ∫ x : ℝ,x^2 ∂μ
  let a := θ^2*V/2
  have hV : 0≤V := integral_nonneg (fun _=>sq_nonneg _)
  have hV' : V≤M^2 := by
    have h := integral_mono_of_nonneg (Filter.Eventually.of_forall (fun x : ℝ=>sq_nonneg x))
      (integrable_const (M^2)) (hBound.mono fun x hx=>by
        change x^2≤M^2
        rw [← sq_abs x]
        exact pow_le_pow_left₀ (abs_nonneg _) hx 2)
    simpa only [integral_const,probReal_univ,one_smul] using h
  have ha : 0≤a := by unfold a; positivity
  have hθsq : θ^2=|θ|^2 := (sq_abs θ).symm
  have ha' : a≤1 := by
    have h := pow_le_pow_left₀ (mul_nonneg (abs_nonneg θ) hM) hθ 2
    rw [mul_pow,sq_abs,one_pow] at h
    unfold a
    linarith [mul_le_mul_of_nonneg_left hV' (sq_nonneg θ)]
  have hEq : ‖(1-(a:ℂ))-Complex.exp ((-a:ℝ):ℂ)‖≤a^2 := by
    have h := Real.norm_exp_sub_one_sub_id_le (x:=-a) (by
      rw [Real.norm_eq_abs,abs_neg,abs_of_nonneg ha]; exact ha')
    rw [← norm_neg,neg_sub,← Complex.ofReal_exp,← Complex.ofReal_one,← Complex.ofReal_sub,
      ← Complex.ofReal_sub,Complex.norm_real,show Real.exp (-a)-(1-a)=Real.exp (-a)-1-(-a) by ring]
    simpa only [norm_neg,Real.norm_of_nonneg ha] using h
  have hAsq : a^2≤M^2*|θ| ^3*V := by
    have hV₂ : V^2≤M^2*V := by
      rw [pow_two]
      exact mul_le_mul_of_nonneg_right hV' hV
    have ht₄ : |θ| ^4≤|θ| ^3 := by
      rw [pow_succ]
      exact mul_le_of_le_one_right (by positivity) hθ'
    calc
      _ = |θ| ^4*V^2/4 := by unfold a; rw [hθsq]; ring
      _ ≤ |θ| ^4*V^2 := by linarith [show 0≤|θ| ^4*V^2 by positivity]
      _ ≤ |θ| ^3*(M^2*V) := mul_le_mul ht₄ hV₂ (sq_nonneg _) (by positivity)
      _ = _ := by ring
  change ‖charFun μ θ-Complex.exp ((-a:ℝ):ℂ)‖≤_
  calc
    _ ≤ ‖charFun μ θ-(1-(a:ℂ))‖+‖(1-(a:ℂ))-Complex.exp ((-a:ℝ):ℂ)‖ :=
      norm_sub_le_norm_sub_add_norm_sub _ _ _
    _ ≤ 3*M*|θ| ^3*V+a^2 :=
      add_le_add (bounded_centered_charFun_error μ θ M hM hθ hBound hMean) hEq
    _ ≤ _ := by linarith

end PomeranceSarkozy
