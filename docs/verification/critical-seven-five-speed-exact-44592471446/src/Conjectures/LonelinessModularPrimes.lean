import Mathlib.Data.Nat.Prime.Basic
import Mathlib.Data.Nat.GCD.BigOperators
import Mathlib.Data.Int.Basic
import Mathlib.Algebra.Order.BigOperators.GroupWithZero.List
import Mathlib.Algebra.BigOperators.Fin
import Mathlib.Analysis.MeanInequalities
import Mathlib.Tactic

/-!
# Prime-product reductions for finite modular classifications

Distinct checked primes give divisibility by their full product. This file
proves both uses of that fact in the spectrum arguments: choosing a modulus
which divides no speed, and forcing a bounded integer obstruction to vanish.
-/

namespace Loneliness.Modular

open scoped BigOperators

theorem prime_product_dvd (ps : Finset ℕ) (D : ℕ)
    (hprime : ∀ p ∈ ps, p.Prime) (hdiv : ∀ p ∈ ps, p ∣ D) :
    (∏ p ∈ ps, p) ∣ D := by
  classical
  induction ps using Finset.induction_on with
  | empty => simp
  | @insert p ps hnot ih =>
    rw [Finset.prod_insert hnot]
    have hcop : p.Coprime (∏ q ∈ ps, q) := by
      apply Nat.Coprime.prod_right
      intro q hq
      exact (Nat.coprime_primes (hprime p (by simp))
        (hprime q (by simp [hq]))).mpr (by
          intro heq
          exact hnot (heq ▸ hq))
    apply hcop.mul_dvd_of_dvd_of_dvd
    · exact hdiv p (by simp)
    · exact ih (fun q hq => hprime q (by simp [hq]))
        (fun q hq => hdiv q (by simp [hq]))

/-- A prime-product bound supplies a modulus dividing none of the positive
speeds. No probabilistic selection or unproved distribution result is used. -/
theorem exists_prime_avoiding_speeds (ps : Finset ℕ) (ds : List ℕ)
    (hprime : ∀ p ∈ ps, p.Prime) (hpos : ∀ d ∈ ds, 0 < d)
    (hbound : ds.prod < ∏ p ∈ ps, p) :
    ∃ p ∈ ps, ∀ d ∈ ds, ¬ p ∣ d := by
  classical
  by_contra! hnone
  have hdiv : ∀ p ∈ ps, p ∣ ds.prod := by
    intro p hp
    obtain ⟨d, hd, hpd⟩ := hnone p hp
    exact hpd.trans (List.dvd_prod hd)
  have hprod := prime_product_dvd ps ds.prod hprime hdiv
  exact (not_le_of_gt hbound) (Nat.le_of_dvd (List.prod_pos hpos) hprod)

/-- Congruences at every checked prime, together with a strict absolute
bound, force the original integer obstruction to be zero. -/
theorem integer_eq_zero_of_prime_product (ps : Finset ℕ) (F : ℤ)
    (hprime : ∀ p ∈ ps, p.Prime)
    (hdiv : ∀ p ∈ ps, (p : ℤ) ∣ F)
    (hbound : F.natAbs < ∏ p ∈ ps, p) : F = 0 := by
  have hprod := prime_product_dvd ps F.natAbs hprime
    (fun p hp => Int.natCast_dvd.mp (hdiv p hp))
  have hz : F.natAbs = 0 := by
    by_contra hne
    exact (not_le_of_gt hbound) (Nat.le_of_dvd (Nat.pos_of_ne_zero hne) hprod)
  exact Int.natAbs_eq_zero.mp hz

/-- The modular conclusion may be a disjunction of polynomial equations:
divisibility of their product still forces a literal zero factor. -/
theorem exists_zero_factor_of_prime_product {ι : Type*} (s : Finset ι)
    (f : ι → ℤ) (ps : Finset ℕ)
    (hprime : ∀ p ∈ ps, p.Prime)
    (hdiv : ∀ p ∈ ps, ∃ i ∈ s, (p : ℤ) ∣ f i)
    (hbound : (∏ i ∈ s, f i).natAbs < ∏ p ∈ ps, p) :
    ∃ i ∈ s, f i = 0 := by
  classical
  have hz : (∏ i ∈ s, f i) = 0 := by
    apply integer_eq_zero_of_prime_product ps _ hprime ?_ hbound
    intro p hp
    obtain ⟨i, hi, hpi⟩ := hdiv p hp
    exact hpi.trans (Finset.dvd_prod_of_mem f hi)
  exact Finset.prod_eq_zero_iff.mp hz

