import Conjectures.LonelinessSixPlaneDataCoverageSoundness
import Mathlib.Tactic.FinCases

namespace Loneliness.SixPlane.Data

set_option maxRecDepth 100000 in
theorem direction_07_00 : partialDirectionCheck 7 0 60 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem direction_07_01 : partialDirectionCheck 7 60 60 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem direction_07_02 : partialDirectionCheck 7 120 60 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem direction_07_03 : partialDirectionCheck 7 180 60 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem direction_07_04 : partialDirectionCheck 7 240 60 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem direction_07_05 : partialDirectionCheck 7 300 60 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem direction_07_06 : partialDirectionCheck 7 360 60 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem direction_07_07 : partialDirectionCheck 7 420 60 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem direction_07_08 : partialDirectionCheck 7 480 60 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem direction_07_09 : partialDirectionCheck 7 540 60 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem direction_07_10 : partialDirectionCheck 7 600 60 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem direction_07_11 : partialDirectionCheck 7 660 60 = true := by
  decide +kernel

theorem direction_cases_07 (block : Fin 12) :
    partialDirectionCheck 7 (block.val * 60) 60 = true := by
  fin_cases block
  · exact direction_07_00
  · exact direction_07_01
  · exact direction_07_02
  · exact direction_07_03
  · exact direction_07_04
  · exact direction_07_05
  · exact direction_07_06
  · exact direction_07_07
  · exact direction_07_08
  · exact direction_07_09
  · exact direction_07_10
  · exact direction_07_11

end Loneliness.SixPlane.Data
