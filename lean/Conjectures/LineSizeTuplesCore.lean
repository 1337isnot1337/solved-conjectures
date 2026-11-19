import Conjectures.LineSizeTuples
import Conjectures.LineSizeCoreGaps

/-! Extract the unique positive core and finite tail from a canonical tuple. -/
noncomputable section
namespace LineSize

open Finset

def tupleCoreLength (S : Finset ℕ) : ℕ := by
  classical
  exact Nat.find (exists_core_length (tupleAt S) S.card (tupleAt_decreasing S))

theorem tupleCoreLength_spec (S : Finset ℕ) :
    IsCoreLength (tupleAt S) S.card (tupleCoreLength S) := by
  classical
  exact Nat.find_spec (exists_core_length (tupleAt S) S.card (tupleAt_decreasing S))

theorem tupleCoreLength_le_card (S : Finset ℕ) : tupleCoreLength S ≤ S.card :=
  (tupleCoreLength_spec S).1

theorem tupleCoreLength_eq (S : Finset ℕ) (r : ℕ)
    (hr : IsCoreLength (tupleAt S) S.card r) : tupleCoreLength S=r :=
  core_length_unique (tupleAt S) S.card (tupleCoreLength S) r (tupleCoreLength_spec S) hr

theorem tupleCoreLength_zero_iff (S : Finset ℕ) (hS : ∀ s ∈ S, 3 ≤ s) :
    tupleCoreLength S=0 ↔ S=∅ := by
  constructor
  · intro hr
    apply eq_empty_iff_forall_notMem.mpr
    intro s hs
    have hcard : 0 < S.card := card_pos.mpr ⟨s,hs⟩
    have hlo := tupleAt_ge_three S hS 0 hcard
    have hhi := (tupleCoreLength_spec S).2.2 0 (by omega) hcard
    omega
  · rintro rfl
    have hbound := tupleCoreLength_le_card ∅
    simpa only [card_empty,Nat.le_zero] using hbound

theorem tuple_card_eq_small_core (S : Finset ℕ) (hS : ∀ s ∈ S, 3 ≤ s)
    (hr : tupleCoreLength S ≤ 2) : S.card=tupleCoreLength S := by
  have hbound := tupleCoreLength_le_card S
  by_contra hne
  have hlt : tupleCoreLength S < S.card := by omega
  have hlo := tupleAt_ge_three S hS (tupleCoreLength S) hlt
  have hhi := tail_size_le_core_length (tupleAt S) S.card (tupleCoreLength S)
    (tupleAt_decreasing S) (tupleCoreLength_spec S) (tupleCoreLength S) le_rfl hlt
  omega

def tupleCoreVector (S : Finset ℕ) : CoreGaps.CoreVector (tupleCoreLength S) :=
  ⟨fun i => tupleAt S i.val-i.val,by
    have hcore := CoreGaps.positive_core_of_sequence (tupleAt S) S.card
      (tupleCoreLength S) (tupleAt_decreasing S) (tupleCoreLength_spec S)
    constructor
    · intro i hi
      rw [CoreGaps.extend_lt _ _ i hi]
      exact hcore.1 i hi
    · intro i hi
      rw [CoreGaps.extend_lt _ _ (i+1) hi,CoreGaps.extend_lt _ _ i (by omega)]
      exact hcore.2 i hi⟩

theorem tupleCoreVector_extend (S : Finset ℕ) :
    CoreGaps.extend (tupleCoreLength S) (tupleCoreVector S).1=(fun i => tupleAt S i-i) := by
  funext i
  by_cases hi : i < tupleCoreLength S
  · exact CoreGaps.extend_lt _ _ i hi
  · rw [CoreGaps.extend_ge _ _ i (by omega)]
    by_cases hik : i < S.card
    · exact (Nat.sub_eq_zero_of_le ((tupleCoreLength_spec S).2.2 i (by omega) hik)).symm
    · rw [tupleAt_eq_zero_of_ge S i (by omega),Nat.zero_sub]

def tupleRawGaps (S : Finset ℕ) : Fin (tupleCoreLength S) → ℕ :=
  CoreGaps.coreEquiv (tupleCoreLength S) (tupleCoreVector S)

