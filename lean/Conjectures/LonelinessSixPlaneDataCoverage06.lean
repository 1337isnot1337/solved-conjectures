import Conjectures.LonelinessSixPlaneDataCoverageSoundness
import Mathlib.Tactic.FinCases

namespace Loneliness.SixPlane.Data

set_option maxRecDepth 100000 in
theorem direction_06_00 : partialDirectionCheck 6 0 60 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem direction_06_01 : partialDirectionCheck 6 60 60 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem direction_06_02 : partialDirectionCheck 6 120 60 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem direction_06_03 : partialDirectionCheck 6 180 60 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem direction_06_04 : partialDirectionCheck 6 240 60 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem direction_06_05 : partialDirectionCheck 6 300 60 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem direction_06_06 : partialDirectionCheck 6 360 60 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem direction_06_07 : partialDirectionCheck 6 420 60 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem direction_06_08 : partialDirectionCheck 6 480 60 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem direction_06_09 : partialDirectionCheck 6 540 60 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem direction_06_10 : partialDirectionCheck 6 600 60 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem direction_06_11 : partialDirectionCheck 6 660 60 = true := by
  decide +kernel

theorem direction_cases_06 (block : Fin 12) :
    partialDirectionCheck 6 (block.val * 60) 60 = true := by
  fin_cases block
  · exact direction_06_00
  · exact direction_06_01
  · exact direction_06_02
  · exact direction_06_03
  · exact direction_06_04
  · exact direction_06_05
  · exact direction_06_06
  · exact direction_06_07
  · exact direction_06_08
  · exact direction_06_09
  · exact direction_06_10
  · exact direction_06_11

end Loneliness.SixPlane.Data
