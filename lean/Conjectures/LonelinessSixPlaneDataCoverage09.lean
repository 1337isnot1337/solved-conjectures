import Conjectures.LonelinessSixPlaneDataCoverageSoundness
import Mathlib.Tactic.FinCases

namespace Loneliness.SixPlane.Data

set_option maxRecDepth 100000 in
theorem direction_09_00 : partialDirectionCheck 9 0 60 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem direction_09_01 : partialDirectionCheck 9 60 60 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem direction_09_02 : partialDirectionCheck 9 120 60 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem direction_09_03 : partialDirectionCheck 9 180 60 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem direction_09_04 : partialDirectionCheck 9 240 60 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem direction_09_05 : partialDirectionCheck 9 300 60 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem direction_09_06 : partialDirectionCheck 9 360 60 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem direction_09_07 : partialDirectionCheck 9 420 60 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem direction_09_08 : partialDirectionCheck 9 480 60 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem direction_09_09 : partialDirectionCheck 9 540 60 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem direction_09_10 : partialDirectionCheck 9 600 60 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem direction_09_11 : partialDirectionCheck 9 660 60 = true := by
  decide +kernel

theorem direction_cases_09 (block : Fin 12) :
    partialDirectionCheck 9 (block.val * 60) 60 = true := by
  fin_cases block
  · exact direction_09_00
  · exact direction_09_01
  · exact direction_09_02
  · exact direction_09_03
  · exact direction_09_04
  · exact direction_09_05
  · exact direction_09_06
  · exact direction_09_07
  · exact direction_09_08
  · exact direction_09_09
  · exact direction_09_10
  · exact direction_09_11

end Loneliness.SixPlane.Data