theorem tupleCost_eq_rawGapWeight (S : Finset ℕ) :
    tupleCost S=(tupleCoreLength S)^2+
      ∑ j : Fin (tupleCoreLength S), (j.val+1)*tupleRawGaps S j := by
  calc
    tupleCost S = ∑ i : Fin (tupleCoreLength S), (tupleCoreVector S).1 i := by
      unfold tupleCost
      rw [pointCost_eq_core (tupleAt S) S.card (tupleCoreLength S) (tupleCoreLength_spec S)]
      exact (Fin.sum_univ_eq_sum_range (fun i => tupleAt S i-i) (tupleCoreLength S)).symm
    _ = _ := CoreGaps.coreEquiv_weight (tupleCoreLength S) (tupleCoreVector S)

theorem tupleCoreLength_sq_le_cost (S : Finset ℕ) :
    (tupleCoreLength S)^2 ≤ tupleCost S := by
  rw [tupleCost_eq_rawGapWeight]
  omega

theorem tupleCoreLength_le_cost (S : Finset ℕ) : tupleCoreLength S ≤ tupleCost S := by
  have hsq : tupleCoreLength S ≤ (tupleCoreLength S)^2 := by
    simpa only [pow_two] using Nat.le_mul_self (tupleCoreLength S)
  exact hsq.trans (tupleCoreLength_sq_le_cost S)

def tupleCoreSizes (S : Finset ℕ) : Finset ℕ :=
  (range (tupleCoreLength S)).image (tupleAt S)

def tupleTail (S : Finset ℕ) : Finset ℕ :=
  ((range S.card).filter (fun i => tupleCoreLength S ≤ i)).image (tupleAt S)

theorem mem_tupleCoreSizes (S : Finset ℕ) (s : ℕ) :
    s ∈ tupleCoreSizes S ↔ ∃ i < tupleCoreLength S, tupleAt S i=s := by
  simp only [tupleCoreSizes,mem_image,mem_range]

theorem mem_tupleTail (S : Finset ℕ) (s : ℕ) :
    s ∈ tupleTail S ↔ ∃ i, tupleCoreLength S ≤ i ∧ i < S.card ∧ tupleAt S i=s := by
  simp only [tupleTail,mem_image,mem_filter,mem_range]
  constructor
  · rintro ⟨i,⟨hik,hri⟩,heq⟩
    exact ⟨i,hri,hik,heq⟩
  · rintro ⟨i,hri,hik,heq⟩
    exact ⟨i,⟨hik,hri⟩,heq⟩

theorem tupleCoreSizes_subset (S : Finset ℕ) : tupleCoreSizes S ⊆ S := by
  intro s hs
  obtain ⟨i,hi,rfl⟩ := (mem_tupleCoreSizes S s).mp hs
  exact tupleAt_mem S i (lt_of_lt_of_le hi (tupleCoreLength_le_card S))

theorem tupleTail_subset (S : Finset ℕ) : tupleTail S ⊆ S := by
  intro s hs
  obtain ⟨i,_,hi,rfl⟩ := (mem_tupleTail S s).mp hs
  exact tupleAt_mem S i hi

theorem tupleCoreSizes_union_tail (S : Finset ℕ) : tupleCoreSizes S ∪ tupleTail S=S := by
  apply subset_antisymm
  · exact union_subset (tupleCoreSizes_subset S) (tupleTail_subset S)
  · intro s hs
    obtain ⟨i,hi,heq⟩ := (mem_iff_tupleAt S s).mp hs
    by_cases hir : i < tupleCoreLength S
    · exact mem_union.mpr (Or.inl ((mem_tupleCoreSizes S s).mpr ⟨i,hir,heq⟩))
    · exact mem_union.mpr (Or.inr ((mem_tupleTail S s).mpr ⟨i,by omega,hi,heq⟩))

theorem tupleCoreSizes_disjoint_tail (S : Finset ℕ) :
    Disjoint (tupleCoreSizes S) (tupleTail S) := by
  apply disjoint_left.mpr
  intro s hcore htail
  obtain ⟨i,hi,hei⟩ := (mem_tupleCoreSizes S s).mp hcore
  obtain ⟨j,hrj,hjk,hej⟩ := (mem_tupleTail S s).mp htail
  have hlt := tupleAt_decreasing S i j (by omega) hjk
  omega

