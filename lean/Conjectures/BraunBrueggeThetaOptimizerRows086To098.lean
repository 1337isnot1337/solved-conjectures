import Conjectures.BraunBrueggeThetaOptimizerArithmetic

/-! Exact comparisons at total path lengths 86 through 98. -/

namespace BraunBruegge

set_option maxHeartbeats 0
set_option maxRecDepth 20000

private theorem row86 : checkThetaOptimizerAtTotal 86 = true := by decide +kernel
private theorem row87 : checkThetaOptimizerAtTotal 87 = true := by decide +kernel
private theorem row88 : checkThetaOptimizerAtTotal 88 = true := by decide +kernel
private theorem row89 : checkThetaOptimizerAtTotal 89 = true := by decide +kernel
private theorem row90 : checkThetaOptimizerAtTotal 90 = true := by decide +kernel
private theorem row91 : checkThetaOptimizerAtTotal 91 = true := by decide +kernel
private theorem row92 : checkThetaOptimizerAtTotal 92 = true := by decide +kernel
private theorem row93 : checkThetaOptimizerAtTotal 93 = true := by decide +kernel
private theorem row94 : checkThetaOptimizerAtTotal 94 = true := by decide +kernel
private theorem row95 : checkThetaOptimizerAtTotal 95 = true := by decide +kernel
private theorem row96 : checkThetaOptimizerAtTotal 96 = true := by decide +kernel
private theorem row97 : checkThetaOptimizerAtTotal 97 = true := by decide +kernel
private theorem row98 : checkThetaOptimizerAtTotal 98 = true := by decide +kernel

theorem thetaOptimizerRows086To098 (l : ℕ) (lo : 86 ≤ l) (hi : l ≤ 98) :
    checkThetaOptimizerAtTotal l = true := by
  have h : l = 86 ∨ l = 87 ∨ l = 88 ∨ l = 89 ∨ l = 90 ∨ l = 91 ∨ l = 92 ∨ l = 93 ∨ l = 94 ∨ l = 95 ∨ l = 96 ∨ l = 97 ∨ l = 98 := by omega
  rcases h with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact row86
  · exact row87
  · exact row88
  · exact row89
  · exact row90
  · exact row91
  · exact row92
  · exact row93
  · exact row94
  · exact row95
  · exact row96
  · exact row97
  · exact row98

end BraunBruegge
