import Mathlib.Data.ZMod.Basic
import Mathlib.Data.Finset.Basic
import Mathlib.Tactic.Ring

namespace ReciprocalTail

/-- Eliminate the unit-fraction multiplier between two tail updates. -/
theorem backward_step {R : Type*} [CommRing R] (a u v w t : R)
    (hw : w = a * u - v) (ht : t = a * v) :
    v * (v + w) = u * t := by
  rw [hw, ht]
  ring

/-- Possible initial denominators for a block ending at a zero numerator. -/
def possible {p : ℕ} [NeZero p] (Q : ℕ → ZMod p) (start : ℕ) :
    ℕ → Finset (ZMod p)
  | 0 => {-Q (start + 1)}
  | depth + 1 =>
    let next := possible Q (start + 1) depth
    Finset.univ.filter fun v =>
      ∃ w ∈ next, v * (v + Q (start + 1)) = Q start * w

theorem mem_possible {p : ℕ} [NeZero p] (Q v : ℕ → ZMod p) (start depth : ℕ)
    (hend : v (start + depth) = -Q (start + depth + 1))
    (hstep : ∀ i, start ≤ i → i < start + depth →
      v i * (v i + Q (i + 1)) = Q i * v (i + 1)) :
    v start ∈ possible Q start depth := by
  induction depth generalizing start with
  | zero => simpa [possible] using hend
  | succ depth ih =>
    simp only [possible, Finset.mem_filter, Finset.mem_univ, true_and]
    refine ⟨v (start + 1), ih (start + 1) ?_ ?_, hstep start (by omega) (by omega)⟩
    · simpa [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using hend
    · intro i hlo hhi
      exact hstep i (by omega) (by omega)

def quadratic (p A n : ℕ) : ZMod p :=
  (A : ZMod p) * n * (n + 1 : ZMod p) - 1

/-- The endpoint is a root and its constrained backward block has no start. -/
def excluded (p : ℕ) [NeZero p] (A start depth : ℕ) : Prop :=
  quadratic p A (start + depth) = 0 ∧
    possible (quadratic p A) start depth = ∅

instance (p : ℕ) [NeZero p] (A start depth : ℕ) :
    Decidable (excluded p A start depth) := inferInstanceAs (Decidable (_ ∧ _))

set_option maxRecDepth 16000 in
set_option maxHeartbeats 4000000 in
theorem final_windows :
    excluded 11 16 10 5 ∧ excluded 13 64 0 3 ∧ excluded 19 252 3 3 ∧
    excluded 11 1932 4 1 ∧ excluded 11 2700 10 5 := by decide

end ReciprocalTail
