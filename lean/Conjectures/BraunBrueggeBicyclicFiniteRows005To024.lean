import Conjectures.BraunBrueggeBicyclicFiniteArithmetic

/-! Kernel checks at total lengths 5 through 24. -/

namespace BraunBruegge

set_option maxHeartbeats 0
set_option maxRecDepth 20000

private theorem mixedRow5 : checkMixedAtTotal 5 = true := by decide +kernel

private theorem mixedRow6 : checkMixedAtTotal 6 = true := by decide +kernel

private theorem mixedRow7 : checkMixedAtTotal 7 = true := by decide +kernel

private theorem mixedRow8 : checkMixedAtTotal 8 = true := by decide +kernel

private theorem mixedRow9 : checkMixedAtTotal 9 = true := by decide +kernel

private theorem mixedRow10 : checkMixedAtTotal 10 = true := by decide +kernel

private theorem mixedRow11 : checkMixedAtTotal 11 = true := by decide +kernel

private theorem mixedRow12 : checkMixedAtTotal 12 = true := by decide +kernel

private theorem mixedRow13 : checkMixedAtTotal 13 = true := by decide +kernel

private theorem mixedRow14 : checkMixedAtTotal 14 = true := by decide +kernel

private theorem mixedRow15 : checkMixedAtTotal 15 = true := by decide +kernel

private theorem mixedRow16 : checkMixedAtTotal 16 = true := by decide +kernel

private theorem mixedRow17 : checkMixedAtTotal 17 = true := by decide +kernel

private theorem mixedRow18 : checkMixedAtTotal 18 = true := by decide +kernel

private theorem mixedRow19 : checkMixedAtTotal 19 = true := by decide +kernel

private theorem mixedRow20 : checkMixedAtTotal 20 = true := by decide +kernel

private theorem mixedRow21 : checkMixedAtTotal 21 = true := by decide +kernel

private theorem mixedRow22 : checkMixedAtTotal 22 = true := by decide +kernel

private theorem mixedRow23 : checkMixedAtTotal 23 = true := by decide +kernel

private theorem mixedRow24 : checkMixedAtTotal 24 = true := by decide +kernel

theorem mixedRows005To024 (l : ℕ) (lo : 5 ≤ l) (hi : l ≤ 24) : checkMixedAtTotal l = true := by
  have h : l = 5 ∨ l = 6 ∨ l = 7 ∨ l = 8 ∨ l = 9 ∨ l = 10 ∨ l = 11 ∨ l = 12 ∨ l = 13 ∨ l = 14 ∨ l = 15 ∨ l = 16 ∨ l = 17 ∨ l = 18 ∨ l = 19 ∨ l = 20 ∨ l = 21 ∨ l = 22 ∨ l = 23 ∨ l = 24 := by omega
  rcases h with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact mixedRow5
  · exact mixedRow6
  · exact mixedRow7
  · exact mixedRow8
  · exact mixedRow9
  · exact mixedRow10
  · exact mixedRow11
  · exact mixedRow12
  · exact mixedRow13
  · exact mixedRow14
  · exact mixedRow15
  · exact mixedRow16
  · exact mixedRow17
  · exact mixedRow18
  · exact mixedRow19
  · exact mixedRow20
  · exact mixedRow21
  · exact mixedRow22
  · exact mixedRow23
  · exact mixedRow24

end BraunBruegge
