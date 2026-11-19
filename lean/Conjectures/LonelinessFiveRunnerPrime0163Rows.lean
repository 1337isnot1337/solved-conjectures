import Conjectures.LonelinessFiveRunnerFinite
import Mathlib.Data.Fin.VecNotation
import Mathlib.Tactic.FinCases

/-! Ten retained rows for prime 163. Row.Valid checks injectivity,
the radius-nine bound, and one of the two primitive target directions. -/

namespace Loneliness.Modular.FiveRunner.Prime0163

def rows : Fin 10 → Row :=
  ![⟨![1, 2, 3, 4, 5], 1, [1, 2, 3, 4, 5]⟩,
    ⟨![1, 2, 79, 80, 81], 2, [1, 2, 3, 4, 5]⟩,
    ⟨![1, 53, 54, 55, 56], 3, [1, 2, 3, 4, 5]⟩,
    ⟨![1, 40, 41, 42, 81], 4, [1, 2, 3, 4, 5]⟩,
    ⟨![1, 32, 33, 65, 66], 5, [1, 2, 3, 4, 5]⟩,
    ⟨![1, 3, 4, 5, 9], 1, [1, 3, 4, 5, 9]⟩,
    ⟨![1, 3, 53, 54, 56], 3, [1, 3, 4, 5, 9]⟩,
    ⟨![1, 40, 41, 42, 43], 4, [1, 3, 4, 5, 9]⟩,
    ⟨![1, 32, 65, 66, 67], 5, [1, 3, 4, 5, 9]⟩,
    ⟨![1, 18, 54, 72, 73], 9, [1, 3, 4, 5, 9]⟩]

theorem row0_valid : (rows 0).Valid 163 := by
  decide +kernel

theorem row1_valid : (rows 1).Valid 163 := by
  decide +kernel

theorem row2_valid : (rows 2).Valid 163 := by
  decide +kernel

theorem row3_valid : (rows 3).Valid 163 := by
  decide +kernel

theorem row4_valid : (rows 4).Valid 163 := by
  decide +kernel

theorem row5_valid : (rows 5).Valid 163 := by
  decide +kernel

theorem row6_valid : (rows 6).Valid 163 := by
  decide +kernel

theorem row7_valid : (rows 7).Valid 163 := by
  decide +kernel

theorem row8_valid : (rows 8).Valid 163 := by
  decide +kernel

theorem row9_valid : (rows 9).Valid 163 := by
  decide +kernel

theorem rows_valid (i : Fin 10) : (rows i).Valid 163 := by
  fin_cases i
  · exact row0_valid
  · exact row1_valid
  · exact row2_valid
  · exact row3_valid
  · exact row4_valid
  · exact row5_valid
  · exact row6_valid
  · exact row7_valid
  · exact row8_valid
  · exact row9_valid

def terminal : Finset ℕ → ℕ → Bool := FiveRunner.terminal rows

theorem terminal_sound :
    ∀ s index, terminal s index = true → Retained rows s :=
  FiveRunner.terminal_sound rows

end Loneliness.Modular.FiveRunner.Prime0163
