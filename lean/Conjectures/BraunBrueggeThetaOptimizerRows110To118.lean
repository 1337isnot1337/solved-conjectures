import Conjectures.BraunBrueggeThetaOptimizerArithmetic

/-! Exact comparisons at total path lengths 110 through 118. -/

namespace BraunBruegge

set_option maxHeartbeats 0
set_option maxRecDepth 20000

private theorem row110 : checkThetaOptimizerAtTotal 110 = true := by decide +kernel
private theorem row111 : checkThetaOptimizerAtTotal 111 = true := by decide +kernel
private theorem row112 : checkThetaOptimizerAtTotal 112 = true := by decide +kernel
private theorem row113 : checkThetaOptimizerAtTotal 113 = true := by decide +kernel
private theorem row114 : checkThetaOptimizerAtTotal 114 = true := by decide +kernel
private theorem row115 : checkThetaOptimizerAtTotal 115 = true := by decide +kernel
private theorem row116 : checkThetaOptimizerAtTotal 116 = true := by decide +kernel
private theorem row117 : checkThetaOptimizerAtTotal 117 = true := by decide +kernel
private theorem row118 : checkThetaOptimizerAtTotal 118 = true := by decide +kernel

theorem thetaOptimizerRows110To118 (l : ℕ) (lo : 110 ≤ l) (hi : l ≤ 118) :
    checkThetaOptimizerAtTotal l = true := by
  have h : l = 110 ∨ l = 111 ∨ l = 112 ∨ l = 113 ∨ l = 114 ∨ l = 115 ∨ l = 116 ∨ l = 117 ∨ l = 118 := by omega
  rcases h with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact row110
  · exact row111
  · exact row112
  · exact row113
  · exact row114
  · exact row115
  · exact row116
  · exact row117
  · exact row118

end BraunBruegge
