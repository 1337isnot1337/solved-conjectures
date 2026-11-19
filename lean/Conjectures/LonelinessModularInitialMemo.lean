import Conjectures.LonelinessModularInitialBits
import Conjectures.LonelinessModularMemo

/-! Verified memo tables for the two arithmetic maps used in initial
support searches. Sparse tables may omit any key: the exact map is the
fallback. The finite table checks are separate from the finite search. -/

namespace Loneliness.Modular.InitialMemo

def cover (den m : ℕ) (table : Memo.Tree) : ℕ → ℕ :=
  Memo.lookup (InitialBits.cover den m) table

def compatibleBase (m : ℕ) (inv : ℕ → ℕ) (width key : ℕ) : ℕ :=
  InitialBits.compatible m inv (key/width) (key%width)

def compatible (m : ℕ) (inv : ℕ → ℕ) (width : ℕ) (table : Memo.Tree)
    (b a : ℕ) : ℕ :=
  if a<width then Memo.lookup (compatibleBase m inv width) table (b*width+a)
  else InitialBits.compatible m inv b a

theorem cover_eq (den m : ℕ) (table : Memo.Tree)
    (hcheck : Memo.check (InitialBits.cover den m) table=true) :
    ∀ a, cover den m table a=InitialBits.cover den m a :=
  Memo.lookup_eq _ table hcheck

theorem compatible_eq (m : ℕ) (inv : ℕ → ℕ) (width : ℕ) (hwidth : 0<width)
    (table : Memo.Tree) (hcheck : Memo.check (compatibleBase m inv width) table=true)
    (b a : ℕ) : compatible m inv width table b a=InitialBits.compatible m inv b a := by
  by_cases ha : a<width
  · have hdiv : (b*width+a)/width=b := by
      rw [Nat.add_comm,Nat.add_mul_div_right a b hwidth,Nat.div_eq_of_lt ha,Nat.zero_add]
    have hmod : (b*width+a)%width=a := by
      rw [Nat.mul_add_mod_self_right,Nat.mod_eq_of_lt ha]
    rw [compatible,ite_eq_left ha,Memo.lookup_eq _ table hcheck]
    simp only [compatibleBase,hdiv,hmod]
  · rw [compatible,ite_eq_right ha]

theorem checked_tree (den m : ℕ) (inv : ℕ → ℕ) (width : ℕ) (hwidth : 0<width)
    (coverTable compatibleTable : Memo.Tree)
    (hcover : Memo.check (InitialBits.cover den m) coverTable=true)
    (hcompatible : Memo.check (compatibleBase m inv width) compatibleTable=true)
    (b : ℕ) (terminal : Finset ℕ → ℕ → Bool)
    (lookup : ℕ → SupportSearch.Tape.Node) (fuel index slots : ℕ)
    (hcheck : SupportSearch.Bits.tapeCheck (cover den m coverTable)
      (compatible m inv width compatibleTable b) terminal lookup fuel index
      (InitialBits.encode (InitialSupport.selected b))
      (InitialBits.encode (InitialSupport.available m inv b))
      (InitialBits.encode (InitialSupport.uncovered den m b)) slots=true) :
    SupportSearch.check (InitialSupport.badTimes den m) (InitialSupport.pairCompatible m inv b)
      terminal (SupportSearch.Tape.toTree lookup fuel index)
      (InitialSupport.selected b) (InitialSupport.available m inv b)
      (InitialSupport.uncovered den m b) slots=true := by
  apply InitialBits.checked_tree_with_masks den m inv b terminal
    (cover den m coverTable) (compatible m inv width compatibleTable b)
    ?_ ?_ lookup fuel index slots hcheck
  · intro a
    rw [cover_eq den m coverTable hcover]
    exact InitialBits.decode_encode _
  · intro a c
    rw [compatible_eq m inv width hwidth compatibleTable hcompatible]
    exact InitialBits.compatible_testBit m inv b a c

end Loneliness.Modular.InitialMemo
