import Conjectures.LonelinessModularTightPrimeDefs
import Conjectures.LonelinessPrefixProductTables

/-! Compute the rational products before casting their strict margins to ℝ. -/

namespace Loneliness.Modular.TightPrimeBounds

open scoped BigOperators
set_option maxRecDepth 16384
set_option maxHeartbeats 0

def prefixProductValue : ℕ → ℚ
  | 6 => 8993 / 308758035600
  | 7 => 1 / 5143824000
  | 8 => 19283407 / 21431729527810560000
  | 9 => 2482597 / 826841416968000000000
  | 10 => 31983096361649 / 4289227381918300405953600000000
  | 11 => 289 / 20428512501085573500000
  | 12 => 1476748201913 / 70457736818858675876241619968000000
  | 13 => 89348172069691 / 3616460531462492894939937597619200000000
  | _ => 0

theorem prefix_product_value (k : ℕ) (hk : 6 ≤ k) (hk' : k ≤ 13) :
    ∏ i ∈ Finset.range (k-1), PrefixProduct.kzIncrement k i = prefixProductValue k := by
  interval_cases k
  · norm_num [prefixProductValue, Finset.prod_range_succ, PrefixProduct.kzIncrement]
  · norm_num [prefixProductValue, Finset.prod_range_succ, PrefixProduct.kzIncrement]
  · norm_num [prefixProductValue, Finset.prod_range_succ, PrefixProduct.kzIncrement]
  · exact PrefixProduct.kzIncrement_product_nine
  · exact PrefixProduct.kzIncrement_product_ten
  · exact PrefixProduct.kzIncrement_product_eleven
  · exact PrefixProduct.kzIncrement_product_twelve
  · exact PrefixProduct.kzIncrement_product_thirteen

/-- Round the exact rational reciprocal upward by one natural step. -/
theorem prefix_margin (k : ℕ) (hk : 6 ≤ k) (hk' : k ≤ 13) :
    1 < (∏ i ∈ Finset.range (k-1), (PrefixProduct.kzIncrement k i : ℝ)) *
      ((squaredNormBound k + 1 : ℕ) : ℝ) := by
  have hQ : (1 : ℚ) < (∏ i ∈ Finset.range (k-1), PrefixProduct.kzIncrement k i) *
      ((squaredNormBound k + 1 : ℕ) : ℚ) := by
    rw [prefix_product_value k hk hk']
    interval_cases k <;> norm_num [prefixProductValue, squaredNormBound]
  exact_mod_cast hQ

end Loneliness.Modular.TightPrimeBounds
