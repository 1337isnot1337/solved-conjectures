module
public import Mathlib.LinearAlgebra.AffineSpace.Independent
public import Mathlib.Algebra.BigOperators.Fin
public import Mathlib.Basic.Real.Basic
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Ring

@[expose] public section
namespace CyrusianKaplan
open Set

/-- Positive barycentric coordinates, using the finite vertex family
itself rather than an ambient convex-hull description. -/
def openBarycentricSimplex {E : Type*} [AddCommGroup E] [Module ℝ E]
    {n : ℕ} (v : Fin n→E) : Set E :=
  {p | ∃ a : Fin n→ℝ, (∀ i,0<a i) ∧ (∑ i,a i)=1 ∧ (∑ i,a i • v i)=p}

theorem openBarycentricSimplex_singleton {E : Type*} [AddCommGroup E] [Module ℝ E]
    (x : E) : openBarycentricSimplex (fun _ : Fin 1 => x) = {x} := by
  ext p
  change (∃ a : Fin 1 → ℝ, (∀ i,0<a i) ∧ (∑ i,a i)=1 ∧ (∑ i,a i • x)=p) ↔ p=x
  simp only [Fin.sum_univ_one]
  constructor
  · rintro ⟨a,_,h,e⟩
    rwa [h,one_smul,eq_comm] at e
  · rintro rfl
    exact ⟨fun _ => 1,fun _ => zero_lt_one,rfl,one_smul _ _⟩

/-- Positive barycentric weights at a new centre are exactly the
open cone over the smaller positive barycentric simplex. -/
theorem mem_openBarycentricSimplex_cons {E : Type*} [AddCommGroup E] [Module ℝ E]
    {n : ℕ} (hn : 0<n) (x : E) (v : Fin n→E) (p : E) :
    p∈openBarycentricSimplex (Fin.cons x v) ↔
      ∃ z∈openBarycentricSimplex v,∃ t∈Ioo (0:ℝ) 1,AffineMap.lineMap x z t=p := by
  constructor
  · rintro ⟨w,hw,hSum,hP⟩
    change (∑ i : Fin (n+1),w i)=1 at hSum
    rw [Fin.sum_univ_succ] at hSum
    let t := 1-w 0
    have hW : (∑ i : Fin n,w i.succ)=t := by
      dsimp [t]
      linarith
    have hT : t<1 := by
      dsimp [t]
      linarith [hw 0]
    have hPos : 0<t := by
      rw [← hW]
      exact Finset.sum_pos (fun i _ => hw i.succ)
        ⟨⟨0,hn⟩,Finset.mem_univ _⟩
    let u (i : Fin n) := w i.succ/t
    let z := ∑ i,u i • v i
    refine ⟨z,⟨u,(fun i => div_pos (hw i.succ) hPos),?_,rfl⟩,t,⟨hPos,hT⟩,?_⟩
    · change (∑ i : Fin n,w i.succ/t)=1
      simp_rw [div_eq_mul_inv]
      rw [← Finset.sum_mul,hW,mul_inv_cancel₀ hPos.ne']
    · rw [AffineMap.lineMap_apply_module]
      change (1-t) • x+t • (∑ i,u i • v i)=p
      have hA : 1-t=w 0 := by dsimp [t]; ring
      rw [hA,Finset.smul_sum]
      simp only [smul_smul,u]
      have hCancel (a : ℝ) : t*(a/t)=a := by field_simp
      simp only [hCancel]
      simpa [Fin.sum_univ_succ] using hP
  · rintro ⟨z,⟨u,hu,hs,hz⟩,t,ht,hp⟩
    let w : Fin (n+1)→ℝ := Fin.cons (1-t) (fun i : Fin n => t*u i)
    refine ⟨w,?_,?_,?_⟩
    · intro i
      refine Fin.cases ?_ (fun j => ?_) i
      · exact sub_pos.mpr ht.2
      · exact mul_pos ht.1 (hu j)
    · rw [Fin.sum_univ_succ]
      simp only [w,Fin.cons_zero,Fin.cons_succ,← Finset.mul_sum,hs,mul_one]
      ring
    · change (∑ i : Fin (n+1),w i • Fin.cons x v i)=p
      rw [Fin.sum_univ_succ]
      simp only [w,Fin.cons_zero,Fin.cons_succ,← smul_smul,← Finset.smul_sum,hz]
      simpa [AffineMap.lineMap_apply_module] using hp

end CyrusianKaplan