/-- AM--GM in the exact polynomial form needed by the norm reductions. -/
theorem scaled_product_le_sum_pow {n : ℕ} (hn : 0 < n) (f : Fin n → ℝ)
    (hf : ∀ i, 0 ≤ f i) :
    (n : ℝ) ^ n * (∏ i, f i) ≤ (∑ i, f i) ^ n := by
  have hnR : (0 : ℝ) < n := by exact_mod_cast hn
  have hweight : ∑ _i : Fin n, (1 : ℝ) / n = 1 := by
    simp [ne_of_gt hnR]
  have hmean := Real.geom_mean_le_arith_mean_weighted Finset.univ
    (fun _ : Fin n => (1 : ℝ) / n) f
    (fun _ _ => by positivity) hweight (fun i _ => hf i)
  have hsum : (∑ i, (1 / (n : ℝ)) * f i) = (∑ i, f i) / n := by
    rw [← Finset.mul_sum]
    ring
  rw [hsum] at hmean
  have hpow := pow_le_pow_left₀
    (Finset.prod_nonneg (fun i _ => Real.rpow_nonneg (hf i) _)) hmean n
  have hroot (i : Fin n) : (f i ^ ((1 : ℝ) / n)) ^ n = f i := by
    rw [← Real.rpow_natCast, ← Real.rpow_mul (hf i)]
    rw [one_div_mul_cancel (ne_of_gt hnR), Real.rpow_one]
  rw [← Finset.prod_pow] at hpow
  simp only [hroot] at hpow
  calc
    (n : ℝ)^n * ∏ i, f i ≤ (n : ℝ)^n * ((∑ i, f i) / n)^n :=
      mul_le_mul_of_nonneg_left hpow (by positivity)
    _ = (∑ i, f i)^n := by
      rw [← mul_pow]
      congr 1
      field_simp

theorem speed_product_square_bound {n : ℕ} (hn : 0 < n) (v : Fin n → ℕ) :
    n^n * (∏ i, v i)^2 ≤ (∑ i, (v i)^2)^n := by
  have h := scaled_product_le_sum_pow hn (fun i => ((v i : ℝ)^2))
    (fun i => sq_nonneg _)
  rw [Finset.prod_pow] at h
  exact_mod_cast h

/-- This version consumes only integer squares and products, so each
numerical norm/prime certificate can be checked by ordinary kernel reduction. -/
theorem exists_prime_avoiding_of_square_bound {n : ℕ} (hn : 0 < n)
    (v : Fin n → ℕ) (hv : ∀ i, 0 < v i) (ps : Finset ℕ)
    (hprime : ∀ p ∈ ps, p.Prime)
    (hbound : (∑ i, (v i)^2)^n < n^n * (∏ p ∈ ps, p)^2) :
    ∃ p ∈ ps, ∀ i, ¬ p ∣ v i := by
  have hmul := lt_of_le_of_lt (speed_product_square_bound hn v) hbound
  have hsq : (∏ i, v i)^2 < (∏ p ∈ ps, p)^2 := by
    exact (Nat.mul_lt_mul_left (Nat.pow_pos hn)).mp hmul
  have hprod : (∏ i, v i) < ∏ p ∈ ps, p := by
    by_contra hnot
    exact (not_le_of_gt hsq) (Nat.pow_le_pow_left (Nat.le_of_not_gt hnot) 2)
  have hpos : ∀ d ∈ List.ofFn v, 0 < d := by
    intro d hd
    obtain ⟨i, rfl⟩ := List.mem_ofFn.mp hd
    exact hv i
  obtain ⟨p, hp, havoid⟩ := exists_prime_avoiding_speeds ps (List.ofFn v)
    hprime hpos (by simpa only [List.prod_ofFn] using hprod)
  exact ⟨p, hp, fun i => havoid (v i) (List.mem_ofFn.mpr ⟨i, rfl⟩)⟩

end Loneliness.Modular
