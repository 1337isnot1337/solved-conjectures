import Conjectures.BraunBrueggeBicyclicFiniteArithmetic

/-! Kernel checks at total lengths 99 through 108. -/

namespace BraunBruegge

set_option maxHeartbeats 0
set_option maxRecDepth 20000

private theorem mixedRow99 : checkMixedAtTotal 99 = true := by decide +kernel

private theorem mixedRow100 : checkMixedAtTotal 100 = true := by decide +kernel

private theorem mixedRow101 : checkMixedAtTotal 101 = true := by decide +kernel

private theorem mixedRow102 : checkMixedAtTotal 102 = true := by decide +kernel

private theorem mixedRow103 : checkMixedAtTotal 103 = true := by decide +kernel

private theorem mixedRow104 : checkMixedAtTotal 104 = true := by decide +kernel

private theorem mixedRow105 : checkMixedAtTotal 105 = true := by decide +kernel

private theorem mixedRow106 : checkMixedAtTotal 106 = true := by decide +kernel

private theorem mixedRow107 : checkMixedAtTotal 107 = true := by decide +kernel

private theorem mixedRow108 : checkMixedAtTotal 108 = true := by decide +kernel

theorem mixedRows099To108 (l : ℕ) (lo : 99 ≤ l) (hi : l ≤ 108) : checkMixedAtTotal l = true := by
  have h : l = 99 ∨ l = 100 ∨ l = 101 ∨ l = 102 ∨ l = 103 ∨ l = 104 ∨ l = 105 ∨ l = 106 ∨ l = 107 ∨ l = 108 := by omega
  rcases h with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact mixedRow99
  · exact mixedRow100
  · exact mixedRow101
  · exact mixedRow102
  · exact mixedRow103
  · exact mixedRow104
  · exact mixedRow105
  · exact mixedRow106
  · exact mixedRow107
  · exact mixedRow108

end BraunBruegge
