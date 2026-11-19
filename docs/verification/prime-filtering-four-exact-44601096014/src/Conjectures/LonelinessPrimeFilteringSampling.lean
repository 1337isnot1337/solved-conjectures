import Mathlib.Data.Nat.Basic
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Ring
import Mathlib.Tactic.Linarith
import Lean.Elab.Tactic.Omega

/-!
# Finite sampling of the first five quotient digits

If `j` divides a positive sampling scale `a`, sampling `a*x/m` before
dividing by `a/j` preserves the integer quotient `j*x/m`. Scale sixty
therefore preserves the first five quotient digits simultaneously. This
is an arithmetic reduction for the finite four-input filtering case.
It does not assert that those finite profiles have a common good shift.
-/

namespace Loneliness.PrimeFilteringSampling

/-- Sampling at a multiple of the multiplier preserves its integer quotient. -/
theorem sampled_quotient {a j : ℕ} (ha : 0 < a) (hj : j ∣ a) (x m : ℕ) :
    j * (a * x / m) / a = j * x / m := by
  obtain ⟨b, rfl⟩ := hj
  have hjpos : 0 < j := by
    by_contra h
    have hz : j = 0 := by omega
    simp [hz] at ha
  have hbpos : 0 < b := by
    by_contra h
    have hz : b = 0 := by omega
    simp [hz] at ha
  calc
    j * (j * b * x / m) / (j * b) = (j * b * x / m) / b :=
      Nat.mul_div_mul_left _ _ hjpos
    _ = (j * b * x) / (m * b) := Nat.div_div_eq_div_mul _ _ _
    _ = (j * x * b) / (m * b) := by congr 1; ring
    _ = j * x / m := Nat.mul_div_mul_right _ _ hbpos

theorem small_multiplier_dvd_sixty (j : Fin 5) : j.val + 1 ∣ 60 := by
  have h : j.val = 0 ∨ j.val = 1 ∨ j.val = 2 ∨ j.val = 3 ∨ j.val = 4 := by omega
  rcases h with h | h | h | h | h <;> norm_num [h]

/-- The quotient cell lies in a fixed set of 420 possibilities. -/
theorem sample_lt {x m : ℕ} (hx : x < 7 * m) : 60 * x / m < 420 := by
  apply Nat.div_lt_of_lt_mul
  nlinarith

/-- One finite cell determines all five quotients, for an arbitrary modulus. -/
theorem exists_five_quotient_sample {x m : ℕ} (hx : x < 7 * m) :
    ∃ c : Fin 420, ∀ j : Fin 5,
      ((j.val + 1) * x / m) % 7 = ((j.val + 1) * c.val / 60) % 7 := by
  refine ⟨⟨60 * x / m, sample_lt hx⟩, ?_⟩
  intro j
  exact congrArg (fun n : ℕ => n % 7)
    (sampled_quotient (by decide) (small_multiplier_dvd_sixty j) x m).symm

end Loneliness.PrimeFilteringSampling
