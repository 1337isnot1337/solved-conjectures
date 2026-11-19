import Conjectures.LonelinessSixPlaneDataCoverageSoundness
import Mathlib.Tactic.FinCases

namespace Loneliness.SixPlane.Data

set_option maxRecDepth 100000 in
theorem direction_03_00 : partialDirectionCheck 3 0 60 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem direction_03_01 : partialDirectionCheck 3 60 60 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem direction_03_02 : partialDirectionCheck 3 120 60 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem direction_03_03 : partialDirectionCheck 3 180 60 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem direction_03_04 : partialDirectionCheck 3 240 60 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem direction_03_05 : partialDirectionCheck 3 300 60 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem direction_03_06 : partialDirectionCheck 3 360 60 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem direction_03_07 : partialDirectionCheck 3 420 60 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem direction_03_08 : partialDirectionCheck 3 480 60 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem direction_03_09 : partialDirectionCheck 3 540 60 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem direction_03_10 : partialDirectionCheck 3 600 60 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem direction_03_11 : partialDirectionCheck 3 660 60 = true := by
  decide +kernel

theorem direction_cases_03 (block : Fin 12) :
    partialDirectionCheck 3 (block.val * 60) 60 = true := by
  fin_cases block
  · exact direction_03_00
  · exact direction_03_01
  · exact direction_03_02
  · exact direction_03_03
  · exact direction_03_04
  · exact direction_03_05
  · exact direction_03_06
  · exact direction_03_07
  · exact direction_03_08
  · exact direction_03_09
  · exact direction_03_10
  · exact direction_03_11

end Loneliness.SixPlane.Data
