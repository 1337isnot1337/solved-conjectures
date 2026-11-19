import Conjectures.LonelinessModularInitialSupport
import Conjectures.LonelinessModularCoverBits
import Mathlib.Combinatorics.Colex

/-! The bit-mask support checker supplies the exact finite-set checker used
by initial prime normalization. The adapter keeps every minimum pair in the
folded interval and every support cardinality up to the requested count. -/

namespace Loneliness.Modular.InitialBits

open scoped BigOperators

def encode (s : Finset ℕ) : ℕ := ∑ a∈s, 2^a

theorem decode_encode (s : Finset ℕ) : SupportSearch.Bits.decode (encode s)=s :=
  Finset.toFinset_bitIndices_sum_two_pow s

def cover (den m a : ℕ) : ℕ := encode (InitialSupport.badTimes den m a)

def compatible (m : ℕ) (inv : ℕ → ℕ) (b a : ℕ) : ℕ :=
  encode ((Finset.Icc 1 (m/2)).filter (fun c =>
    InitialSupport.pairCompatible m inv b a c=true))

theorem compatible_testBit (m : ℕ) (inv : ℕ → ℕ) (b a c : ℕ) :
    (compatible m inv b a).testBit c=InitialSupport.pairCompatible m inv b a c := by
  apply Bool.eq_iff_iff.mpr
  change (compatible m inv b a).testBit c=true ↔
    InitialSupport.pairCompatible m inv b a c=true
  rw [←SupportSearch.Bits.mem_decode,compatible,decode_encode,Finset.mem_filter]
  constructor
  · exact fun h => h.2
  · intro h
    have hh : 0<a ∧ 2*a≤m ∧ 0<c ∧ 2*c≤m ∧
        b≤folded m (inv a*c) ∧ b≤folded m (inv c*a) := of_decide_eq_true h
    exact ⟨Finset.mem_Icc.mpr ⟨by omega,by omega⟩,h⟩

/-- A supplied bit-mask implementation is usable once its coverage and
compatibility functions agree with the mathematical finite sets. -/
theorem checked_tree_with_masks (den m : ℕ) (inv : ℕ → ℕ) (b : ℕ)
    (terminal : Finset ℕ → ℕ → Bool) (coverMask compatibleMask : ℕ → ℕ)
    (hcover : ∀ a, SupportSearch.Bits.decode (coverMask a)=InitialSupport.badTimes den m a)
    (hcompatible : ∀ a c, (compatibleMask a).testBit c=
      InitialSupport.pairCompatible m inv b a c)
    (lookup : ℕ → SupportSearch.Tape.Node) (fuel index slots : ℕ)
    (hcheck : SupportSearch.Bits.tapeCheck coverMask compatibleMask terminal lookup fuel index
      (encode (InitialSupport.selected b)) (encode (InitialSupport.available m inv b))
      (encode (InitialSupport.uncovered den m b)) slots=true) :
    SupportSearch.check (InitialSupport.badTimes den m) (InitialSupport.pairCompatible m inv b)
      terminal (SupportSearch.Tape.toTree lookup fuel index)
      (InitialSupport.selected b) (InitialSupport.available m inv b)
      (InitialSupport.uncovered den m b) slots=true := by
  rw [SupportSearch.Bits.tapeCheck_eq,SupportSearch.Bits.check_eq] at hcheck
  have hc : (fun a => SupportSearch.Bits.decode (coverMask a))=InitialSupport.badTimes den m :=
    funext hcover
  have hp : (fun a c => (compatibleMask a).testBit c)=InitialSupport.pairCompatible m inv b := by
    funext a c
    exact hcompatible a c
  simpa only [hc,hp,decode_encode] using hcheck

theorem checked_tree (den m : ℕ) (inv : ℕ → ℕ) (b : ℕ)
    (terminal : Finset ℕ → ℕ → Bool) (lookup : ℕ → SupportSearch.Tape.Node)
    (fuel index slots : ℕ)
    (hcheck : SupportSearch.Bits.tapeCheck (cover den m) (compatible m inv b)
      terminal lookup fuel index (encode (InitialSupport.selected b))
      (encode (InitialSupport.available m inv b))
      (encode (InitialSupport.uncovered den m b)) slots=true) :
    SupportSearch.check (InitialSupport.badTimes den m) (InitialSupport.pairCompatible m inv b)
      terminal (SupportSearch.Tape.toTree lookup fuel index)
      (InitialSupport.selected b) (InitialSupport.available m inv b)
      (InitialSupport.uncovered den m b) slots=true := by
  exact checked_tree_with_masks den m inv b terminal (cover den m) (compatible m inv b)
    (fun a => decode_encode _) (compatible_testBit m inv b) lookup fuel index slots hcheck

end Loneliness.Modular.InitialBits
