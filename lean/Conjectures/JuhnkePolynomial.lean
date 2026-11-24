import Conjectures.JuhnkeRuns
import Mathlib.Algebra.Polynomial.Reverse

/-!
# Juhnke's conjecture

This module assembles the proven alternating-run inequalities and the
binomial-translation theorem. The path-count bridge is a separate module;
this file proves log-concavity of the explicit run-expansion polynomial for
every parameter, not only bounded computations.
-/

namespace Juhnke

open Polynomial
open scoped BigOperators

theorem reflect_finsetSum {ι : Type*} (s : Finset ι) (f : ι → ℝ[X]) (N : ℕ) :
    reflect N (∑ i ∈ s, f i) = ∑ i ∈ s, reflect N (f i) := by
  ext i
  simp only [coeff_reflect, finsetSum_coeff]

theorem reflect_coeff_of_le {p : ℝ[X]} {N i : ℕ} (hi : i ≤ N) :
    (reflect N p).coeff i = p.coeff (N - i) := by
  rw [coeff_reflect, revAt_le hi]

theorem reflect_coeff_zero {p : ℝ[X]} {N i : ℕ} (hp : p.natDegree ≤ N)
    (hi : N < i) : (reflect N p).coeff i = 0 := by
  rw [coeff_reflect, revAt_eq_self_of_lt hi]
  exact coeff_eq_zero_of_natDegree_lt (lt_of_le_of_lt hp hi)

theorem reflect_preserves_strongLogConcave {p : ℝ[X]} {N : ℕ}
    (hdegree : p.natDegree ≤ N) (hp : ∀ i, 0 ≤ p.coeff i)
    (hc : StrongLogConcave p.coeff) :
    (∀ i, 0 ≤ (reflect N p).coeff i) ∧ StrongLogConcave (reflect N p).coeff := by
  have hn (i : ℕ) : 0 ≤ (reflect N p).coeff i := by
    rw [coeff_reflect]
    exact hp _
  refine ⟨hn, ?_⟩
  intro i j hij
  by_cases hj : j < N
  · rw [reflect_coeff_of_le (show i ≤ N by omega),
      reflect_coeff_of_le (show j + 1 ≤ N by omega),
      reflect_coeff_of_le (show i + 1 ≤ N by omega),
      reflect_coeff_of_le (show j ≤ N by omega)]
    have h := hc (N - (j + 1)) (N - (i + 1)) (by omega)
    have hi' : N - (i + 1) + 1 = N - i := by omega
    have hj' : N - (j + 1) + 1 = N - j := by omega
    rw [hi', hj'] at h
    simpa [mul_comm] using h
  · rw [reflect_coeff_zero hdegree (show N < j + 1 by omega), mul_zero]
    exact mul_nonneg (hn _) (hn _)

noncomputable def runPolynomial (m : ℕ) : ℝ[X] :=
  ∑ n ∈ Finset.range (2 * m + 1), monomial n (interleavedRuns m n)

