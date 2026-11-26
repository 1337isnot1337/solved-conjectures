module
public import Mathlib.Algebra.BigOperators.Ring.Finset
public import Mathlib.Basic.Real.Basic
import Mathlib.Tactic.FieldSimp

@[expose] public section
namespace CyrusianKaplan

open scoped BigOperators

/-- Homogeneous ray coordinates at height g are exactly positive
barycentric coordinates in the g-dilate of the simplex with
vertices A_i / w_i. No integer-coordinate or boundary case is
silently lost in this chart identity. -/
theorem positive_ray_coefficients_iff_barycentric {d m : ℕ}
    (A : Fin m → Fin d → ℝ) (w : Fin d → ℝ) (g : ℝ)
    (hw : ∀ i,0<w i) (hg : 0<g) (z : Fin m → ℝ) :
    (∃ x : Fin d → ℝ, (∀ i,0<x i) ∧
      (∑ i,w i*x i)=g ∧ ∀ j,z j=∑ i,A j i*x i) ↔
    (∃ u : Fin d → ℝ, (∀ i,0<u i) ∧
      (∑ i,u i)=1 ∧ ∀ j,z j=g*(∑ i,(A j i/w i)*u i)) := by
  constructor
  · rintro ⟨x,hx,hSum,hz⟩
    let u (i : Fin d) : ℝ := w i*x i/g
    have hU : (∑ i,u i)=1 := by
      unfold u
      simp only [div_eq_mul_inv]
      rw [← Finset.sum_mul,hSum,mul_inv_cancel₀ hg.ne']
    refine ⟨u,fun i => div_pos (mul_pos (hw i) (hx i)) hg,hU,fun j => ?_⟩
    rw [hz,Finset.mul_sum]
    apply Finset.sum_congr rfl
    intro i _
    unfold u
    field_simp [(hw i).ne',hg.ne']
  · rintro ⟨u,hu,hSum,hz⟩
    let x (i : Fin d) : ℝ := g*u i/w i
    have hX : (∑ i,w i*x i)=g := by
      calc
        _ = ∑ i,g*u i := by
          apply Finset.sum_congr rfl
          intro i _
          unfold x
          field_simp [(hw i).ne']
        _ = g := by rw [← Finset.mul_sum,hSum,mul_one]
    refine ⟨x,fun i => div_pos (mul_pos hg (hu i)) (hw i),hX,fun j => ?_⟩
    rw [hz,Finset.mul_sum]
    apply Finset.sum_congr rfl
    intro i _
    unfold x
    field_simp [(hw i).ne']

end CyrusianKaplan
