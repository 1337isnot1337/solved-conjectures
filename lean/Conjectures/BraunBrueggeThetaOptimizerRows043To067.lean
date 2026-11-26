import Conjectures.BraunBrueggeThetaOptimizerArithmetic

/-! Exact comparisons at total path lengths 43 through 67. -/

namespace BraunBruegge

set_option maxHeartbeats 0
set_option maxRecDepth 20000

private theorem row43 : checkThetaOptimizerAtTotal 43 = true := by decide +kernel
private theorem row44 : checkThetaOptimizerAtTotal 44 = true := by decide +kernel
private theorem row45 : checkThetaOptimizerAtTotal 45 = true := by decide +kernel
private theorem row46 : checkThetaOptimizerAtTotal 46 = true := by decide +kernel
private theorem row47 : checkThetaOptimizerAtTotal 47 = true := by decide +kernel
private theorem row48 : checkThetaOptimizerAtTotal 48 = true := by decide +kernel
private theorem row49 : checkThetaOptimizerAtTotal 49 = true := by decide +kernel
private theorem row50 : checkThetaOptimizerAtTotal 50 = true := by decide +kernel
private theorem row51 : checkThetaOptimizerAtTotal 51 = true := by decide +kernel
private theorem row52 : checkThetaOptimizerAtTotal 52 = true := by decide +kernel
private theorem row53 : checkThetaOptimizerAtTotal 53 = true := by decide +kernel
private theorem row54 : checkThetaOptimizerAtTotal 54 = true := by decide +kernel
private theorem row55 : checkThetaOptimizerAtTotal 55 = true := by decide +kernel
private theorem row56 : checkThetaOptimizerAtTotal 56 = true := by decide +kernel
private theorem row57 : checkThetaOptimizerAtTotal 57 = true := by decide +kernel
private theorem row58 : checkThetaOptimizerAtTotal 58 = true := by decide +kernel
private theorem row59 : checkThetaOptimizerAtTotal 59 = true := by decide +kernel
private theorem row60 : checkThetaOptimizerAtTotal 60 = true := by decide +kernel
private theorem row61 : checkThetaOptimizerAtTotal 61 = true := by decide +kernel
private theorem row62 : checkThetaOptimizerAtTotal 62 = true := by decide +kernel
private theorem row63 : checkThetaOptimizerAtTotal 63 = true := by decide +kernel
private theorem row64 : checkThetaOptimizerAtTotal 64 = true := by decide +kernel
private theorem row65 : checkThetaOptimizerAtTotal 65 = true := by decide +kernel
private theorem row66 : checkThetaOptimizerAtTotal 66 = true := by decide +kernel
private theorem row67 : checkThetaOptimizerAtTotal 67 = true := by decide +kernel

theorem thetaOptimizerRows043To067 (l : ℕ) (lo : 43 ≤ l) (hi : l ≤ 67) :
    checkThetaOptimizerAtTotal l = true := by
  have h : l = 43 ∨ l = 44 ∨ l = 45 ∨ l = 46 ∨ l = 47 ∨ l = 48 ∨ l = 49 ∨ l = 50 ∨ l = 51 ∨ l = 52 ∨ l = 53 ∨ l = 54 ∨ l = 55 ∨ l = 56 ∨ l = 57 ∨ l = 58 ∨ l = 59 ∨ l = 60 ∨ l = 61 ∨ l = 62 ∨ l = 63 ∨ l = 64 ∨ l = 65 ∨ l = 66 ∨ l = 67 := by omega
  rcases h with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact row43
  · exact row44
  · exact row45
  · exact row46
  · exact row47
  · exact row48
  · exact row49
  · exact row50
  · exact row51
  · exact row52
  · exact row53
  · exact row54
  · exact row55
  · exact row56
  · exact row57
  · exact row58
  · exact row59
  · exact row60
  · exact row61
  · exact row62
  · exact row63
  · exact row64
  · exact row65
  · exact row66
  · exact row67

end BraunBruegge
