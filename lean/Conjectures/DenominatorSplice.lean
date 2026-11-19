import Conjectures.DenominatorHead
import Conjectures.DenominatorSeries

namespace DenominatorForest.State

theorem liftHead_nil (t : State) : (liftHead [] t).DataEq t := by
  constructor
  · intro i
    simp [liftHead,splice]
  · simp [liftHead,splice]

theorem liftHead_step_tail (a : List Nat) (t : State) (j : Nat) :
    ((liftHead a t).step (a.length+j)).DataEq
      (liftHead (shiftHead a 1) (t.step j)) := by
  constructor
  · intro i
    by_cases hi : i < a.length
    · have hlarge : i < a.length+j := by omega
      change (if i < a.length+j then (splice a t _).value i+1
        else (splice a t _).value (i+1))=(splice (shiftHead a 1) (t.step j) _).value i
      rw [splice_value_head (shiftHead a 1) (t.step j) _ i (by simpa using hi),
        shiftHead_getD a 1 i hi]
      simp only [hlarge,↓reduceIte]
      rw [splice_value_head _ _ _ _ hi]
    · have hi' : a.length ≤ i := by omega
      have hip : a.length ≤ i+1 := by omega
      change (if i < a.length+j then (splice a t _).value i+1
        else (splice a t _).value (i+1))=(splice (shiftHead a 1) (t.step j) _).value i
      rw [splice_value_tail (shiftHead a 1) (t.step j) _ i (by simpa using hi'),
        shiftHead_length,splice_value_tail a t _ i hi',splice_value_tail a t _ (i+1) hip]
      dsimp [step]
      have he : i+1-a.length=(i-a.length)+1 := by omega
      rw [he]
      have hh : (i < a.length+j) ↔ i-a.length < j := by omega
      simp only [hh]
  · change ((splice a t _).value (a.length+j):Int)-(a.length+j)-1=
      ((t.step j).offset-(shiftHead a 1).length)
    rw [splice_value_tail _ _ _ _ (by omega),shiftHead_length]
    simp only [Nat.add_sub_cancel_left,step]
    omega

def Separated (a : List Nat) (t : State) : Prop :=
  a=[] ∨ t.value 0+2 ≤ a.getD (a.length-1) 0

theorem liftHead_legal_tail (a : List Nat) (t : State) (hsep : Separated a t) (j : Nat) :
    (liftHead a t).Legal (a.length+j) ↔ t.Legal j := by
  by_cases ha : a=[]
  · subst a
    simpa using legal_congr (liftHead_nil t) j
  have hl : 0 < a.length := List.ne_nil_iff_length_pos.mp ha
  have hlast := hsep.resolve_left ha
  have hcur : (liftHead a t).value (a.length+j)=t.value j := by
    change (splice a t _).value _=_
    rw [splice_value_tail _ _ _ _ (by omega)]
    simp
  by_cases hj : j=0
  · subst j
    have hprev : (liftHead a t).value (a.length+0-1)=a.getD (a.length-1) 0 := by
      apply splice_value_head
      omega
    simp only [Nat.add_zero] at hcur hprev
    dsimp [Legal]
    rw [hcur,hprev]
    dsimp only [liftHead,splice]
    omega
  · have hprev : (liftHead a t).value (a.length+j-1)=t.value (j-1) := by
      change (splice a t _).value _=_
      rw [splice_value_tail _ _ _ _ (by omega)]
      congr 1
      omega
    dsimp [Legal]
    rw [hcur,hprev]
    dsimp only [liftHead,splice]
    omega

theorem liftHead_legal_head (a : List Nat) (t : State) (hs : (liftHead a t).Sorted)
    (hoff : t.offset ≤ (a.getD (a.length-1) 0:Int)) (j : Nat) (hj : j < a.length) :
    (liftHead a t).Legal j ↔ j=0 ∨ a.getD j 0 ≠ a.getD (j-1) 0+1 := by
  have hlast : a.length-1 < a.length := by omega
  have hphys := (liftHead a t).physical_antitone hs (show j ≤ a.length-1 by omega)
  change ((splice a t _).value (a.length-1):Int)-((a.length-1:Nat):Int) ≤
    ((splice a t _).value j:Int)-j at hphys
  rw [splice_value_head _ _ _ _ hlast,splice_value_head _ _ _ _ hj] at hphys
  rw [show (liftHead a t).Legal j ↔ HeadLegal a (t.offset-a.length) j from
    splice_head_legal a t _ j hj]
  dsimp [HeadLegal]
  have hleg : (j:Int)+(t.offset-a.length) ≤ a.getD j 0 := by omega
  simp only [hleg,true_and]

theorem liftHead_moves (a : List Nat) (t : State) (hs : (liftHead a t).Sorted)
    (hsep : Separated a t) (hoff : a ≠ [] → t.offset ≤ (a.getD (a.length-1) 0:Int)) :
    (liftHead a t).moves=freeChoices a ∪ t.moves.image (fun j => a.length+j) := by
  ext i
  rw [mem_moves,Finset.mem_union,Finset.mem_image]
  by_cases hi : i < a.length
  · have ha : a ≠ [] := by intro hh; simp [hh] at hi
    rw [liftHead_legal_head a t hs (hoff ha) i hi]
    constructor
    · intro hh
      exact Or.inl ((mem_freeChoices a i).mpr ⟨hi,hh⟩)
    · intro hh
      rcases hh with hh|⟨j,_,hj⟩
      · exact ((mem_freeChoices a i).mp hh).2
      · omega
  · have he : a.length+(i-a.length)=i := by omega
    have hlegal : (liftHead a t).Legal i ↔ t.Legal (i-a.length) := by
      simpa only [he] using liftHead_legal_tail a t hsep (i-a.length)
    rw [hlegal]
    constructor
    · intro hh
      exact Or.inr ⟨i-a.length,(mem_moves _ _).mpr hh,he⟩
    · intro hh
      rcases hh with hh|⟨j,hj,he'⟩
      · have hh' := ((mem_freeChoices a i).mp hh).1
        omega
      · have heq : j=i-a.length := by omega
        rw [← heq]
        exact (mem_moves _ _).mp hj

theorem liftHead_moves_disjoint (a : List Nat) (t : State) :
    Disjoint (freeChoices a) (t.moves.image (fun j => a.length+j)) := by
  apply Finset.disjoint_left.mpr
  intro i hi hj
  have hi' := ((mem_freeChoices a i).mp hi).1
  obtain ⟨j,_,he⟩ := Finset.mem_image.mp hj
  omega

/-- If the first tail pile lies below the legal threshold, all tail piles
do, because physical pile sizes decrease with the index. -/
theorem splice_moves_blocked (a : List Nat) (t : State) (s : Int) (ht : t.Sorted)
    (hblock : (t.value 0:Int) < a.length+s) :
    (splice a t s).moves=headChoices a s := by
  ext j
  rw [mem_moves,mem_headChoices]
  by_cases hj : j < a.length
  · rw [splice_head_legal a t s j hj]
    simp only [hj,true_and]
  · have hphys := t.value_sub_index_le ht (j-a.length)
    have hnot : ¬(splice a t s).Legal j := by
      intro hh
      have hval := hh.1
      rw [splice_value_tail _ _ _ _ (by omega)] at hval
      change (j:Int)+s ≤ t.value (j-a.length) at hval
      omega
    simp only [hnot,hj,false_and]

theorem headStep_last_ge (a : List Nat) (t : State) (s : Int)
    (hs : (splice a t s).Sorted) (j : Nat) (hj : j < a.length)
    (hnew : 0 < (headStep a j).length) :
    a.getD (a.length-1) 0 ≤ (headStep a j).getD ((headStep a j).length-1) 0 := by
  have hlen : 0 < a.length-1 := by simpa only [headStep_length] using hnew
  have hl : 2 ≤ a.length := by omega
  have he : a.length-1-1=a.length-2 := by omega
  rw [headStep_length,he,headStep_getD a j (a.length-2) (by omega)]
  split_ifs with hij
  · have hh := hs (a.length-2)
    change (splice a t s).value (a.length-2+1) ≤ (splice a t s).value (a.length-2)+1 at hh
    rw [splice_value_head _ _ _ _ (by omega),splice_value_head _ _ _ _ (by omega)] at hh
    have he' : a.length-2+1=a.length-1 := by omega
    simpa only [he'] using hh
  · have he' : a.length-2+1=a.length-1 := by omega
    rw [he']

theorem splice_step_blocks_tail (a : List Nat) (t : State) (s : Int)
    (hs : (splice a t s).Sorted) (hsep : Separated a t)
    (j : Nat) (hj : j < a.length) :
    (t.value 0:Int) < (headStep a j).length+((a.getD j 0:Int)-j-1) := by
  have ha : a ≠ [] := by intro hh; simp [hh] at hj
  have hlast := hsep.resolve_left ha
  have hphys := (splice a t s).physical_antitone hs (show j ≤ a.length-1 by omega)
  dsimp only at hphys
  rw [splice_value_head _ _ _ _ (by omega),splice_value_head _ _ _ _ hj] at hphys
  rw [headStep_length]
  omega

theorem headStep_separated (a : List Nat) (t : State) (s : Int)
    (hs : (splice a t s).Sorted) (hsep : Separated a t)
    (j : Nat) (hj : j < a.length) : Separated (headStep a j) t := by
  by_cases hnew : headStep a j=[]
  · exact Or.inl hnew
  · right
    have ha : a ≠ [] := by intro hh; simp [hh] at hj
    have hlast := hsep.resolve_left ha
    exact hlast.trans (headStep_last_ge a t s hs j hj (List.ne_nil_iff_length_pos.mp hnew))

theorem step_value_zero_le (t : State) (ht : t.Sorted) (j : Nat) :
    (t.step j).value 0 ≤ t.value 0+1 := by
  dsimp [step]
  split_ifs
  · exact le_rfl
  · simpa using ht 0

structure Protected (a : List Nat) (t : State) : Prop where
  tail_sorted : t.Sorted
  full_sorted : (liftHead a t).Sorted
  separated : Separated a t
  high : a ≠ [] → t.offset ≤ (a.getD (a.length-1) 0:Int)

theorem protected_after_tail (a : List Nat) (t : State) (h : Protected a t) (j : Nat) :
    Protected (shiftHead a 1) (t.step j) := by
  refine ⟨t.step_sorted h.tail_sorted j,
    sorted_dataEq (liftHead_step_tail a t j) ((liftHead a t).step_sorted h.full_sorted _),?_,?_⟩
  · by_cases ha : a=[]
    · left
      simp [shiftHead,ha]
    · right
      have hlen : 0 < a.length := List.ne_nil_iff_length_pos.mp ha
      have hgap := h.separated.resolve_left ha
      have hzero := t.step_value_zero_le h.tail_sorted j
      rw [shiftHead_length,shiftHead_getD _ _ _ (by omega)]
      omega
  · intro hnew
    have ha : a ≠ [] := by intro he; simp [shiftHead,he] at hnew
    have hlen : 0 < a.length := List.ne_nil_iff_length_pos.mp ha
    have hgap := h.separated.resolve_left ha
    have hoff := t.step_offset_le h.tail_sorted j
    rw [shiftHead_length,shiftHead_getD _ _ _ (by omega)]
    omega

end DenominatorForest.State
