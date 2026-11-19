import Conjectures.LonelinessFiveRunnerNormData
import Conjectures.LonelinessTightNormCommon
import Conjectures.LonelinessFourSpeedGap
import Conjectures.LonelinessModularForcedDivisor

/-! A norm bound and prime selection at the actual five-speed threshold `1/6`.

The geometric basis and determinant inputs come from the primitive speed vector.
All smaller runner bounds are discharged by the checked one-through-four-speed
theorems. At least one of the five selected primes divides no speed.
No finite modular classification is assumed here. -/

namespace Loneliness.FiveRunnerNorm

open scoped BigOperators
open CoordinateSubspace

theorem lower_runner_bound (m : ℕ) (hm : m < 5) : LonelyRunnerBound m := by
  by_cases hfour : m = 4
  · subst m
    exact four_speed_lonelyRunnerBound
  · exact SmallRunner.lonelyRunnerBound m (by omega)

theorem squared_norm_le (v : Fin 5 → ℕ)
    (hpositive : ∀ i, 0 < v i)
    (hprimitive : (List.ofFn v).foldr Nat.gcd 0 = 1)
    (hvalue : value (List.ofFn v) ≤ (1 / 6 : ℝ)) :
    (∑ i, (v i)^2) ≤ 347142 := by
  apply NormGeometry.natural_squaredNorm_le_of_product (n := 4) v
    hpositive hprimitive (by simpa using hvalue)
    (fun m _hm hlt => lower_runner_bound m hlt)
    (KZGeneral.increment Data.bounds Data.scale) 347142
  · intro t ht hp hr
    apply Data.product_lower_bound t ht ?_ hr
    intro r hr'
    rw [Data.prefix_eq r hr']
    exact hp r hr'
  · exact Data.numerical_margin

def primeList : List ℕ := [149, 151, 163, 167, 173]

def primeSet : Finset ℕ := primeList.toFinset

theorem all_primes : ∀ p ∈ primeSet, p.Prime := by
  norm_num [primeSet, primeList]

theorem all_primes_gt_135 : ∀ p ∈ primeSet, 135 < p := by
  norm_num [primeSet, primeList]

theorem prime_product : (∏ p ∈ primeSet, p) = 105953033267 := by
  decide +kernel

theorem forced_divisor : Modular.forcedDivisor 5 = 60 := by
  decide +kernel

theorem prime_product_coprime :
    (Modular.forcedDivisor 5).Coprime (∏ p ∈ primeSet, p) := by
  rw [prime_product, forced_divisor]
  decide +kernel

theorem prime_product_margin :
    347142^5 < 5^5 * (Modular.forcedDivisor 5 * ∏ p ∈ primeSet, p)^2 := by
  rw [prime_product, forced_divisor]
  decide +kernel

theorem exists_prime_avoiding (v : Fin 5 → ℕ)
    (hpositive : ∀ i, 0 < v i)
    (hprimitive : (List.ofFn v).foldr Nat.gcd 0 = 1)
    (hvalue : value (List.ofFn v) ≤ (1 / 6 : ℝ)) :
    ∃ p ∈ primeSet, ∀ i, ¬ p ∣ v i := by
  apply Modular.exists_prime_avoiding_forced_of_tight (by decide) v hpositive
    (by norm_num; exact hvalue) primeSet all_primes prime_product_coprime
  exact (Nat.pow_le_pow_left (squared_norm_le v hpositive hprimitive hvalue) 5).trans_lt
    prime_product_margin

end Loneliness.FiveRunnerNorm
