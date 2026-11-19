import Conjectures.LonelinessFiveSpeedRootSemanticsDefs
import Conjectures.LonelinessFiveSpeedRelationDefs

/-! The exact map from modular short forms to the fifty mixed-sign integer
relations. The positive integer lift excludes the thirty all-positive rows;
the modular checker continues to use all eighty. -/

namespace Loneliness.FiveSpeedRoot

open scoped BigOperators
open Matrix
open Loneliness.FiveSpeedCertificate

def relationFormIndex : Fin 50 → Fin 80 :=
  ![0, 2, 4, 5, 6, 7, 9, 12, 13, 16, 17, 18, 19, 20, 21, 22, 23, 24,
    26, 29, 30, 34, 35, 36, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50,
    51, 52, 53, 54, 55, 57, 60, 61, 65, 66, 67, 72, 73, 74, 75]

set_option maxRecDepth 10000 in
set_option maxHeartbeats 0 in
private theorem relationFormIndex_checked :
    ∀ a : Fin 50, ∀ i : Fin 5, formRows (relationFormIndex a) i = relationRows a i := by
  decide +kernel

theorem relationFormIndex_spec (a : Fin 50) :
    formRows (relationFormIndex a) = relationRows a :=
  funext (relationFormIndex_checked a)

set_option maxRecDepth 10000 in
set_option maxHeartbeats 0 in
theorem relationFormIndex_injective : Function.Injective relationFormIndex := by
  change ∀ a b : Fin 50, relationFormIndex a = relationFormIndex b → a = b
  decide +kernel

set_option maxRecDepth 10000 in
set_option maxHeartbeats 0 in
theorem mixed_form_index_iff (a : Fin 80) :
    (∃ i : Fin 5, formRows a i < 0) ↔ ∃ b : Fin 50, a = relationFormIndex b := by
  revert a
  decide +kernel

theorem relationRows_canonical (a : Fin 50) : CanonicalForm (relationRows a) := by
  rw [← relationFormIndex_spec a]
  exact formRows_spec _

theorem relationRows_injective : Function.Injective relationRows := by
  intro a b h
  apply relationFormIndex_injective
  apply formRows_injective
  simpa only [relationFormIndex_spec] using h

theorem relationRows_eq_up_to_sign_iff (a b : Fin 50) :
    relationRows a = relationRows b ∨ relationRows a = -relationRows b ↔ a = b := by
  rw [← relationFormIndex_spec a, ← relationFormIndex_spec b,
    formRows_eq_up_to_sign_iff, relationFormIndex_injective.eq_iff]

set_option maxRecDepth 10000 in
set_option maxHeartbeats 0 in
private theorem relationRows_as_additive_checked :
    ∀ a : Fin 50, ∃ i j k : Fin 5, i ≠ k ∧ j ≠ k ∧
      ((∀ m, relationRows a m = additiveRelation i j k m) ∨
       (∀ m, relationRows a m = -(additiveRelation i j k m))) := by
  decide +kernel

theorem relationRows_as_additive (a : Fin 50) :
    ∃ i j k : Fin 5, i ≠ k ∧ j ≠ k ∧
      (relationRows a = additiveRelation i j k ∨ relationRows a = -additiveRelation i j k) := by
  obtain ⟨i, j, k, hik, hjk, h | h⟩ := relationRows_as_additive_checked a
  · exact ⟨i, j, k, hik, hjk, Or.inl (funext h)⟩
  · exact ⟨i, j, k, hik, hjk, Or.inr (funext h)⟩

theorem zero_relation_additive (a : Fin 50) (v : Speeds)
    (hzero : dot (relationRows a) v = 0) :
    ∃ i j k : Fin 5, i ≠ k ∧ j ≠ k ∧ v i + v j = v k ∧
      (relationRows a = additiveRelation i j k ∨ relationRows a = -additiveRelation i j k) := by
  obtain ⟨i, j, k, hik, hjk, hrow⟩ := relationRows_as_additive a
  have hZ : (v i : ℤ) + (v j : ℤ) - (v k : ℤ) = 0 := by
    have h := hzero
    change relationRows a ⬝ᵥ (fun m => (v m : ℤ)) = 0 at h
    rcases hrow with heq | heq
    · rw [heq, additiveRelation_dotProduct] at h
      exact h
    · rw [heq, neg_dotProduct, additiveRelation_dotProduct, neg_eq_zero] at h
      exact h
  refine ⟨i, j, k, hik, hjk, ?_, hrow⟩
  have heq : (v i : ℤ) + (v j : ℤ) = (v k : ℤ) := sub_eq_zero.mp hZ
  exact_mod_cast heq

