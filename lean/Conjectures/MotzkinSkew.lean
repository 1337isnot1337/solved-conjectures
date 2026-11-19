import Mathlib.Algebra.Group.MinimalAxioms
import Mathlib.GroupTheory.Subgroup.Centralizer
import Mathlib.Data.Fintype.BigOperators
import Mathlib.Tactic.Abel
import Mathlib.Tactic.Linarith

/-! Integer skew translations give an algebraic replacement for integrating
a closed cochain on the infinite square lattice. -/
namespace Motzkin

open scoped BigOperators

structure IntegralLift (G : Type*) where
  displacement : G
  step : G → ℤ

namespace IntegralLift

variable {G : Type*} [AddCommGroup G]

omit [AddCommGroup G] in
@[ext] theorem ext {X Y : IntegralLift G}
    (hd : X.displacement = Y.displacement) (hs : ∀ x, X.step x = Y.step x) : X=Y := by
  cases X
  cases Y
  simp only [mk.injEq]
  exact ⟨hd,funext hs⟩

instance : Zero (IntegralLift G) := ⟨⟨0,fun _ => 0⟩⟩

instance : Add (IntegralLift G) := ⟨fun X Y =>
  ⟨X.displacement+Y.displacement,fun x => Y.step x+X.step (x+Y.displacement)⟩⟩

instance : Neg (IntegralLift G) := ⟨fun X =>
  ⟨-X.displacement,fun x => -X.step (x-X.displacement)⟩⟩

@[simp] theorem zero_displacement : (0 : IntegralLift G).displacement = 0 := rfl
@[simp] theorem zero_step (x : G) : (0 : IntegralLift G).step x = 0 := rfl
@[simp] theorem add_displacement (X Y : IntegralLift G) :
    (X+Y).displacement = X.displacement+Y.displacement := rfl
@[simp] theorem add_step (X Y : IntegralLift G) (x : G) :
    (X+Y).step x = Y.step x+X.step (x+Y.displacement) := rfl
@[simp] theorem neg_displacement (X : IntegralLift G) :
    (-X).displacement = -X.displacement := rfl
@[simp] theorem neg_step (X : IntegralLift G) (x : G) :
    (-X).step x = -X.step (x-X.displacement) := rfl

instance : AddGroup (IntegralLift G) := AddGroup.ofLeftAxioms
  (fun X Y Z => by
    apply ext
    · simp only [add_displacement,add_assoc]
    · intro x
      simp only [add_step,add_displacement]
      have he : x+(Y.displacement+Z.displacement) = (x+Z.displacement)+Y.displacement := by abel
      rw [he]
      omega)
  (fun X => by
    apply ext
    · simp only [add_displacement,zero_displacement,zero_add]
    · intro x
      simp only [add_step,zero_step,add_zero])
  (fun X => by
    apply ext
    · simp only [add_displacement,neg_displacement,neg_add_cancel,zero_displacement]
    · intro x
      simp only [add_step,neg_step,add_sub_cancel_right,add_neg_cancel,zero_step])

def displacementHom : IntegralLift G →+ G where
  toFun := displacement
  map_zero' := rfl
  map_add' _ _ := rfl

@[simp] theorem displacementHom_apply (X : IntegralLift G) :
    displacementHom X = X.displacement := rfl

theorem commute_iff (X Y : IntegralLift G) : X+Y=Y+X ↔
    ∀ x, X.step x+Y.step (x+X.displacement) = Y.step x+X.step (x+Y.displacement) := by
  constructor
  · intro h x
    have hh := congrArg (fun Z : IntegralLift G => Z.step x) h
    exact hh.symm
  · intro h
    apply ext
    · simp only [add_displacement,add_comm]
    · intro x
      exact (h x).symm

def translationPeriods (f : G → ℤ) : AddSubgroup G where
  carrier := {a | ∀ x, f (x+a)=f x}
  zero_mem' := by intro x; rw [add_zero]
  add_mem' := by
    intro a b ha hb x
    rw [← add_assoc,hb,ha]
  neg_mem' := by
    intro a ha x
    have hh := ha (x-a)
    rw [sub_add_cancel] at hh
    simpa only [sub_eq_add_neg] using hh.symm

theorem constant_of_generator_periods {a b : G}
    (hgen : AddSubgroup.closure ({a,b} : Set G) = ⊤) (f : G → ℤ)
    (ha : ∀ x, f (x+a)=f x) (hb : ∀ x, f (x+b)=f x) : ∀ x, f x=f 0 := by
  have hle : AddSubgroup.closure ({a,b} : Set G) ≤ translationPeriods f := by
    apply (AddSubgroup.closure_le _).mpr
    intro x hx
    simp only [Set.mem_insert_iff,Set.mem_singleton_iff] at hx
    rcases hx with rfl | rfl
    · exact ha
    · exact hb
  rw [hgen] at hle
  intro x
  have hx := hle (show x ∈ (⊤ : AddSubgroup G) from trivial)
  simpa only [zero_add] using hx 0

/-- A lift that has zero base translation and commutes with both generators
is an integer vertical translation independent of the starting point. -/
theorem kernel_step_constant {X Y Z : IntegralLift G}
    (hgen : AddSubgroup.closure ({X.displacement,Y.displacement} : Set G) = ⊤)
    (hZ : Z.displacement=0) (hZX : Z+X=X+Z) (hZY : Z+Y=Y+Z) :
    ∀ x, Z.step x=Z.step 0 := by
  apply constant_of_generator_periods hgen
  · intro x
    have hh := (commute_iff Z X).mp hZX x
    rw [hZ,add_zero] at hh
    omega
  · intro x
    have hh := (commute_iff Z Y).mp hZY x
    rw [hZ,add_zero] at hh
    omega

variable [Fintype G]

def total (X : IntegralLift G) : ℤ := ∑ x, X.step x

theorem total_add (X Y : IntegralLift G) : total (X+Y) = total X+total Y := by
  have hshift : (∑ x, X.step (x+Y.displacement)) = ∑ x, X.step x := by
    apply Fintype.sum_equiv (Equiv.addRight Y.displacement)
    intro x
    rfl
  simp only [total,add_step,Finset.sum_add_distrib,hshift]
  omega

def totalHom : IntegralLift G →+ ℤ where
  toFun := total
  map_zero' := by simp only [total,zero_step,Finset.sum_const_zero]
  map_add' := total_add

theorem total_of_constant {X : IntegralLift G} (hX : ∀ x, X.step x=X.step 0) :
    total X = (Fintype.card G : ℤ)*X.step 0 := by
  simp only [total,hX,Finset.sum_const,Finset.card_univ,nsmul_eq_mul]

end IntegralLift
end Motzkin
