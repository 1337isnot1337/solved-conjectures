import Conjectures.BraunBrueggeBicyclicFiniteArithmetic

/-! Kernel checks at total lengths 118 through 125. -/

namespace BraunBruegge

set_option maxHeartbeats 0
set_option maxRecDepth 20000

private theorem mixedRow118 : checkMixedAtTotal 118 = true := by decide +kernel

private theorem mixedRow119 : checkMixedAtTotal 119 = true := by decide +kernel

private theorem mixedRow120 : checkMixedAtTotal 120 = true := by decide +kernel

private theorem mixedRow121 : checkMixedAtTotal 121 = true := by decide +kernel

private theorem mixedRow122 : checkMixedAtTotal 122 = true := by decide +kernel

private theorem mixedRow123 : checkMixedAtTotal 123 = true := by decide +kernel

private theorem mixedRow124 : checkMixedAtTotal 124 = true := by decide +kernel

private theorem mixedRow125 : checkMixedAtTotal 125 = true := by decide +kernel

theorem mixedRows118To125 (l : ℕ) (lo : 118 ≤ l) (hi : l ≤ 125) : checkMixedAtTotal l = true := by
  have h : l = 118 ∨ l = 119 ∨ l = 120 ∨ l = 121 ∨ l = 122 ∨ l = 123 ∨ l = 124 ∨ l = 125 := by omega
  rcases h with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact mixedRow118
  · exact mixedRow119
  · exact mixedRow120
  · exact mixedRow121
  · exact mixedRow122
  · exact mixedRow123
  · exact mixedRow124
  · exact mixedRow125

end BraunBruegge
