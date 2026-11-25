module
public import Conjectures.PomeranceSarkozyPrimeCRT
public import Mathlib.Data.Fintype.Pi

@[expose] public section
namespace PomeranceSarkozy

open Finset
open Classical

variable {ι : Type*} [Fintype ι] [DecidableEq ι] {Ω : ι → Type*} [∀ i,Fintype (Ω i)]

abbrev FixedCoordinates (S : Finset ι) (r : ∀ i,Ω i) :=
  {x : ∀ i,Ω i // ∀ i∈S,x i=r i}

noncomputable instance (S : Finset ι) (r : ∀ i,Ω i) : Fintype (FixedCoordinates S r) := by
  classical
  exact Subtype.fintype _

noncomputable def fixedCoordinatesEquiv (S : Finset ι) (r : ∀ i,Ω i) :
    FixedCoordinates S r ≃ (∀ i,{x : Ω i // i∈S → x=r i}) where
  toFun x i := ⟨x.val i,x.property i⟩
  invFun x := ⟨fun i => (x i).val,fun i hi => (x i).property hi⟩
  left_inv _ := rfl
  right_inv _ := rfl

theorem fixedCoordinates_card (S : Finset ι) (r : ∀ i,Ω i) :
    Fintype.card (FixedCoordinates S r) = ∏ i : ι, if i∈S then 1 else Fintype.card (Ω i) := by
  rw [Fintype.card_congr (fixedCoordinatesEquiv S r),Fintype.card_pi]
  apply Finset.prod_congr rfl
  intro i _
  by_cases hi : i∈S
  · let u : Unique {x : Ω i // i∈S → x=r i} :=
      ⟨⟨⟨r i,fun _ => rfl⟩⟩,fun x => Subtype.ext (x.property hi)⟩
    rw [ite_eq_left hi]
    exact @Fintype.card_unique _ u _
  · rw [ite_eq_right hi]
    exact Fintype.card_congr
      ⟨Subtype.val,fun x => ⟨x,fun h => (hi h).elim⟩,fun _ => rfl,fun _ => rfl⟩

/-- Literal uniform-product probability of any selection of independent
coordinates taking prescribed values. -/
theorem fixedCoordinates_probability (S : Finset ι) (r : ∀ i,Ω i)
    (h : ∀ i,0 < Fintype.card (Ω i)) :
    (Fintype.card (FixedCoordinates S r):ℚ)/(Fintype.card (∀ i,Ω i):ℚ) =
      ∏ i ∈ S,((Fintype.card (Ω i):ℚ))⁻¹ := by
  rw [fixedCoordinates_card,Fintype.card_pi,Nat.cast_prod,Nat.cast_prod,
    ← Finset.prod_div_distrib]
  have hS : (Finset.univ : Finset ι).filter (fun i => i∈S)=S := by ext i; simp
  conv_rhs => rw [← hS,Finset.prod_filter]
  apply Finset.prod_congr rfl
  intro i _
  by_cases hi : i∈S
  · simp [hi,one_div]
  · have hc : (Fintype.card (Ω i):ℚ)≠0 := by exact_mod_cast (h i).ne'
    simp [hi,hc]

end PomeranceSarkozy
