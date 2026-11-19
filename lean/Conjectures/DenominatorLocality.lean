import Conjectures.DenominatorFiniteLists

namespace DenominatorFinite

open DenominatorForest

/-- Agreement with an actual positive partition on a finite initial segment.
The length equation retains the information carried by the distant boundary. -/
structure Realizes (L W : Nat) (s : State) (l : List Nat) : Prop where
  descending : Descending l
  positive : Positive l
  length_offset : (l.length:Int)=(L:Int)+s.offset
  window : W ≤ l.length
  head_values : ∀ i, i < W → (l.getD i 0:Int)=(L:Int)-1-i+s.value i

theorem Realizes.legal_iff (L W : Nat) (s : State) (l : List Nat)
    (h : Realizes L W s l) (j : Nat) (hj : j < W) :
    Legal l j ↔ s.Legal j := by
  have hv := h.head_values j hj
  have hl := h.length_offset
  have hjl : j < l.length := hj.trans_le h.window
  by_cases hj0 : j=0
  · subst j
    constructor
    · intro hg
      refine ⟨?_,Or.inl rfl⟩
      have hh := hg.2.1
      omega
    · intro hg
      refine ⟨hjl,?_,Or.inl rfl⟩
      have hh := hg.1
      omega
  · have hp := h.head_values (j-1) (by omega)
    simp only [Legal,State.Legal,hjl,true_and,hj0,false_or]
    omega

theorem Realizes.legal_lt_window (L W : Nat) (s : State) (l : List Nat)
    (h : Realizes L W s l) (d : Nat) (hd : s.WithinDepth d)
    (hW : 2*d+3 < W) (j : Nat) (hj : Legal l j) : j < W := by
  by_contra hn
  have hlast : W-1 < W := by omega
  have hp := h.head_values (W-1) hlast
  have hv := hd.1 (W-1)
  have hl := h.length_offset
  have hoff := hd.2
  have hs := h.descending (W-1) j (by omega) hj.1
  have hleg := hj.2.1
  omega

theorem Realizes.choices_eq (L W : Nat) (s : State) (l : List Nat)
    (h : Realizes L W s l) (d : Nat) (hd : s.WithinDepth d)
    (hW : 2*d+3 < W) : choices l=s.moves := by
  ext j
  rw [mem_choices,State.mem_moves]
  constructor
  · intro hj
    exact (h.legal_iff L W s l j (h.legal_lt_window L W s l d hd hW j hj)).mp hj
  · intro hj
    have hb := s.legal_index_le_depth d j hd hj
    exact (h.legal_iff L W s l j (by omega)).mpr hj

theorem Realizes.after_reverse (L W : Nat) (s : State) (l : List Nat)
    (h : Realizes L W s l) (j : Nat) (hj : Legal l j) (hjW : j < W) :
    Realizes L (W-1) (s.step j) (reverseList l j) := by
  refine ⟨reverse_descending l h.descending j hj,reverse_positive l j,?_,?_,?_⟩
  · rw [reverse_length l j hj]
    have hv := h.head_values j hjW
    dsimp [State.step]
    omega
  · rw [reverse_length l j hj]
    have hl := hj.2.1
    have hw := h.window
    omega
  · intro i hi
    have hi' : i < l.length-1 := by have := h.window; omega
    rw [reverse_getD_head l j i hj.1 hi']
    have hv := h.head_values i (by omega)
    have hv' := h.head_values (i+1) (by omega)
    dsimp [State.step]
    split_ifs <;> omega

/-- Exact finite/infinite path-count correspondence at every bounded depth. -/
theorem pathCount_eq_actual (r d L W : Nat) (s : State) (l : List Nat)
    (h : Realizes L W s l) (hd : s.WithinDepth d) (hW : 2*d+3*r+4 ≤ W) :
    actualPathCount r (l:Multiset Nat)=pathCount r s := by
  induction r generalizing d W s l with
  | zero => rfl
  | succ r ih =>
    have hW' : 2*d+3 < W := by omega
    have hchoices := h.choices_eq L W s l d hd hW'
    rw [actualPathCount,← choices_image l,Finset.sum_image (choices_injective l h.descending),
      pathCount,← hchoices]
    apply Finset.sum_congr rfl
    intro j hj
    have hj' := (mem_choices l j).mp hj
    have hjW := h.legal_lt_window L W s l d hd hW' j hj'
    have hsleg := (h.legal_iff L W s l j hjW).mp hj'
    rw [← reverse_coe l j hj'.1]
    exact ih (d+1) (W-1) (s.step j) (reverseList l j)
      (h.after_reverse L W s l j hj' hjW) (s.step_withinDepth d j hd hsleg) (by omega)

end DenominatorFinite
