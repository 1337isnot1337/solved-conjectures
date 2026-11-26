module
public import Conjectures.PomeranceSarkozyObservationLaws

@[expose] public section
namespace PomeranceSarkozy

open Finset
open scoped BigOperators

variable {J A : Type*} [Fintype J] [DecidableEq J] [DecidableEq A]
variable {Ω : J→Type*} [∀ j,Fintype (Ω j)]

/-- Fiber of a coordinatewise observation on a Cartesian product. -/
def observationFiberEquiv (o : ∀ j,Ω j→Finset A) (s : J→Finset A) :
    {x : ∀ j,Ω j // (fun j => o j (x j))=s} ≃
      (∀ j,{x : Ω j // o j x=s j}) where
  toFun x j := ⟨x.val j,congrFun x.property j⟩
  invFun x := ⟨fun j => (x j).val,funext fun j => (x j).property⟩
  left_inv _ := rfl
  right_inv _ := rfl

/-- Exact mass of a tuple of observations under independent uniform
sampling in each finite coordinate. -/
theorem coordinate_observation_mass (o : ∀ j,Ω j→Finset A) (s : J→Finset A) :
    ((Finset.univ.filter fun x : (∀ j,Ω j) => (fun j => o j (x j))=s).card:ℚ)/
      (Fintype.card (∀ j,Ω j):ℚ) =
      ∏ j,observationLaw (o j) (s j) := by
  classical
  let _ : ∀ j : J,Fintype {x : Ω j // o j x=s j} := fun _ => Fintype.ofFinite _
  have hcard : (Finset.univ.filter fun x : (∀ j,Ω j) => (fun j => o j (x j))=s).card =
      ∏ j,(Finset.univ.filter fun x : Ω j => o j x=s j).card := by
    let _ : Fintype {x : (∀ j,Ω j) // (fun j => o j (x j))=s} := Fintype.ofFinite _
    have he := Fintype.card_congr (observationFiberEquiv (Ω:=Ω) o s)
    rw [Fintype.card_pi] at he
    exact (Fintype.card_subtype _).symm.trans (he.trans
      (Finset.prod_congr rfl (fun j _ => Fintype.card_subtype _)))
  rw [hcard,Fintype.card_pi,Nat.cast_prod,Nat.cast_prod,← Finset.prod_div_distrib]
  rfl

end PomeranceSarkozy
