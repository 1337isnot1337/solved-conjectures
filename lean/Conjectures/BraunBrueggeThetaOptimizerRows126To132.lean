import Conjectures.BraunBrueggeThetaOptimizerArithmetic

/-! Exact comparisons at total path lengths 126 through 132. -/

namespace BraunBruegge

set_option maxHeartbeats 0
set_option maxRecDepth 20000

private theorem row126 : checkThetaOptimizerAtTotal 126 = true := by decide +kernel
private theorem row127 : checkThetaOptimizerAtTotal 127 = true := by decide +kernel
private theorem row128 : checkThetaOptimizerAtTotal 128 = true := by decide +kernel
private theorem row129 : checkThetaOptimizerAtTotal 129 = true := by decide +kernel
private theorem row130 : checkThetaOptimizerAtTotal 130 = true := by decide +kernel
private theorem row131 : checkThetaOptimizerAtTotal 131 = true := by decide +kernel
private theorem row132 : checkThetaOptimizerAtTotal 132 = true := by decide +kernel

theorem thetaOptimizerRows126To132 (l : ℕ) (lo : 126 ≤ l) (hi : l ≤ 132) :
    checkThetaOptimizerAtTotal l = true := by
  have h : l = 126 ∨ l = 127 ∨ l = 128 ∨ l = 129 ∨ l = 130 ∨ l = 131 ∨ l = 132 := by omega
  rcases h with rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact row126
  · exact row127
  · exact row128
  · exact row129
  · exact row130
  · exact row131
  · exact row132

end BraunBruegge
