import Conjectures.BraunBrueggeThetaOptimizerArithmetic

/-! Exact comparisons at total path lengths 11 through 42. -/

namespace BraunBruegge

set_option maxHeartbeats 0
set_option maxRecDepth 20000

private theorem row11 : checkThetaOptimizerAtTotal 11 = true := by decide +kernel
private theorem row12 : checkThetaOptimizerAtTotal 12 = true := by decide +kernel
private theorem row13 : checkThetaOptimizerAtTotal 13 = true := by decide +kernel
private theorem row14 : checkThetaOptimizerAtTotal 14 = true := by decide +kernel
private theorem row15 : checkThetaOptimizerAtTotal 15 = true := by decide +kernel
private theorem row16 : checkThetaOptimizerAtTotal 16 = true := by decide +kernel
private theorem row17 : checkThetaOptimizerAtTotal 17 = true := by decide +kernel
private theorem row18 : checkThetaOptimizerAtTotal 18 = true := by decide +kernel
private theorem row19 : checkThetaOptimizerAtTotal 19 = true := by decide +kernel
private theorem row20 : checkThetaOptimizerAtTotal 20 = true := by decide +kernel
private theorem row21 : checkThetaOptimizerAtTotal 21 = true := by decide +kernel
private theorem row22 : checkThetaOptimizerAtTotal 22 = true := by decide +kernel
private theorem row23 : checkThetaOptimizerAtTotal 23 = true := by decide +kernel
private theorem row24 : checkThetaOptimizerAtTotal 24 = true := by decide +kernel
private theorem row25 : checkThetaOptimizerAtTotal 25 = true := by decide +kernel
private theorem row26 : checkThetaOptimizerAtTotal 26 = true := by decide +kernel
private theorem row27 : checkThetaOptimizerAtTotal 27 = true := by decide +kernel
private theorem row28 : checkThetaOptimizerAtTotal 28 = true := by decide +kernel
private theorem row29 : checkThetaOptimizerAtTotal 29 = true := by decide +kernel
private theorem row30 : checkThetaOptimizerAtTotal 30 = true := by decide +kernel
private theorem row31 : checkThetaOptimizerAtTotal 31 = true := by decide +kernel
private theorem row32 : checkThetaOptimizerAtTotal 32 = true := by decide +kernel
private theorem row33 : checkThetaOptimizerAtTotal 33 = true := by decide +kernel
private theorem row34 : checkThetaOptimizerAtTotal 34 = true := by decide +kernel
private theorem row35 : checkThetaOptimizerAtTotal 35 = true := by decide +kernel
private theorem row36 : checkThetaOptimizerAtTotal 36 = true := by decide +kernel
private theorem row37 : checkThetaOptimizerAtTotal 37 = true := by decide +kernel
private theorem row38 : checkThetaOptimizerAtTotal 38 = true := by decide +kernel
private theorem row39 : checkThetaOptimizerAtTotal 39 = true := by decide +kernel
private theorem row40 : checkThetaOptimizerAtTotal 40 = true := by decide +kernel
private theorem row41 : checkThetaOptimizerAtTotal 41 = true := by decide +kernel
private theorem row42 : checkThetaOptimizerAtTotal 42 = true := by decide +kernel

theorem thetaOptimizerRows011To042 (l : ℕ) (lo : 11 ≤ l) (hi : l ≤ 42) :
    checkThetaOptimizerAtTotal l = true := by
  have h : l = 11 ∨ l = 12 ∨ l = 13 ∨ l = 14 ∨ l = 15 ∨ l = 16 ∨ l = 17 ∨ l = 18 ∨ l = 19 ∨ l = 20 ∨ l = 21 ∨ l = 22 ∨ l = 23 ∨ l = 24 ∨ l = 25 ∨ l = 26 ∨ l = 27 ∨ l = 28 ∨ l = 29 ∨ l = 30 ∨ l = 31 ∨ l = 32 ∨ l = 33 ∨ l = 34 ∨ l = 35 ∨ l = 36 ∨ l = 37 ∨ l = 38 ∨ l = 39 ∨ l = 40 ∨ l = 41 ∨ l = 42 := by omega
  rcases h with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact row11
  · exact row12
  · exact row13
  · exact row14
  · exact row15
  · exact row16
  · exact row17
  · exact row18
  · exact row19
  · exact row20
  · exact row21
  · exact row22
  · exact row23
  · exact row24
  · exact row25
  · exact row26
  · exact row27
  · exact row28
  · exact row29
  · exact row30
  · exact row31
  · exact row32
  · exact row33
  · exact row34
  · exact row35
  · exact row36
  · exact row37
  · exact row38
  · exact row39
  · exact row40
  · exact row41
  · exact row42

end BraunBruegge
