import Conjectures.LonelinessModularTightPrimeDefs

/-! Separate kernel-checked numerical assertions for seven speeds. -/

namespace Loneliness.Modular.TightPrimeBounds

open scoped BigOperators
set_option maxRecDepth 16384
set_option maxHeartbeats 0

theorem all_primes_seven : ∀ p ∈ primeSet 7, p.Prime := by
  norm_num [primeSet, primeList]

theorem prime_product_seven : (∏ p ∈ primeSet 7, p) = primeProduct 7 := by
  decide +kernel

theorem coprime_seven : (forcedDivisor 7).Coprime (∏ p ∈ primeSet 7, p) := by
  rw [prime_product_seven]
  decide +kernel

theorem margin_seven :
    (squaredNormBound 7)^7 < 7^7 * (forcedDivisor 7 * ∏ p ∈ primeSet 7, p)^2 := by
  rw [prime_product_seven]
  decide +kernel

end Loneliness.Modular.TightPrimeBounds
