import Conjectures.LonelinessModularTightPrimeDefs

/-! Separate kernel-checked numerical assertions for six speeds. -/

namespace Loneliness.Modular.TightPrimeBounds

open scoped BigOperators
set_option maxRecDepth 16384
set_option maxHeartbeats 0

theorem all_primes_six : ∀ p ∈ primeSet 6, p.Prime := by
  norm_num [primeSet, primeList]

theorem prime_product_six : (∏ p ∈ primeSet 6, p) = primeProduct 6 := by
  decide +kernel

theorem coprime_six : (forcedDivisor 6).Coprime (∏ p ∈ primeSet 6, p) := by
  rw [prime_product_six]
  decide +kernel

theorem margin_six :
    (squaredNormBound 6)^6 < 6^6 * (forcedDivisor 6 * ∏ p ∈ primeSet 6, p)^2 := by
  rw [prime_product_six]
  decide +kernel

end Loneliness.Modular.TightPrimeBounds
