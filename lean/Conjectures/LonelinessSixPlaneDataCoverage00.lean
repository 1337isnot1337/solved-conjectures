import Conjectures.LonelinessSixPlaneDataCoverageSoundness
import Mathlib.Tactic.FinCases

namespace Loneliness.SixPlane.Data

set_option maxRecDepth 100000 in
theorem direction_00_00 : partialDirectionCheck 0 0 60 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem direction_00_01 : partialDirectionCheck 0 60 60 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem direction_00_02 : partialDirectionCheck 0 120 60 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem direction_00_03 : partialDirectionCheck 0 180 60 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem direction_00_04 : partialDirectionCheck 0 240 60 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem direction_00_05 : partialDirectionCheck 0 300 60 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem direction_00_06 : partialDirectionCheck 0 360 60 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem direction_00_07 : partialDirectionCheck 0 420 60 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem direction_00_08 : partialDirectionCheck 0 480 60 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem direction_00_09 : partialDirectionCheck 0 540 60 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem direction_00_10 : partialDirectionCheck 0 600 60 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem direction_00_11 : partialDirectionCheck 0 660 60 = true := by
  decide +kernel

theorem direction_cases_00 (block : Fin 12) :
    partialDirectionCheck 0 (block.val * 60) 60 = true := by
  fin_cases block
  · exact direction_00_00
  · exact direction_00_01
  · exact direction_00_02
  · exact direction_00_03
  · exact direction_00_04
  · exact direction_00_05
  · exact direction_00_06
  · exact direction_00_07
  · exact direction_00_08
  · exact direction_00_09
  · exact direction_00_10
  · exact direction_00_11

end Loneliness.SixPlane.Data
