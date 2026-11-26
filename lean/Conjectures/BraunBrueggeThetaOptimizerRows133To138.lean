import Conjectures.BraunBrueggeThetaOptimizerArithmetic

/-! Exact comparisons at total path lengths 133 through 138. -/

namespace BraunBruegge

set_option maxHeartbeats 0
set_option maxRecDepth 20000

private theorem row133 : checkThetaOptimizerAtTotal 133 = true := by decide +kernel
private theorem row134 : checkThetaOptimizerAtTotal 134 = true := by decide +kernel
private theorem row135 : checkThetaOptimizerAtTotal 135 = true := by decide +kernel
private theorem row136 : checkThetaOptimizerAtTotal 136 = true := by decide +kernel
private theorem row137 : checkThetaOptimizerAtTotal 137 = true := by decide +kernel
private theorem row138 : checkThetaOptimizerAtTotal 138 = true := by decide +kernel

theorem thetaOptimizerRows133To138 (l : ℕ) (lo : 133 ≤ l) (hi : l ≤ 138) :
    checkThetaOptimizerAtTotal l = true := by
  have h : l = 133 ∨ l = 134 ∨ l = 135 ∨ l = 136 ∨ l = 137 ∨ l = 138 := by omega
  rcases h with rfl | rfl | rfl | rfl | rfl | rfl
  · exact row133
  · exact row134
  · exact row135
  · exact row136
  · exact row137
  · exact row138

end BraunBruegge
