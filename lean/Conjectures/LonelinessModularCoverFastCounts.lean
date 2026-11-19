import Mathlib.Data.Nat.BitIndices

/-! Direct binary population counts for the support certificates.

`Nat.bitIndices` constructs an index list and shifts every existing index at
each binary digit. The support checker needs the length of that list in every
capacity gain. The function below accumulates the length directly. Its exact
equality with the existing mathematical count holds for every natural number.
-/

namespace Loneliness.Modular.SupportSearch.Bits.Fast

def count (n : ℕ) : ℕ :=
  @Nat.binaryRec (fun _ => ℕ) 0 (fun b _ total => total + if b then 1 else 0) n

@[simp] theorem count_zero : count 0 = 0 := rfl

theorem count_bit (b : Bool) (n : ℕ) :
    count (Nat.bit b n) = count n + if b then 1 else 0 :=
  Nat.binaryRec_eq b n (.inl rfl)

theorem count_eq (n : ℕ) : count n = n.bitIndices.length := by
  induction n using Nat.binaryRec with
  | zero => rfl
  | bit b n ih =>
    rw [count_bit, ih]
    cases b <;> simp

end Loneliness.Modular.SupportSearch.Bits.Fast
