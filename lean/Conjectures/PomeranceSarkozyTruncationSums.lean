module
public import Conjectures.PomeranceSarkozySubsetPairs

@[expose] public section
namespace PomeranceSarkozy

open Finset
open Classical
variable {A : Type*} [DecidableEq A]

def smallSubsets (I : Finset A) (R : ℕ) : Finset (Finset A) :=
  I.powerset.filter fun S => S.card≤R

theorem disjointExtension_card {I S U : Finset A} (h : U ∈ (I\S).powerset) :
    (S∪U).card=S.card+U.card :=
  Finset.card_union_of_disjoint ((Finset.subset_sdiff.mp (Finset.mem_powerset.mp h)).2.symm)

theorem truncatedExtension_sum (I : Finset A) (R : ℕ) (ε : ℚ) :
    (∑ S ∈ smallSubsets I R,
      (((I\S).powerset.filter fun T => T.card≤R-S.card).card:ℚ)*ε) =
      ∑ T ∈ smallSubsets I R,(2:ℚ)^T.card*ε := by
  calc
    _ = ∑ S ∈ I.powerset,∑ U ∈ (I\S).powerset,if (S∪U).card≤R then ε else 0 := by
      unfold smallSubsets
      rw [Finset.sum_filter]
      apply Finset.sum_congr rfl
      intro S _
      by_cases hS : S.card≤R
      · rw [ite_eq_left hS,← nsmul_eq_mul,← Finset.sum_const,Finset.sum_filter]
        apply Finset.sum_congr rfl
        intro U hU
        have hcard := disjointExtension_card hU
        have hiff : U.card≤R-S.card ↔ (S∪U).card≤R := by omega
        simp only [hiff]
      · rw [ite_eq_right hS]
        symm
        apply Finset.sum_eq_zero
        intro U hU
        have hcard := disjointExtension_card hU
        exact ite_eq_right (by omega)
    _ = ∑ T ∈ I.powerset,∑ S ∈ T.powerset,if T.card≤R then ε else 0 :=
       sum_disjointExtensions I (fun T _ => if T.card≤R then ε else 0)
    _ = _ := by
      unfold smallSubsets
      rw [Finset.sum_filter]
      apply Finset.sum_congr rfl
      intro T _
      by_cases h : T.card≤R
      · simp [h,Finset.card_powerset,nsmul_eq_mul,Nat.cast_pow]
      · simp [h]

theorem lawInclusion_nonneg (I : Finset A) (p : Finset A→ℚ)
    (hp : ∀ B∈I.powerset,0≤p B) (T : Finset A) :
    0≤lawInclusion I p T := by
  unfold lawInclusion
  apply Finset.sum_nonneg
  intro B hB
  split
  · exact hp B hB
  · rfl

theorem recoverRemainder_sum_bound (I : Finset A) (p : Finset A→ℚ) (R : ℕ)
    (hp : ∀ B∈I.powerset,0≤p B) :
    (∑ S ∈ smallSubsets I R,recoverRemainder I p S (R-S.card)) ≤
      (2:ℚ)^(R+1)*∑ T ∈ I.powersetCard (R+1),lawInclusion I p T := by
  calc
    _ = ∑ S ∈ I.powerset,∑ U ∈ (I\S).powerset,
          if (S∪U).card=R+1 ∧ S.card≤R then lawInclusion I p (S∪U) else 0 := by
      unfold smallSubsets
      rw [Finset.sum_filter]
      apply Finset.sum_congr rfl
      intro S _
      by_cases hS : S.card≤R
      · rw [ite_eq_left hS,recoverRemainder,Finset.powersetCard_eq_filter,Finset.sum_filter]
        apply Finset.sum_congr rfl
        intro U hU
        have hcard := disjointExtension_card hU
        have hiff : U.card=R-S.card+1 ↔ (S∪U).card=R+1 := by omega
        simp only [hiff,hS,and_true]
      · simp [hS]
    _ = ∑ T ∈ I.powerset,∑ S ∈ T.powerset,
            if T.card=R+1 ∧ S.card≤R then lawInclusion I p T else 0 :=
      sum_disjointExtensions I (fun T S => if T.card=R+1 ∧ S.card≤R then lawInclusion I p T else 0)
    _ ≤ ∑ T ∈ I.powerset,if T.card=R+1 then (2:ℚ)^(R+1)*lawInclusion I p T else 0 := by
      apply Finset.sum_le_sum
      intro T _
      by_cases hT : T.card=R+1
      · rw [ite_eq_left hT]
        calc
          _ ≤ ∑ S ∈ T.powerset,lawInclusion I p T := by
            apply Finset.sum_le_sum
            intro S _
            split
            · rfl
            · exact lawInclusion_nonneg I p hp T
          _ = _ := by simp [Finset.card_powerset,hT,nsmul_eq_mul,Nat.cast_pow]
      · simp [hT]
    _ = _ := by rw [← Finset.sum_filter,← Finset.powersetCard_eq_filter,Finset.mul_sum]

end PomeranceSarkozy
