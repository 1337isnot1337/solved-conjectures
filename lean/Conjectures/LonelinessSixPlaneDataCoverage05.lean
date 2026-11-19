import Conjectures.LonelinessSixPlaneDataCoverageSoundness
import Mathlib.Tactic.FinCases

namespace Loneliness.SixPlane.Data

set_option maxRecDepth 100000 in
theorem direction_05_00 : partialDirectionCheck 5 0 60 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem direction_05_01 : partialDirectionCheck 5 60 60 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem direction_05_02 : partialDirectionCheck 5 120 60 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem direction_05_03 : partialDirectionCheck 5 180 60 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem direction_05_04 : partialDirectionCheck 5 240 60 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem direction_05_05 : partialDirectionCheck 5 300 60 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem direction_05_06 : partialDirectionCheck 5 360 60 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem direction_05_07 : partialDirectionCheck 5 420 60 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem direction_05_08 : partialDirectionCheck 5 480 60 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem direction_05_09 : partialDirectionCheck 5 540 60 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem direction_05_10 : partialDirectionCheck 5 600 60 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem direction_05_11 : partialDirectionCheck 5 660 60 = true := by
  decide +kernel

theorem direction_cases_05 (block : Fin 12) :
    partialDirectionCheck 5 (block.val * 60) 60 = true := by
  fin_cases block
  · exact direction_05_00
  · exact direction_05_01
  · exact direction_05_02
  · exact direction_05_03
  · exact direction_05_04
  · exact direction_05_05
  · exact direction_05_06
  · exact direction_05_07
  · exact direction_05_08
  · exact direction_05_09
  · exact direction_05_10
  · exact direction_05_11

end Loneliness.SixPlane.Data
