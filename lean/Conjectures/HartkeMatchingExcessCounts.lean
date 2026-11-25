import Conjectures.HartkeMatchingExcessPaths
import Mathlib.Algebra.BigOperators.Group.Finset.Sigma

/-!
# Hartke–Stolee–West–Yancey's matching-excess conjecture

Exact matching-count identities for the actual split graphs. `pathCount`
counts permutations satisfying proved graph constraints; it is not a
recursively postulated proxy. The preceding bijection proves its recurrence.
-/

namespace HartkeMatchingExcess

open Finset Equiv
open scoped BigOperators

variable {R : ℕ}

noncomputable def pathCount (A : Fin (R + 1) → Fin (R + 1) → Prop)
    (j : Fin (R + 1)) : ℕ := Nat.card (ReturnFiber A j)

abbrev RestrictedReturns (A : Fin (R + 1) → Fin (R + 1) → Prop)
    (S : Finset (Fin (R + 1))) :=
  {σ : Equiv.Perm (Fin (R + 1)) // PathPermutation A σ ∧ σ 0 ∈ S}

def returnDecomposition (A : Fin (R + 1) → Fin (R + 1) → Prop)
    (S : Finset (Fin (R + 1))) :
    RestrictedReturns A S ≃ (Σ j : S, ReturnFiber A j.1) where
  toFun σ := ⟨⟨σ.1 0, σ.2.2⟩, ⟨σ.1, σ.2.1, rfl⟩⟩
  invFun σ := ⟨σ.2.1, σ.2.2.1, by rw [σ.2.2.2]; exact σ.1.2⟩
  left_inv σ := rfl
  right_inv σ := by
    rcases σ with ⟨⟨j, hj⟩, ⟨σ, hσ, hz⟩⟩
    change σ 0 = j at hz
    subst j
    rfl

theorem restrictedReturns_card (A : Fin (R + 1) → Fin (R + 1) → Prop)
    (S : Finset (Fin (R + 1))) :
    Nat.card (RestrictedReturns A S) = ∑ j ∈ S, pathCount A j := by
  classical
  rw [Nat.card_congr (returnDecomposition A S), Nat.card_sigma]
  exact Finset.sum_coe_sort S (pathCount A)

@[simp] theorem pathCount_zero (A : Fin (R + 1) → Fin (R + 1) → Prop) :
    pathCount A 0 = 1 := by
  apply Nat.card_eq_one_iff_exists.mpr
  refine ⟨⟨1, ?_, rfl⟩, ?_⟩
  · constructor
    · intro i hi; exact le_rfl
    · intro i hi hmove; exact False.elim (hmove rfl)
  · intro σ
    apply Subtype.ext
    exact (upperPermutation_zero_iff σ.2.1.1).mp σ.2.2

theorem pathCount_rec (A : Fin (R + 1) → Fin (R + 1) → Prop) [DecidableRel A]
    (j : Fin (R + 1)) (hj0 : j ≠ 0) :
    pathCount A j = ∑ i ∈ (Iio j).filter (fun i => A i j), pathCount A i := by
  classical
  let e : PreviousFiber A j ≃ RestrictedReturns A ((Iio j).filter (fun i => A i j)) :=
    Equiv.subtypeEquivRight fun σ => by simp
  exact (returnFiber_card A j hj0).trans
    ((Nat.card_congr e).trans (restrictedReturns_card A _))

def returnDigraph (A : Fin (R + 1) → Fin (R + 1) → Prop)
    (J : Finset (Fin (R + 1))) (i j : Fin (R + 1)) : Prop :=
  i = j ∨ (i < j ∧ A i j) ∨ (j = 0 ∧ i ∈ J)

theorem cycleCover_return_iff (A : Fin (R + 1) → Fin (R + 1) → Prop)
    (J : Finset (Fin (R + 1))) (σ : Equiv.Perm (Fin (R + 1))) :
    (∀ j, returnDigraph A J (σ j) j) ↔
      PathPermutation A σ ∧ σ 0 ∈ insert 0 J := by
  classical
  constructor
  · intro h
    refine ⟨⟨?_, ?_⟩, ?_⟩
    · intro j hj0
      rcases h j with he | ⟨hlt, _⟩ | ⟨hz, _⟩
      · exact he.le
      · exact hlt.le
      · exact False.elim (hj0 hz)
    · intro j hj0 hmove
      rcases h j with he | ⟨_, hA⟩ | ⟨hz, _⟩
      · exact False.elim (hmove he)
      · exact hA
      · exact False.elim (hj0 hz)
    · rcases h 0 with he | ⟨hlt, _⟩ | ⟨_, hJ⟩
      · exact mem_insert.mpr (Or.inl he)
      · exact False.elim ((not_lt_of_ge (Fin.zero_le _)) hlt)
      · exact mem_insert.mpr (Or.inr hJ)
  · rintro ⟨hσ, hJ⟩ j
    by_cases hj0 : j = 0
    · subst j
      rcases mem_insert.mp hJ with hz | hJ
      · exact Or.inl hz
      · exact Or.inr (Or.inr ⟨rfl, hJ⟩)
    · by_cases hfix : σ j = j
      · exact Or.inl hfix
      · exact Or.inr (Or.inl
          ⟨lt_of_le_of_ne (hσ.1 j hj0) hfix, hσ.2 j hj0 hfix⟩)

/-- The path-sum formula counts actual spanning perfect matchings. -/
theorem perfectMatchingCount_returnGraph
    (A : Fin (R + 1) → Fin (R + 1) → Prop) (J : Finset (Fin (R + 1)))
    (hJ : 0 ∉ J) :
    perfectMatchingCount (splitGraph (returnDigraph A J)) =
      1 + ∑ j ∈ J, pathCount A j := by
  classical
  rw [perfectMatchingCount_splitGraph]
  let e : CycleCover (returnDigraph A J) ≃ RestrictedReturns A (insert 0 J) :=
    Equiv.subtypeEquivRight (cycleCover_return_iff A J)
  rw [Nat.card_congr e, restrictedReturns_card, sum_insert hJ, pathCount_zero]

end HartkeMatchingExcess
