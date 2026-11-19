import Conjectures.LonelinessFiveSpeedLinearReduction
import Mathlib.Algebra.BigOperators.Fin
import Mathlib.Data.Int.GCD
import Mathlib.Tactic.FinCases

/-! Elimination of one relation among three integer parameters.  The free
coordinates use the increasing order supplied by `Fin.succAbove`, matching the
two-column maps in the finite certificate.  No rational parameter is introduced.
-/

namespace Loneliness.FiveSpeedCertificate

open Matrix
open scoped BigOperators Matrix

def lineFreeParameters (j : Fin 3) (u : ThreeIntegerVector) : Fin 2 → ℤ :=
  fun k => u (j.succAbove k)

def lineEliminationMap (A : ThreeParameterMap) (h : Fin 3 → ℤ) (j : Fin 3) :
    Matrix (Fin 5) (Fin 2) ℤ :=
  fun i k => A i (j.succAbove k) * h j - A i j * h (j.succAbove k)

/-- Multiplying by the pivot clears the eliminated coordinate exactly. -/
theorem lineElimination_mulVec (A : ThreeParameterMap) (h : Fin 3 → ℤ)
    (j : Fin 3) (u : ThreeIntegerVector) (hrelation : h ⬝ᵥ u = 0) :
    lineEliminationMap A h j *ᵥ lineFreeParameters j u = h j • (A *ᵥ u) := by
  have hsum : h j * u j +
      (∑ k : Fin 2, h (j.succAbove k) * u (j.succAbove k)) = 0 := by
    change (∑ k : Fin 3, h k * u k) = 0 at hrelation
    rwa [Fin.sum_univ_succAbove (fun k => h k * u k) j] at hrelation
  have hfree : (∑ k : Fin 2, h (j.succAbove k) * u (j.succAbove k)) =
      -(h j * u j) := by omega
  ext i
  change (∑ k : Fin 2,
      (A i (j.succAbove k) * h j - A i j * h (j.succAbove k)) *
        u (j.succAbove k)) = h j * (∑ k : Fin 3, A i k * u k)
  rw [Fin.sum_univ_succAbove (fun k => A i k * u k) j]
  calc
    _ = h j * (∑ k : Fin 2, A i (j.succAbove k) * u (j.succAbove k)) -
        A i j * (∑ k : Fin 2, h (j.succAbove k) * u (j.succAbove k)) := by
      simp_rw [sub_mul]
      rw [Finset.sum_sub_distrib, Finset.mul_sum, Finset.mul_sum]
      congr 1 <;> apply Finset.sum_congr rfl <;> intro k _ <;> ring
    _ = _ := by rw [hfree]; ring

theorem lineFreeParameters_ne_zero (A : ThreeParameterMap) (h : Fin 3 → ℤ)
    (j : Fin 3) (hj : h j ≠ 0) (u : ThreeIntegerVector)
    (hrelation : h ⬝ᵥ u = 0) (himage : ∃ i, (A *ᵥ u) i ≠ 0) :
    lineFreeParameters j u ≠ 0 := by
  intro hz
  obtain ⟨i, hi⟩ := himage
  have heq := lineElimination_mulVec A h j u hrelation
  rw [hz, Matrix.mulVec_zero] at heq
  have heqi := congrFun heq i
  change 0 = h j * (A *ᵥ u) i at heqi
  exact (mul_ne_zero hj hi) heqi.symm

/-- Every nonzero integer pair has a positive common factor and a primitive
integer pair, with signs retained. -/
theorem primitive_pair_factor (u : Fin 2 → ℤ) (hu : u ≠ 0) :
    ∃ g : ℕ, 0 < g ∧ ∃ w : Fin 2 → ℤ,
      Nat.gcd (w 0).natAbs (w 1).natAbs = 1 ∧ u = (g : ℤ) • w := by
  have hg : 0 < Int.gcd (u 0) (u 1) := by
    by_contra hn
    have hz : Int.gcd (u 0) (u 1) = 0 := Nat.eq_zero_of_not_pos hn
    have hz0 : u 0 = 0 := by
      simpa [hz] using Int.gcd_dvd_left (u 0) (u 1)
    have hz1 : u 1 = 0 := by
      simpa [hz] using Int.gcd_dvd_right (u 0) (u 1)
    apply hu
    ext i
    fin_cases i
    · exact hz0
    · exact hz1
  obtain ⟨g, x, y, hg, hcoprime, hx, hy⟩ := Int.exists_gcd_one' hg
  refine ⟨g, hg, ![x, y], ?_, ?_⟩
  · change Nat.gcd x.natAbs y.natAbs = 1
    exact hcoprime
  · ext i
    fin_cases i
    · simpa [mul_comm] using hx
    · simpa [mul_comm] using hy

