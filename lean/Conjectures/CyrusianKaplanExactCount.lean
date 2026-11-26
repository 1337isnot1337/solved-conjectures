module
public import Conjectures.CyrusianKaplanEncodingEquivalence
public import Conjectures.CyrusianKaplanOrdinarizationCount
public import Mathlib.Data.Finset.Powerset
public import Mathlib.Data.Finset.Prod
public import Mathlib.SetTheory.Cardinal.Finite
public import Mathlib.Data.Fintype.Card

@[expose] public section
namespace CyrusianKaplan

open Finset

/-- Actual finite pairs (high gaps, low members) with the two
addition tests, for every genus and index. -/
noncomputable def admissibleEncodingPairs (g r : ℕ) : Finset (Finset ℕ × Finset ℕ) := by
  classical
  exact (((Finset.Ioo g (2*g)).powersetCard r) ×ˢ ((Finset.Icc 1 g).powersetCard r)).filter
    (fun z=>EncodingTests g z.1 z.2)

theorem mem_admissibleEncodingPairs_iff (g r : ℕ) (A B : Finset ℕ) :
    (A,B)∈admissibleEncodingPairs g r ↔
    (A⊆Finset.Ioo g (2*g) ∧ A.card=r) ∧
    (B⊆Finset.Icc 1 g ∧ B.card=r) ∧ EncodingTests g A B := by
  classical
  simp only [admissibleEncodingPairs,Finset.mem_filter,Finset.mem_product,Finset.mem_powersetCard]
  exact and_assoc

noncomputable def admissibleEncodingPairs_equiv (g r : ℕ) :
    IntegerEncoding g r ≃ ↥(admissibleEncodingPairs g r) where
  toFun E := ⟨(E.highGaps,E.lowMembers),
    (mem_admissibleEncodingPairs_iff g r E.highGaps E.lowMembers).mpr
      ⟨⟨E.highBounds,E.highCard⟩,⟨E.lowBounds,E.lowCard⟩,E.tests⟩⟩
  invFun p := by
    have h := (mem_admissibleEncodingPairs_iff g r p.val.1 p.val.2).mp p.property
    exact ⟨p.val.1,p.val.2,h.1.1,h.2.1.1,h.1.2,h.2.1.2,h.2.2⟩
  left_inv := by intro E; cases E; rfl
  right_inv := by intro E; apply Subtype.ext; rfl

abbrev ExactOrdinarizationClass (g r : ℕ) :=
  {S : GappedSemigroup // S.genus=g ∧ ∃ T : GappedSemigroup,
    T.IsOrdinary ∧ OrdinarizationPath S r T}

theorem exact_ordinarization_index_iff (S : GappedSemigroup) (r : ℕ) :
    (∃ T : GappedSemigroup,T.IsOrdinary ∧ OrdinarizationPath S r T) ↔
      S.lowMembers.card=r := by
  constructor
  · rintro ⟨T,hT,hP⟩
    exact (ordinary_path_length_eq_lowMembers hP hT).symm
  · intro h
    rw [← h]
    exact exists_path_to_ordinary S

noncomputable def exact_ordinarization_encoding_equiv (g r : ℕ) :
    ExactOrdinarizationClass g r ≃ ↥(admissibleEncodingPairs g r) := by
  let E : ExactOrdinarizationClass g r ≃ ExactGenusIndexClass g r :=
    { toFun := fun S=>⟨S.val,S.property.1,
        (exact_ordinarization_index_iff S.val r).mp S.property.2⟩
      invFun := fun S=>⟨S.val,S.property.1,
        (exact_ordinarization_index_iff S.val r).mpr S.property.2⟩
      left_inv := by intro S; apply Subtype.ext; rfl
      right_inv := by intro S; apply Subtype.ext; rfl }
  exact E.trans ((exact_genus_index_encoding_equiv g r).trans (admissibleEncodingPairs_equiv g r))

/-- Exact cardinality bridge for the count n_{g,r}. No limiting or
large-genus hypothesis enters, and the class uses the actual
ordinarization step rather than a surrogate index. -/
theorem exact_ordinarization_count (g r : ℕ) :
    Nat.card (ExactOrdinarizationClass g r)=(admissibleEncodingPairs g r).card := by
  rw [Nat.card_congr (exact_ordinarization_encoding_equiv g r),Nat.card_eq_fintype_card, Fintype.card_coe]

end CyrusianKaplan
