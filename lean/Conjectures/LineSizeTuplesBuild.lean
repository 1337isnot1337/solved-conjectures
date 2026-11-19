import Conjectures.LineSizeTuplesCore
import Conjectures.LineSizeTuplesList

/-! Reconstruct a strictly decreasing tuple from a positive core and a
smaller tail. The core length, tail, and cost are recovered exactly. -/
noncomputable section
namespace LineSize.TupleBuild

open Finset

theorem positiveCore_drop (r : ℕ) (y : ℕ → ℕ) (hy : CoreGaps.IsPositiveCore r y)
    (i n : ℕ) (hin : i+n < r) : y (i+n)+2*n ≤ y i := by
  induction n with
  | zero => simp
  | succ n ih =>
    have hprev := ih (by omega)
    have hstep : y (i+(n+1))+2 ≤ y (i+n) := by
      simpa only [Nat.add_assoc] using hy.2 (i+n) (by omega)
    omega

def coreAt (r : ℕ) (z : ℕ → ℕ) (i : ℕ) : ℕ := CoreGaps.fromGaps r z i+i

theorem coreAt_decreasing (r : ℕ) (z : ℕ → ℕ) : Decreasing (coreAt r z) r := by
  intro i j hij hj
  have hdrop := positiveCore_drop r (CoreGaps.fromGaps r z)
    (CoreGaps.fromGaps_positive r z) i (j-i) (by omega)
  rw [show i+(j-i)=j by omega] at hdrop
  unfold coreAt
  omega

theorem coreAt_positive (r : ℕ) (z : ℕ → ℕ) (i : ℕ) (hi : i < r) : i < coreAt r z i := by
  have hpos := (CoreGaps.fromGaps_positive r z).1 i hi
  unfold coreAt
  omega

theorem coreAt_last (r : ℕ) (z : ℕ → ℕ) : coreAt (r+1) z r=r+1+z r := by
  rw [coreAt,CoreGaps.fromGaps_last]
  omega

theorem coreAt_lower (r : ℕ) (z : ℕ → ℕ) (i : ℕ) (hi : i < r) :
    r+z (r-1) ≤ coreAt r z i := by
  cases r with
  | zero => omega
  | succ r =>
    change r+1+z r ≤ coreAt (r+1) z i
    by_cases hir : i=r
    · subst i
      exact (coreAt_last r z).symm.le
    · have hlast := coreAt_last r z
      have hdrop := coreAt_decreasing (r+1) z i r (by omega) (by omega)
      omega

theorem coreAt_bump_lower (r b : ℕ) (z : ℕ → ℕ) (i : ℕ) (hi : i < r) :
    r+b ≤ coreAt r (CoreGaps.bumpLast r b z) i := by
  have hbound := coreAt_lower r (CoreGaps.bumpLast r b z) i hi
  rw [CoreGaps.bumpLast,ite_eq_left (show r-1+1=r by omega)] at hbound
  omega

def coreList (r : ℕ) (z : ℕ → ℕ) : List ℕ := List.ofFn (fun i : Fin r => coreAt r z i.val)

@[simp] theorem coreList_length (r : ℕ) (z : ℕ → ℕ) : (coreList r z).length=r := by
  simp [coreList]

theorem coreList_sortedGT (r : ℕ) (z : ℕ → ℕ) : (coreList r z).SortedGT :=
  ofFn_sortedGT_of_decreasing (coreAt r z) r (coreAt_decreasing r z)

theorem coreList_getD (r : ℕ) (z : ℕ → ℕ) (i : ℕ) (hi : i < r) :
    (coreList r z).getD i 0=coreAt r z i := ofFn_getD (coreAt r z) r i hi

theorem mem_coreList (r : ℕ) (z : ℕ → ℕ) (s : ℕ) :
    s ∈ coreList r z ↔ ∃ i < r, coreAt r z i=s := by
  constructor
  · intro hs
    obtain ⟨i,heq⟩ := List.mem_ofFn.mp hs
    exact ⟨i.val,i.isLt,heq⟩
  · rintro ⟨i,hi,heq⟩
    exact List.mem_ofFn.mpr ⟨⟨i,hi⟩,heq⟩

def assemble (r : ℕ) (z : ℕ → ℕ) (T : Finset ℕ) : Finset ℕ :=
  (coreList r z++tupleValues T).toFinset

def Separated (r : ℕ) (z : ℕ → ℕ) (T : Finset ℕ) : Prop :=
  ∀ i < r, ∀ s ∈ T, s < coreAt r z i

