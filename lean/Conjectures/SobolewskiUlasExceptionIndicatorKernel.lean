module

public import Conjectures.SobolewskiUlasExceptionBinaryAutomaton
public import Mathlib.Data.Set.Finite.Basic

@[expose] public section
namespace SobolewskiUlasException

theorem scan_append (p : Phase) (xs ys : List ℕ) :
    scan p (xs++ys)=scan (scan p xs) ys := by
  induction xs generalizing p with
  | nil => rfl
  | cons x xs ih =>
    change scan (scanStep p x) (xs++ys)=scan (scan (scanStep p x) xs) ys
    exact ih _

theorem scan_zeros_preserves_acceptance (p : Phase) (t : ℕ) :
    accepted (scan p (List.replicate t 0)) ↔ accepted p := by
  induction t generalizing p with
  | zero => rfl
  | succ t ih =>
    rw [List.replicate_succ,scan,ih,accepted_step_zero]

def predicateKernel (b : ℕ) (f : ℕ→Prop) : Set (ℕ→Prop) :=
  {g | ∃ e d : ℕ,d<b^e ∧ g=(fun n => f (b^e*n+d))}

/-- Each literal section of the normalized indicator is the same
scanner started in one of finitely many reachable states. -/
theorem scaled_indicator_finite_binary_kernel : (predicateKernel 2 inScaled).Finite := by
  let startsIn (p : Phase) (n : ℕ) : Prop := accepted (scan p (Nat.digits 2 n))
  apply (Set.finite_range startsIn).subset
  rintro g ⟨e,d,hd,rfl⟩
  have hl : (Nat.digits 2 d).length≤e :=
    (Nat.digits_length_le_iff (by decide : 1<(2:ℕ)) d).mpr hd
  let pad := e-(Nat.digits 2 d).length
  let xs := Nat.digits 2 d ++ List.replicate pad 0
  refine ⟨scan .skipEven xs,?_⟩
  funext n
  apply propext
  change accepted (scan (scan .skipEven xs) (Nat.digits 2 n)) ↔ inScaled (2^e*n+d)
  rw [← binary_scanner_correct,← scan_append]
  by_cases hn : n=0
  · subst n
    simp only [Nat.digits_zero,List.append_nil,Nat.mul_zero,Nat.zero_add,xs,scan_append]
    exact scan_zeros_preserves_acceptance _ _
  · have h := Nat.digits_append_zeroes_append_digits (b := 2) (k := pad) (m := n)
      (n := d) (by decide) (Nat.pos_of_ne_zero hn)
    have he : (Nat.digits 2 d).length+pad=e := Nat.add_sub_of_le hl
    rw [he,Nat.add_comm] at h
    rw [show xs++Nat.digits 2 n=Nat.digits 2 (2^e*n+d) from h]

end SobolewskiUlasException
