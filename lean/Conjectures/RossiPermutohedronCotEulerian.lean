module

public import Conjectures.RossiPermutohedronRational
public import Mathlib.Analysis.Complex.UpperHalfPlane.Exp

@[expose] public section
namespace RossiPermutohedron
open Complex
open scoped UpperHalfPlane

local notation "UHP" => UpperHalfPlane.upperHalfPlaneSet

noncomputable def scaledCot (z : ℂ) : ℂ := (Real.pi:ℂ) * Complex.cot ((Real.pi:ℂ)*z)

theorem cotFrequency_ne_zero : cotFrequency ≠ 0 := by
  unfold cotFrequency
  exact mul_ne_zero (mul_ne_zero (by norm_num) (ofReal_ne_zero.mpr Real.pi_ne_zero)) I_ne_zero

theorem cotQ_norm_lt_one {z : ℂ} (hz : z∈UHP) : ‖cotQ z‖<1 :=
  UpperHalfPlane.norm_exp_two_pi_I_lt_one ⟨z,hz⟩

theorem cotQ_ne_one {z : ℂ} (hz : z∈UHP) : cotQ z≠1 := by
  have h := cotQ_norm_lt_one hz
  intro he
  rw [he,norm_one] at h
  exact (lt_irrefl 1 h)

theorem scaledCot_eq_rational {z : ℂ} (hz : z∈UHP) :
    scaledCot z = -((Real.pi:ℂ)*I) - cotFrequency*rationalEulerian 0 (cotQ z) := by
  have hq : 1-cotQ z≠0 := sub_ne_zero.mpr (cotQ_ne_one hz).symm
  rw [scaledCot,Complex.cot_pi_eq_exp_ratio,rationalEulerian_zero]
  change (Real.pi:ℂ)*((cotQ z+1)/(I*(1-cotQ z))) =
    -((Real.pi:ℂ)*I) - cotFrequency*(cotQ z/(1-cotQ z))
  unfold cotFrequency
  field_simp [I_ne_zero]
  linear_combination (1+cotQ z)*I_sq

theorem iteratedDerivWithin_cot_eulerian (n : ℕ) {z : ℂ} (hz : z∈UHP) :
    iteratedDerivWithin (n+1) scaledCot UHP z =
      -(cotFrequency^(n+2)*rationalEulerian (n+1) (cotQ z)) := by
  induction n generalizing z with
  | zero =>
    have hu : UniqueDiffWithinAt ℂ UHP z := UpperHalfPlane.isOpen_upperHalfPlaneSet.uniqueDiffOn z hz
    rw [iteratedDerivWithin_succ,iteratedDerivWithin_zero]
    have heq := derivWithin_congr (s := UHP) (x := z)
      (fun x hx => scaledCot_eq_rational hx) (scaledCot_eq_rational hz)
    rw [heq]
    have H := ((hasDerivAt_rationalEulerian_cotQ 0 z (cotQ_ne_one hz)).const_mul cotFrequency).const_sub
      (-((Real.pi:ℂ)*I))
    rw [H.hasDerivWithinAt.derivWithin hu]
    ring
  | succ n ih =>
    have hu : UniqueDiffWithinAt ℂ UHP z := UpperHalfPlane.isOpen_upperHalfPlaneSet.uniqueDiffOn z hz
    rw [iteratedDerivWithin_succ]
    have heq := derivWithin_congr (s := UHP) (x := z) (fun x hx => ih hx) (ih hz)
    rw [heq]
    have H := ((hasDerivAt_rationalEulerian_cotQ (n+1) z (cotQ_ne_one hz)).const_mul
      (cotFrequency^(n+2))).neg
    change derivWithin (-(fun x => cotFrequency^(n+2)*rationalEulerian (n+1) (cotQ x))) UHP z = _
    rw [H.hasDerivWithinAt.derivWithin hu]
    rw [show n+1+2=n+2+1 by omega,pow_succ]
    ring

end RossiPermutohedron
