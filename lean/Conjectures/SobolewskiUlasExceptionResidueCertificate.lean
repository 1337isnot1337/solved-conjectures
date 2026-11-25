module

public import Conjectures.SobolewskiUlasExceptionModState

@[expose] public section
namespace SobolewskiUlasException

def residueState (x y z mask : ℕ) (src pos : Bool) : PartitionModState :=
  ⟨x,y,z,⟨mask.testBit 0,mask.testBit 1,mask.testBit 2,mask.testBit 3,mask.testBit 4,
      mask.testBit 5,mask.testBit 6⟩,src,pos⟩

/-- A closed reachable-state certificate. The arithmetic below checks the
initial state, both transitions, and both output conditions in Lean. -/
def residueStates : List PartitionModState := [
  residueState 1 2 8 32 false false,
  residueState 2 6 0 24 false true,
  residueState 2 14 24 28 false true,
  residueState 4 14 24 28 false true,
  residueState 4 30 24 28 false true,
  residueState 6 2 8 33 false true,
  residueState 6 26 0 32 false true,
  residueState 10 14 24 28 false true,
  residueState 10 22 0 24 false true,
  residueState 12 14 24 28 false true,
  residueState 12 30 24 28 false true,
  residueState 14 2 8 32 false true,
  residueState 14 10 0 33 false true,
  residueState 18 22 0 24 false true,
  residueState 18 30 24 28 false true,
  residueState 20 2 8 32 false true,
  residueState 20 18 8 32 false true,
  residueState 22 10 0 32 false true,
  residueState 22 18 8 33 false true,
  residueState 26 6 0 24 false true,
  residueState 26 30 24 28 false true,
  residueState 28 2 8 34 true true,
  residueState 28 18 8 34 true true,
  residueState 30 18 8 32 false true,
  residueState 30 26 0 33 false true
]

def residueStateValid (s : PartitionModState) : Prop :=
  (s.x.val=28 ↔ s.source=true) ∧ (s.positive=true → s.x.val%4=2 ∨ s.x.val%8=4)

instance residueStateValidDecidable (s : PartitionModState) : Decidable (residueStateValid s) :=
  inferInstanceAs (Decidable ((_ ↔ _) ∧ (_ → _ ∨ _)))

theorem residueStates_all :
    residueStates.all (fun s => decide (s.even∈residueStates ∧
      s.odd∈residueStates ∧ residueStateValid s)) = true := by
  decide +kernel

theorem residueStates_closed (s : PartitionModState) (hs : s∈residueStates) :
    s.even∈residueStates ∧ s.odd∈residueStates ∧ residueStateValid s :=
  of_decide_eq_true (List.all_eq_true.mp residueStates_all s hs)

theorem partitionModState_zero : partitionModState 0 = residueState 1 2 8 32 false false := by
  apply PartitionModState.ext
  · exact partPrefix_zero 1
  · change 2*partPrefix 2 0 = _
    rw [partPrefix_zero]
    decide
  · change 8*partPrefix 3 0 = _
    rw [partPrefix_zero]
    decide
  · decide
  · decide
  · decide

theorem partitionModState_mem (n : ℕ) : partitionModState n ∈ residueStates := by
  induction n using Nat.strong_induction_on with
  | h n ih =>
    by_cases h0 : n=0
    · subst n
      rw [partitionModState_zero]
      decide
    have hlt : n/2<n := Nat.div_lt_self (Nat.pos_of_ne_zero h0) (by decide)
    have hk := residueStates_closed _ (ih (n/2) hlt)
    by_cases he : n%2=0
    · have h := partitionModState_even (n/2)
      rw [show 2*(n/2)=n by omega] at h
      rw [h]
      exact hk.1
    · have h := partitionModState_odd (n/2)
      rw [show 2*(n/2)+1=n by omega] at h
      rw [h]
      exact hk.2.1

theorem partitionModState_val (n : ℕ) : (partitionModState n).x.val = binaryPartitionCount (2*n)%32 := by
  change (partPrefix 1 n).val = _
  rw [←partPrefix_even_zero]
  exact ZMod.val_natCast 32 _

theorem binaryPartition_valuation_bound : BinaryPartitionValuationBound := by
  intro n hn
  have hh := (residueStates_closed _ (partitionModState_mem n)).2.2.2
    (by change decide (0<n)=true; exact decide_eq_true hn)
  rw [partitionModState_val] at hh
  omega

theorem binaryPartition_exception_residue : BinaryPartitionExceptionResidue := by
  intro n
  have hh := (residueStates_closed _ (partitionModState_mem n)).2.2.1
  rw [partitionModState_val] at hh
  exact hh.trans (sourceIndicatorBit_correct n)

/-- Every explicit source layer consists of actual binary-partition exceptions. -/
theorem source_layer_is_binary_partition_exception (n : ℕ) (hn : inSourceLayer n) :
    IsBinaryPartitionException n :=
  source_layer_is_exception_of_congruences binaryPartition_exception_residue n hn

theorem binary_exception_classification_of_legendre (h : ThreeSquaresOfNotForbidden) :
    BinaryExceptionClassification :=
  binaryExceptionClassification_of_congruences binaryPartition_valuation_bound binaryPartition_exception_residue h

theorem binaryPartitionEnumeration_power_two_of_legendre
    (h : ThreeSquaresOfNotForbidden) (f : ℕ→ℕ) (hf : StrictMono f)
    (hr : Set.range f = {n | IsBinaryPartitionException n}) (a : ℕ) (ha : 0<a) :
    ¬IsRegular (2^a) (fun k => (f (k+1) : ℤ)) :=
  binaryPartitionEnumeration_positive_tail_not_regular_power_two
    (binary_exception_classification_of_legendre h) f hf hr a ha

theorem binaryPartitionEnumeration_of_legendre_and_durand
    (h : ThreeSquaresOfNotForbidden) (hd : CobhamGapTransfer) (f : ℕ→ℕ) (hf : StrictMono f)
    (hr : Set.range f = {n | IsBinaryPartitionException n}) (m : ℕ) (hm : 2≤m) :
    ¬IsRegular m (fun k => (f (k+1) : ℤ)) :=
  binaryPartitionEnumeration_positive_tail_not_regular
    (binary_exception_classification_of_legendre h) hd f hf hr m hm

end SobolewskiUlasException
