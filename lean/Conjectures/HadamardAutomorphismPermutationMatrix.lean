import Conjectures.HadamardAutomorphismPermutation
import Mathlib.Data.Matrix.Basic
import Mathlib.Basic.Real.Basic
import Mathlib.Tactic.Ring
import Mathlib.Tactic.NormNum.Basic

/-!
# Sign changes of Hadamard matrices

This module connects the signed-index normalization with the actual matrix
entries. Both sign entries and all row-orthogonality equations are preserved.
-/

namespace HadamardAutomorphism

open scoped BigOperators

def realSign (u : ℤˣ) : ℝ := (u : ℤ)

@[simp] theorem realSign_one : realSign 1 = 1 := by simp [realSign]

@[simp] theorem realSign_mul (u v : ℤˣ) : realSign (u * v) = realSign u * realSign v := by
  simp [realSign]

theorem realSign_sq (u : ℤˣ) : realSign u ^ 2 = 1 := by
  rcases Int.units_eq_one_or u with rfl | rfl <;> norm_num [realSign]

variable {R C : Type*}

/-- Independent row and column changes of signs. -/
def signSwitch (H : Matrix R C ℝ) (d : R → ℤˣ) (e : C → ℤˣ) : Matrix R C ℝ :=
  fun i j => realSign (d i) * H i j * realSign (e j)

theorem signSwitch_signs (H : Matrix R C ℝ) (d : R → ℤˣ) (e : C → ℤˣ)
    (hsign : ∀ i j, H i j ^ 2 = 1) :
    ∀ i j, signSwitch H d e i j ^ 2 = 1 := by
  intro i j
  simp only [signSwitch, mul_pow, realSign_sq, hsign, one_mul]

theorem signSwitch_orthogonal [Fintype C] [DecidableEq R]
    (H : Matrix R C ℝ) (d : R → ℤˣ) (e : C → ℤˣ) (n : ℝ)
    (horth : ∀ i k, ∑ j, H i j * H k j = if i = k then n else 0) :
    ∀ i k, ∑ j, signSwitch H d e i j * signSwitch H d e k j =
      if i = k then n else 0 := by
  intro i k
  calc
    ∑ j, signSwitch H d e i j * signSwitch H d e k j =
        (realSign (d i) * realSign (d k)) * (∑ j, H i j * H k j) := by
      rw [Finset.mul_sum]
      apply Finset.sum_congr rfl
      intro j _
      calc
        signSwitch H d e i j * signSwitch H d e k j =
            (realSign (d i) * realSign (d k)) * (H i j * H k j) *
              realSign (e j) ^ 2 := by dsimp [signSwitch]; ring
        _ = _ := by rw [realSign_sq, mul_one]
    _ = if i = k then n else 0 := by
      rw [horth]
      split_ifs with hik
      · subst k
        rw [← pow_two, realSign_sq, one_mul]
      · exact mul_zero _

theorem signSwitch_invariant (H : Matrix R C ℝ) (σ : Equiv.Perm R) (τ : Equiv.Perm C)
    (s : R → ℤˣ) (t : C → ℤˣ) (d : R → ℤˣ) (e : C → ℤˣ)
    (hd : ∀ i, s i = d i * d (σ i)) (he : ∀ j, t j = e j * e (τ j))
    (hinv : ∀ i j, H (σ i) (τ j) = realSign (s i) * realSign (t j) * H i j) :
    ∀ i j, signSwitch H d e (σ i) (τ j) = signSwitch H d e i j := by
  intro i j
  dsimp only [signSwitch]
  rw [hinv, hd, he, realSign_mul, realSign_mul]
  calc
    realSign (d (σ i)) *
        (realSign (d i) * realSign (d (σ i)) *
          (realSign (e j) * realSign (e (τ j))) * H i j) * realSign (e (τ j)) =
        realSign (d i) * H i j * realSign (e j) *
          (realSign (d (σ i)) ^ 2 * realSign (e (τ j)) ^ 2) := by ring
    _ = realSign (d i) * H i j * realSign (e j) := by rw [realSign_sq, realSign_sq]; ring

/-- Odd-order signed symmetries become ordinary permutation symmetries after
row and column sign changes, while retaining the Hadamard equations. -/
theorem normalize_signed_hadamard [Fintype C] [DecidableEq R]
    (H : Matrix R C ℝ) (σ : Equiv.Perm R) (τ : Equiv.Perm C)
    (s : R → ℤˣ) (t : C → ℤˣ) {q : ℕ} (hq : Odd q)
    (hσ : signedLift σ s ^ q = 1) (hτ : signedLift τ t ^ q = 1)
    (n : ℝ) (hsign : ∀ i j, H i j ^ 2 = 1)
    (horth : ∀ i k, ∑ j, H i j * H k j = if i = k then n else 0)
    (hinv : ∀ i j, H (σ i) (τ j) = realSign (s i) * realSign (t j) * H i j) :
    ∃ d : R → ℤˣ, ∃ e : C → ℤˣ,
      (∀ i j, signSwitch H d e i j ^ 2 = 1) ∧
      (∀ i k, ∑ j, signSwitch H d e i j * signSwitch H d e k j =
        if i = k then n else 0) ∧
      (∀ i j, signSwitch H d e (σ i) (τ j) = signSwitch H d e i j) := by
  obtain ⟨d, hd⟩ := exists_diagonal_normalizer σ s hq hσ
  obtain ⟨e, he⟩ := exists_diagonal_normalizer τ t hq hτ
  exact ⟨d, e, signSwitch_signs H d e hsign, signSwitch_orthogonal H d e n horth,
    signSwitch_invariant H σ τ s t d e hd he hinv⟩

end HadamardAutomorphism
