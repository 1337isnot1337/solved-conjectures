import Conjectures.BraunBrueggeBicyclicWedgeBenchmark

/-! Normalized odd-cycle facet counts increase with length, and their
successive ratios decrease. These facts give the balanced product maximum. -/

namespace BraunBruegge

noncomputable def oddIndexMass (j : ℕ) : ℝ := ((2 : ℝ) * j + 1) / 2 * centralSignMass (2 * j)

theorem oddIndexMass_nonneg (j : ℕ) : 0 ≤ oddIndexMass j := by
  unfold oddIndexMass
  exact mul_nonneg (by positivity) (centralSignMass_nonneg _)

theorem normalized_oddCycle_index (j : ℕ) :
    (oddCycleFacetNumber (2 * j + 1) : ℝ) / (2 : ℝ) ^ (2 * j + 1) = oddIndexMass j := by
  unfold oddCycleFacetNumber oddIndexMass centralSignMass
  rw [show 2 * j + 1 - 1 = 2 * j by omega, pow_succ]
  push_cast
  ring

theorem centralSignMass_even_succ (j : ℕ) :
    centralSignMass (2 * (j + 1)) = ((2 : ℝ) * j + 1) / (2 * j + 2) * centralSignMass (2 * j) := by
  have h : ((j : ℝ) + 1) * (Nat.centralBinom (j + 1) : ℝ) =
      2 * (2 * (j : ℝ) + 1) * (j.centralBinom : ℝ) := by exact_mod_cast Nat.succ_mul_centralBinom_succ j
  have he : (Nat.centralBinom (j + 1) : ℝ) =
      2 * (2 * (j : ℝ) + 1) * (j.centralBinom : ℝ) / ((j : ℝ) + 1) :=
    (eq_div_iff (by positivity)).mpr (by linear_combination h)
  unfold centralSignMass
  rw [show 2 * (j + 1) / 2 = j + 1 by omega, show 2 * j / 2 = j by omega,
    ← Nat.centralBinom_eq_two_mul_choose, ← Nat.centralBinom_eq_two_mul_choose,
    he, Nat.mul_succ 2 j, pow_add]
  field_simp

theorem oddIndexMass_succ (j : ℕ) :
    oddIndexMass (j + 1) = oddIndexMass j * ((2 : ℝ) * j + 3) / (2 * j + 2) := by
  unfold oddIndexMass
  rw [centralSignMass_even_succ]
  push_cast
  ring

theorem oddIndexMass_monotone : Monotone oddIndexMass := by
  apply monotone_nat_of_le_succ
  intro j
  rw [oddIndexMass_succ]
  apply (le_div_iff₀ (by positivity)).mpr
  nlinarith [oddIndexMass_nonneg j]

private theorem oddIndexMass_exchange (a b : ℕ) (hab : a + 2 ≤ b) :
    oddIndexMass a * oddIndexMass b ≤ oddIndexMass (a + 1) * oddIndexMass (b - 1) := by
  obtain ⟨k, rfl⟩ : ∃ k, b = k + 1 := ⟨b - 1, by omega⟩
  rw [Nat.add_sub_cancel, oddIndexMass_succ k, oddIndexMass_succ a]
  have hak : (a : ℝ) ≤ k := by exact_mod_cast (show a ≤ k by omega)
  have hfrac : ((2 : ℝ) * k + 3) / (2 * k + 2) ≤ ((2 : ℝ) * a + 3) / (2 * a + 2) := by
    apply (div_le_div_iff₀ (by positivity) (by positivity)).mpr
    nlinarith only [hak]
  have hm := mul_le_mul_of_nonneg_left hfrac (mul_nonneg (oddIndexMass_nonneg a) (oddIndexMass_nonneg k))
  convert hm using 1 <;> ring

private theorem oddIndexMass_product_balanced_sorted (a b : ℕ) (hab : a ≤ b) :
    oddIndexMass a * oddIndexMass b ≤ oddIndexMass ((a + b) / 2) * oddIndexMass ((a + b + 1) / 2) := by
  generalize hd : b - a = d
  induction d using Nat.strong_induction_on generalizing a b with
  | h d ih =>
    by_cases hclose : b ≤ a + 1
    · rw [show (a + b) / 2 = a by omega, show (a + b + 1) / 2 = b by omega]
    · have hsorted : a + 1 ≤ b - 1 := by omega
      have hsmall : b - 1 - (a + 1) < d := by omega
      have hIH := ih (b - 1 - (a + 1)) hsmall (a + 1) (b - 1) hsorted rfl
      rw [show a + 1 + (b - 1) = a + b by omega] at hIH
      exact (oddIndexMass_exchange a b (by omega)).trans hIH

theorem oddIndexMass_product_balanced (a b : ℕ) :
    oddIndexMass a * oddIndexMass b ≤ oddIndexMass ((a + b) / 2) * oddIndexMass ((a + b + 1) / 2) := by
  by_cases hab : a ≤ b
  · exact oddIndexMass_product_balanced_sorted a b hab
  · simpa only [mul_comm (oddIndexMass b) (oddIndexMass a), Nat.add_comm b a] using
      oddIndexMass_product_balanced_sorted b a (by omega)

end BraunBruegge
