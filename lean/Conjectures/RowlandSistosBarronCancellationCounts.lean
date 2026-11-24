import Conjectures.RowlandSistosBarronKrawtchouk
import Mathlib.Algebra.Ring.Int.Parity
import Mathlib.Data.Finset.Card

/-!
# Rowland–Sistos Barrón conjecture

Exact counts of the cancelled leading coefficients in Section 4 of the
recorded proof. The square-dependent count is uniform in the exponent;
it is not inferred from a finite enumeration.
-/

open scoped BigOperators

namespace RowlandSistosBarron

noncomputable section

theorem parity_cancellation_count {M : ℕ} (hM : 49 ≤ M) :
    ((Finset.range M).filter (fun j => 2 * j = M)).card =
      if M % 2 = 0 then 1 else 0 := by
  have hdiv := Nat.mod_add_div M 2
  by_cases he : M % 2 = 0
  · have hfilter : (Finset.range M).filter (fun j => 2 * j = M) = {M / 2} := by
      ext j
      simp only [Finset.mem_filter, Finset.mem_range, Finset.mem_singleton]
      omega
    simp [hfilter, he]
  · have hfilter : (Finset.range M).filter (fun j => 2 * j = M) = ∅ := by
      ext j
      simp only [Finset.mem_filter, Finset.mem_range, Finset.notMem_empty, iff_false]
      omega
    simp [hfilter, he]

theorem square_of_cancellation {M j : ℕ}
    (h : ((M : ℚ) - 2 * j) ^ 2 = M) : IsSquare M := by
  apply Int.isSquare_natCast_iff.mp
  refine ⟨(M : ℤ) - 2 * j, ?_⟩
  have hz : ((M : ℤ) - 2 * j) ^ 2 = M := by exact_mod_cast h
  simpa [pow_two] using hz.symm

private theorem square_add_mod_two (m : ℕ) : (m ^ 2 + m) % 2 = 0 := by
  have hm := Nat.mod_lt m (by decide : 0 < 2)
  have hc : m % 2 = 0 ∨ m % 2 = 1 := by omega
  rcases hc with h | h <;> simp [Nat.add_mod, Nat.pow_mod, h]

theorem square_cancellation_indices {m : ℕ} (hm : 7 ≤ m) :
    (Finset.range (m ^ 2)).filter (fun j : ℕ => (((m ^ 2 : ℕ) : ℚ) - 2 * (j : ℚ)) ^ 2 = ((m ^ 2 : ℕ) : ℚ)) =
      {(m ^ 2 - m) / 2, (m ^ 2 + m) / 2} := by
  have hmsq : m ≤ m ^ 2 := by nlinarith
  have hsub : m ^ 2 - m + m = m ^ 2 := Nat.sub_add_cancel hmsq
  have hmodp := square_add_mod_two m
  have hmodm : (m ^ 2 - m) % 2 = 0 := by
    have heq : m ^ 2 + m = (m ^ 2 - m) + 2 * m := by omega
    rw [heq, Nat.add_mod, Nat.mul_mod] at hmodp
    simpa using hmodp
  have hdivp := Nat.mod_add_div (m ^ 2 + m) 2
  have hdivm := Nat.mod_add_div (m ^ 2 - m) 2
  have hlow : 2 * ((m ^ 2 - m) / 2) + m = m ^ 2 := by omega
  have hhigh : 2 * ((m ^ 2 + m) / 2) = m ^ 2 + m := by omega
  have hlow_lt : (m ^ 2 - m) / 2 < m ^ 2 := by nlinarith
  have hhigh_lt : (m ^ 2 + m) / 2 < m ^ 2 := by nlinarith
  have hlowq : (2 : ℚ) * ((m ^ 2 - m) / 2 : ℕ) + m = (m : ℚ) ^ 2 := by
    exact_mod_cast hlow
  have hhighq : (2 : ℚ) * ((m ^ 2 + m) / 2 : ℕ) = (m : ℚ) ^ 2 + m := by
    exact_mod_cast hhigh
  ext j
  simp only [Finset.mem_filter, Finset.mem_range, Finset.mem_insert, Finset.mem_singleton]
  constructor
  · rintro ⟨_, h⟩
    push_cast at h
    rcases (sq_eq_sq_iff_eq_or_eq_neg).mp h with hroot | hroot
    · left
      have hj : 2 * j + m = m ^ 2 := by
        have hq : (2 : ℚ) * j + m = (m : ℚ) ^ 2 := by linarith
        exact_mod_cast hq
      omega
    · right
      have hj : 2 * j = m ^ 2 + m := by
        have hq : (2 : ℚ) * j = (m : ℚ) ^ 2 + m := by linarith
        exact_mod_cast hq
      omega
  · rintro (rfl | rfl)
    · refine ⟨hlow_lt, ?_⟩
      push_cast
      have hroot : (m : ℚ) ^ 2 - 2 * ((m ^ 2 - m) / 2 : ℕ) = m := by linarith
      rw [hroot]
    · refine ⟨hhigh_lt, ?_⟩
      push_cast
      have hroot : (m : ℚ) ^ 2 - 2 * ((m ^ 2 + m) / 2 : ℕ) = -m := by linarith
      rw [hroot]
      ring

theorem square_cancellation_count {M : ℕ} (hM : 49 ≤ M) :
    ((Finset.range M).filter (fun j : ℕ => ((M : ℚ) - 2 * (j : ℚ)) ^ 2 = M)).card =
      if IsSquare M then 2 else 0 := by
  classical
  by_cases hs : IsSquare M
  · obtain ⟨m, rfl⟩ := hs.exists_sq
    have hm : 7 ≤ m := by nlinarith
    rw [square_cancellation_indices hm]
    have hdistinct : (m ^ 2 - m) / 2 ≠ (m ^ 2 + m) / 2 := by
      have hmsq : m ≤ m ^ 2 := by nlinarith
      have hsub : m ^ 2 - m + m = m ^ 2 := Nat.sub_add_cancel hmsq
      have hmodp := square_add_mod_two m
      have hdivp := Nat.mod_add_div (m ^ 2 + m) 2
      have hdivm := Nat.mod_add_div (m ^ 2 - m) 2
      have hmodm := Nat.mod_lt (m ^ 2 - m) (by decide : 0 < 2)
      omega
    simp [hdistinct, hs]
  · have hfilter : (Finset.range M).filter (fun j : ℕ => ((M : ℚ) - 2 * (j : ℚ)) ^ 2 = M) = ∅ := by
      apply Finset.filter_eq_empty_iff.mpr
      intro j _ h
      exact hs (square_of_cancellation h)
    simp [hfilter, hs]

end

end RowlandSistosBarron
