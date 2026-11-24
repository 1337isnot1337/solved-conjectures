import Conjectures.JuhnkeLogConcavity
import Mathlib.Data.Nat.Choose.Basic
import Mathlib.Data.Nat.Choose.Cast

/-!
# Juhnke's conjecture

The exact run formulas and all-index inequalities from
`results/juhnke-lattice-paths/PROOF.md`. The endpoint displacements are
`(m,m+2)` and `(m+1,m+1)`. This module is arithmetic infrastructure;
the literal path-count correspondence is supplied separately.
-/

namespace Juhnke

open scoped BigOperators

noncomputable def binom (m j : ℕ) : ℝ := m.choose j

noncomputable def runFactor (m j : ℕ) : ℝ :=
  1 + ((m : ℝ) + 1) * ((m : ℝ) - j) /
    ((m : ℝ) * ((m : ℝ) + 1 - j))

noncomputable def evenRun (m j : ℕ) : ℝ :=
  2 * runFactor m j * binom m j ^ 2

noncomputable def oddRun (m j : ℕ) : ℝ :=
  2 * runFactor m j * binom m j * binom m (j + 1)

theorem binom_nonneg (m j : ℕ) : 0 ≤ binom m j := by
  unfold binom
  positivity

theorem binom_pos {m j : ℕ} (hj : j ≤ m) : 0 < binom m j := by
  unfold binom
  exact_mod_cast Nat.choose_pos hj

theorem binom_zero {m j : ℕ} (hj : m < j) : binom m j = 0 := by
  simp [binom, Nat.choose_eq_zero_of_lt hj]

theorem binom_next {m j : ℕ} (hj : j ≤ m) :
    binom m (j + 1) = binom m j * ((m : ℝ) - j) / (j + 1) := by
  have h := Nat.choose_succ_right_eq m j
  have hcast : binom m (j + 1) * ((j : ℝ) + 1) =
      binom m j * ((m : ℝ) - j) := by
    have h' := congrArg (fun n : ℕ => (n : ℝ)) h
    push_cast [Nat.cast_sub hj] at h'
    exact h'
  apply (eq_div_iff (show (j : ℝ) + 1 ≠ 0 by positivity)).mpr
  exact hcast

