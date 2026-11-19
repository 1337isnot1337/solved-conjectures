import Conjectures.LonelinessFiveSpeedRelationCertificate

/-! Complete reduction of two different catalogue relations, and of the
distinguished 1:3:4 triple, to the nine three-parameter maps. -/

namespace Loneliness.FiveSpeedCertificate

open Matrix
open scoped Matrix

theorem two_relations_to_nine_maps (a b : Fin 50) (hab : a ≠ b)
    (v : FiveIntegerVector)
    (ha : relationRows a ⬝ᵥ v = 0) (hb : relationRows b ⬝ᵥ v = 0)
    (hnonzero : ∀ i, v i ≠ 0)
    (hdistinct : ∀ i j, i ≠ j → |v i| ≠ |v j|)
    (B : ℤ) (hbound : ∀ i, |v i| ≤ B) : RelationImage v B := by
  rcases lt_or_gt_of_ne hab with hlt | hgt
  · obtain ⟨certificate, hcheck⟩ := every_relation_pair_checked a b hlt
    exact relationCaseCheck_sound (pairRelations a b) certificate hcheck v
      (pairRelations_mulVec a b v ha hb) hnonzero hdistinct B hbound
  · obtain ⟨certificate, hcheck⟩ := every_relation_pair_checked b a hgt
    exact relationCaseCheck_sound (pairRelations b a) certificate hcheck v
      (pairRelations_mulVec b a v hb ha) hnonzero hdistinct B hbound

theorem special134_to_nine_maps (v : FiveIntegerVector)
    (hrelations : special134Relations *ᵥ v = 0)
    (hnonzero : ∀ i, v i ≠ 0)
    (hdistinct : ∀ i j, i ≠ j → |v i| ≠ |v j|)
    (B : ℤ) (hbound : ∀ i, |v i| ≤ B) : RelationImage v B :=
  relationCaseCheck_sound special134Relations relationCertificate134
    relationCertificate134_checked v hrelations hnonzero hdistinct B hbound

end Loneliness.FiveSpeedCertificate
