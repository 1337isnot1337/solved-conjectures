import Conjectures.BraunBrueggeThetaOptimizerArithmetic

/-! Exact comparisons at total path lengths 139 through 143. -/

namespace BraunBruegge

set_option maxHeartbeats 0
set_option maxRecDepth 20000

private theorem row139 : checkThetaOptimizerAtTotal 139 = true := by decide +kernel
private theorem row140 : checkThetaOptimizerAtTotal 140 = true := by decide +kernel
private theorem row141 : checkThetaOptimizerAtTotal 141 = true := by decide +kernel
private theorem row142 : checkThetaOptimizerAtTotal 142 = true := by decide +kernel
private theorem row143 : checkThetaOptimizerAtTotal 143 = true := by decide +kernel

theorem thetaOptimizerRows139To143 (l : ℕ) (lo : 139 ≤ l) (hi : l ≤ 143) :
    checkThetaOptimizerAtTotal l = true := by
  have h : l = 139 ∨ l = 140 ∨ l = 141 ∨ l = 142 ∨ l = 143 := by omega
  rcases h with rfl | rfl | rfl | rfl | rfl
  · exact row139
  · exact row140
  · exact row141
  · exact row142
  · exact row143

end BraunBruegge
