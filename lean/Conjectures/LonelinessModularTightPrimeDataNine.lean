import Conjectures.LonelinessModularTightPrimeDefs

/-! Separate kernel-checked numerical assertions for nine speeds. -/

namespace Loneliness.Modular.TightPrimeBounds

open scoped BigOperators
set_option maxRecDepth 16384
set_option maxHeartbeats 0

theorem all_primes_nine : ∀ p ∈ primeSet 9, p.Prime := by
  norm_num [primeSet, primeList]

theorem prime_product_nine : (∏ p ∈ primeSet 9, p) = primeProduct 9 := by
  decide +kernel

theorem coprime_nine : (forcedDivisor 9).Coprime (∏ p ∈ primeSet 9, p) := by
  rw [prime_product_nine]
  decide +kernel

theorem margin_nine :
    (squaredNormBound 9)^9 < 9^9 * (forcedDivisor 9 * ∏ p ∈ primeSet 9, p)^2 := by
  rw [prime_product_nine]
  decide +kernel

end Loneliness.Modular.TightPrimeBounds