theorem dot_natAbs_le_weight (r : Row) (v : Speeds) (C : ℕ)
    (hv : ∀ i, v i ≤ C) : (dot r v).natAbs ≤ C * coefficientWeight r := by
  calc
    (dot r v).natAbs ≤ ∑ i, (r i * (v i : ℤ)).natAbs := Int.natAbs_sum_le _ _
    _ ≤ ∑ i, (r i).natAbs * C := by
      apply Finset.sum_le_sum
      intro i _
      rw [Int.natAbs_mul, Int.natAbs_natCast]
      exact Nat.mul_le_mul_left _ (hv i)
    _ = C * coefficientWeight r := by
      rw [← Finset.sum_mul, Nat.mul_comm]
      rfl

theorem form_dot_natAbs_le_three_mul (a : Fin 80) (v : Speeds) (C : ℕ)
    (hv : ∀ i, v i ≤ C) : (dot (formRows a) v).natAbs ≤ 3 * C := by
  have hweight : coefficientWeight (formRows a) = 3 := (formRows_spec a).1.1
  simpa only [hweight, Nat.mul_comm] using dot_natAbs_le_weight (formRows a) v C hv

theorem form_dot_pos_of_nonnegative (a : Fin 80) (v : Speeds)
    (hv : ∀ i, 0 < v i) (hr : ∀ i, 0 ≤ formRows a i) :
    0 < dot (formRows a) v := by
  obtain ⟨i, hi, _⟩ := (formRows_spec a).2
  have hvZ (j : Fin 5) : (0 : ℤ) < v j := by exact_mod_cast hv j
  apply Finset.sum_pos'
  · intro j _
    exact mul_nonneg (hr j) (hvZ j).le
  · exact ⟨i, Finset.mem_univ _, mul_pos hi (hvZ i)⟩

theorem zero_form_has_negative (a : Fin 80) (v : Speeds)
    (hv : ∀ i, 0 < v i) (hzero : dot (formRows a) v = 0) :
    ∃ i : Fin 5, formRows a i < 0 := by
  by_contra hnone
  have hnonneg : ∀ i, 0 ≤ formRows a i := by
    intro i
    exact le_of_not_gt (fun hi => hnone ⟨i, hi⟩)
  have hpos := form_dot_pos_of_nonnegative a v hv hnonneg
  rw [hzero] at hpos
  exact (lt_irrefl (0 : ℤ)) hpos

theorem zero_form_relation_index (a : Fin 80) (v : Speeds)
    (hv : ∀ i, 0 < v i) (hzero : dot (formRows a) v = 0) :
    ∃ b : Fin 50, a = relationFormIndex b ∧ dot (relationRows b) v = 0 := by
  obtain ⟨b, hb⟩ := (mixed_form_index_iff a).mp (zero_form_has_negative a v hv hzero)
  refine ⟨b, hb, ?_⟩
  simpa only [hb, relationFormIndex_spec] using hzero

theorem zero_form_additive (a : Fin 80) (v : Speeds)
    (hv : ∀ i, 0 < v i) (hzero : dot (formRows a) v = 0) :
    ∃ i j k : Fin 5, i ≠ k ∧ j ≠ k ∧ v i + v j = v k ∧
      (formRows a = additiveRelation i j k ∨ formRows a = -additiveRelation i j k) := by
  obtain ⟨b, hb, hbzero⟩ := zero_form_relation_index a v hv hzero
  obtain ⟨i, j, k, hik, hjk, hsum, hrow⟩ := zero_relation_additive b v hbzero
  refine ⟨i, j, k, hik, hjk, hsum, ?_⟩
  simpa only [hb, relationFormIndex_spec] using hrow

theorem two_zero_forms_give_two_integer_relations (a b : Fin 80) (hab : a ≠ b)
    (v : Speeds) (hv : ∀ i, 0 < v i)
    (ha : dot (formRows a) v = 0) (hb : dot (formRows b) v = 0) :
    ∃ c d : Fin 50, c ≠ d ∧
      dot (relationRows c) v = 0 ∧ dot (relationRows d) v = 0 := by
  obtain ⟨c, hc, hczero⟩ := zero_form_relation_index a v hv ha
  obtain ⟨d, hd, hdzero⟩ := zero_form_relation_index b v hv hb
  refine ⟨c, d, ?_, hczero, hdzero⟩
  intro hcd
  exact hab (hc.trans ((congrArg relationFormIndex hcd).trans hd.symm))

theorem two_zero_forms_give_relation_matrix (a b : Fin 80) (hab : a ≠ b)
    (v : Speeds) (hv : ∀ i, 0 < v i)
    (ha : dot (formRows a) v = 0) (hb : dot (formRows b) v = 0) :
    ∃ c d : Fin 50, c ≠ d ∧
      Matrix.mulVec (pairRelations c d) (fun i => (v i : ℤ)) = 0 := by
  obtain ⟨c, d, hcd, hc, hd⟩ := two_zero_forms_give_two_integer_relations a b hab v hv ha hb
  refine ⟨c, d, hcd, ?_⟩
  funext i
  fin_cases i
  · change dot (relationRows c) v = 0
    exact hc
  · change dot (relationRows d) v = 0
    exact hd

end Loneliness.FiveSpeedRoot
