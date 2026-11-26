import Conjectures.BraunBrueggeThetaOptimizerArithmetic

/-! Exact comparisons at total path lengths 99 through 109. -/

namespace BraunBruegge

set_option maxHeartbeats 0
set_option maxRecDepth 20000

private theorem row99 : checkThetaOptimizerAtTotal 99 = true := by decide +kernel
private theorem row100 : checkThetaOptimizerAtTotal 100 = true := by decide +kernel
private theorem row101 : checkThetaOptimizerAtTotal 101 = true := by decide +kernel
private theorem row102 : checkThetaOptimizerAtTotal 102 = true := by decide +kernel
private theorem row103 : checkThetaOptimizerAtTotal 103 = true := by decide +kernel
private theorem row104 : checkThetaOptimizerAtTotal 104 = true := by decide +kernel
private theorem row105 : checkThetaOptimizerAtTotal 105 = true := by decide +kernel
private theorem row106 : checkThetaOptimizerAtTotal 106 = true := by decide +kernel
private theorem row107 : checkThetaOptimizerAtTotal 107 = true := by decide +kernel
private theorem row108 : checkThetaOptimizerAtTotal 108 = true := by decide +kernel
private theorem row109 : checkThetaOptimizerAtTotal 109 = true := by decide +kernel

theorem thetaOptimizerRows099To109 (l : ℕ) (lo : 99 ≤ l) (hi : l ≤ 109) :
    checkThetaOptimizerAtTotal l = true := by
  have h : l = 99 ∨ l = 100 ∨ l = 101 ∨ l = 102 ∨ l = 103 ∨ l = 104 ∨ l = 105 ∨ l = 106 ∨ l = 107 ∨ l = 108 ∨ l = 109 := by omega
  rcases h with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact row99
  · exact row100
  · exact row101
  · exact row102
  · exact row103
  · exact row104
  · exact row105
  · exact row106
  · exact row107
  · exact row108
  · exact row109

end BraunBruegge
