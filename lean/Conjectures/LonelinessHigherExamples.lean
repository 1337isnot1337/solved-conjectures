import Conjectures.LonelinessConsecutive
import Conjectures.LonelinessHigherExamplesSeven
import Conjectures.LonelinessHigherExamplesEight
import Conjectures.LonelinessHigherExamplesEquality

/-! The explicit examples in the higher-speed results. All 27 seven-speed
sporadic values, all 17 eight-speed sporadic values, and all six displayed
equality examples for nine through thirteen speeds are proved. Exhaustiveness
of these lists is a separate mathematical obligation. -/

namespace Loneliness.HigherExamples

theorem nine_consecutive_value : value [1,2,3,4,5,6,7,8,9] = 1/10 := by
  have h := consecutive_value 9 (by decide)
  norm_num at h
  exact h

theorem ten_consecutive_value : value [1,2,3,4,5,6,7,8,9,10] = 1/11 := by
  have h := consecutive_value 10 (by decide)
  norm_num at h
  exact h

theorem eleven_consecutive_value : value [1,2,3,4,5,6,7,8,9,10,11] = 1/12 := by
  have h := consecutive_value 11 (by decide)
  norm_num at h
  exact h

theorem twelve_consecutive_value : value [1,2,3,4,5,6,7,8,9,10,11,12] = 1/13 := by
  have h := consecutive_value 12 (by decide)
  norm_num at h
  exact h

theorem thirteen_consecutive_value : value [1,2,3,4,5,6,7,8,9,10,11,12,13] = 1/14 := by
  have h := consecutive_value 13 (by decide)
  norm_num at h
  exact h

end Loneliness.HigherExamples
