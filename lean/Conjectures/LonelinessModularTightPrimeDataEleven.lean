import Conjectures.LonelinessModularTightPrimeDefs

/-! Separate kernel-checked numerical assertions for eleven speeds. -/

namespace Loneliness.Modular.TightPrimeBounds

open scoped BigOperators
set_option maxRecDepth 16384
set_option maxHeartbeats 0

theorem all_primes_eleven : ∀ p ∈ primeSet 11, p.Prime := by
  norm_num [primeSet, primeList]

theorem prime_product_eleven : (∏ p ∈ primeSet 11, p) = primeProduct 11 := by
  decide +kernel

theorem coprime_eleven : (forcedDivisor 11).Coprime (∏ p ∈ primeSet 11, p) := by
  rw [prime_product_eleven]
  decide +kernel

theorem margin_eleven :
    (squaredNormBound 11)^11 < 11^11 * (forcedDivisor 11 * ∏ p ∈ primeSet 11, p)^2 := by
  rw [prime_product_eleven]
  decide +kernel

end Loneliness.Modular.TightPrimeBounds
