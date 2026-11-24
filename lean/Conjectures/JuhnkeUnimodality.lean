import Conjectures.JuhnkePolynomial
import Mathlib.Data.Finset.Max

/-!
# Juhnke's conjecture

The unimodality clause in Juhnke's Conjecture 6 follows from the stronger
ratio-order form of log-concavity already proved for the path polynomial.
-/

namespace Juhnke

/-- Weak increase to a mode and weak decrease from that mode. -/
def Unimodal (a : ℕ → ℝ) : Prop :=
  ∃ k, (∀ i j, i ≤ j → j ≤ k → a i ≤ a j) ∧
    (∀ i j, k ≤ i → i ≤ j → a j ≤ a i)

theorem StrongLogConcave.unimodal_of_finite_support {a : ℕ → ℝ}
    (ha : ∀ i, 0 ≤ a i) (hc : StrongLogConcave a)
    (d : ℕ) (hs : ∀ i, d < i → a i = 0) : Unimodal a := by
  obtain ⟨k, hk, hmax⟩ := Finset.exists_max_image (Finset.range (d + 1)) a
    ⟨0, by simp⟩
  have hglobal (i : ℕ) : a i ≤ a k := by
    by_cases hi : i < d + 1
    · exact hmax i (Finset.mem_range.mpr hi)
    · rw [hs i (by omega)]
      exact ha k
  by_cases hk0 : a k = 0
  · have hz (i : ℕ) : a i = 0 := by
      have h := hglobal i
      rw [hk0] at h
      exact le_antisymm h (ha i)
    refine ⟨0, ?_, ?_⟩ <;> intro i j _ _ <;> simp [hz]
  have hkp : 0 < a k := lt_of_le_of_ne (ha k) (Ne.symm hk0)
  have hleft (i : ℕ) (hi : i < k) : a i ≤ a (i + 1) := by
    have h := hc i (k - 1) (by omega)
    have hk' : k - 1 + 1 = k := by omega
    rw [hk'] at h
    have hmul := mul_le_mul_of_nonneg_left (hglobal (k - 1)) (ha (i + 1))
    exact (mul_le_mul_iff_left₀ hkp).mp (h.trans hmul)
  have hright (i : ℕ) (hi : k ≤ i) : a (i + 1) ≤ a i := by
    have h := hc k i hi
    have hmul := mul_le_mul_of_nonneg_right (hglobal (k + 1)) (ha i)
    exact (mul_le_mul_iff_right₀ hkp).mp (h.trans hmul)
  refine ⟨k, ?_, ?_⟩
  · intro i j hij hjk
    induction j, hij using Nat.le_induction with
    | base => exact le_rfl
    | succ j hij ih =>
      exact (ih (by omega)).trans (hleft j (by omega))
  · intro i j hki hij
    induction j, hij using Nat.le_induction with
    | base => exact le_rfl
    | succ j hij ih =>
      exact (hright j (by omega)).trans ih

theorem polynomial_unimodal_of_strongLogConcave {p : Polynomial ℝ}
    (hp : ∀ i, 0 ≤ p.coeff i) (hc : StrongLogConcave p.coeff) : Unimodal p.coeff :=
  hc.unimodal_of_finite_support hp p.natDegree fun _ hi =>
    Polynomial.coeff_eq_zero_of_natDegree_lt hi

theorem runExpansionPolynomial_unimodal {m : ℕ} (hm : 1 ≤ m) :
    Unimodal (runExpansionPolynomial m).coeff := by
  have h := runExpansionPolynomial_strongLogConcave hm
  exact polynomial_unimodal_of_strongLogConcave h.1 h.2

end Juhnke
