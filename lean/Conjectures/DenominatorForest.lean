import Conjectures.DenominatorDynamics
import Mathlib.Algebra.Order.BigOperators.Group.Finset
import Mathlib.Data.Int.Basic

/-! Infinite head states for reverse Bulgarian solitaire. The finite cutoff
only certifies that all legal choices are enumerated. It is not part of the
semantic data, and the path counts are proved independent of it. -/

namespace DenominatorForest

structure State where
  value : Nat → Nat
  offset : Int
  cutoff : Nat
  tail_small : ∀ i, cutoff ≤ i → value i ≤ 1

namespace State

def Legal (s : State) (j : Nat) : Prop :=
  (j:Int)+s.offset ≤ s.value j ∧ (j=0 ∨ s.value j ≠ s.value (j-1)+1)

instance (s : State) (j : Nat) : Decidable (s.Legal j) :=
  inferInstanceAs (Decidable
    ((j:Int)+s.offset ≤ s.value j ∧ (j=0 ∨ s.value j ≠ s.value (j-1)+1)))

def searchBound (s : State) : Nat := max s.cutoff ((1-s.offset).toNat+1)

def moves (s : State) : Finset Nat := (Finset.range s.searchBound).filter s.Legal

theorem legal_lt_bound (s : State) (j : Nat) (hj : s.Legal j) : j < s.searchBound := by
  by_cases hcut : j < s.cutoff
  · exact hcut.trans_le (le_max_left _ _)
  · have hsmall := s.tail_small j (by omega)
    have hval := hj.1
    have hmax : (1-s.offset).toNat+1 ≤ s.searchBound := le_max_right _ _
    omega

@[simp] theorem mem_moves (s : State) (j : Nat) : j ∈ s.moves ↔ s.Legal j := by
  simp only [moves,Finset.mem_filter,Finset.mem_range]
  exact ⟨fun h => h.2,fun h => ⟨s.legal_lt_bound j h,h⟩⟩

def step (s : State) (j : Nat) : State where
  value i := if i < j then s.value i+1 else s.value (i+1)
  offset := (s.value j:Int)-j-1
  cutoff := max j (s.cutoff-1)
  tail_small := by
    intro i hi
    have hj : j ≤ i := (le_max_left _ _).trans hi
    have hc : s.cutoff-1 ≤ i := (le_max_right _ _).trans hi
    simp only [show ¬i < j by omega]
    exact s.tail_small (i+1) (by omega)

def DataEq (s t : State) : Prop := (∀ i, s.value i=t.value i) ∧ s.offset=t.offset

theorem dataEq_refl (s : State) : s.DataEq s := ⟨fun _ => rfl,rfl⟩

theorem dataEq_symm {s t : State} (h : s.DataEq t) : t.DataEq s :=
  ⟨fun i => (h.1 i).symm,h.2.symm⟩

theorem dataEq_trans {s t u : State} (h : s.DataEq t) (h' : t.DataEq u) : s.DataEq u :=
  ⟨fun i => (h.1 i).trans (h'.1 i),h.2.trans h'.2⟩

theorem legal_congr {s t : State} (h : s.DataEq t) (j : Nat) : s.Legal j ↔ t.Legal j := by
  simp only [Legal,h.1 j,h.1 (j-1),h.2]

theorem moves_congr {s t : State} (h : s.DataEq t) : s.moves=t.moves := by
  ext j
  rw [mem_moves,mem_moves]
  exact legal_congr h j

theorem step_congr {s t : State} (h : s.DataEq t) (j : Nat) :
    (s.step j).DataEq (t.step j) := by
  constructor
  · intro i
    simp only [step,h.1 i,h.1 (i+1)]
  · simp only [step,h.1 j]

def Sorted (s : State) : Prop := ∀ i, s.value (i+1) ≤ s.value i+1

theorem sorted_dataEq {s t : State} (h : s.DataEq t) (hs : s.Sorted) : t.Sorted := by
  intro i
  simpa only [h.1 i,h.1 (i+1)] using hs i

theorem physical_antitone (s : State) (hs : s.Sorted) :
    Antitone (fun i => (s.value i:Int)-i) := by
  apply antitone_nat_of_succ_le
  intro i
  have hh := hs i
  omega

theorem step_sorted (s : State) (hs : s.Sorted) (j : Nat) : (s.step j).Sorted := by
  intro i
  have h0 := hs i
  have h1 := hs (i+1)
  dsimp [step]
  split_ifs <;> omega

theorem value_sub_index_le (s : State) (hs : s.Sorted) (j : Nat) :
    (s.value j:Int)-j ≤ s.value 0 := by
  simpa using s.physical_antitone hs (Nat.zero_le j)

theorem step_offset_le (s : State) (hs : s.Sorted) (j : Nat) :
    (s.step j).offset ≤ (s.value 0:Int)-1 := by
  have hh := s.value_sub_index_le hs j
  dsimp [step]
  omega

/-- The elementary depth bounds used to separate the finite right boundary
from every reverse move in a fixed initial part of the forest. -/
def WithinDepth (s : State) (d : Nat) : Prop :=
  (∀ i, s.value i ≤ d+1) ∧ -(d:Int)-1 ≤ s.offset

theorem step_withinDepth (s : State) (d j : Nat) (hs : s.WithinDepth d)
    (hj : s.Legal j) : (s.step j).WithinDepth (d+1) := by
  constructor
  · intro i
    have hi := hs.1 i
    have hi' := hs.1 (i+1)
    dsimp [step]
    split_ifs <;> omega
  · have hleg := hj.1
    have hoff := hs.2
    dsimp [step]
    omega

theorem legal_index_le_depth (s : State) (d j : Nat) (hs : s.WithinDepth d)
    (hj : s.Legal j) : j ≤ 2*d+2 := by
  have hv := hs.1 j
  have hoff := hs.2
  have hleg := hj.1
  omega

end State

def pathCount : Nat → State → Nat
  | 0,_ => 1
  | d+1,s => ∑ j ∈ s.moves, pathCount d (s.step j)

theorem pathCount_congr (d : Nat) (s t : State) (h : s.DataEq t) :
    pathCount d s=pathCount d t := by
  induction d generalizing s t with
  | zero => rfl
  | succ d ih =>
    simp only [pathCount]
    rw [State.moves_congr h]
    apply Finset.sum_congr rfl
    intro j _
    exact ih _ _ (State.step_congr h j)

end DenominatorForest
