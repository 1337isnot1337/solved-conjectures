import Conjectures.BraunBrueggeBicyclicFiniteArithmetic

/-! Kernel checks at total lengths 75 through 87. -/

namespace BraunBruegge

set_option maxHeartbeats 0
set_option maxRecDepth 20000

private theorem mixedRow75 : checkMixedAtTotal 75 = true := by decide +kernel

private theorem mixedRow76 : checkMixedAtTotal 76 = true := by decide +kernel

private theorem mixedRow77 : checkMixedAtTotal 77 = true := by decide +kernel

private theorem mixedRow78 : checkMixedAtTotal 78 = true := by decide +kernel

private theorem mixedRow79 : checkMixedAtTotal 79 = true := by decide +kernel

private theorem mixedRow80 : checkMixedAtTotal 80 = true := by decide +kernel

private theorem mixedRow81 : checkMixedAtTotal 81 = true := by decide +kernel

private theorem mixedRow82 : checkMixedAtTotal 82 = true := by decide +kernel

private theorem mixedRow83 : checkMixedAtTotal 83 = true := by decide +kernel

private theorem mixedRow84 : checkMixedAtTotal 84 = true := by decide +kernel

private theorem mixedRow85 : checkMixedAtTotal 85 = true := by decide +kernel

private theorem mixedRow86 : checkMixedAtTotal 86 = true := by decide +kernel

private theorem mixedRow87 : checkMixedAtTotal 87 = true := by decide +kernel

theorem mixedRows075To087 (l : ℕ) (lo : 75 ≤ l) (hi : l ≤ 87) : checkMixedAtTotal l = true := by
  have h : l = 75 ∨ l = 76 ∨ l = 77 ∨ l = 78 ∨ l = 79 ∨ l = 80 ∨ l = 81 ∨ l = 82 ∨ l = 83 ∨ l = 84 ∨ l = 85 ∨ l = 86 ∨ l = 87 := by omega
  rcases h with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact mixedRow75
  · exact mixedRow76
  · exact mixedRow77
  · exact mixedRow78
  · exact mixedRow79
  · exact mixedRow80
  · exact mixedRow81
  · exact mixedRow82
  · exact mixedRow83
  · exact mixedRow84
  · exact mixedRow85
  · exact mixedRow86
  · exact mixedRow87

end BraunBruegge
