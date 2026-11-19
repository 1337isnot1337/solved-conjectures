import Conjectures.LonelinessFiveSpeedRelationData
import Mathlib.Tactic.FinCases

/-! Soundness of the finite relation certificates. The certificates give
integer matrix identities and signed coordinate selectors. -/

namespace Loneliness.FiveSpeedCertificate

open Matrix
open scoped Matrix

def additiveRelation (i j k : Fin 5) : FiveIntegerVector :=
  Pi.single i 1 + Pi.single j 1 - Pi.single k 1

theorem additiveRelation_dotProduct (i j k : Fin 5) (v : FiveIntegerVector) :
    additiveRelation i j k ⬝ᵥ v = v i + v j - v k := by
  simp [additiveRelation, add_dotProduct, sub_dotProduct, single_dotProduct]

set_option maxRecDepth 8192 in
set_option maxHeartbeats 0 in
theorem relationRows_cover_additive : ∀ i j k : Fin 5, i ≠ k → j ≠ k →
    ∃ a : Fin 50,
      (∀ m, relationRows a m = additiveRelation i j k m) ∨
      (∀ m, relationRows a m = -(additiveRelation i j k m)) := by
  decide +kernel

set_option maxRecDepth 8192 in
set_option maxHeartbeats 0 in
theorem relationRows_entrywise_injective : ∀ a b : Fin 50,
    (∀ i, relationRows a i = relationRows b i) → a = b := by
  decide +kernel

theorem relationRows_injective : Function.Injective relationRows := by
  intro a b hab
  exact relationRows_entrywise_injective a b (congrFun hab)

theorem additive_relation_covered (i j k : Fin 5) (hik : i ≠ k) (hjk : j ≠ k)
    (v : FiveIntegerVector) (hrelation : v i + v j - v k = 0) :
    ∃ a : Fin 50, relationRows a ⬝ᵥ v = 0 := by
  obtain ⟨a, h | h⟩ := relationRows_cover_additive i j k hik hjk
  · refine ⟨a, ?_⟩
    rw [show relationRows a = additiveRelation i j k from funext h,
      additiveRelation_dotProduct, hrelation]
  · refine ⟨a, ?_⟩
    rw [show relationRows a = -additiveRelation i j k from funext h,
      neg_dotProduct, additiveRelation_dotProduct, hrelation, neg_zero]

structure SignedCanonicalMap where
  index : Fin 9
  permutation : Fin 5 → Fin 5
  negative : Fin 5 → Bool

def transformedMap (s : SignedCanonicalMap) : ThreeParameterMap :=
  fun i j => (if s.negative i then (-1 : ℤ) else 1) *
    canonicalMaps s.index (s.permutation i) j

inductive RelationCaseCertificate where
  | image (signed : SignedCanonicalMap) (payload : ProjectionPayload)
      (selector : UnitRowSelector)
  | zero (coordinate : Fin 5) (payload : RowSpanPayload)
  | repeated (left right : Fin 5) (negative : Bool) (payload : RowSpanPayload)

def relationCaseCheck (C : TwoRelationMatrix) : RelationCaseCertificate → Bool
  | .image signed payload selector =>
      decide (∀ i j, signed.permutation i = signed.permutation j → i = j) &&
        (projectionCheck (transformedMap signed) C payload &&
          unitRowsCheck (transformedMap signed) selector)
  | .zero coordinate payload =>
      rowSpanCheck C (coordinateRow coordinate) payload
  | .repeated left right negative payload =>
      decide (left ≠ right) &&
        rowSpanCheck C (signedPairRow left right (if negative then -1 else 1)) payload

def RelationImage (v : FiveIntegerVector) (B : ℤ) : Prop :=
  ∃ (signed : SignedCanonicalMap) (u : ThreeIntegerVector),
    Function.Injective signed.permutation ∧
    transformedMap signed *ᵥ u = v ∧ ∀ j, |u j| ≤ B

theorem relationCaseCheck_sound (C : TwoRelationMatrix)
    (certificate : RelationCaseCertificate)
    (hcheck : relationCaseCheck C certificate = true)
    (v : FiveIntegerVector) (hrelations : C *ᵥ v = 0)
    (hnonzero : ∀ i, v i ≠ 0)
    (hdistinct : ∀ i j, i ≠ j → |v i| ≠ |v j|)
    (B : ℤ) (hbound : ∀ i, |v i| ≤ B) : RelationImage v B := by
  cases certificate with
  | image signed payload selector =>
      have hc : (∀ i j, signed.permutation i = signed.permutation j → i = j) ∧
          projectionCheck (transformedMap signed) C payload = true ∧
          unitRowsCheck (transformedMap signed) selector = true := by
        simpa only [relationCaseCheck, Bool.and_eq_true, decide_eq_true_eq] using hcheck
      exact ⟨signed, selectedParameters selector v, hc.1,
        projectionCheck_exact (transformedMap signed) C payload selector hc.2.1 hc.2.2
          v hrelations,
        selectedParameters_abs_le selector v B hbound⟩
  | zero coordinate payload =>
      exact (hnonzero coordinate (rowSpanCheck_coordinate_zero C coordinate payload
        hcheck v hrelations)).elim
  | repeated left right negative payload =>
      have hc : left ≠ right ∧
          rowSpanCheck C (signedPairRow left right (if negative then -1 else 1))
            payload = true := by
        simpa only [relationCaseCheck, Bool.and_eq_true, decide_eq_true_eq] using hcheck
      have hsign : (if negative then (-1 : ℤ) else 1) = 1 ∨
          (if negative then (-1 : ℤ) else 1) = -1 := by
        cases negative <;> simp
      exact (hdistinct left right hc.1 (rowSpanCheck_signedPair_abs_eq C left right
        (if negative then -1 else 1) hsign payload hc.2 v hrelations)).elim

theorem pairRelations_mulVec (a b : Fin 50) (v : FiveIntegerVector)
    (ha : relationRows a ⬝ᵥ v = 0) (hb : relationRows b ⬝ᵥ v = 0) :
    pairRelations a b *ᵥ v = 0 := by
  ext i
  fin_cases i
  · simpa [pairRelations, Matrix.mulVec] using ha
  · simpa [pairRelations, Matrix.mulVec] using hb

end Loneliness.FiveSpeedCertificate
