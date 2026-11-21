import Mathlib.Data.Int.Fib.Lemmas
import Mathlib.Tactic.Ring

namespace SunFibonacciSquarefree

/-- Lucas trace of the Fibonacci companion matrix to the power `d`. -/
def lucas (d : ℤ) := Int.fib (d-1) + Int.fib (d+1)

private theorem stride (x d : ℤ) :
    Int.fib (x+2*d) = lucas d * Int.fib (x+d) - (-1)^d.natAbs * Int.fib x := by
  have step (j : ℤ) : Int.fib (j+d) = Int.fib (d-1) * Int.fib j + Int.fib d * Int.fib (j+1) := by
    simpa only [add_comm j d] using Int.fib_add d j
  have next : Int.fib (d+1) = Int.fib (d-1) + Int.fib d := by
    simpa only [show d-1+2 = d+1 by ring, show d-1+1 = d by ring] using Int.fib_add_two (d-1)
  rw [show x+2*d = (x+d)+d by ring, step (x+d), show x+d+1 = (x+1)+d by ring,
      step (x+1), step x, ← Int.fib_succ_mul_fib_pred_sub_fib_sq d]
  rw [show x+1+1 = x+2 by ring, Int.fib_add_two, lucas, next]
  ring

/-- Every odd multiple of a Fibonacci index is forced to a signed residue
modulo the square of its Lucas number. -/
theorem odd_multiple (d : ℤ) (t : ℕ) :
    (lucas d)^2 ∣ Int.fib ((2*(t:ℤ)+1)*d) - (-(-1 : ℤ)^d.natAbs)^t * Int.fib d := by
  suffices h : ∃ e o : ℤ, Int.fib (2*(t:ℤ)*d) = lucas d * e ∧
      Int.fib ((2*(t:ℤ)+1)*d) = (-(-1 : ℤ)^d.natAbs)^t * Int.fib d + (lucas d)^2 * o by
    obtain ⟨_, o, _, ho⟩ := h
    exact ⟨o, by rw [ho]; ring⟩
  induction t with
  | zero => exact ⟨0, 0, by simp, by simp⟩
  | succ t ih =>
    obtain ⟨e, o, he, ho⟩ := ih
    let e' := Int.fib ((2*(t:ℤ)+1)*d) - (-1 : ℤ)^d.natAbs * e
    have evenNext : Int.fib ((2*(t:ℤ)+2)*d) = lucas d * e' := by
      rw [show (2*(t:ℤ)+2)*d = 2*(t:ℤ)*d+2*d by ring, stride,
          show 2*(t:ℤ)*d+d = (2*(t:ℤ)+1)*d by ring, he]
      dsimp [e']; ring
    refine ⟨e', e' - (-1 : ℤ)^d.natAbs * o, ?_, ?_⟩
    · simpa only [Nat.cast_succ, mul_add, mul_one] using evenNext
    · rw [Nat.cast_succ, show (2*((t:ℤ)+1)+1)*d = (2*(t:ℤ)+1)*d+2*d by ring,
          stride, show (2*(t:ℤ)+1)*d+d = (2*(t:ℤ)+2)*d by ring, evenNext, ho, pow_succ]
      ring

end SunFibonacciSquarefree
