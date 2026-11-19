import Conjectures.HaralambisOrientation
import Conjectures.HaralambisFaces
import Mathlib.Algebra.Ring.Int.Parity
import Mathlib.Tactic.NormNum

namespace Haralambis

def IsDefect (d : Fin 3 → ℕ) (occ : ℕ → ℤ) (e : SurfaceEdge d) : Prop :=
  occ e.2.val=0 ∧ occ (e.2.val+d e.1)=0

instance (d : Fin 3 → ℕ) (occ : ℕ → ℤ) (e : SurfaceEdge d) : Decidable (IsDefect d occ e) :=
  inferInstanceAs (Decidable (occ e.2.val=0 ∧ occ (e.2.val+d e.1)=0))

def defectWeight (d : Fin 3 → ℕ) (occ : ℕ → ℤ) (e : SurfaceEdge d) : ℤ :=
  if IsDefect d occ e then 1 else 0

theorem defect_weight_eq (d : Fin 3 → ℕ) (occ : ℕ → ℤ)
    (hbinary : ∀ t, occ t=0 ∨ occ t=1)
    (havoid : ∀ i t, t+d i < windowLength d → occ t+occ (t+d i) ≤ 1)
    (e : SurfaceEdge d) : defectWeight d occ e=1-occ e.2.val-occ (e.2.val+d e.1) := by
  have hA := havoid e.1 e.2.val ((edge_window d _ _).mp e.2.isLt)
  rcases hbinary e.2.val with h0 | h1 <;>
    rcases hbinary (e.2.val+d e.1) with h0' | h1' <;>
    simp_all [defectWeight,IsDefect]

