module

public import Conjectures.SobolewskiUlasExceptionPartitionRecurrence
public import Conjectures.SobolewskiUlasExceptionCongruenceReduction

@[expose] public section
namespace SobolewskiUlasException

theorem not_inSourceLayer_zero : ¬inSourceLayer 0 := by
  intro h
  obtain ⟨j,s,hs⟩ := h
  have hp : 0<2^(2*j+1)*baseValue s := Nat.mul_pos (by positivity)
    (by have ho := baseValue_odd s; omega)
  omega

theorem not_binary_partition_exception_zero : ¬ IsBinaryPartitionException 0 := by
  intro h
  apply h
  refine ⟨1,0,0,?_⟩
  norm_num [binaryPartitionCount_zero]

theorem binaryExceptionClassification_of_congruences
    (hv : BinaryPartitionValuationBound) (hr : BinaryPartitionExceptionResidue)
    (hL : ThreeSquaresOfNotForbidden) : BinaryExceptionClassification := by
  intro n
  cases n with
  | zero => exact iff_of_false not_binary_partition_exception_zero not_inSourceLayer_zero
  | succ n => exact positive_exception_classification_of_congruences hv hr hL _ (Nat.succ_pos _)

/-- Removing the first index from the source's zero-based enumeration,
as in the literal positive-index wording of Conjecture 7.1. -/
theorem binaryPartitionEnumeration_positive_tail_not_regular
    (hc : BinaryExceptionClassification) (ht : CobhamGapTransfer)
    (f : ℕ → ℕ) (hf : StrictMono f) (hr : Set.range f = {n | IsBinaryPartitionException n})
    (m : ℕ) (hm : 2≤m) :
    ¬IsRegular m (fun k => (f (k+1) : ℤ)) := by
  intro h
  exact binaryPartitionEnumeration_not_regular_of_source_inputs hc ht f hf hr m hm
    (regular_of_tail (show 0<m by omega) h)

theorem binaryPartitionEnumeration_positive_tail_not_regular_power_two
    (hc : BinaryExceptionClassification)
    (f : ℕ → ℕ) (hf : StrictMono f) (hr : Set.range f = {n | IsBinaryPartitionException n})
    (a : ℕ) (ha : 0<a) :
    ¬IsRegular (2^a) (fun k => (f (k+1) : ℤ)) := by
  intro h
  exact binaryPartitionEnumeration_not_regular_power_two hc f hf hr a ha
    (regular_of_tail (by positivity : 0<(2:ℕ)^a) h)

end SobolewskiUlasException
