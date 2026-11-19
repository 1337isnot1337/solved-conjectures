import Mathlib.NumberTheory.EulerProduct.Basic

/-! The endpoint-density tail only ranges over integers whose prime
factors divide the fixed endpoint order. Its reciprocal-power series
converges in every positive dimension, including dimension one. -/

namespace Loneliness.Hyperplane

open scoped BigOperators

noncomputable section

def reciprocalPowerHom (d : ℕ) : ℕ →* ℝ where
  toFun n := ((n : ℝ) ^ d)⁻¹
  map_one' := by simp
  map_mul' := by
    intro m n
    simp [Nat.cast_mul, mul_pow, mul_inv_rev, mul_comm]

theorem reciprocalPowerHom_prime_norm_lt_one
    (d : ℕ) (hd : 0 < d) {p : ℕ} (hp : p.Prime) :
    ‖reciprocalPowerHom d p‖ < 1 := by
  change ‖((p : ℝ) ^ d)⁻¹‖ < 1
  rw [Real.norm_eq_abs, abs_of_nonneg (by positivity)]
  apply inv_lt_one_of_one_lt₀
  exact one_lt_pow₀ (by exact_mod_cast hp.one_lt) hd.ne'

theorem hasSum_smooth_reciprocal_power
    (Q d : ℕ) (hd : 0 < d) :
    HasSum (fun g : Nat.factoredNumbers Q.primeFactors =>
      (((g : ℕ) : ℝ) ^ d)⁻¹)
      (∏ p ∈ Q.primeFactors, (1 - ((p : ℝ) ^ d)⁻¹)⁻¹) := by
  have h := EulerProduct.summable_and_hasSum_factoredNumbers_prod_filter_prime_geometric
    (f := reciprocalPowerHom d) (fun {_} hp => reciprocalPowerHom_prime_norm_lt_one d hd hp)
    Q.primeFactors
  have hfilter : Q.primeFactors.filter Nat.Prime = Q.primeFactors := by
    exact Finset.filter_eq_self.mpr (fun _ hp => Nat.prime_of_mem_primeFactors hp)
  simpa [reciprocalPowerHom, hfilter] using h.2

theorem summable_smooth_reciprocal_power
    (Q d : ℕ) (hd : 0 < d) :
    Summable (fun g : Nat.factoredNumbers Q.primeFactors =>
      (((g : ℕ) : ℝ) ^ d)⁻¹) :=
  (hasSum_smooth_reciprocal_power Q d hd).summable

theorem tsum_smooth_reciprocal_power
    (Q d : ℕ) (hd : 0 < d) :
    (∑' g : Nat.factoredNumbers Q.primeFactors, (((g : ℕ) : ℝ) ^ d)⁻¹) =
      (∏ p ∈ Q.primeFactors, 1 - ((p : ℝ) ^ d)⁻¹)⁻¹ := by
  rw [(hasSum_smooth_reciprocal_power Q d hd).tsum_eq, Finset.prod_inv_distrib]

end

end Loneliness.Hyperplane
