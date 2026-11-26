import Conjectures.BraunBrueggeThetaOptimizerArithmetic

/-! Exact comparisons at total path lengths 119 through 125. -/

namespace BraunBruegge

set_option maxHeartbeats 0
set_option maxRecDepth 20000

private theorem row119 : checkThetaOptimizerAtTotal 119 = true := by decide +kernel
private theorem row120 : checkThetaOptimizerAtTotal 120 = true := by decide +kernel
private theorem row121 : checkThetaOptimizerAtTotal 121 = true := by decide +kernel
private theorem row122 : checkThetaOptimizerAtTotal 122 = true := by decide +kernel
private theorem row123 : checkThetaOptimizerAtTotal 123 = true := by decide +kernel
private theorem row124 : checkThetaOptimizerAtTotal 124 = true := by decide +kernel
private theorem row125 : checkThetaOptimizerAtTotal 125 = true := by decide +kernel

theorem thetaOptimizerRows119To125 (l : ℕ) (lo : 119 ≤ l) (hi : l ≤ 125) :
    checkThetaOptimizerAtTotal l = true := by
  have h : l = 119 ∨ l = 120 ∨ l = 121 ∨ l = 122 ∨ l = 123 ∨ l = 124 ∨ l = 125 := by omega
  rcases h with rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact row119
  · exact row120
  · exact row121
  · exact row122
  · exact row123
  · exact row124
  · exact row125

end BraunBruegge
