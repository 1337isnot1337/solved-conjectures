module
public import Conjectures.PomeranceSarkozyTruncationSums

@[expose] public section
namespace PomeranceSarkozy

open Finset
open Classical
variable {A : Type*} [DecidableEq A]

def largeSubsets (I : Finset A) (R : ℕ) : Finset (Finset A) :=
  I.powerset.filter fun S => ¬S.card≤R

set_option maxHeartbeats 600000 in
theorem largeAtomMass_le (I : Finset A) (p : Finset A→ℚ) (R : ℕ)
    (hp : ∀ S∈I.powerset,0≤p S) :
    (∑ S ∈ largeSubsets I R,p S) ≤
      ∑ T ∈ I.powersetCard (R+1),lawInclusion I p T := by
  unfold lawInclusion largeSubsets
  rw [Finset.sum_comm (s:=I.powersetCard (R+1)),Finset.sum_filter]
  apply Finset.sum_le_sum
  intro S hS
  by_cases hR : S.card≤R
  · simp only [not_true_eq_false,hR,ite_false]
    apply Finset.sum_nonneg
    intro T _
    split
    · exact hp S hS
    · rfl
  · rw [ite_eq_left hR]
    obtain ⟨T,hTS,hCard⟩ := Finset.exists_subset_card_eq
      (show R+1≤S.card from Nat.succ_le_of_lt (Nat.lt_of_not_ge hR))
    have hTI : T∈I.powersetCard (R+1) :=
      Finset.mem_powersetCard.mpr ⟨hTS.trans (Finset.mem_powerset.mp hS),hCard⟩
    calc
      _ = (if T⊆S then p S else (0:ℚ)) := by rw [ite_eq_left hTS]
      _ ≤ _ := Finset.single_le_sum (s:=I.powersetCard (R+1))
        (f:=fun U : Finset A => if U⊆S then p S else (0:ℚ)) (fun U _ => by
        split
        · exact hp S hS
        · rfl) hTI

set_option maxHeartbeats 1000000 in
/-- Quantitative finite total-variation transfer by truncated
inclusion-exclusion. The left side is twice total variation when the
input weights are probability laws. -/
theorem truncated_inclusion_total_variation (I : Finset A) (p q : Finset A→ℚ)
    (R : ℕ) (ε : ℚ)
    (hp : ∀ S∈I.powerset,0≤p S) (hq : ∀ S∈I.powerset,0≤q S)
    (hinc : ∀ T∈smallSubsets I R,|lawInclusion I p T-lawInclusion I q T|≤ε) :
    (∑ S ∈ I.powerset,|p S-q S|) ≤
      (∑ T ∈ smallSubsets I R,(2:ℚ)^T.card*ε) +
      ((2:ℚ)^(R+1)+1) *
        ((∑ T ∈ I.powersetCard (R+1),lawInclusion I p T) +
          (∑ T ∈ I.powersetCard (R+1),lawInclusion I q T)) := by
  have hf :
      (∑ S ∈ smallSubsets I R,|p S-q S|) ≤
        ∑ S ∈ smallSubsets I R,((recoverRemainder I p S (R-S.card) +
            recoverRemainder I q S (R-S.card)) +
          (((I\S).powerset.filter fun T => T.card≤R-S.card).card:ℚ)*ε) := by
    apply Finset.sum_le_sum
    intro S hS
    obtain ⟨hSI,hSR⟩ := Finset.mem_filter.mp hS
    apply recoverAtom_compare I p q S _ hp hq (Finset.mem_powerset.mp hSI) ε
    intro U hU
    obtain ⟨hUI,hUR⟩ := Finset.mem_filter.mp hU
    have hUsub := (Finset.subset_sdiff.mp (Finset.mem_powerset.mp hUI)).1
    have hcard := disjointExtension_card hUI
    exact hinc _ (Finset.mem_filter.mpr ⟨Finset.mem_powerset.mpr
      (Finset.union_subset (Finset.mem_powerset.mp hSI) hUsub),by omega⟩)
  have hl :
      (∑ S ∈ largeSubsets I R,|p S-q S|) ≤
        (∑ S ∈ largeSubsets I R,p S) + ∑ S ∈ largeSubsets I R,q S := by
    rw [← Finset.sum_add_distrib]
    apply Finset.sum_le_sum
    intro S hS
    have hSI : S∈I.powerset := (Finset.mem_filter.mp hS).1
    have hh := abs_sub_le (p S) 0 (q S)
    simpa [abs_of_nonneg (hp S hSI),abs_of_nonneg (hq S hSI)] using hh
  have hs :
      (∑ S ∈ smallSubsets I R,|p S-q S|)+(∑ S ∈ largeSubsets I R,|p S-q S|) =
        ∑ S ∈ I.powerset,|p S-q S| :=
    Finset.sum_filter_add_sum_filter_not _ _ _
  rw [← hs]
  simp only [Finset.sum_add_distrib,truncatedExtension_sum] at hf
  have he₁ := recoverRemainder_sum_bound I p R hp
  have he₂ := recoverRemainder_sum_bound I q R hq
  have ht₁ := largeAtomMass_le I p R hp
  have ht₂ := largeAtomMass_le I q R hq
  rw [add_mul,mul_add,one_mul]
  linarith

end PomeranceSarkozy