theorem sum_subtype_support {E : Type*} [Fintype E] (P : E → Prop) [DecidablePred P]
    (f : E → ℤ) :
    (∑ e : {e : E // P e}, f e.val) = ∑ e : E, if P e then f e else 0 := by
  rw [←Finset.sum_filter]
  exact (Finset.sum_subtype (Finset.univ.filter P) (by simp) f).symm

theorem defect_incident_sum (d : Fin 3 → ℕ) (occ : ℕ → ℤ)
    (g : SurfaceEdge d → SurfaceFace d) (v : SurfaceFace d) :
    (∑ e : {e : SurfaceEdge d // IsDefect d occ e}, if g e.val=v then (1:ℤ) else 0) =
      ∑ e : SurfaceEdge d, if g e=v then defectWeight d occ e else 0 := by
  rw [sum_subtype_support (IsDefect d occ) (fun e : SurfaceEdge d => if g e=v then (1:ℤ) else 0)]
  apply Finset.sum_congr rfl
  intro e he
  by_cases hD : IsDefect d occ e <;> by_cases hgv : g e=v <;>
    simp [hD,hgv,defectWeight]

theorem defect_degree_formula (d : Fin 3 → ℕ) (occ : ℕ → ℤ) (v : SurfaceFace d) :
    (edgeDegree
      (fun e : {e : SurfaceEdge d // IsDefect d occ e} => positiveFace d e.val)
      (fun e : {e : SurfaceEdge d // IsDefect d occ e} => negativeFace d e.val) v : ℤ) =
      defectWeight d occ (facePositiveLower d v)+defectWeight d occ (facePositiveUpper d v)+
      defectWeight d occ (faceNegativeUpper d v)+defectWeight d occ (faceNegativeLower d v) := by
  simp only [edgeDegree,Nat.cast_add,Finset.natCast_card_filter]
  rw [defect_incident_sum,defect_incident_sum,sum_positive_fiber,sum_negative_fiber]
  ring

theorem defect_degree_even (d : Fin 3 → ℕ) (occ : ℕ → ℤ)
    (hbinary : ∀ t, occ t=0 ∨ occ t=1)
    (havoid : ∀ i t, t+d i < windowLength d → occ t+occ (t+d i) ≤ 1)
    (v : SurfaceFace d) :
    Even (edgeDegree
      (fun e : {e : SurfaceEdge d // IsDefect d occ e} => positiveFace d e.val)
      (fun e : {e : SurfaceEdge d // IsDefect d occ e} => negativeFace d e.val) v) := by
  apply (Int.even_coe_nat _).mp
  refine ⟨2-occ v.2.val-occ (v.2.val+d (nextAxis v.1))-
    occ (v.2.val+d (prevAxis v.1))-
    occ (v.2.val+d (nextAxis v.1)+d (prevAxis v.1)),?_⟩
  rw [defect_degree_formula]
  simp only [defect_weight_eq d occ hbinary havoid,
    facePositiveLower,facePositiveUpper,faceNegativeUpper,faceNegativeLower]
  simp only [Nat.add_assoc,Nat.add_comm,Nat.add_left_comm]
  ring

/-- The finite, explicitly indexed surface has a closed integer edge field
whose absolute value is exactly the indicator of two empty endpoints. -/
theorem exists_surface_signs (d : Fin 3 → ℕ) (occ : ℕ → ℤ)
    (hbinary : ∀ t, occ t=0 ∨ occ t=1)
    (havoid : ∀ i t, t+d i < windowLength d → occ t+occ (t+d i) ≤ 1) :
    ∃ f : SurfaceEdge d → ℤ,
      (∀ e, |f e|=1-occ e.2.val-occ (e.2.val+d e.1)) ∧
      ∀ v, f (facePositiveLower d v)+f (facePositiveUpper d v)=
        f (faceNegativeUpper d v)+f (faceNegativeLower d v) := by
  let lo := fun e : {e : SurfaceEdge d // IsDefect d occ e} => positiveFace d e.val
  let hi := fun e : {e : SurfaceEdge d // IsDefect d occ e} => negativeFace d e.val
  obtain ⟨s,hs,hbalance⟩ := exists_balanced_signs lo hi (defect_degree_even d occ hbinary havoid)
  let f : SurfaceEdge d → ℤ := fun e => if h : IsDefect d occ e then s ⟨e,h⟩ else 0
  refine ⟨f,?_,?_⟩
  · intro e
    have habs : |f e|=defectWeight d occ e := by
      by_cases hD : IsDefect d occ e
      · simp only [f,dite_eq_left hD,defectWeight,ite_true,hD]
        rcases hs ⟨e,hD⟩ with hh | hh <;> rw [hh] <;> norm_num
      · simp only [f,dite_eq_right hD,defectWeight,ite_false,hD,abs_zero]
    exact habs.trans (defect_weight_eq d occ hbinary havoid e)
  · intro v
    let c : SurfaceEdge d → ℤ := fun e =>
      (if positiveFace d e=v then 1 else 0)-(if negativeFace d e=v then 1 else 0)
    have hb : (∑ e : SurfaceEdge d, f e*c e)=0 := by
      have hh := sum_subtype_support (IsDefect d occ) (fun e => f e*c e)
      have he : (∑ e : SurfaceEdge d, if IsDefect d occ e then f e*c e else 0)=
          ∑ e : SurfaceEdge d, f e*c e := by
        apply Finset.sum_congr rfl
        intro e he
        by_cases hD : IsDefect d occ e <;> simp [hD,f]
      rw [he] at hh
      rw [←hh]
      simpa only [f,c,lo,hi,dite_eq_left,Subtype.property] using hbalance v
    have he : (∑ e : SurfaceEdge d, f e*c e) =
        (∑ e : SurfaceEdge d, if positiveFace d e=v then f e else 0)-
        (∑ e : SurfaceEdge d, if negativeFace d e=v then f e else 0) := by
      rw [←Finset.sum_sub_distrib]
      apply Finset.sum_congr rfl
      intro e he
      dsimp [c]
      split_ifs <;> ring
    rw [he,sum_positive_fiber,sum_negative_fiber] at hb
    omega

def extendSurfaceFunction (d : Fin 3 → ℕ) (f : SurfaceEdge d → ℤ)
    (i : Fin 3) (t : ℕ) : ℤ :=
  if h : t < edgeLength d i then f ⟨i,⟨t,h⟩⟩ else 0

theorem extendSurfaceFunction_apply (d : Fin 3 → ℕ) (f : SurfaceEdge d → ℤ) (e : SurfaceEdge d) :
    extendSurfaceFunction d f e.1 e.2.val=f e := by
  obtain ⟨i,⟨t,ht⟩⟩ := e
  simp only [extendSurfaceFunction,dite_eq_left ht]

theorem parity_of_defect_absolute {x c c' : ℤ} (h : |x|=1-c-c') :
    x%2=(1+c+c')%2 := by
  rcases le_total 0 x with hx | hx
  · rw [abs_of_nonneg hx] at h
    omega
  · rw [abs_of_nonpos hx] at h
    omega

/-- The finite certificate used by the density argument. No primitive-gcd,
topological, or orientation hypothesis is assumed. -/
theorem finite_signed_edges (d : Fin 3 → ℕ) (occ : ℕ → ℤ)
    (hbinary : ∀ t, occ t=0 ∨ occ t=1)
    (havoid : ∀ i t, t+d i < d 0+d 1+d 2 → occ t+occ (t+d i) ≤ 1) :
    ∃ F : Fin 3 → ℕ → ℤ,
      (∀ i t, t+d i < d 0+d 1+d 2 → |F i t|=1-occ t-occ (t+d i)) ∧
      (∀ t, t < d 2 → F 0 t+F 1 (t+d 0)=F 1 t+F 0 (t+d 1)) ∧
      (∀ t, t < d 0 → F 1 t+F 2 (t+d 1)=F 2 t+F 1 (t+d 2)) ∧
      (∀ t, t < d 1 → F 2 t+F 0 (t+d 2)=F 0 t+F 2 (t+d 0)) := by
  obtain ⟨f,habs,hclosed⟩ := exists_surface_signs d occ hbinary havoid
  let F := extendSurfaceFunction d f
  have hsquare : ∀ k t, t < d k →
      F (nextAxis k) t+F (prevAxis k) (t+d (nextAxis k))=
      F (prevAxis k) t+F (nextAxis k) (t+d (prevAxis k)) := by
    intro k t ht
    let v : SurfaceFace d := ⟨k,⟨t,ht⟩⟩
    have hh := hclosed v
    rw [←extendSurfaceFunction_apply d f (facePositiveLower d v),
      ←extendSurfaceFunction_apply d f (facePositiveUpper d v),
      ←extendSurfaceFunction_apply d f (faceNegativeUpper d v),
      ←extendSurfaceFunction_apply d f (faceNegativeLower d v)] at hh
    change F (nextAxis k) t+F (prevAxis k) (t+d (nextAxis k))=
      F (nextAxis k) (t+d (prevAxis k))+F (prevAxis k) t at hh
    omega
  refine ⟨F,?_,?_,?_,?_⟩
  · intro i t ht
    have he : t < edgeLength d i := (edge_window d i t).mpr ht
    simpa only [F,extendSurfaceFunction,dite_eq_left he] using habs ⟨i,⟨t,he⟩⟩
  · intro t ht
    simpa only [next_two,prev_two] using hsquare 2 t ht
  · intro t ht
    simpa only [next_zero,prev_zero] using hsquare 0 t ht
  · intro t ht
    simpa only [next_one,prev_one] using hsquare 1 t ht

end Haralambis
