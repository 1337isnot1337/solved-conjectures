import Conjectures.DenominatorForest
import Mathlib.Data.List.GetD

namespace DenominatorForest

def headStep (a : List Nat) (j : Nat) : List Nat :=
  (List.range (a.length-1)).map (fun i => if i < j then a.getD i 0+1 else a.getD (i+1) 0)

def HeadLegal (a : List Nat) (s : Int) (j : Nat) : Prop :=
  (j:Int)+s ≤ a.getD j 0 ∧ (j=0 ∨ a.getD j 0 ≠ a.getD (j-1) 0+1)

instance (a : List Nat) (s : Int) (j : Nat) : Decidable (HeadLegal a s j) :=
  inferInstanceAs (Decidable
    ((j:Int)+s ≤ a.getD j 0 ∧ (j=0 ∨ a.getD j 0 ≠ a.getD (j-1) 0+1)))

def headChoices (a : List Nat) (s : Int) : Finset Nat :=
  (Finset.range a.length).filter (HeadLegal a s)

def freeChoices (a : List Nat) : Finset Nat :=
  (Finset.range a.length).filter (fun j => j=0 ∨ a.getD j 0 ≠ a.getD (j-1) 0+1)

def shiftHead (a : List Nat) (c : Nat) : List Nat := a.map (·+c)

@[simp] theorem headStep_length (a : List Nat) (j : Nat) :
    (headStep a j).length=a.length-1 := by simp [headStep]

theorem headStep_getD (a : List Nat) (j i : Nat) (hi : i < a.length-1) :
    (headStep a j).getD i 0=if i < j then a.getD i 0+1 else a.getD (i+1) 0 := by
  rw [List.getD_eq_getElem _ _ (by simpa using hi)]
  simp [headStep]

@[simp] theorem shiftHead_length (a : List Nat) (c : Nat) :
    (shiftHead a c).length=a.length := by simp [shiftHead]

theorem shiftHead_getD (a : List Nat) (c i : Nat) (hi : i < a.length) :
    (shiftHead a c).getD i 0=a.getD i 0+c := by
  rw [List.getD_eq_getElem _ _ (by simpa using hi),List.getD_eq_getElem _ _ hi]
  simp [shiftHead]

@[simp] theorem mem_headChoices (a : List Nat) (s : Int) (j : Nat) :
    j ∈ headChoices a s ↔ j < a.length ∧ HeadLegal a s j := by
  simp [headChoices]

@[simp] theorem mem_freeChoices (a : List Nat) (j : Nat) :
    j ∈ freeChoices a ↔ j < a.length ∧ (j=0 ∨ a.getD j 0 ≠ a.getD (j-1) 0+1) := by
  simp [freeChoices]

theorem headChoices_free (a : List Nat) : headChoices a (-(a.length:Int))=freeChoices a := by
  ext j
  rw [mem_headChoices,mem_freeChoices]
  dsimp [HeadLegal]
  constructor
  · rintro ⟨hj,_,he⟩
    exact ⟨hj,he⟩
  · rintro ⟨hj,he⟩
    exact ⟨hj,by omega,he⟩

theorem headStep_shift (a : List Nat) (j c : Nat) :
    headStep (shiftHead a c) j=shiftHead (headStep a j) c := by
  apply List.ext_getElem
  · simp
  · intro i hi hi'
    have hlen : i < a.length-1 := by simpa using hi
    have h0 := shiftHead_getD a c i (by omega)
    have h1 := shiftHead_getD a c (i+1) (by omega)
    have hs := headStep_getD (shiftHead a c) j i (by simpa using hlen)
    have ht := shiftHead_getD (headStep a j) c i (by simpa using hlen)
    rw [h0,h1] at hs
    rw [headStep_getD a j i hlen] at ht
    rw [← List.getD_eq_getElem _ 0 hi,← List.getD_eq_getElem _ 0 hi']
    rw [hs,ht]
    split_ifs <;> omega

theorem headChoices_shift (a : List Nat) (s : Int) (c : Nat) :
    headChoices (shiftHead a c) (s+c)=headChoices a s := by
  ext j
  by_cases hj : j < a.length
  · simp only [mem_headChoices,shiftHead_length,hj,true_and,HeadLegal]
    rw [shiftHead_getD a c j hj,shiftHead_getD a c (j-1) (by omega)]
    omega
  · simp [hj]

theorem freeChoices_shift (a : List Nat) (c : Nat) :
    freeChoices (shiftHead a c)=freeChoices a := by
  ext j
  by_cases hj : j < a.length
  · simp only [mem_freeChoices,shiftHead_length,hj,true_and]
    rw [shiftHead_getD a c j hj,shiftHead_getD a c (j-1) (by omega)]
    omega
  · simp [hj]

theorem headOffset_shift (a : List Nat) (c j : Nat) (hj : j < a.length) :
    ((shiftHead a c).getD j 0:Int)-j-1=((a.getD j 0:Int)-j-1)+c := by
  rw [shiftHead_getD a c j hj]
  omega

namespace State

/-- Attach a finite head to an infinite tail, with the specified total
length offset. -/
def splice (a : List Nat) (t : State) (s : Int) : State where
  value i := if i < a.length then a.getD i 0 else t.value (i-a.length)
  offset := s
  cutoff := a.length+t.cutoff
  tail_small := by
    intro i hi
    have hlen : ¬i < a.length := by omega
    simp only [hlen,↓reduceIte]
    exact t.tail_small _ (by omega)

def liftHead (a : List Nat) (t : State) : State := splice a t (t.offset-a.length)

theorem splice_value_head (a : List Nat) (t : State) (s : Int) (i : Nat)
    (hi : i < a.length) : (splice a t s).value i=a.getD i 0 := by simp [splice,hi]

theorem splice_value_tail (a : List Nat) (t : State) (s : Int) (i : Nat)
    (hi : a.length ≤ i) : (splice a t s).value i=t.value (i-a.length) := by
  simp [splice,show ¬i < a.length by omega]

theorem splice_head_legal (a : List Nat) (t : State) (s : Int) (j : Nat)
    (hj : j < a.length) : (splice a t s).Legal j ↔ HeadLegal a s j := by
  have hj' : j-1 < a.length := by omega
  simp only [Legal,HeadLegal,splice_value_head _ _ _ _ hj,splice_value_head _ _ _ _ hj']
  rfl

theorem splice_step_head (a : List Nat) (t : State) (s : Int) (j : Nat)
    (hj : j < a.length) :
    ((splice a t s).step j).DataEq
      (splice (headStep a j) t ((a.getD j 0:Int)-j-1)) := by
  constructor
  · intro i
    by_cases hi : i < a.length-1
    · rw [splice_value_head _ _ _ _ (by simpa using hi),headStep_getD a j i hi]
      dsimp [step]
      by_cases hij : i < j
      · simp only [hij,↓reduceIte]
        rw [splice_value_head _ _ _ _ (by omega)]
      · simp only [hij,↓reduceIte]
        rw [splice_value_head _ _ _ _ (by omega)]
    · rw [splice_value_tail _ _ _ _ (by simp; omega)]
      have hij : ¬i < j := by omega
      dsimp [step]
      simp only [hij,↓reduceIte,headStep_length]
      rw [splice_value_tail _ _ _ _ (by omega)]
      congr 1
      omega
  · dsimp [step,splice]
    simp only [hj,↓reduceIte]

end State
end DenominatorForest
