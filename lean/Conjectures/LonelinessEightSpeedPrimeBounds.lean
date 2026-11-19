import Conjectures.LonelinessTightSmallNormBounds

/-! The improved squared-norm ceiling needs only the first twenty original
eight-speed primes. The original twenty-six-prime list is retained unchanged
in TightPrimeBounds. All assertions below use exact natural arithmetic. -/

namespace Loneliness.Modular.EightSpeed

open scoped BigOperators
open CoordinateSubspace TightPrimeBounds

set_option maxRecDepth 16384
set_option maxHeartbeats 0

def smallPrimeSet : Finset ℕ :=
  {71,89,97,101,107,113,131,137,139,149,151,157,163,167,173,179,181,191,193,197}

def smallPrimeProduct : ℕ := 7308224883867280340537283066963016119376739

theorem smallPrimeSet_subset : smallPrimeSet ⊆ primeSet 8 := by
  decide +kernel

theorem smallPrimeSet_primes : ∀ p ∈ smallPrimeSet, p.Prime := by
  intro p hp
  exact all_primes_eight p (smallPrimeSet_subset hp)

theorem smallPrimeSet_product : (∏ p ∈ smallPrimeSet, p) = smallPrimeProduct := by
  decide +kernel

theorem smallPrimeSet_coprime :
    (forcedDivisor 8).Coprime (∏ p ∈ smallPrimeSet, p) := by
  rw [smallPrimeSet_product]
  decide +kernel

theorem smallPrimeSet_margin :
    (squaredNormBound 8)^8 < 8^8 * (forcedDivisor 8 * ∏ p ∈ smallPrimeSet, p)^2 := by
  rw [smallPrimeSet_product]
  decide +kernel

theorem exists_prime_of_squaredNorm (v : Fin 8 → ℕ)
    (hpositive : ∀ i, 0 < v i) (hvalue : value (List.ofFn v) ≤ (1/9 : ℝ))
    (hnorm : (∑ i, (v i)^2) ≤ squaredNormBound 8) :
    ∃ p ∈ smallPrimeSet, ∀ i, ¬ p ∣ v i := by
  exact exists_prime_avoiding_forced_of_tight (by decide) v hpositive
    (by norm_num at hvalue ⊢; exact hvalue)
    smallPrimeSet smallPrimeSet_primes smallPrimeSet_coprime
    ((Nat.pow_le_pow_left hnorm 8).trans_lt smallPrimeSet_margin)

/-- Geometry discharges the norm premise. The only analytic inputs left
are runner bounds in strictly fewer than eight speeds. -/
theorem exists_prime_of_tight (v : Fin 8 → ℕ) (hpositive : ∀ i, 0 < v i)
    (hprimitive : (List.ofFn v).foldr Nat.gcd 0 = 1)
    (hvalue : value (List.ofFn v) ≤ (1/9 : ℝ))
    (hLRC : ∀ m : ℕ, 1 ≤ m → m < 8 → LonelyRunnerBound m) :
    ∃ p ∈ smallPrimeSet, ∀ i, ¬ p ∣ v i := by
  apply exists_prime_of_squaredNorm v hpositive hvalue
  exact NormGeometry.tight_small_natural_squaredNorm_le (n := 7)
    (by decide) (by decide) v hpositive hprimitive hvalue hLRC

end Loneliness.Modular.EightSpeed
