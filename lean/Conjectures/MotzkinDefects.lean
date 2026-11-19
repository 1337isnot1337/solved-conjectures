import Conjectures.HaralambisDefects
import Mathlib.Algebra.Ring.Int.Parity
import Mathlib.Tactic.Abel

/-! The labelled two-dimensional torus retains parallel edges and loops.
Balanced signs on its defect dual produce a closed integral edge field. -/
namespace Motzkin.Torus

open scoped BigOperators
open Haralambis

variable {G : Type*} [AddCommGroup G] [Fintype G]

abbrev Edge (G : Type*) := Bool × G

def jump (a b : G) (e : Edge G) : G := if e.1 then b else a
def positiveFace (a : G) (e : Edge G) : G := if e.1 then e.2-a else e.2
def negativeFace (b : G) (e : Edge G) : G := if e.1 then e.2 else e.2-b

theorem sum_positive_fiber [DecidableEq G] (a v : G) (f : Edge G → ℤ) :
    (∑ e, if positiveFace a e=v then f e else 0) = f (false,v)+f (true,v+a) := by
  classical
  simp [positiveFace,Fintype.sum_prod_type,sub_eq_iff_eq_add,add_comm]

theorem sum_negative_fiber [DecidableEq G] (b v : G) (f : Edge G → ℤ) :
    (∑ e, if negativeFace b e=v then f e else 0) = f (false,v+b)+f (true,v) := by
  classical
  simp [negativeFace,Fintype.sum_prod_type,sub_eq_iff_eq_add,add_comm]

def IsDefect (a b : G) (occ : G → ℤ) (e : Edge G) : Prop :=
  occ e.2=0 ∧ occ (e.2+jump a b e)=0

instance (a b : G) (occ : G → ℤ) (e : Edge G) : Decidable (IsDefect a b occ e) :=
  inferInstanceAs (Decidable (occ e.2=0 ∧ occ (e.2+jump a b e)=0))

def defectWeight (a b : G) (occ : G → ℤ) (e : Edge G) : ℤ :=
  if IsDefect a b occ e then 1 else 0

omit [Fintype G] in
theorem defect_weight_eq (a b : G) (occ : G → ℤ)
    (hbinary : ∀ x, occ x=0 ∨ occ x=1)
    (havoid : ∀ e : Edge G, occ e.2+occ (e.2+jump a b e) ≤ 1) (e : Edge G) :
    defectWeight a b occ e=1-occ e.2-occ (e.2+jump a b e) := by
  have hA := havoid e
  rcases hbinary e.2 with h0 | h1 <;>
    rcases hbinary (e.2+jump a b e) with h0' | h1' <;>
    simp_all [defectWeight,IsDefect]

