import Conjectures.OrdinaryDarcaisLargeData
import Conjectures.OrdinaryDarcaisWeights

/-! A segment of the factorial-cleared recurrence can be checked from the value at its left endpoint. -/

namespace OrdinaryDarcais

def recurrenceSegment (n : ℕ) (row : ℕ → ℕ) (start acc : ℕ) : ℕ → ℕ
  | 0 => acc
  | len+1 =>
    weightAt (n-(start+len)) * row (start+len+1) +
      (start+len+1) * recurrenceSegment n row start acc len

theorem recurrenceSegment_eq (n : ℕ) (row : ℕ → ℕ) (start len : ℕ) :
    recurrenceSegment n row start (cachedNested n row start) len =
      cachedNested n row (start+len) := by
  induction len with
  | zero => rfl
  | succ len ih =>
    simp only [recurrenceSegment, Nat.add_succ, cachedNested, ih]
    rfl

open Lean Elab Term in
elab "ordinaryMassPartial " n:num m:num : term =>
  return mkNatLit (cachedNested n.getNat largeMass m.getNat)

open Lean Elab Term in
elab "ordinaryPackedPartial " n:num m:num : term =>
  return mkNatLit (cachedNested n.getNat largePacked m.getNat)

end OrdinaryDarcais
