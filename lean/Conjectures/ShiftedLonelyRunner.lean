import Conjectures.ShiftedLonelyRunnerData18To22
import Conjectures.ShiftedLonelyRunnerData23To27
import Conjectures.ShiftedLonelyRunnerData28To32
import Conjectures.ShiftedLonelyRunnerData33To37
import Conjectures.ShiftedLonelyRunnerData38To42
import Conjectures.ShiftedLonelyRunnerData43To47
import Conjectures.ShiftedLonelyRunnerData48To52
import Conjectures.ShiftedLonelyRunnerData53To57

namespace ShiftedLonelyRunner

/-- The published record for every size in the certified range has its stated
attained real-time maximum and strictly violates the shifted bound. -/
theorem verified_range (n : ℕ) (hlo : 18 ≤ n) (hhi : n ≤ 57) :
    ∃ row : Row, row.Verified n := by
  interval_cases n
  · exact ⟨row18, verified18⟩
  · exact ⟨row19, verified19⟩
  · exact ⟨row20, verified20⟩
  · exact ⟨row21, verified21⟩
  · exact ⟨row22, verified22⟩
  · exact ⟨row23, verified23⟩
  · exact ⟨row24, verified24⟩
  · exact ⟨row25, verified25⟩
  · exact ⟨row26, verified26⟩
  · exact ⟨row27, verified27⟩
  · exact ⟨row28, verified28⟩
  · exact ⟨row29, verified29⟩
  · exact ⟨row30, verified30⟩
  · exact ⟨row31, verified31⟩
  · exact ⟨row32, verified32⟩
  · exact ⟨row33, verified33⟩
  · exact ⟨row34, verified34⟩
  · exact ⟨row35, verified35⟩
  · exact ⟨row36, verified36⟩
  · exact ⟨row37, verified37⟩
  · exact ⟨row38, verified38⟩
  · exact ⟨row39, verified39⟩
  · exact ⟨row40, verified40⟩
  · exact ⟨row41, verified41⟩
  · exact ⟨row42, verified42⟩
  · exact ⟨row43, verified43⟩
  · exact ⟨row44, verified44⟩
  · exact ⟨row45, verified45⟩
  · exact ⟨row46, verified46⟩
  · exact ⟨row47, verified47⟩
  · exact ⟨row48, verified48⟩
  · exact ⟨row49, verified49⟩
  · exact ⟨row50, verified50⟩
  · exact ⟨row51, verified51⟩
  · exact ⟨row52, verified52⟩
  · exact ⟨row53, verified53⟩
  · exact ⟨row54, verified54⟩
  · exact ⟨row55, verified55⟩
  · exact ⟨row56, verified56⟩
  · exact ⟨row57, verified57⟩

/-- Zhang’s shifted Lonely Runner bound fails at each of the forty sizes. -/
theorem zhang_question_8_5 (n : ℕ) (hlo : 18 ≤ n) (hhi : n ≤ 57) :
    Gamma n < 1 / ((n : ℝ) + 1) := by
  obtain ⟨w, hw⟩ := verified_range n hlo hhi
  exact hw.Gamma_lt

end ShiftedLonelyRunner
