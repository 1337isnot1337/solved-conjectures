import Conjectures.LonelinessSixPlaneDataCoverageSoundness
import Mathlib.Tactic.FinCases

namespace Loneliness.SixPlane.Data

set_option maxRecDepth 100000 in
theorem direction_04_00 : partialDirectionCheck 4 0 60 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem direction_04_01 : partialDirectionCheck 4 60 60 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem direction_04_02 : partialDirectionCheck 4 120 60 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem direction_04_03 : partialDirectionCheck 4 180 60 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem direction_04_04 : partialDirectionCheck 4 240 60 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem direction_04_05 : partialDirectionCheck 4 300 60 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem direction_04_06 : partialDirectionCheck 4 360 60 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem direction_04_07 : partialDirectionCheck 4 420 60 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem direction_04_08 : partialDirectionCheck 4 480 60 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem direction_04_09 : partialDirectionCheck 4 540 60 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem direction_04_10 : partialDirectionCheck 4 600 60 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem direction_04_11 : partialDirectionCheck 4 660 60 = true := by
  decide +kernel

theorem direction_cases_04 (block : Fin 12) :
    partialDirectionCheck 4 (block.val * 60) 60 = true := by
  fin_cases block
  · exact direction_04_00
  · exact direction_04_01
  · exact direction_04_02
  · exact direction_04_03
  · exact direction_04_04
  · exact direction_04_05
  · exact direction_04_06
  · exact direction_04_07
  · exact direction_04_08
  · exact direction_04_09
  · exact direction_04_10
  · exact direction_04_11

end Loneliness.SixPlane.Data
