module
public import Conjectures.NovelliThibonCompleteWords
public import Mathlib.Data.Sym.Card

@[expose] public section
namespace NovelliThibon

open Classical
variable {A R : Type*} [Fintype A] [DecidableEq A] [CommSemiring R]

noncomputable def completeSum (x : A → R) (n : ℕ) : R :=
  ∑ s : Sym A n,(s.val.map x).prod

theorem completeSum_rename {B : Type*} [Fintype B] [DecidableEq B] (e : A ≃ B)
    (x : B → R) (n : ℕ) :
    completeSum (x∘e) n = completeSum x n := by
  unfold completeSum
  apply Fintype.sum_equiv (Sym.equivCongr e)
  intro s
  simp [Function.comp_def,Multiset.map_map]

theorem completeSum_zero (x : A → R) : completeSum x 0 = 1 := by
  unfold completeSum
  simp [Sym.eq_nil_of_card_zero]

theorem completeSum_eq_hsymm_eval (x : A → R) (n : ℕ) :
    completeSum x n = MvPolynomial.eval x (MvPolynomial.hsymm A R n) := by
  unfold completeSum MvPolynomial.hsymm
  change _ = (MvPolynomial.eval₂Hom (RingHom.id R) x) _
  rw [map_sum]
  apply Finset.sum_congr rfl
  intro s _
  rw [← Multiset.prod_hom']
  simp

/-- Deleting the distinguished variable in the actual complete
homogeneous polynomial; follows directly from the multiset bijection. -/
theorem completeSum_option_succ (x : Option A → R) (n : ℕ) :
    completeSum x (n+1) =
      x none * completeSum x n + completeSum (x ∘ some) (n+1) := by
  unfold completeSum
  let e := symOptionSuccEquiv (α:=A) (n:=n)
  rw [← Equiv.sum_comp e.symm,Fintype.sum_sum_type,Finset.mul_sum]
  congr 1
  · apply Finset.sum_congr rfl
    intro s _
    change ((none ::ₘ s.val).map x).prod = _
    simp
  · apply Finset.sum_congr rfl
    intro s _
    change ((SymOptionSuccEquiv.decode (Sum.inr s)).val.map x).prod = _
    simp [SymOptionSuccEquiv.decode,Multiset.map_map,Function.comp_def]

end NovelliThibon
