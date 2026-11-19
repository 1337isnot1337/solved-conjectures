import Conjectures.LonelinessTightSmallNormBounds

/-! The improved squared-norm ceiling needs only the first twelve original
seven-speed primes. The original seventeen-prime list is retained unchanged
in TightPrimeBounds. All assertions below use exact natural arithmetic. -/

namespace Loneliness.Modular.SevenSpeed

open scoped BigOperators
open CoordinateSubspace TightPrimeBounds

set_option maxRecDepth 16384
set_option maxHeartbeats 0

def smallPrimeSet : Finset ℕ :=
  {251,257,263,269,271,277,281,283,293,307,311,313}

def smallPrimeProduct : ℕ := 238543403318474543942749297577

theorem smallPrimeSet_subset : smallPrimeSet ⊆ primeSet 7 := by
  decide +kernel

theorem smallPrimeSet_primes : ∀ p ∈ smallPrimeSet, p.Prime := by
  intro p hp
  exact all_primes_seven p (smallPrimeSet_subset hp)

theorem smallPrimeSet_product : (∏ p ∈ smallPrimeSet, p) = smallPrimeProduct := by
  decide +kernel

theorem smallPrimeSet_coprime :
    (forcedDivisor 7).Coprime (∏ p ∈ smallPrimeSet, p) := by
  rw [smallPrimeSet_product]
  decide +kernel

theorem smallPrimeSet_margin :
    (squaredNormBound 7)^7 < 7^7 * (forcedDivisor 7 * ∏ p ∈ smallPrimeSet, p)^2 := by
  rw [smallPrimeSet_product]
  decide +kernel

theorem exists_prime_of_squaredNorm (v : Fin 7 → ℕ)
    (hpositive : ∀ i, 0 < v i) (hvalue : value (List.ofFn v) ≤ (1/8 : ℝ))
    (hnorm : (∑ i, (v i)^2) ≤ squaredNormBound 7) :
    ∃ p ∈ smallPrimeSet, ∀ i, ¬ p ∣ v i := by
  exact exists_prime_avoiding_forced_of_tight (by decide) v hpositive
    (by norm_num at hvalue ⊢; exact hvalue)
    smallPrimeSet smallPrimeSet_primes smallPrimeSet_coprime
    ((Nat.pow_le_pow_left hnorm 7).trans_lt smallPrimeSet_margin)

/-- Geometry discharges the norm premise. The only analytic inputs left
are runner bounds in strictly fewer than seven speeds. -/
theorem exists_prime_of_tight (v : Fin 7 → ℕ) (hpositive : ∀ i, 0 < v i)
    (hprimitive : (List.ofFn v).foldr Nat.gcd 0 = 1)
    (hvalue : value (List.ofFn v) ≤ (1/8 : ℝ))
    (hLRC : ∀ m : ℕ, 1 ≤ m → m < 7 → LonelyRunnerBound m) :
    ∃ p ∈ smallPrimeSet, ∀ i, ¬ p ∣ v i := by
  apply exists_prime_of_squaredNorm v hpositive hvalue
  exact NormGeometry.tight_small_natural_squaredNorm_le (n := 6)
    (by decide) (by decide) v hpositive hprimitive hvalue hLRC

end Loneliness.Modular.SevenSpeed
