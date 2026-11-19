module

public import Conjectures.FranklSpanFourGraphEncoding

/-! The scalar graph codes and canonical natural-letter word tables have
the same literal digit order. No finite table coverage is assumed here. -/
@[expose] public section

namespace FranklSpanFour.Graph

open Assembly

theorem letterCode_wordOfCode {k : ℕ} (a : ℕ) (p : Fin k) :
    letterCode (wordOfCode k a p) = a / 16 ^ p.val % 16 := by
  induction k generalizing a with
  | zero => exact Fin.elim0 p
  | succ _k ih =>
      refine Fin.cases ?_ (fun q => ?_) p
      · simpa only [wordOfCode, Fin.cons_zero, Fin.val_zero, Nat.pow_zero, Nat.div_one] using
          letterCode_letterOfCode (Nat.mod_lt a (by decide : 0 < 16))
      · simpa only [wordOfCode, Fin.cons_succ, Fin.val_succ, Nat.div_div_eq_div_mul,
          Nat.pow_succ, Nat.mul_comm] using ih (a / 16) q

def naturalWord (k a : ℕ) : List ℕ :=
  List.ofFn (fun p : Fin k => a / 16 ^ p.val % 16)

theorem naturalWord_eq_decoded (k a : ℕ) :
    naturalWord k a = List.ofFn (fun p : Fin k => letterCode (wordOfCode k a p)) := by
  apply congrArg List.ofFn
  funext p
  exact (letterCode_wordOfCode a p).symm

theorem naturalWord_wordCode {k : ℕ} (v : Word k) :
    naturalWord k (wordCode v) = List.ofFn (fun p : Fin k => letterCode (v p)) := by
  rw [naturalWord_eq_decoded, wordOfCode_wordCode]

end FranklSpanFour.Graph