theorem defect_incident_sum [DecidableEq G] (a b : G) (occ : G → ℤ) (g : Edge G → G) (v : G) :
    (∑ e : {e : Edge G // IsDefect a b occ e}, if g e.val=v then (1:ℤ) else 0) =
      ∑ e : Edge G, if g e=v then defectWeight a b occ e else 0 := by
  classical
  rw [sum_subtype_support (IsDefect a b occ) (fun e : Edge G => if g e=v then (1:ℤ) else 0)]
  apply Finset.sum_congr rfl
  intro e he
  by_cases hD : IsDefect a b occ e <;> by_cases hgv : g e=v <;>
    simp [hD,hgv,defectWeight]

theorem defect_degree_formula [DecidableEq G] (a b : G) (occ : G → ℤ) (v : G) :
    (edgeDegree
      (fun e : {e : Edge G // IsDefect a b occ e} => positiveFace a e.val)
      (fun e : {e : Edge G // IsDefect a b occ e} => negativeFace b e.val) v : ℤ) =
      defectWeight a b occ (false,v)+defectWeight a b occ (true,v+a)+
      defectWeight a b occ (false,v+b)+defectWeight a b occ (true,v) := by
  simp only [edgeDegree,Nat.cast_add,Finset.natCast_card_filter]
  rw [defect_incident_sum,defect_incident_sum,sum_positive_fiber,sum_negative_fiber]
  ring

theorem defect_degree_even [DecidableEq G] (a b : G) (occ : G → ℤ)
    (hbinary : ∀ x, occ x=0 ∨ occ x=1)
    (havoid : ∀ e : Edge G, occ e.2+occ (e.2+jump a b e) ≤ 1) (v : G) :
    Even (edgeDegree
      (fun e : {e : Edge G // IsDefect a b occ e} => positiveFace a e.val)
      (fun e : {e : Edge G // IsDefect a b occ e} => negativeFace b e.val) v) := by
  apply (Int.even_coe_nat _).mp
  refine ⟨2-occ v-occ (v+a)-occ (v+b)-occ (v+a+b),?_⟩
  rw [defect_degree_formula]
  simp only [defect_weight_eq a b occ hbinary havoid,jump,Bool.false_eq_true,
    ite_false,ite_true]
  have he : (v+b)+a=(v+a)+b := by abel
  rw [he]
  ring

theorem exists_closed_signs (a b : G) (occ : G → ℤ)
    (hbinary : ∀ x, occ x=0 ∨ occ x=1)
    (havoid : ∀ e : Edge G, occ e.2+occ (e.2+jump a b e) ≤ 1) :
    ∃ w : Edge G → ℤ,
      (∀ e, |w e|=1-occ e.2-occ (e.2+jump a b e)) ∧
      ∀ x, w (false,x)+w (true,x+a)=w (true,x)+w (false,x+b) := by
  classical
  let lo := fun e : {e : Edge G // IsDefect a b occ e} => positiveFace a e.val
  let hi := fun e : {e : Edge G // IsDefect a b occ e} => negativeFace b e.val
  obtain ⟨s,hs,hbalance⟩ := exists_balanced_signs lo hi (defect_degree_even a b occ hbinary havoid)
  let w : Edge G → ℤ := fun e => if h : IsDefect a b occ e then s ⟨e,h⟩ else 0
  refine ⟨w,?_,?_⟩
  · intro e
    have habs : |w e|=defectWeight a b occ e := by
      by_cases hD : IsDefect a b occ e
      · simp only [w,dite_eq_left hD,defectWeight,ite_true,hD]
        rcases hs ⟨e,hD⟩ with hh | hh <;> rw [hh] <;> norm_num
      · simp only [w,dite_eq_right hD,defectWeight,ite_false,hD,abs_zero]
    exact habs.trans (defect_weight_eq a b occ hbinary havoid e)
  · intro v
    let c : Edge G → ℤ := fun e =>
      (if positiveFace a e=v then 1 else 0)-(if negativeFace b e=v then 1 else 0)
    have hb : (∑ e : Edge G, w e*c e)=0 := by
      have hh := sum_subtype_support (IsDefect a b occ) (fun e => w e*c e)
      have he : (∑ e : Edge G, if IsDefect a b occ e then w e*c e else 0)=
          ∑ e : Edge G, w e*c e := by
        apply Finset.sum_congr rfl
        intro e he
        by_cases hD : IsDefect a b occ e <;> simp [hD,w]
      rw [he] at hh
      rw [←hh]
      simpa only [w,c,lo,hi,dite_eq_left,Subtype.property] using hbalance v
    have he : (∑ e : Edge G, w e*c e) =
        (∑ e : Edge G, if positiveFace a e=v then w e else 0)-
        (∑ e : Edge G, if negativeFace b e=v then w e else 0) := by
      rw [←Finset.sum_sub_distrib]
      apply Finset.sum_congr rfl
      intro e he
      dsimp [c]
      split_ifs <;> ring
    rw [he,sum_positive_fiber,sum_negative_fiber] at hb
    omega

omit [AddCommGroup G] [Fintype G] in
theorem half_increment {w c d : ℤ} (hw : |w|=1-c-d) :
    2*((1-w-c+d)/2)=1-w-c+d ∧ d ≤ (1-w-c+d)/2 ∧ (1-w-c+d)/2 ≤ 1-c := by
  rcases le_total 0 w with h | h
  · rw [abs_of_nonneg h] at hw
    omega
  · rw [abs_of_nonpos h] at hw
    omega

/-- The parity correction produces integral increments in the exact interval
from the endpoint indicators. -/
theorem exists_closed_integers (a b : G) (occ : G → ℤ)
    (hbinary : ∀ x, occ x=0 ∨ occ x=1)
    (havoid : ∀ e : Edge G, occ e.2+occ (e.2+jump a b e) ≤ 1) :
    ∃ f g : G → ℤ,
      (∀ x, f x+g (x+a)=g x+f (x+b)) ∧
      (∀ x, occ (x+a) ≤ f x ∧ f x ≤ 1-occ x) ∧
      (∀ x, occ (x+b) ≤ g x ∧ g x ≤ 1-occ x) := by
  obtain ⟨w,hw,hclosed⟩ := exists_closed_signs a b occ hbinary havoid
  let f : G → ℤ := fun x => (1-w (false,x)-occ x+occ (x+a))/2
  let g : G → ℤ := fun x => (1-w (true,x)-occ x+occ (x+b))/2
  have hf : ∀ x, 2*f x=1-w (false,x)-occ x+occ (x+a) ∧
      occ (x+a) ≤ f x ∧ f x ≤ 1-occ x := fun x => half_increment (hw (false,x))
  have hg : ∀ x, 2*g x=1-w (true,x)-occ x+occ (x+b) ∧
      occ (x+b) ≤ g x ∧ g x ≤ 1-occ x := fun x => half_increment (hw (true,x))
  refine ⟨f,g,?_,fun x => (hf x).2,fun x => (hg x).2⟩
  intro x
  have h0 := (hf x).1
  have h1 := (hg (x+a)).1
  have h2 := (hg x).1
  have h3 := (hf (x+b)).1
  have hc := hclosed x
  have he : (x+a)+b=(x+b)+a := by abel
  rw [he] at h1
  omega

end Motzkin.Torus
