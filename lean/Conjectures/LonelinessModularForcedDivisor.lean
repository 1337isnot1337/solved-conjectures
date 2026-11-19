import Conjectures.LonelinessModularPrimes
import Conjectures.LonelinessModularWitness
import Mathlib.Algebra.GCDMonoid.Finset

/-! Every small denominator divides a speed in a tuple at or below the tight
threshold. Its least common multiple strengthens the exact prime-product
selection bound, including the nine-speed certificate. -/

namespace Loneliness.Modular

open scoped BigOperators

theorem exists_dvd_speed_of_tight (k d : ℕ) (ds : List ℕ)
    (hd : 2 ≤ d) (hdk : d ≤ k)
    (hvalue : value ds ≤ (1 : ℝ) / ((k : ℝ)+1)) :
    ∃ a ∈ ds, d ∣ a := by
  by_contra! hnone
  have hdpos : 0 < d := by omega
  have hw : Witness d d 1 ds := by
    intro a ha
    have hmod : a % d ≠ 0 := fun h => hnone a ha (Nat.dvd_of_mod_eq_zero h)
    have hlt : a % d < d := Nat.mod_lt a hdpos
    have hfold : 1 ≤ folded d a := by
      unfold folded
      omega
    simpa only [Nat.one_mul, Nat.mul_one] using Nat.mul_le_mul_left d hfold
  have hlower := witness_value_lower hd hdpos hw
  have hgap : (1 : ℝ) / ((k : ℝ)+1) < 1 / (d : ℝ) := by
    apply one_div_lt_one_div_of_lt (by exact_mod_cast hdpos)
    exact_mod_cast (show d < k+1 by omega)
  linarith

def forcedDivisor (k : ℕ) : ℕ := (Finset.Icc 2 k).lcm id

theorem forcedDivisor_dvd_product (k : ℕ) (ds : List ℕ)
    (hvalue : value ds ≤ (1 : ℝ) / ((k : ℝ)+1)) :
    forcedDivisor k ∣ ds.prod := by
  apply Finset.lcm_dvd
  intro d hd
  obtain ⟨a, ha, hda⟩ := exists_dvd_speed_of_tight k d ds
    (Finset.mem_Icc.mp hd).1 (Finset.mem_Icc.mp hd).2 hvalue
  exact hda.trans (List.dvd_prod ha)

theorem exists_prime_avoiding_with_forced_divisor {n : ℕ}
    (hn : 0 < n) (v : Fin n → ℕ) (hpositive : ∀ i, 0 < v i)
    (F : ℕ) (ps : Finset ℕ)
    (hprime : ∀ p ∈ ps, p.Prime)
    (hforced : F ∣ ∏ i, v i)
    (hcoprime : F.Coprime (∏ p ∈ ps, p))
    (hbound : (∑ i, (v i)^2)^n < n^n * (F * ∏ p ∈ ps, p)^2) :
    ∃ p ∈ ps, ∀ i, ¬ p ∣ v i := by
  classical
  by_contra! hnone
  have hprimeprod : (∏ p ∈ ps, p) ∣ ∏ i, v i := by
    apply prime_product_dvd ps _ hprime
    intro p hp
    obtain ⟨i, hi⟩ := hnone p hp
    exact hi.trans (Finset.dvd_prod_of_mem v (Finset.mem_univ i))
  have hdiv := hcoprime.mul_dvd_of_dvd_of_dvd hforced hprimeprod
  have hlower : F * ∏ p ∈ ps, p ≤ ∏ i, v i :=
    Nat.le_of_dvd (Finset.prod_pos (fun i _ => hpositive i)) hdiv
  have hsquare := Nat.pow_le_pow_left hlower 2
  have hscaled := Nat.mul_le_mul_left (n^n) hsquare
  have hamgm := speed_product_square_bound hn v
  exact (not_le_of_gt hbound) (hscaled.trans hamgm)

theorem exists_prime_avoiding_forced_of_tight {n : ℕ}
    (hn : 0 < n) (v : Fin n → ℕ) (hpositive : ∀ i, 0 < v i)
    (hvalue : value (List.ofFn v) ≤ (1 : ℝ) / ((n : ℝ)+1))
    (ps : Finset ℕ) (hprime : ∀ p ∈ ps, p.Prime)
    (hcoprime : (forcedDivisor n).Coprime (∏ p ∈ ps, p))
    (hbound : (∑ i, (v i)^2)^n <
      n^n * (forcedDivisor n * ∏ p ∈ ps, p)^2) :
    ∃ p ∈ ps, ∀ i, ¬ p ∣ v i := by
  apply exists_prime_avoiding_with_forced_divisor hn v hpositive
    (forcedDivisor n) ps hprime ?_ hcoprime hbound
  simpa only [List.prod_ofFn] using forcedDivisor_dvd_product n (List.ofFn v) hvalue

end Loneliness.Modular
