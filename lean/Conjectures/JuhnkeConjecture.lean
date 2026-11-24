import Conjectures.JuhnkeUnitRuns
import Conjectures.JuhnkePathsBoundary
import Conjectures.JuhnkeUnimodality

/-!
# Juhnke's conjecture

The all-parameter counting polynomial for Juhnke's two endpoint families.
The unit-word counts proved from literal paths agree with the alternating
run sequence in the recorded argument.
-/

namespace Juhnke

open scoped BigOperators
open Polynomial

theorem unitWordCount_even {a b : ℕ} (ha : 0 < a) (hb : 0 < b) (j : ℕ) :
    unitWordCount (a + b) a (2 * j + 2) =
      2 * ((a - 1).choose j * (b - 1).choose j) :=
  unitWord_even_count ha hb j

theorem unitWordCount_odd {a b : ℕ} (ha : 0 < a) (hb : 0 < b) (j : ℕ) :
    unitWordCount (a + b) a (2 * j + 3) =
      (a - 1).choose (j + 1) * (b - 1).choose j +
        (a - 1).choose j * (b - 1).choose (j + 1) :=
  unitWord_odd_count ha hb j

theorem combined_even_count {m : ℕ} (hm : 1 ≤ m) (j : ℕ) :
    (unitWordCount (2 * m + 2) m (2 * j + 2) : ℝ) +
      (unitWordCount (2 * m + 2) (m + 1) (2 * j + 2) : ℝ) = evenRun m j := by
  have h₁ := unitWordCount_even (a := m) (b := m + 2) (by omega) (by omega) j
  have h₂ := unitWordCount_even (a := m + 1) (b := m + 1) (by omega) (by omega) j
  have hn₁ : m + (m + 2) = 2 * m + 2 := by omega
  have hn₂ : m + 1 + (m + 1) = 2 * m + 2 := by omega
  rw [hn₁] at h₁
  rw [hn₂] at h₂
  rw [h₁, h₂, evenRun_count hm]
  simp only [Nat.add_sub_cancel, show m + 2 - 1 = m + 1 by omega, binom]
  push_cast
  ring

theorem combined_odd_count {m : ℕ} (hm : 1 ≤ m) (j : ℕ) :
    (unitWordCount (2 * m + 2) m (2 * j + 3) : ℝ) +
      (unitWordCount (2 * m + 2) (m + 1) (2 * j + 3) : ℝ) = oddRun m j := by
  have h₁ := unitWordCount_odd (a := m) (b := m + 2) (by omega) (by omega) j
  have h₂ := unitWordCount_odd (a := m + 1) (b := m + 1) (by omega) (by omega) j
  have hn₁ : m + (m + 2) = 2 * m + 2 := by omega
  have hn₂ : m + 1 + (m + 1) = 2 * m + 2 := by omega
  rw [hn₁] at h₁
  rw [hn₂] at h₂
  rw [h₁, h₂, oddRun_count hm]
  simp only [Nat.add_sub_cancel, show m + 2 - 1 = m + 1 by omega, binom]
  push_cast
  ring

/-- The exact two-family word count, including every index beyond the support. -/
theorem combined_run_count {m : ℕ} (hm : 1 ≤ m) (n : ℕ) :
    (unitWordCount (2 * m + 2) m (n + 2) : ℝ) +
      (unitWordCount (2 * m + 2) (m + 1) (n + 2) : ℝ) = interleavedRuns m n := by
  by_cases he : n % 2 = 0
  · have hn : n = 2 * (n / 2) := by omega
    conv_lhs => rw [hn]
    rw [combined_even_count hm]
    simp [interleavedRuns, he]
  · have hn : n = 2 * (n / 2) + 1 := by omega
    have hn' : n + 2 = 2 * (n / 2) + 3 := by omega
    rw [hn', combined_odd_count hm]
    simp [interleavedRuns, he]

/-- The two literal endpoint polynomials equal the source's run expansion. -/
theorem combined_pathPolynomial {m : ℕ} (hm : 1 ≤ m) :
    pathPolynomial (2 * m + 2) m + pathPolynomial (2 * m + 2) (m + 1) =
      runExpansionPolynomial m := by
  have hN : 0 < 2 * m + 2 := by omega
  let f : ℕ → ℝ[X] := fun r =>
    C ((unitWordCount (2 * m + 2) m r : ℝ) +
      (unitWordCount (2 * m + 2) (m + 1) r : ℝ)) * X ^ r * (1 + X) ^ (2 * m + 2 - r)
  have heq : pathPolynomial (2 * m + 2) m + pathPolynomial (2 * m + 2) (m + 1) =
      ∑ r ∈ Finset.range (2 * m + 2 + 1), f r := by
    rw [pathPolynomial_sum_runCounts hN, pathPolynomial_sum_runCounts hN,
      ← Finset.sum_add_distrib]
    apply Finset.sum_congr rfl
    intro r _
    simp only [f, map_add]
    ring
  have h0a := unitWordCount_zero hN m
  have h0b := unitWordCount_zero hN (m + 1)
  have h1a := unitWordCount_one (N := 2 * m + 2) (a := m) (by omega) (by omega)
  have h1b := unitWordCount_one (N := 2 * m + 2) (a := m + 1) (by omega) (by omega)
  have hsmall : (∑ r ∈ Finset.range 2, f r) = 0 := by
    simp [Finset.sum_range_succ, f, h0a, h0b, h1a, h1b]
  rw [heq, show 2 * m + 2 + 1 = 2 + (2 * m + 1) by omega,
    Finset.sum_range_add, hsmall, zero_add]
  unfold runExpansionPolynomial
  apply Finset.sum_congr rfl
  intro n _
  dsimp only [f]
  rw [show 2 + n = n + 2 by omega, combined_run_count hm n,
    show 2 * m + 2 - (n + 2) = 2 * m - n by omega]

theorem combined_pathPolynomial_strongLogConcave {m : ℕ} (hm : 1 ≤ m) :
    (∀ i, 0 ≤ (pathPolynomial (2 * m + 2) m +
      pathPolynomial (2 * m + 2) (m + 1)).coeff i) ∧
    StrongLogConcave (pathPolynomial (2 * m + 2) m +
      pathPolynomial (2 * m + 2) (m + 1)).coeff := by
  rw [combined_pathPolynomial hm]
  exact runExpansionPolynomial_strongLogConcave hm

theorem combined_pathPolynomial_logConcave {m : ℕ} (hm : 1 ≤ m) :
    LogConcave (pathPolynomial (2 * m + 2) m +
      pathPolynomial (2 * m + 2) (m + 1)).coeff := by
  rw [combined_pathPolynomial hm]
  exact runExpansionPolynomial_logConcave hm

theorem combined_pathPolynomial_unimodal {m : ℕ} (hm : 1 ≤ m) :
    Unimodal (pathPolynomial (2 * m + 2) m +
      pathPolynomial (2 * m + 2) (m + 1)).coeff := by
  rw [combined_pathPolynomial hm]
  exact runExpansionPolynomial_unimodal hm

end Juhnke