theorem runPolynomial_coeff (m n : ℕ) :
    (runPolynomial m).coeff n = interleavedRuns m n := by
  unfold runPolynomial
  simp only [finsetSum_coeff, coeff_monomial]
  by_cases hn : n ≤ 2 * m
  · simp [Finset.sum_ite_eq', show n < 2 * m + 1 by omega]
  · simp [Finset.sum_ite_eq', show ¬ n < 2 * m + 1 by omega,
      interleavedRuns_zero (show 2 * m < n by omega)]

theorem runPolynomial_natDegree_le (m : ℕ) : (runPolynomial m).natDegree ≤ 2 * m := by
  apply natDegree_le_iff_coeff_eq_zero.mpr
  intro n hn
  rw [runPolynomial_coeff, interleavedRuns_zero hn]

theorem runPolynomial_strongLogConcave {m : ℕ} (hm : 1 ≤ m) :
    (∀ i, 0 ≤ (runPolynomial m).coeff i) ∧ StrongLogConcave (runPolynomial m).coeff := by
  have hcoeff : (runPolynomial m).coeff = interleavedRuns m := by
    funext n
    exact runPolynomial_coeff m n
  rw [hcoeff]
  exact ⟨interleavedRuns_nonneg hm, interleavedRuns_strongLogConcave hm⟩

theorem reflect_X_add_one : reflect 1 (X + (1 : ℝ[X])) = X + 1 := by
  have hx : reflect 1 (X : ℝ[X]) = 1 := by
    simp
  rw [reflect_add, hx, reflect_one]
  simp [add_comm]

theorem reflect_X_add_one_pow (d : ℕ) :
    reflect d ((X + (1 : ℝ[X])) ^ d) = (X + 1) ^ d := by
  induction d with
  | zero => simp [reflect_one]
  | succ d ih =>
    rw [pow_succ]
    rw [reflect_mul _ _ (F := d) (G := 1)]
    · rw [ih, reflect_X_add_one]
    · simp
    · simp

theorem reflect_extended_X_add_one_pow (n d : ℕ) :
    reflect (n + d) ((X + (1 : ℝ[X])) ^ d) = X ^ n * (X + 1) ^ d := by
  have h := reflect_mul (1 : ℝ[X]) ((X + 1) ^ d) (F := n) (G := d)
    (by simp) (by simp)
  simpa [reflect_one, reflect_X_add_one_pow] using h

/-- The literal sum supplied by expanding each long step into unit edges. -/
noncomputable def runExpansionPolynomial (m : ℕ) : ℝ[X] :=
  ∑ n ∈ Finset.range (2 * m + 1),
    C (interleavedRuns m n) * X ^ (n + 2) * (1 + X) ^ (2 * m - n)

theorem runExpansionPolynomial_reflection (m : ℕ) :
    runExpansionPolynomial m =
      reflect (2 * m + 2) (taylor 1 (reflect (2 * m) (runPolynomial m))) := by
  unfold runPolynomial
  rw [reflect_finsetSum]
  simp_rw [← C_mul_X_pow_eq_monomial, reflect_C_mul_X_pow]
  rw [map_sum]
  rw [reflect_finsetSum]
  unfold runExpansionPolynomial
  apply Finset.sum_congr rfl
  intro n hn
  have hn' : n ≤ 2 * m := by simpa using Finset.mem_range.mp hn
  rw [revAt_le hn']
  simp only [taylor_mul, taylor_C, taylor_X_pow, map_one]
  rw [reflect_C_mul]
  have heq : 2 * m + 2 = (n + 2) + (2 * m - n) := by omega
  rw [heq, reflect_extended_X_add_one_pow]
  simp [add_comm, mul_assoc]

theorem runExpansionPolynomial_strongLogConcave {m : ℕ} (hm : 1 ≤ m) :
    (∀ i, 0 ≤ (runExpansionPolynomial m).coeff i) ∧
      StrongLogConcave (runExpansionPolynomial m).coeff := by
  have hRun := runPolynomial_strongLogConcave hm
  have hRev := reflect_preserves_strongLogConcave (runPolynomial_natDegree_le m)
    hRun.1 hRun.2
  have hTaylor := taylor_preserves_strongLogConcave hRev.1 hRev.2 (by norm_num : (0 : ℝ) ≤ 1)
  rw [runExpansionPolynomial_reflection]
  apply reflect_preserves_strongLogConcave _ hTaylor.1 hTaylor.2
  rw [natDegree_taylor]
  have hdegree := runPolynomial_natDegree_le m
  exact natDegree_reflect_le.trans (by omega)

/-- Every coefficient inequality of Juhnke's all-dimensional run expansion. -/
theorem runExpansionPolynomial_logConcave {m : ℕ} (hm : 1 ≤ m) :
    LogConcave (runExpansionPolynomial m).coeff :=
  (runExpansionPolynomial_strongLogConcave hm).2.logConcave

end Juhnke
