module

public import Mathlib.Algebra.Order.Antidiag.Pi
public import Mathlib.Data.Sym.NatCard
public import Mathlib.Tactic

public section
namespace HKMEhrhart
open Finset
open scoped BigOperators

abbrev WeakComposition (r n : ℕ) := {f : Fin r → ℕ // ∑ i,f i=n}
abbrev PositiveComposition (r n : ℕ) := {f : Fin r → ℕ // (∑ i,f i=n) ∧ ∀ i, 1≤f i}

theorem weakComposition_card (r n : ℕ) :
    Nat.card (WeakComposition r n) = (r+n-1).choose n := by
  classical
  let F := Finset.piAntidiag (Finset.univ : Finset (Fin r)) n
  let e : WeakComposition r n ≃ ↥F :=
    { toFun := fun w => ⟨w.val,Finset.mem_piAntidiag.mpr ⟨w.property,fun _ _ => Finset.mem_univ _⟩⟩
      invFun := fun w => ⟨w.val,(Finset.mem_piAntidiag.mp w.property).1⟩
      left_inv := fun _ => rfl
      right_inv := fun _ => rfl }
  rw [Nat.card_congr e,Nat.card_eq_fintype_card,Fintype.card_coe]
  unfold F
  rw [← Finset.map_sym_eq_piAntidiag,Finset.card_map,Finset.sym_univ,Finset.card_univ,
    ← Nat.card_eq_fintype_card,Sym.natCard_sym_eq_choose,Nat.card_eq_fintype_card,Fintype.card_fin]

theorem positiveComposition_card (r n : ℕ) :
    Nat.card (PositiveComposition (r+1) (n+1)) = n.choose r := by
  by_cases h : r≤n
  · let d := n-r
    have hd : d+(r+1)=n+1 := by dsimp [d]; omega
    let e : PositiveComposition (r+1) (n+1) ≃ WeakComposition (r+1) d :=
      { toFun := fun w => ⟨fun i => w.val i-1,by
          rw [Finset.sum_tsub_distrib Finset.univ (fun i _ => w.property.2 i),w.property.1]
          simp [d]⟩
        invFun := fun w => ⟨fun i => w.val i+1,by
          refine ⟨?_,fun i => Nat.le_add_left 1 _⟩
          simp only [sum_add_distrib,w.property,sum_const,card_univ,Fintype.card_fin,nsmul_eq_mul,mul_one]
          exact hd⟩
        left_inv := fun w => Subtype.ext (funext fun i => Nat.sub_add_cancel (w.property.2 i))
        right_inv := fun w => Subtype.ext (funext fun i => Nat.add_sub_cancel _ _) }
    rw [Nat.card_congr e,weakComposition_card]
    have he : r+1+d-1=n := by omega
    rw [he]
    exact Nat.choose_symm h
  · have hn : n<r := lt_of_not_ge h
    have : IsEmpty (PositiveComposition (r+1) (n+1)) := by
      refine ⟨fun w => ?_⟩
      have hh : (∑ _ : Fin (r+1), (1:ℕ)) ≤ ∑ i, w.val i :=
        Finset.sum_le_sum (fun i _ => w.property.2 i)
      have hh' : r+1 ≤ n+1 := by
        simpa [nsmul_eq_mul,w.property.1] using hh
      omega
    rw [Nat.card_of_isEmpty,Nat.choose_eq_zero_of_lt hn]

end HKMEhrhart
