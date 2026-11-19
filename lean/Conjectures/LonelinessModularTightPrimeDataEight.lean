import Conjectures.LonelinessModularTightPrimeDefs

/-! Separate kernel-checked numerical assertions for eight speeds. -/

namespace Loneliness.Modular.TightPrimeBounds

open scoped BigOperators
set_option maxRecDepth 16384
set_option maxHeartbeats 0

theorem all_primes_eight : ∀ p ∈ primeSet 8, p.Prime := by
  norm_num [primeSet, primeList]

theorem prime_product_eight : (∏ p ∈ primeSet 8, p) = primeProduct 8 := by
  decide +kernel

theorem coprime_eight : (forcedDivisor 8).Coprime (∏ p ∈ primeSet 8, p) := by
  rw [prime_product_eight]
  decide +kernel

theorem margin_eight :
    (squaredNormBound 8)^8 < 8^8 * (forcedDivisor 8 * ∏ p ∈ primeSet 8, p)^2 := by
  rw [prime_product_eight]
  decide +kernel

end Loneliness.Modular.TightPrimeBounds