theorem tupleCoreSizes_card (S : Finset ℕ) : (tupleCoreSizes S).card=tupleCoreLength S := by
  have hinj : Set.InjOn (tupleAt S) (↑(range (tupleCoreLength S)) : Set ℕ) := by
    intro i hi j hj heq
    exact tupleAt_injective S i j
      (lt_of_lt_of_le (mem_range.mp hi) (tupleCoreLength_le_card S))
      (lt_of_lt_of_le (mem_range.mp hj) (tupleCoreLength_le_card S)) heq
  rw [tupleCoreSizes,card_image_of_injOn hinj,card_range]

theorem tupleTail_card (S : Finset ℕ) : (tupleTail S).card=S.card-tupleCoreLength S := by
  have hcard := card_union_of_disjoint (tupleCoreSizes_disjoint_tail S)
  rw [tupleCoreSizes_union_tail,tupleCoreSizes_card] at hcard
  omega

theorem tupleTail_le_coreLength (S : Finset ℕ) (s : ℕ) (hs : s ∈ tupleTail S) :
    s ≤ tupleCoreLength S := by
  obtain ⟨i,hri,hi,rfl⟩ := (mem_tupleTail S s).mp hs
  exact tail_size_le_core_length (tupleAt S) S.card (tupleCoreLength S)
    (tupleAt_decreasing S) (tupleCoreLength_spec S) i hri hi

theorem tupleCoreSizes_ge_coreLength (S : Finset ℕ) (s : ℕ) (hs : s ∈ tupleCoreSizes S) :
    tupleCoreLength S ≤ s := by
  obtain ⟨i,hi,rfl⟩ := (mem_tupleCoreSizes S s).mp hs
  have hsize := core_size_lower (tupleAt S) S.card (tupleCoreLength S)
    (tupleAt_decreasing S) (tupleCoreLength_spec S) i hi
  omega

theorem tupleTail_lt_coreSizes (S : Finset ℕ) (s t : ℕ)
    (hs : s ∈ tupleTail S) (ht : t ∈ tupleCoreSizes S) : s < t := by
  obtain ⟨i,hri,hi,rfl⟩ := (mem_tupleTail S s).mp hs
  obtain ⟨j,hj,rfl⟩ := (mem_tupleCoreSizes S t).mp ht
  exact tupleAt_decreasing S j i (by omega) hi

def tupleSmallTail (S : Finset ℕ) : Finset ℕ := (tupleTail S).erase (tupleCoreLength S)

def tupleTailBit (S : Finset ℕ) : ℕ := if tupleCoreLength S ∈ tupleTail S then 1 else 0

theorem tupleTailBit_le_one (S : Finset ℕ) : tupleTailBit S ≤ 1 := by
  unfold tupleTailBit
  split <;> omega

theorem tupleSmallTail_subset (S : Finset ℕ) (hS : ∀ s ∈ S, 3 ≤ s) :
    tupleSmallTail S ⊆ Ico 3 (tupleCoreLength S) := by
  intro s hs
  obtain ⟨hne,htail⟩ := mem_erase.mp hs
  have hlo := hS s (tupleTail_subset S htail)
  have hhi := tupleTail_le_coreLength S s htail
  exact mem_Ico.mpr ⟨hlo,by omega⟩

theorem tupleTail_reconstruct (S : Finset ℕ) :
    tupleTail S=if tupleTailBit S=1 then
      insert (tupleCoreLength S) (tupleSmallTail S) else tupleSmallTail S := by
  by_cases h : tupleCoreLength S ∈ tupleTail S <;> simp [tupleTailBit,tupleSmallTail,h]

def tupleGapAt (S : Finset ℕ) (i : ℕ) : ℕ :=
  CoreGaps.gaps (tupleCoreLength S) (fun j => tupleAt S j-j) i

theorem tupleRawGaps_apply (S : Finset ℕ) (i : Fin (tupleCoreLength S)) :
    tupleRawGaps S i=tupleGapAt S i.val := by
  change CoreGaps.gaps (tupleCoreLength S)
    (CoreGaps.extend (tupleCoreLength S) (tupleCoreVector S).1) i.val=
      CoreGaps.gaps (tupleCoreLength S) (fun j => tupleAt S j-j) i.val
  rw [tupleCoreVector_extend]

theorem tupleGapAt_eq_zero_of_ge (S : Finset ℕ) (i : ℕ) (hi : tupleCoreLength S ≤ i) :
    tupleGapAt S i=0 := CoreGaps.gaps_of_ge _ _ i hi