theorem assemble_sorted (r : ℕ) (z : ℕ → ℕ) (T : Finset ℕ) (hsep : Separated r z T) :
    (coreList r z++tupleValues T).SortedGT := by
  apply List.sortedGT_append.mpr
  refine ⟨coreList_sortedGT r z,T.sortedGT_sort,?_⟩
  intro s hs t ht
  obtain ⟨i,hi,rfl⟩ := (mem_coreList r z s).mp hs
  exact hsep i hi t ((mem_tupleValues T t).mp ht)

theorem tupleValues_assemble (r : ℕ) (z : ℕ → ℕ) (T : Finset ℕ)
    (hsep : Separated r z T) : tupleValues (assemble r z T)=coreList r z++tupleValues T :=
  tupleValues_eq_of_sortedGT _ (assemble_sorted r z T hsep)

theorem assemble_card (r : ℕ) (z : ℕ → ℕ) (T : Finset ℕ) (hsep : Separated r z T) :
    (assemble r z T).card=r+T.card := by
  rw [assemble,List.toFinset_card_of_nodup (assemble_sorted r z T hsep).nodup,
    List.length_append,coreList_length,tupleValues_length]

theorem tupleAt_assemble_prefix (r : ℕ) (z : ℕ → ℕ) (T : Finset ℕ)
    (hsep : Separated r z T) (i : ℕ) (hi : i < r) :
    tupleAt (assemble r z T) i=coreAt r z i := by
  exact (tupleAt_append_left _ _ (assemble_sorted r z T hsep) i
    (by simpa only [coreList_length] using hi)).trans (coreList_getD r z i hi)

theorem tupleAt_assemble_tail (r : ℕ) (z : ℕ → ℕ) (T : Finset ℕ)
    (hsep : Separated r z T) (i : ℕ) (hi : r ≤ i) :
    tupleAt (assemble r z T) i=tupleAt T (i-r) := by
  change tupleAt (coreList r z++tupleValues T).toFinset i=(tupleValues T).getD (i-r) 0
  simpa only [coreList_length] using tupleAt_append_right _ _
    (assemble_sorted r z T hsep) i (by simpa only [coreList_length] using hi)

theorem assemble_core_spec (r : ℕ) (z : ℕ → ℕ) (T : Finset ℕ)
    (hsep : Separated r z T) (htail : ∀ s ∈ T, s ≤ r) :
    IsCoreLength (tupleAt (assemble r z T)) (assemble r z T).card r := by
  refine ⟨?_,?_,?_⟩
  · rw [assemble_card r z T hsep]
    omega
  · intro i hi
    rw [tupleAt_assemble_prefix r z T hsep i hi]
    exact coreAt_positive r z i hi
  · intro i hri hi
    have hindex : i-r < T.card := by
      rw [assemble_card r z T hsep] at hi
      omega
    rw [tupleAt_assemble_tail r z T hsep i hri]
    exact (htail _ (tupleAt_mem T (i-r) hindex)).trans hri

theorem tupleCoreLength_assemble (r : ℕ) (z : ℕ → ℕ) (T : Finset ℕ)
    (hsep : Separated r z T) (htail : ∀ s ∈ T, s ≤ r) : tupleCoreLength (assemble r z T)=r :=
  tupleCoreLength_eq _ r (assemble_core_spec r z T hsep htail)

theorem tupleCost_assemble (r : ℕ) (z : ℕ → ℕ) (T : Finset ℕ)
    (hsep : Separated r z T) (htail : ∀ s ∈ T, s ≤ r) :
    tupleCost (assemble r z T)=r^2+∑ i ∈ range r, (i+1)*z i := by
  unfold tupleCost
  rw [pointCost_eq_core _ _ r (assemble_core_spec r z T hsep htail)]
  unfold pointCost
  calc
    (∑ i ∈ range r, (tupleAt (assemble r z T) i-i)) =
        ∑ i ∈ range r, CoreGaps.fromGaps r z i := by
      apply sum_congr rfl
      intro i hi
      rw [tupleAt_assemble_prefix r z T hsep i (mem_range.mp hi),coreAt,Nat.add_sub_cancel]
    _ = _ := CoreGaps.sum_fromGaps r z

