import Conjectures.LonelinessModularTightPrimeDefs

/-! Separate kernel-checked numerical assertions for thirteen speeds. -/

namespace Loneliness.Modular.TightPrimeBounds

open scoped BigOperators
set_option maxRecDepth 16384
set_option maxHeartbeats 0

theorem all_primes_thirteen : ∀ p ∈ primeSet 13, p.Prime := by
  norm_num [primeSet, primeList]

theorem prime_product_thirteen : (∏ p ∈ primeSet 13, p) = primeProduct 13 := by
  decide +kernel

theorem coprime_thirteen : (forcedDivisor 13).Coprime (∏ p ∈ primeSet 13, p) := by
  rw [prime_product_thirteen]
  decide +kernel

theorem margin_thirteen :
    (squaredNormBound 13)^13 < 13^13 * (forcedDivisor 13 * ∏ p ∈ primeSet 13, p)^2 := by
  rw [prime_product_thirteen]
  decide +kernel

end Loneliness.Modular.TightPrimeBounds