theorem tupleRawGaps_extend (S : Finset ℕ) :
    CoreGaps.extend (tupleCoreLength S) (tupleRawGaps S)=tupleGapAt S := by
  funext i
  by_cases hi : i < tupleCoreLength S
  · rw [CoreGaps.extend_lt _ _ i hi]
    exact tupleRawGaps_apply S ⟨i,hi⟩
  · rw [CoreGaps.extend_ge _ _ i (by omega),tupleGapAt_eq_zero_of_ge S i (by omega)]

theorem tupleGapAt_last (S : Finset ℕ) (hr : 0 < tupleCoreLength S) :
    tupleGapAt S (tupleCoreLength S-1)=
      tupleAt S (tupleCoreLength S-1)-tupleCoreLength S := by
  unfold tupleGapAt
  simp only [CoreGaps.gaps,ite_eq_right (show ¬tupleCoreLength S-1+1 < tupleCoreLength S by omega),
    ite_eq_left (show tupleCoreLength S-1 < tupleCoreLength S by omega)]
  omega

theorem tupleTailBit_le_lastGap (S : Finset ℕ) (hr : 0 < tupleCoreLength S) :
    tupleTailBit S ≤ tupleGapAt S (tupleCoreLength S-1) := by
  rw [tupleGapAt_last S hr]
  by_cases h : tupleCoreLength S ∈ tupleTail S
  · rw [tupleTailBit,ite_eq_left h]
    obtain ⟨i,hri,hi,heq⟩ := (mem_tupleTail S (tupleCoreLength S)).mp h
    have hdrop := tupleAt_decreasing S (tupleCoreLength S-1) i (by omega) hi
    omega
  · rw [tupleTailBit,ite_eq_right h]
    exact Nat.zero_le _

def tupleReducedGaps (S : Finset ℕ) : Fin (tupleCoreLength S) → ℕ :=
  CoreGaps.restrict (tupleCoreLength S)
    (CoreGaps.lowerLast (tupleCoreLength S) (tupleTailBit S) (tupleGapAt S))

theorem tupleReducedGaps_extend (S : Finset ℕ) :
    CoreGaps.extend (tupleCoreLength S) (tupleReducedGaps S)=
      CoreGaps.lowerLast (tupleCoreLength S) (tupleTailBit S) (tupleGapAt S) := by
  apply CoreGaps.extend_restrict
  intro i hi
  rw [CoreGaps.lowerLast,ite_eq_right (show ¬i+1=tupleCoreLength S by omega),
    tupleGapAt_eq_zero_of_ge S i hi]

theorem tupleRawGap_reconstruct (S : Finset ℕ) (hr : 0 < tupleCoreLength S) :
    CoreGaps.bumpLast (tupleCoreLength S) (tupleTailBit S)
      (CoreGaps.extend (tupleCoreLength S) (tupleReducedGaps S))=tupleGapAt S := by
  rw [tupleReducedGaps_extend]
  exact CoreGaps.bump_lower _ _ _ (tupleTailBit_le_lastGap S hr)

theorem weighted_extend (r : ℕ) (z : Fin r → ℕ) :
    (∑ j ∈ range r, (j+1)*CoreGaps.extend r z j)=∑ j : Fin r, (j.val+1)*z j := by
  rw [← Fin.sum_univ_eq_sum_range]
  apply sum_congr rfl
  intro j _
  rw [CoreGaps.extend_lt r z j.val j.isLt]

theorem tupleCost_eq_shiftedGapWeight (S : Finset ℕ) (hr : 0 < tupleCoreLength S) :
    tupleCost S=(tupleCoreLength S)^2+tupleCoreLength S*tupleTailBit S+
      ∑ j : Fin (tupleCoreLength S), (j.val+1)*tupleReducedGaps S j := by
  have hcost : tupleCost S=(tupleCoreLength S)^2+
      ∑ j ∈ range (tupleCoreLength S), (j+1)*tupleGapAt S j :=
    CoreGaps.pointCost_eq_gapWeight (tupleAt S) S.card (tupleCoreLength S)
      (tupleAt_decreasing S) (tupleCoreLength_spec S)
  rw [← tupleRawGap_reconstruct S hr,CoreGaps.weighted_bump,weighted_extend] at hcost
  omega

end LineSize
