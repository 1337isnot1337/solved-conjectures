module
public import Conjectures.PomeranceSarkozyBonferroniKernel

@[expose] public section
namespace PomeranceSarkozy

open Finset
open Classical
variable {A : Type*} [DecidableEq A]

omit [DecidableEq A] in
theorem generic_powerset_truncated_alternating (S : Finset A) (r : ℕ) :
    (∑ T ∈ S.powerset with T.card≤r,(-1:ℤ)^T.card) = truncatedAlternatingChoose S.card r := by
  have hf : S.powerset.filter (fun T => T.card≤r) =
      S.powerset.filter (fun T => T.card∈Finset.range (r+1)) := by
    ext T
    simp
  rw [hf,← Finset.sum_fiberwise_eq_sum_filter]
  unfold truncatedAlternatingChoose
  apply Finset.sum_congr rfl
  intro k _
  have hset : S.powerset.filter (fun T => T.card=k) = S.powersetCard k := by
    ext T
    simp
  rw [hset]
  have hmod : (∑ T ∈ S.powersetCard k,(-1:ℤ)^T.card) =
      ∑ T ∈ S.powersetCard k,(-1:ℤ)^k :=
    Finset.sum_congr rfl (fun T ht => by rw [(Finset.mem_powersetCard.mp ht).2])
  rw [hmod,Finset.sum_const,nsmul_eq_mul,Finset.card_powersetCard,mul_comm]

def signedAtomKernel (I S B : Finset A) (r : ℕ) : ℤ :=
  ∑ T ∈ ((I\S).powerset.filter fun T => T.card≤r),
    if S∪T ⊆ B then (-1:ℤ)^T.card else 0

def atomRemainderKernel (I S B : Finset A) (r : ℕ) : ℤ :=
  ∑ T ∈ (I\S).powersetCard (r+1),if S∪T ⊆ B then 1 else 0

theorem signedAtomKernel_of_subset (I S B : Finset A) (r : ℕ)
    (hB : B⊆I) (hS : S⊆B) :
    signedAtomKernel I S B r = truncatedAlternatingChoose (B\S).card r := by
  unfold signedAtomKernel
  rw [← Finset.sum_filter]
  have hf : (((I\S).powerset.filter (fun T => T.card≤r)).filter (fun T => S∪T⊆B)) =
      (B\S).powerset.filter (fun T => T.card≤r) := by
    ext T
    simp only [Finset.mem_filter,Finset.mem_powerset,Finset.union_subset_iff,hS,true_and]
    constructor
    · rintro ⟨⟨hI,hcard⟩,hTB⟩
      exact ⟨Finset.subset_sdiff.mpr ⟨hTB,(Finset.subset_sdiff.mp hI).2⟩,hcard⟩
    · rintro ⟨hBS,hcard⟩
      obtain ⟨hTB,hd⟩ := Finset.subset_sdiff.mp hBS
      exact ⟨⟨Finset.subset_sdiff.mpr ⟨hTB.trans hB,hd⟩,hcard⟩,hTB⟩
  rw [hf,generic_powerset_truncated_alternating]

theorem atomRemainderKernel_of_subset (I S B : Finset A) (r : ℕ)
    (hB : B⊆I) (hS : S⊆B) :
    atomRemainderKernel I S B r = ((B\S).card.choose (r+1):ℤ) := by
  unfold atomRemainderKernel
  rw [← Finset.sum_filter]
  have h : (((I\S).powersetCard (r+1)).filter (fun T => S∪T⊆B)) =
      (B\S).powersetCard (r+1) := by
    ext T
    simp only [Finset.mem_filter,Finset.mem_powersetCard,Finset.union_subset_iff,hS,true_and]
    constructor
    · rintro ⟨⟨hI,hcard⟩,hTB⟩
      exact ⟨Finset.subset_sdiff.mpr ⟨hTB,(Finset.subset_sdiff.mp hI).2⟩,hcard⟩
    · rintro ⟨hBS,hcard⟩
      obtain ⟨hTB,hd⟩ := Finset.subset_sdiff.mp hBS
      exact ⟨⟨Finset.subset_sdiff.mpr ⟨hTB.trans hB,hd⟩,hcard⟩,hTB⟩
  rw [h,Finset.sum_const,Finset.card_powersetCard,nsmul_one]

/-- Exact pointwise error for recovering a single atom from a
truncated family of inclusion indicators. -/
theorem signedAtomKernel_error (I S B : Finset A) (r : ℕ) (hB : B⊆I) :
    |signedAtomKernel I S B r-(if B=S then 1 else 0)| ≤ atomRemainderKernel I S B r := by
  by_cases hS : S⊆B
  · rw [signedAtomKernel_of_subset I S B r hB hS,
      atomRemainderKernel_of_subset I S B r hB hS]
    have hiff : (B\S).card=0 ↔ B=S := by
      rw [Finset.card_eq_zero,Finset.sdiff_eq_empty_iff_subset]
      exact ⟨fun h => le_antisymm h hS,fun he => he.le⟩
    simpa only [hiff] using truncatedAlternatingChoose_error (B\S).card r
  · have hs (T : Finset A) : ¬ S∪T⊆B :=
      fun h => hS (Finset.union_subset_iff.mp h).1
    have hb : B≠S := fun h => hS h.ge
    simp [signedAtomKernel,atomRemainderKernel,hs,hb]

end PomeranceSarkozy