theorem tupleTail_assemble (r : ℕ) (z : ℕ → ℕ) (T : Finset ℕ)
    (hsep : Separated r z T) (htail : ∀ s ∈ T, s ≤ r) : tupleTail (assemble r z T)=T := by
  ext s
  rw [mem_tupleTail,tupleCoreLength_assemble r z T hsep htail]
  constructor
  · rintro ⟨i,hri,hi,heq⟩
    have hindex : i-r < T.card := by
      rw [assemble_card r z T hsep] at hi
      omega
    rw [tupleAt_assemble_tail r z T hsep i hri] at heq
    exact heq ▸ tupleAt_mem T (i-r) hindex
  · intro hs
    obtain ⟨i,hi,heq⟩ := (mem_iff_tupleAt T s).mp hs
    refine ⟨r+i,by omega,?_,?_⟩
    · rw [assemble_card r z T hsep]
      omega
    · rw [tupleAt_assemble_tail r z T hsep (r+i) (by omega),Nat.add_sub_cancel_left]
      exact heq

theorem tupleCoreSizes_assemble (r : ℕ) (z : ℕ → ℕ) (T : Finset ℕ)
    (hsep : Separated r z T) (htail : ∀ s ∈ T, s ≤ r) :
    tupleCoreSizes (assemble r z T)=(range r).image (coreAt r z) := by
  ext s
  rw [mem_tupleCoreSizes,tupleCoreLength_assemble r z T hsep htail]
  constructor
  · rintro ⟨i,hi,heq⟩
    rw [tupleAt_assemble_prefix r z T hsep i hi] at heq
    exact mem_image.mpr ⟨i,mem_range.mpr hi,heq⟩
  · intro hs
    obtain ⟨i,hi,heq⟩ := mem_image.mp hs
    exact ⟨i,mem_range.mp hi,(tupleAt_assemble_prefix r z T hsep i (mem_range.mp hi)).trans heq⟩

theorem coreAt_actual (S : Finset ℕ) (i : ℕ) (hi : i < tupleCoreLength S) :
    coreAt (tupleCoreLength S) (tupleGapAt S) i=tupleAt S i := by
  unfold coreAt
  change CoreGaps.fromGaps (tupleCoreLength S)
    (CoreGaps.gaps (tupleCoreLength S) (fun j => tupleAt S j-j)) i+i=tupleAt S i
  rw [CoreGaps.fromGaps_gaps (tupleCoreLength S) (fun j => tupleAt S j-j)
    (CoreGaps.positive_core_of_sequence (tupleAt S) S.card (tupleCoreLength S)
      (tupleAt_decreasing S) (tupleCoreLength_spec S)) i hi]
  exact Nat.sub_add_cancel ((tupleCoreLength_spec S).2.1 i hi).le

theorem actual_separated (S : Finset ℕ) :
    Separated (tupleCoreLength S) (tupleGapAt S) (tupleTail S) := by
  intro i hi s hs
  rw [coreAt_actual S i hi]
  exact tupleTail_lt_coreSizes S s (tupleAt S i) hs
    ((mem_tupleCoreSizes S (tupleAt S i)).mpr ⟨i,hi,rfl⟩)

theorem assemble_actual (S : Finset ℕ) :
    assemble (tupleCoreLength S) (tupleGapAt S) (tupleTail S)=S := by
  have himage : (range (tupleCoreLength S)).image (coreAt (tupleCoreLength S) (tupleGapAt S))=
      tupleCoreSizes S := by
    unfold tupleCoreSizes
    apply image_congr
    intro i hi
    exact coreAt_actual S i (mem_range.mp hi)
  rw [← tupleCoreSizes_union_tail (assemble (tupleCoreLength S) (tupleGapAt S) (tupleTail S)),
    tupleCoreSizes_assemble _ _ _ (actual_separated S) (tupleTail_le_coreLength S),
    tupleTail_assemble _ _ _ (actual_separated S) (tupleTail_le_coreLength S),
    himage,tupleCoreSizes_union_tail]

theorem assemble_reduced_actual (S : Finset ℕ) (hr : 0 < tupleCoreLength S) :
    assemble (tupleCoreLength S)
      (CoreGaps.bumpLast (tupleCoreLength S) (tupleTailBit S)
        (CoreGaps.extend (tupleCoreLength S) (tupleReducedGaps S)))
      (if tupleTailBit S=1 then insert (tupleCoreLength S) (tupleSmallTail S) else tupleSmallTail S)=S := by
  rw [tupleRawGap_reconstruct S hr,← tupleTail_reconstruct S]
  exact assemble_actual S

end LineSize.TupleBuild
