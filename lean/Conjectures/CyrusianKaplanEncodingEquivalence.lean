module
public import Conjectures.CyrusianKaplanGapCorrespondence

@[expose] public section
namespace CyrusianKaplan

open Finset

/-- The precise two finite sets of size r from the written encoding. -/
structure IntegerEncoding (g r : ℕ) where
  highGaps : Finset ℕ
  lowMembers : Finset ℕ
  highBounds : highGaps⊆Finset.Ioo g (2*g)
  lowBounds : lowMembers⊆Finset.Icc 1 g
  highCard : highGaps.card=r
  lowCard : lowMembers.card=r
  tests : EncodingTests g highGaps lowMembers

abbrev ExactGenusIndexClass (g r : ℕ) :=
  {S : GappedSemigroup // S.genus=g ∧ S.lowMembers.card=r}

theorem GappedSemigroup.eq_of_carrier_eq {S T : GappedSemigroup} (h : S.carrier=T.carrier) :
    S=T := by
  have hg : S.gaps=T.gaps := by
    ext n
    rw [S.mem_gap,T.mem_gap,h]
  cases S
  cases T
  congr

theorem IntegerEncoding.eq_of_parts {g r : ℕ} {A B : IntegerEncoding g r}
    (h₁ : A.highGaps=B.highGaps) (h₂ : A.lowMembers=B.lowMembers) : A=B := by
  cases A
  cases B
  congr

noncomputable def toEncoding {g r : ℕ} (S : ExactGenusIndexClass g r) :
    IntegerEncoding g r where
  highGaps := S.val.highGaps
  lowMembers := S.val.lowMembers
  highBounds := by
    have h := S.val.highGaps_subset
    rwa [S.property.1] at h
  lowBounds := by
    have h := S.val.lowMembers_subset
    rwa [S.property.1] at h
  highCard := S.val.card_highGaps_eq_card_lowMembers.trans S.property.2
  lowCard := S.property.2
  tests := by
    have h := S.val.encodingTests
    rwa [S.property.1] at h

def decoded {g r : ℕ} (E : IntegerEncoding g r) : GappedSemigroup :=
  decodeEncoding g E.highGaps E.lowMembers E.highBounds E.lowBounds E.tests

theorem decoded_genus {g r : ℕ} (E : IntegerEncoding g r) :
    (decoded E).genus=g :=
  decodeEncoding_genus _ _ _ _ _ _ (E.highCard.trans E.lowCard.symm)

theorem decoded_lowMembers {g r : ℕ} (E : IntegerEncoding g r) :
    (decoded E).lowMembers=E.lowMembers := by
  classical
  ext n
  change n∈(Finset.Icc 1 (decoded E).genus).filter
    (fun x=>EncodedMember g E.highGaps E.lowMembers x)↔n∈E.lowMembers
  rw [decoded_genus]
  constructor
  · intro hn
    obtain ⟨hi,hm⟩ := Finset.mem_filter.mp hn
    have hp := Finset.mem_Icc.mp hi
    rcases hm with hz|⟨_,hb⟩|⟨hgt,_⟩
    · omega
    · exact hb
    · omega
  · intro h
    exact Finset.mem_filter.mpr ⟨E.lowBounds h,encodedMember_of_low_mem E.lowBounds h⟩

theorem decoded_highGaps {g r : ℕ} (E : IntegerEncoding g r) :
    (decoded E).highGaps=E.highGaps := by
  ext n
  change n∈((Finset.Icc 1 g\E.lowMembers)∪E.highGaps).filter
    (fun x=>(decoded E).genus<x)↔n∈E.highGaps
  rw [decoded_genus]
  constructor
  · intro hn
    obtain ⟨h,hh⟩ := Finset.mem_filter.mp hn
    rcases Finset.mem_union.mp h with hlo|hhi
    · exact ((not_lt_of_ge (Finset.mem_Icc.mp (Finset.mem_sdiff.mp hlo).1).2) hh).elim
    · exact hhi
  · intro hn
    exact Finset.mem_filter.mpr ⟨Finset.mem_union.mpr (Or.inr hn),
      (Finset.mem_Ioo.mp (E.highBounds hn)).1⟩

/-- A bijection of actual numerical semigroups of genus g and
positive-low-member count r with the admissible finite
encodings, without assuming large genus. -/
noncomputable def exact_genus_index_encoding_equiv (g r : ℕ) :
    ExactGenusIndexClass g r ≃ IntegerEncoding g r where
  toFun := toEncoding
  invFun E := ⟨decoded E,decoded_genus E,(congrArg Finset.card (decoded_lowMembers E)).trans E.lowCard⟩
  left_inv S := by
    apply Subtype.ext
    apply GappedSemigroup.eq_of_carrier_eq
    ext n
    change EncodedMember g S.val.highGaps S.val.lowMembers n↔n∈S.val.carrier
    have h := (S.val.mem_iff_encoded n).symm
    rwa [S.property.1] at h
  right_inv E := IntegerEncoding.eq_of_parts (decoded_highGaps E) (decoded_lowMembers E)

end CyrusianKaplan
