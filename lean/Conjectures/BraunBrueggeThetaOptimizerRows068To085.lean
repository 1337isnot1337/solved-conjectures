import Conjectures.BraunBrueggeThetaOptimizerArithmetic

/-! Exact comparisons at total path lengths 68 through 85. -/

namespace BraunBruegge

set_option maxHeartbeats 0
set_option maxRecDepth 20000

private theorem row68 : checkThetaOptimizerAtTotal 68 = true := by decide +kernel
private theorem row69 : checkThetaOptimizerAtTotal 69 = true := by decide +kernel
private theorem row70 : checkThetaOptimizerAtTotal 70 = true := by decide +kernel
private theorem row71 : checkThetaOptimizerAtTotal 71 = true := by decide +kernel
private theorem row72 : checkThetaOptimizerAtTotal 72 = true := by decide +kernel
private theorem row73 : checkThetaOptimizerAtTotal 73 = true := by decide +kernel
private theorem row74 : checkThetaOptimizerAtTotal 74 = true := by decide +kernel
private theorem row75 : checkThetaOptimizerAtTotal 75 = true := by decide +kernel
private theorem row76 : checkThetaOptimizerAtTotal 76 = true := by decide +kernel
private theorem row77 : checkThetaOptimizerAtTotal 77 = true := by decide +kernel
private theorem row78 : checkThetaOptimizerAtTotal 78 = true := by decide +kernel
private theorem row79 : checkThetaOptimizerAtTotal 79 = true := by decide +kernel
private theorem row80 : checkThetaOptimizerAtTotal 80 = true := by decide +kernel
private theorem row81 : checkThetaOptimizerAtTotal 81 = true := by decide +kernel
private theorem row82 : checkThetaOptimizerAtTotal 82 = true := by decide +kernel
private theorem row83 : checkThetaOptimizerAtTotal 83 = true := by decide +kernel
private theorem row84 : checkThetaOptimizerAtTotal 84 = true := by decide +kernel
private theorem row85 : checkThetaOptimizerAtTotal 85 = true := by decide +kernel

theorem thetaOptimizerRows068To085 (l : ℕ) (lo : 68 ≤ l) (hi : l ≤ 85) :
    checkThetaOptimizerAtTotal l = true := by
  have h : l = 68 ∨ l = 69 ∨ l = 70 ∨ l = 71 ∨ l = 72 ∨ l = 73 ∨ l = 74 ∨ l = 75 ∨ l = 76 ∨ l = 77 ∨ l = 78 ∨ l = 79 ∨ l = 80 ∨ l = 81 ∨ l = 82 ∨ l = 83 ∨ l = 84 ∨ l = 85 := by omega
  rcases h with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact row68
  · exact row69
  · exact row70
  · exact row71
  · exact row72
  · exact row73
  · exact row74
  · exact row75
  · exact row76
  · exact row77
  · exact row78
  · exact row79
  · exact row80
  · exact row81
  · exact row82
  · exact row83
  · exact row84
  · exact row85

end BraunBruegge