theorem binom_previous {m j : ℕ} (hj : 1 ≤ j) (hjm : j ≤ m) :
    binom m (j - 1) = binom m j * (j : ℝ) / ((m : ℝ) - j + 1) := by
  have h := Nat.choose_succ_right_eq m (j - 1)
  have hj' : j - 1 + 1 = j := by omega
  rw [hj'] at h
  have hcast : binom m j * (j : ℝ) =
      binom m (j - 1) * ((m : ℝ) - j + 1) := by
    have hs : m - (j - 1) = m - j + 1 := by omega
    rw [hs] at h
    have h' := congrArg (fun n : ℕ => (n : ℝ)) h
    push_cast [Nat.cast_sub hjm] at h'
    exact h'
  apply (eq_div_iff (show (m : ℝ) - j + 1 ≠ 0 by
    have : (j : ℝ) ≤ m := by exact_mod_cast hjm
    linarith)).mpr
  exact hcast.symm

theorem binom_lower {m j : ℕ} (hm : 1 ≤ m) (hj : j ≤ m) :
    binom (m - 1) j = binom m j * ((m : ℝ) - j) / m := by
  have h := Nat.choose_mul_succ_eq (m - 1) j
  rw [Nat.sub_add_cancel hm] at h
  have h' := congrArg (fun n : ℕ => (n : ℝ)) h
  push_cast [Nat.cast_sub hj] at h'
  apply (eq_div_iff (show (m : ℝ) ≠ 0 by exact_mod_cast (show m ≠ 0 by omega))).mpr
  exact h'

theorem binom_upper {m j : ℕ} (hj : j ≤ m) :
    binom (m + 1) j = binom m j * ((m : ℝ) + 1) / ((m : ℝ) + 1 - j) := by
  have h := Nat.choose_mul_succ_eq m j
  have h' := congrArg (fun n : ℕ => (n : ℝ)) h
  push_cast [Nat.cast_sub (show j ≤ m + 1 by omega)] at h'
  apply (eq_div_iff (show (m : ℝ) + 1 - j ≠ 0 by
    have : (j : ℝ) ≤ m := by exact_mod_cast hj
    linarith)).mpr
  exact h'.symm

/-- Two alternating starting directions, summed over the two endpoint pairs. -/
theorem evenRun_count {m : ℕ} (hm : 1 ≤ m) (j : ℕ) :
    evenRun m j =
      2 * (binom (m - 1) j * binom (m + 1) j + binom m j ^ 2) := by
  by_cases hj : j ≤ m
  · rw [binom_lower hm hj, binom_upper hj]
    have hmR : (m : ℝ) ≠ 0 := by exact_mod_cast (show m ≠ 0 by omega)
    have hjR : (j : ℝ) ≤ m := by exact_mod_cast hj
    have hden : (m : ℝ) + 1 - j ≠ 0 := by linarith
    unfold evenRun runFactor
    field_simp [hmR, hden]
    ring
  · have hmj : m < j := by omega
    simp [evenRun, binom_zero hmj, binom_zero (show m - 1 < j by omega)]

/-- The two possible majority directions for odd run number, over both endpoints. -/
theorem oddRun_count {m : ℕ} (hm : 1 ≤ m) (j : ℕ) :
    oddRun m j = binom (m - 1) (j + 1) * binom (m + 1) j +
      binom (m - 1) j * binom (m + 1) (j + 1) +
      2 * binom m j * binom m (j + 1) := by
  by_cases hj : j < m
  · rw [binom_lower hm (show j + 1 ≤ m by omega), binom_upper (Nat.le_of_lt hj),
      binom_lower hm (Nat.le_of_lt hj), binom_upper (show j + 1 ≤ m by omega)]
    have hmR : (m : ℝ) ≠ 0 := by exact_mod_cast (show m ≠ 0 by omega)
    have hjR : (j : ℝ) < m := by exact_mod_cast hj
    have hden : (m : ℝ) + 1 - j ≠ 0 := by linarith
    have hden' : (m : ℝ) + 1 - (j + 1) ≠ 0 := by linarith
    unfold oddRun runFactor
    simp only [Nat.cast_add, Nat.cast_one]
    field_simp [hmR, hden, hden']
    ring
  · have hmj : m ≤ j := by omega
    have h₁ : m - 1 < j := by omega
    have h₂ : m - 1 < j + 1 := by omega
    have h₃ : m < j + 1 := by omega
    simp [oddRun, binom_zero h₁, binom_zero h₂, binom_zero h₃]

theorem runFactor_ge_one {m j : ℕ} (hm : 1 ≤ m) (hj : j ≤ m) :
    1 ≤ runFactor m j := by
  have hmR : 0 < (m : ℝ) := by exact_mod_cast (show 0 < m by omega)
  have hjR : (j : ℝ) ≤ m := by exact_mod_cast hj
  unfold runFactor
  have : 0 ≤ (((m : ℝ) + 1) * ((m : ℝ) - j)) /
      ((m : ℝ) * ((m : ℝ) + 1 - j)) :=
    div_nonneg (mul_nonneg (by positivity) (sub_nonneg.mpr hjR))
      (mul_nonneg hmR.le (by linarith))
  linarith

theorem runFactor_antitone_step {m j : ℕ} (hm : 1 ≤ m) (hj : j < m) :
    runFactor m (j + 1) ≤ runFactor m j := by
  have hmR : 0 < (m : ℝ) := by exact_mod_cast (show 0 < m by omega)
  have hjR : (j : ℝ) + 1 ≤ m := by exact_mod_cast (Nat.succ_le_of_lt hj)
  have h₁ : 0 < (m : ℝ) * ((m : ℝ) + 1 - j) := mul_pos hmR (by linarith)
  have h₂ : 0 < (m : ℝ) * ((m : ℝ) - j) := mul_pos hmR (by linarith)
  unfold runFactor
  simp only [Nat.cast_add, Nat.cast_one]
  apply add_le_add le_rfl
  apply (div_le_div_iff₀ (by nlinarith : 0 < (m : ℝ) * ((m : ℝ) + 1 - (j + 1))) h₁).mpr
  nlinarith [sq_nonneg ((m : ℝ) - j)]

theorem evenRun_pos {m j : ℕ} (hm : 1 ≤ m) (hj : j ≤ m) :
    0 < evenRun m j := by
  have hF : 0 < runFactor m j := lt_of_lt_of_le (by norm_num) (runFactor_ge_one hm hj)
  have hC := binom_pos hj
  unfold evenRun
  positivity

theorem evenRun_zero {m j : ℕ} (hj : m < j) : evenRun m j = 0 := by
  simp [evenRun, binom_zero hj]

theorem oddRun_pos {m j : ℕ} (hm : 1 ≤ m) (hj : j < m) :
    0 < oddRun m j := by
  have hF : 0 < runFactor m j := lt_of_lt_of_le (by norm_num) (runFactor_ge_one hm (by omega))
  have hC := binom_pos (Nat.le_of_lt hj)
  have hC' := binom_pos (Nat.succ_le_of_lt hj)
  unfold oddRun
  positivity

theorem oddRun_zero {m j : ℕ} (hj : m ≤ j) : oddRun m j = 0 := by
  simp [oddRun, binom_zero (show m < j + 1 by omega)]

theorem oddRun_logConcave {m j : ℕ} (hm : 1 ≤ m) (hj : j < m) :
    evenRun m j * evenRun m (j + 1) ≤ oddRun m j ^ 2 := by
  have hF := runFactor_ge_one hm (Nat.le_of_lt hj)
  have hd := runFactor_antitone_step hm hj
  have hC := sq_nonneg (binom m j)
  have hC' := sq_nonneg (binom m (j + 1))
  have hmul : 0 ≤ 4 * runFactor m j * binom m j ^ 2 * binom m (j + 1) ^ 2 :=
    by positivity
  have h := mul_le_mul_of_nonneg_left hd hmul
  unfold evenRun oddRun
  nlinarith

theorem runFactor_cross {m j : ℕ} (hm : 1 ≤ m) (hj : 1 ≤ j) (hjm : j ≤ m) :
    runFactor m (j - 1) * (j : ℝ) * ((m : ℝ) - j) ≤
      runFactor m j * ((m : ℝ) - j + 1) * ((j : ℝ) + 1) := by
  have hmR : 0 < (m : ℝ) := by exact_mod_cast (show 0 < m by omega)
  have hjR : 1 ≤ (j : ℝ) := by exact_mod_cast hj
  have hjmR : (j : ℝ) ≤ m := by exact_mod_cast hjm
  have hs : ((j - 1 : ℕ) : ℝ) = (j : ℝ) - 1 := by
    rw [Nat.cast_sub hj, Nat.cast_one]
  have h₁ : (m : ℝ) + 1 - j ≠ 0 := by linarith
  have h₂ : (m : ℝ) + 1 - (j - 1) ≠ 0 := by linarith
  have h₃ : (m : ℝ) - j + 2 ≠ 0 := by linarith
  have hid : runFactor m j * ((m : ℝ) - j + 1) * ((j : ℝ) + 1) -
      runFactor m (j - 1) * (j : ℝ) * ((m : ℝ) - j) =
      ((((2 * (m : ℝ) + 1) * ((m : ℝ) - j) + 2 * m) * j) +
        ((2 * (m : ℝ) + 1) * ((m : ℝ) - j) + m) * ((m : ℝ) - j + 2)) /
      ((m : ℝ) * ((m : ℝ) - j + 2)) := by
    unfold runFactor
    rw [hs]
    field_simp [hmR.ne', h₁, h₂, h₃]
    ring
  have hsnonneg : 0 ≤ (m : ℝ) - j := sub_nonneg.mpr hjmR
  have : 0 ≤ ((((2 * (m : ℝ) + 1) * ((m : ℝ) - j) + 2 * m) * j) +
        ((2 * (m : ℝ) + 1) * ((m : ℝ) - j) + m) * ((m : ℝ) - j + 2)) /
      ((m : ℝ) * ((m : ℝ) - j + 2)) := by positivity
  linarith

theorem evenRun_logConcave {m j : ℕ} (hm : 1 ≤ m) (hj : 1 ≤ j) (hjm : j < m) :
    oddRun m (j - 1) * oddRun m j ≤ evenRun m j ^ 2 := by
  have hj' : j - 1 + 1 = j := by omega
  have hF := runFactor_ge_one hm (Nat.le_of_lt hjm)
  have hC := binom_nonneg m j
  have hcross := runFactor_cross hm hj (Nat.le_of_lt hjm)
  have hden₁ : 0 < (m : ℝ) - j + 1 := by
    have : (j : ℝ) < m := by exact_mod_cast hjm
    linarith
  have hden₂ : 0 < (j : ℝ) + 1 := by positivity
  have hcross' : runFactor m (j - 1) * (j : ℝ) * ((m : ℝ) - j) /
      (((m : ℝ) - j + 1) * ((j : ℝ) + 1)) ≤ runFactor m j := by
    apply (div_le_iff₀ (mul_pos hden₁ hden₂)).mpr
    nlinarith
  have h := mul_le_mul_of_nonneg_left hcross'
    (show 0 ≤ 4 * runFactor m j * binom m j ^ 4 by positivity)
  unfold evenRun oddRun
  rw [hj', binom_previous hj (Nat.le_of_lt hjm), binom_next (Nat.le_of_lt hjm)]
  convert h using 1 <;> field_simp <;> ring

/-- The run coefficients after removing the two initial zero coefficients. -/
noncomputable def interleavedRuns (m n : ℕ) : ℝ :=
  if n % 2 = 0 then evenRun m (n / 2) else oddRun m (n / 2)

theorem interleavedRuns_even (m j : ℕ) : interleavedRuns m (2 * j) = evenRun m j := by
  simp [interleavedRuns, Nat.mul_comm 2 j]

theorem interleavedRuns_odd (m j : ℕ) : interleavedRuns m (2 * j + 1) = oddRun m j := by
  simp [interleavedRuns, show (2 * j + 1) / 2 = j by omega]

theorem interleavedRuns_pos {m n : ℕ} (hm : 1 ≤ m) (hn : n ≤ 2 * m) :
    0 < interleavedRuns m n := by
  have hmod := Nat.mod_lt n (by omega : 0 < 2)
  have hdecomp := Nat.mod_add_div n 2
  by_cases h : n % 2 = 0
  · have hn' : n = 2 * (n / 2) := by omega
    rw [hn', interleavedRuns_even]
    exact evenRun_pos hm (by omega)
  · have hn' : n = 2 * (n / 2) + 1 := by omega
    rw [hn', interleavedRuns_odd]
    exact oddRun_pos hm (by omega)

theorem interleavedRuns_zero {m n : ℕ} (hn : 2 * m < n) :
    interleavedRuns m n = 0 := by
  have hmod := Nat.mod_lt n (by omega : 0 < 2)
  have hdecomp := Nat.mod_add_div n 2
  by_cases h : n % 2 = 0
  · have hn' : n = 2 * (n / 2) := by omega
    rw [hn', interleavedRuns_even]
    exact evenRun_zero (by omega)
  · have hn' : n = 2 * (n / 2) + 1 := by omega
    rw [hn', interleavedRuns_odd]
    exact oddRun_zero (by omega)

theorem interleavedRuns_nonneg {m : ℕ} (hm : 1 ≤ m) (n : ℕ) :
    0 ≤ interleavedRuns m n := by
  by_cases hn : n ≤ 2 * m
  · exact (interleavedRuns_pos hm hn).le
  · rw [interleavedRuns_zero (by omega)]

theorem interleavedRuns_intervalSupport {m : ℕ} (hm : 1 ≤ m) :
    IntervalSupport (interleavedRuns m) := by
  intro i j k hij hjk hi hk
  by_cases hk' : k ≤ 2 * m
  · exact interleavedRuns_pos hm (by omega)
  · rw [interleavedRuns_zero (by omega)] at hk
    exact False.elim (lt_irrefl _ hk)

theorem interleavedRuns_logConcave {m : ℕ} (hm : 1 ≤ m) :
    LogConcave (interleavedRuns m) := by
  intro n
  have hmod := Nat.mod_lt n (by omega : 0 < 2)
  have hdecomp := Nat.mod_add_div n 2
  by_cases h : n % 2 = 0
  · obtain ⟨j, rfl⟩ : ∃ j, n = 2 * j := ⟨n / 2, by omega⟩
    have hs : 2 * j + 2 = 2 * (j + 1) := by omega
    rw [hs, interleavedRuns_even, interleavedRuns_even, interleavedRuns_odd]
    by_cases hj : j < m
    · exact oddRun_logConcave hm hj
    · rw [evenRun_zero (show m < j + 1 by omega), oddRun_zero (by omega)]
      simp
  · obtain ⟨j, rfl⟩ : ∃ j, n = 2 * j + 1 := ⟨n / 2, by omega⟩
    have hs : 2 * j + 1 + 2 = 2 * (j + 1) + 1 := by omega
    have ht : 2 * j + 1 + 1 = 2 * (j + 1) := by omega
    rw [hs, ht, interleavedRuns_odd, interleavedRuns_odd, interleavedRuns_even]
    by_cases hj : j + 1 < m
    · simpa using evenRun_logConcave hm (show 1 ≤ j + 1 by omega) hj
    · rw [oddRun_zero (show m ≤ j + 1 by omega), mul_zero]
      exact sq_nonneg _

theorem interleavedRuns_strongLogConcave {m : ℕ} (hm : 1 ≤ m) :
    StrongLogConcave (interleavedRuns m) :=
  (interleavedRuns_logConcave hm).strong (interleavedRuns_nonneg hm)
    (interleavedRuns_intervalSupport hm)

end Juhnke
