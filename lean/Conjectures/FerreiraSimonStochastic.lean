import Mathlib

/-!
# Ferreira–Simon's stochastic-order conjecture: deterministic comparison

Candidate for the strict pathwise comparison in the recorded proof:
`results/ferreira-simon-stochastic/PROOF.md`, commit
23e30ce2aae991fd821f1f03a081760d66ef5812.
Original conjecture: Ferreira and Simon, arXiv:2512.04940v1,
Remark 7(b).

This file proves only the deterministic sequence comparison, conditional on
summability. The probability-one event, Poisson Laplace functional, Gamma
scaling, stable marginal identification and passage to stochastic order are
not formalized here. Compilation and repository verification are pending.
-/

namespace Conjectures.FerreiraSimonStochastic

/-- Strict comparison of reciprocal power norms of an everywhere-positive
sequence, for arbitrary positive real exponents, not just integer exponents. -/
theorem inverse_power_sums_strict (a : ℕ → ℝ) (p q : ℝ)
    (ha : ∀ i, 0 < a i) (hp : 0 < p) (hpq : p < q)
    (hsp : Summable (fun i => a i ^ p))
    (hsq : Summable (fun i => a i ^ q)) :
    (∑' i, a i ^ p) ^ (-1 / p) < (∑' i, a i ^ q) ^ (-1 / q) := by
  let S : ℝ := ∑' i, a i ^ p
  let Q : ℝ := ∑' i, a i ^ q
  have hq : 0 < q := hp.trans hpq
  have hlt : ∀ i, a i ^ p < S := by
    intro i
    have h := Summable.sum_le_tsum ({i, i + 1} : Finset ℕ)
      (fun j _ => (Real.rpow_pos_of_pos (ha j) p).le) hsp
    rw [Finset.sum_insert (by simp), Finset.sum_singleton] at h
    change a i ^ p + a (i + 1) ^ p ≤ S at h
    linarith [Real.rpow_pos_of_pos (ha (i + 1)) p]
  have hS : 0 < S := (Real.rpow_pos_of_pos (ha 0) p).trans (hlt 0)
  have hQ : 0 < Q :=
    Summable.tsum_pos hsq (fun i => (Real.rpow_pos_of_pos (ha i) q).le)
      0 (Real.rpow_pos_of_pos (ha 0) q)
  let u : ℕ → ℝ := fun i => a i ^ p / S
  have hu0 : ∀ i, 0 < u i :=
    fun i => div_pos (Real.rpow_pos_of_pos (ha i) p) hS
  have hu1 : ∀ i, u i < 1 :=
    fun i => (div_lt_one hS).2 (hlt i)
  have hr : 1 < q / p := (lt_div_iff₀ hp).2 (by simpa using hpq)
  have hnorm : ∀ i, u i ^ (q / p) = a i ^ q / S ^ (q / p) := by
    intro i
    change (a i ^ p / S) ^ (q / p) = _
    rw [Real.div_rpow (Real.rpow_nonneg (ha i).le p) hS.le,
      ← Real.rpow_mul (ha i).le]
    have he : p * (q / p) = q := by field_simp [hp.ne']
    rw [he]
  have hterm : ∀ i, u i ^ (q / p) < u i := by
    intro i
    simpa only [Real.rpow_one] using
      Real.rpow_lt_rpow_of_exponent_gt (hu0 i) (hu1 i) hr
  have hsu : Summable u := hsp.div_const S
  have hsum := Summable.tsum_lt_tsum_of_nonneg
    (fun i => (Real.rpow_pos_of_pos (hu0 i) (q / p)).le)
    (fun i => (hterm i).le) (hterm 0) hsu
  simp_rw [hnorm] at hsum
  change (∑' i, a i ^ q / S ^ (q / p)) < (∑' i, a i ^ p / S) at hsum
  rw [tsum_div_const, tsum_div_const] at hsum
  change Q / S ^ (q / p) < S / S at hsum
  rw [div_self hS.ne'] at hsum
  have hQlt : Q < S ^ (q / p) :=
    (div_lt_one (Real.rpow_pos_of_pos hS _)).1 hsum
  have hneg : (-1 / q : ℝ) < 0 := div_neg_of_neg_of_pos (by norm_num) hq
  have hresult :=
    (Real.rpow_lt_rpow_iff_of_neg (Real.rpow_pos_of_pos hS _) hQ hneg).2 hQlt
  have heq : (S ^ (q / p)) ^ (-1 / q) = S ^ (-1 / p) := by
    rw [← Real.rpow_mul hS.le]
    congr 1
    field_simp [hp.ne', hq.ne'] <;> ring
  rw [heq] at hresult
  exact hresult

/-- Parameter direction of the recorded Poisson coupling. This statement
does not assert that the sums have the required marginal distributions. -/
theorem strict_parameter_order (a : ℕ → ℝ) (α β : ℝ)
    (ha : ∀ i, 0 < a i) (hα : 0 < α) (hαβ : α < β)
    (hsα : Summable (fun i => a i ^ (1 / α)))
    (hsβ : Summable (fun i => a i ^ (1 / β))) :
    (∑' i, a i ^ (1 / β)) ^ (-β) <
    (∑' i, a i ^ (1 / α)) ^ (-α) := by
  have hβ : 0 < β := hα.trans hαβ
  have hpq : 1 / β < 1 / α := (one_div_lt_one_div hβ hα).2 hαβ
  have h := inverse_power_sums_strict a (1 / β) (1 / α) ha
    (one_div_pos.mpr hβ) hpq hsβ hsα
  have h₁ : (-1 : ℝ) / (1 / β) = -β := by field_simp [hβ.ne']
  have h₂ : (-1 : ℝ) / (1 / α) = -α := by field_simp [hα.ne']
  rw [h₁, h₂] at h
  exact h

#print axioms inverse_power_sums_strict
#print axioms strict_parameter_order

end Conjectures.FerreiraSimonStochastic
