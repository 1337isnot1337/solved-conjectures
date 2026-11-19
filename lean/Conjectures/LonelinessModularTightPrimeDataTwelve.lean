import Conjectures.LonelinessModularTightPrimeDefs

/-! Separate kernel-checked numerical assertions for twelve speeds. -/

namespace Loneliness.Modular.TightPrimeBounds

open scoped BigOperators
set_option maxRecDepth 16384
set_option maxHeartbeats 0

theorem all_primes_twelve : ∀ p ∈ primeSet 12, p.Prime := by
  norm_num [primeSet, primeList]

theorem prime_product_twelve : (∏ p ∈ primeSet 12, p) = primeProduct 12 := by
  decide +kernel

theorem coprime_twelve : (forcedDivisor 12).Coprime (∏ p ∈ primeSet 12, p) := by
  rw [prime_product_twelve]
  decide +kernel

theorem margin_twelve :
    (squaredNormBound 12)^12 < 12^12 * (forcedDivisor 12 * ∏ p ∈ primeSet 12, p)^2 := by
  rw [prime_product_twelve]
  decide +kernel

end Loneliness.Modular.TightPrimeBounds
