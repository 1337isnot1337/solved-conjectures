import Conjectures.LonelinessTwoInsertionsSmall3
import Conjectures.LonelinessTwoInsertionsSmall4
import Conjectures.LonelinessTwoInsertionsSmall5
import Conjectures.LonelinessTwoInsertionsSmall6
import Conjectures.LonelinessTwoInsertionsSmall7
import Conjectures.LonelinessTwoInsertionsSmall8
import Conjectures.LonelinessTwoInsertionsSmall9
import Conjectures.LonelinessTwoInsertionsSmall10
import Mathlib.Tactic.IntervalCases

namespace Loneliness.TwoInsertions

theorem small_bounded_window (p b c : ℕ) (hp : 3 ≤ p) (hp' : p ≤ 10)
    (hb : 1 ≤ b) (hbound : b ≤ smallBound p) (hbc : b ≤ c) :
    TwoSpeedWindow p b c := by
  interval_cases p
  · exact Small3.bounded_first b c hb hbound hbc
  · exact Small4.bounded_first b c hb hbound hbc
  · exact Small5.bounded_first b c hb hbound hbc
  · exact Small6.bounded_first b c hb hbound hbc
  · exact Small7.bounded_first b c hb hbound hbc
  · exact Small8.bounded_first b c hb hbound hbc
  · exact Small9.bounded_first b c hb hbound hbc
  · exact Small10.bounded_first b c hb hbound hbc

end Loneliness.TwoInsertions
