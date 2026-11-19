import Conjectures.LonelinessModularTightPrimeDefs

/-! Separate kernel-checked numerical assertions for ten speeds. -/

namespace Loneliness.Modular.TightPrimeBounds

open scoped BigOperators
set_option maxRecDepth 16384
set_option maxHeartbeats 0

theorem all_primes_ten : ∀ p ∈ primeSet 10, p.Prime := by
  norm_num [primeSet, primeList]

theorem prime_product_ten : (∏ p ∈ primeSet 10, p) = primeProduct 10 := by
  decide +kernel

theorem coprime_ten : (forcedDivisor 10).Coprime (∏ p ∈ primeSet 10, p) := by
  rw [prime_product_ten]
  decide +kernel

theorem margin_ten :
    (squaredNormBound 10)^10 < 10^10 * (forcedDivisor 10 * ∏ p ∈ primeSet 10, p)^2 := by
  rw [prime_product_ten]
  decide +kernel

end Loneliness.Modular.TightPrimeBounds
