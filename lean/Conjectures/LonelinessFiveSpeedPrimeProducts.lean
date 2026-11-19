import Conjectures.LonelinessFiveSpeedPrimeData
import Conjectures.LonelinessFiveSpeedPlanePrimeProduct

/-! Exact products for the bounded root and nine plane covers. -/
set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.FiveSpeedCertificate.PrimeData

open scoped BigOperators

theorem root_product_large :
    (4 * 279841 : ℕ) ^ 111 < ∏ p ∈ rootPrimes, p := by
  decide +kernel

theorem plane_product_large (k : Fin 9) :
    formProductBound (planeStructuralForms k) 279841 < ∏ p ∈ planePrimes k, p := by
  fin_cases k <;> decide +kernel

theorem planePrimes_total_card : (∑ k : Fin 9, (planePrimes k).card) = 574 := by
  decide +kernel

end Loneliness.FiveSpeedCertificate.PrimeData
