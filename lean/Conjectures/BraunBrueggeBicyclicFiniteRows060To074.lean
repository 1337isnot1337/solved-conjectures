import Conjectures.BraunBrueggeBicyclicFiniteArithmetic

/-! Kernel checks at total lengths 60 through 74. -/

namespace BraunBruegge

set_option maxHeartbeats 0
set_option maxRecDepth 20000

private theorem mixedRow60 : checkMixedAtTotal 60 = true := by decide +kernel

private theorem mixedRow61 : checkMixedAtTotal 61 = true := by decide +kernel

private theorem mixedRow62 : checkMixedAtTotal 62 = true := by decide +kernel

private theorem mixedRow63 : checkMixedAtTotal 63 = true := by decide +kernel

private theorem mixedRow64 : checkMixedAtTotal 64 = true := by decide +kernel

private theorem mixedRow65 : checkMixedAtTotal 65 = true := by decide +kernel

private theorem mixedRow66 : checkMixedAtTotal 66 = true := by decide +kernel

private theorem mixedRow67 : checkMixedAtTotal 67 = true := by decide +kernel

private theorem mixedRow68 : checkMixedAtTotal 68 = true := by decide +kernel

private theorem mixedRow69 : checkMixedAtTotal 69 = true := by decide +kernel

private theorem mixedRow70 : checkMixedAtTotal 70 = true := by decide +kernel

private theorem mixedRow71 : checkMixedAtTotal 71 = true := by decide +kernel

private theorem mixedRow72 : checkMixedAtTotal 72 = true := by decide +kernel

private theorem mixedRow73 : checkMixedAtTotal 73 = true := by decide +kernel

private theorem mixedRow74 : checkMixedAtTotal 74 = true := by decide +kernel

theorem mixedRows060To074 (l : ℕ) (lo : 60 ≤ l) (hi : l ≤ 74) : checkMixedAtTotal l = true := by
  have h : l = 60 ∨ l = 61 ∨ l = 62 ∨ l = 63 ∨ l = 64 ∨ l = 65 ∨ l = 66 ∨ l = 67 ∨ l = 68 ∨ l = 69 ∨ l = 70 ∨ l = 71 ∨ l = 72 ∨ l = 73 ∨ l = 74 := by omega
  rcases h with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact mixedRow60
  · exact mixedRow61
  · exact mixedRow62
  · exact mixedRow63
  · exact mixedRow64
  · exact mixedRow65
  · exact mixedRow66
  · exact mixedRow67
  · exact mixedRow68
  · exact mixedRow69
  · exact mixedRow70
  · exact mixedRow71
  · exact mixedRow72
  · exact mixedRow73
  · exact mixedRow74

end BraunBruegge
