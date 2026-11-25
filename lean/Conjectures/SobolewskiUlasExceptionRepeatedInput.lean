module

public import Conjectures.SobolewskiUlasExceptionCarry

@[expose] public section
namespace SobolewskiUlasException

theorem repeatedIndex_succ {k : ℕ} (hk : 0<k) :
    repeatedIndex (k+1)+6=16*repeatedIndex k := by
  have h₁ := repeatedIndex_exact hk
  have h₂ := repeatedIndex_exact (show 0<k+1 by omega)
  rw [repeatedNine] at h₂
  omega

/-- The exact repeated input used by the finite linear representation:
from least significant to most significant it is A, followed by copies
of 9 and a final 1. -/
theorem repeatedIndex_ofDigits (k : ℕ) :
    repeatedIndex (k+2)=Nat.ofDigits 16 (10::List.replicate k 9++[1]) := by
  induction k with
  | zero => decide
  | succ k ih =>
    have h := repeatedIndex_succ (k := k+2) (by omega)
    rw [ih] at h
    change repeatedIndex (k+2+1) = Nat.ofDigits 16 (10::List.replicate (k+1) 9++[1])
    rw [List.replicate_succ]
    change repeatedIndex (k+2+1)+6 =
      16*Nat.ofDigits 16 (10::(List.replicate k 9++[1])) at h
    change repeatedIndex (k+2+1) =
      Nat.ofDigits 16 (10::9::(List.replicate k 9++[1]))
    simp only [Nat.ofDigits_cons] at h ⊢
    omega

theorem repeatedIndex_digits (k : ℕ) :
    Nat.digits 16 (repeatedIndex (k+2))=10::List.replicate k 9++[1] := by
  rw [repeatedIndex_ofDigits]
  apply Nat.digits_ofDigits 16 (by decide)
  · intro d hd
    change d∈(10::(List.replicate k 9++[1])) at hd
    rcases List.mem_cons.mp hd with rfl|hr
    · decide
    · rcases List.mem_append.mp hr with hRep|hLast
      · rw [List.eq_of_mem_replicate hRep]
        decide
      · rw [List.mem_singleton.mp hLast]
        decide
  · intro h
    rw [List.getLast_append_right (by simp : ([1] : List ℕ)≠[])]
    decide

end SobolewskiUlasException