/-- The two-parameter image represents a nonzero multiple of the original
image, and its parameter pair may be chosen primitive. -/
theorem lineElimination_primitive_image (A : ThreeParameterMap) (h : Fin 3 → ℤ)
    (j : Fin 3) (hj : h j ≠ 0) (u : ThreeIntegerVector)
    (hrelation : h ⬝ᵥ u = 0) (hnonzero : ∀ i, (A *ᵥ u) i ≠ 0) :
    ∃ g : ℕ, 0 < g ∧ ∃ w : Fin 2 → ℤ,
      Nat.gcd (w 0).natAbs (w 1).natAbs = 1 ∧
      (g : ℤ) • (lineEliminationMap A h j *ᵥ w) = h j • (A *ᵥ u) ∧
      ∀ i, (lineEliminationMap A h j *ᵥ w) i ≠ 0 := by
  have hfree := lineFreeParameters_ne_zero A h j hj u hrelation ⟨0, hnonzero 0⟩
  obtain ⟨g, hg, w, hw, hfactor⟩ := primitive_pair_factor (lineFreeParameters j u) hfree
  have heq : (g : ℤ) • (lineEliminationMap A h j *ᵥ w) = h j • (A *ᵥ u) := by
    have heq := lineElimination_mulVec A h j u hrelation
    rwa [hfactor, Matrix.mulVec_smul] at heq
  refine ⟨g, hg, w, hw, heq, ?_⟩
  intro i hi
  have heqi := congrFun heq i
  change (g : ℤ) * (lineEliminationMap A h j *ᵥ w) i = h j * (A *ᵥ u) i at heqi
  rw [hi, mul_zero] at heqi
  exact (mul_ne_zero hj (hnonzero i)) heqi.symm

def positiveFirstSign (u : Fin 2 → ℤ) : ℤ := if 0 < u 0 then 1 else -1

def positiveFirstPair (u : Fin 2 → ℤ) : Fin 2 → ℤ := positiveFirstSign u • u

theorem positiveFirstSign_cases (u : Fin 2 → ℤ) :
    positiveFirstSign u = 1 ∨ positiveFirstSign u = -1 := by
  unfold positiveFirstSign
  split_ifs <;> simp

theorem positiveFirstSign_natAbs (u : Fin 2 → ℤ) : (positiveFirstSign u).natAbs = 1 := by
  rcases positiveFirstSign_cases u with h | h <;> simp [h]

theorem positiveFirstPair_pos (u : Fin 2 → ℤ) (hu : u 0 ≠ 0) :
    0 < positiveFirstPair u 0 := by
  change 0 < positiveFirstSign u * u 0
  unfold positiveFirstSign
  split_ifs with h
  · simpa using h
  · simp only [neg_mul, one_mul]
    omega

theorem positiveFirstPair_natAbs (u : Fin 2 → ℤ) (j : Fin 2) :
    (positiveFirstPair u j).natAbs = (u j).natAbs := by
  change (positiveFirstSign u * u j).natAbs = (u j).natAbs
  rw [Int.natAbs_mul, positiveFirstSign_natAbs, Nat.one_mul]

theorem positiveFirstPair_gcd (u : Fin 2 → ℤ) :
    Nat.gcd (positiveFirstPair u 0).natAbs (positiveFirstPair u 1).natAbs =
      Nat.gcd (u 0).natAbs (u 1).natAbs := by
  rw [positiveFirstPair_natAbs, positiveFirstPair_natAbs]

theorem positiveFirstPair_image_natAbs (B : Matrix (Fin 5) (Fin 2) ℤ)
    (u : Fin 2 → ℤ) (i : Fin 5) :
    ((B *ᵥ positiveFirstPair u) i).natAbs = ((B *ᵥ u) i).natAbs := by
  rw [positiveFirstPair, Matrix.mulVec_smul]
  change (positiveFirstSign u * (B *ᵥ u) i).natAbs = ((B *ᵥ u) i).natAbs
  rw [Int.natAbs_mul, positiveFirstSign_natAbs, Nat.one_mul]

end Loneliness.FiveSpeedCertificate
