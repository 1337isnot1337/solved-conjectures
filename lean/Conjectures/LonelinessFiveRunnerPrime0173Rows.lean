import Conjectures.LonelinessFiveRunnerFinite
import Mathlib.Data.Fin.VecNotation
import Mathlib.Tactic.FinCases

/-! Ten retained rows for prime 173. Row.Valid checks injectivity,
the radius-nine bound, and one of the two primitive target directions. -/

namespace Loneliness.Modular.FiveRunner.Prime0173

def rows : Fin 10 → Row :=
  ![⟨![1, 2, 3, 4, 5], 1, [1, 2, 3, 4, 5]⟩,
    ⟨![1, 2, 84, 85, 86], 2, [1, 2, 3, 4, 5]⟩,
    ⟨![1, 56, 57, 58, 59], 3, [1, 2, 3, 4, 5]⟩,
    ⟨![1, 42, 43, 44, 86], 4, [1, 2, 3, 4, 5]⟩,
    ⟨![1, 34, 35, 69, 70], 5, [1, 2, 3, 4, 5]⟩,
    ⟨![1, 3, 4, 5, 9], 1, [1, 3, 4, 5, 9]⟩,
    ⟨![1, 3, 56, 58, 59], 3, [1, 3, 4, 5, 9]⟩,
    ⟨![1, 41, 42, 43, 44], 4, [1, 3, 4, 5, 9]⟩,
    ⟨![1, 34, 69, 70, 71], 5, [1, 3, 4, 5, 9]⟩,
    ⟨![1, 38, 39, 58, 77], 9, [1, 3, 4, 5, 9]⟩]

theorem row0_valid : (rows 0).Valid 173 := by
  decide +kernel

theorem row1_valid : (rows 1).Valid 173 := by
  decide +kernel

theorem row2_valid : (rows 2).Valid 173 := by
  decide +kernel

theorem row3_valid : (rows 3).Valid 173 := by
  decide +kernel

theorem row4_valid : (rows 4).Valid 173 := by
  decide +kernel

theorem row5_valid : (rows 5).Valid 173 := by
  decide +kernel

theorem row6_valid : (rows 6).Valid 173 := by
  decide +kernel

theorem row7_valid : (rows 7).Valid 173 := by
  decide +kernel

theorem row8_valid : (rows 8).Valid 173 := by
  decide +kernel

theorem row9_valid : (rows 9).Valid 173 := by
  decide +kernel

theorem rows_valid (i : Fin 10) : (rows i).Valid 173 := by
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

end Loneliness.Modular.FiveRunner.Prime0173
