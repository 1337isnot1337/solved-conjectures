import Conjectures.LonelinessSixPlaneDataCoverageSoundness
import Mathlib.Tactic.FinCases

namespace Loneliness.SixPlane.Data

set_option maxRecDepth 100000 in
theorem direction_01_00 : partialDirectionCheck 1 0 60 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem direction_01_01 : partialDirectionCheck 1 60 60 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem direction_01_02 : partialDirectionCheck 1 120 60 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem direction_01_03 : partialDirectionCheck 1 180 60 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem direction_01_04 : partialDirectionCheck 1 240 60 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem direction_01_05 : partialDirectionCheck 1 300 60 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem direction_01_06 : partialDirectionCheck 1 360 60 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem direction_01_07 : partialDirectionCheck 1 420 60 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem direction_01_08 : partialDirectionCheck 1 480 60 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem direction_01_09 : partialDirectionCheck 1 540 60 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem direction_01_10 : partialDirectionCheck 1 600 60 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem direction_01_11 : partialDirectionCheck 1 660 60 = true := by
  decide +kernel

theorem direction_cases_01 (block : Fin 12) :
    partialDirectionCheck 1 (block.val * 60) 60 = true := by
  fin_cases block
  · exact direction_01_00
  · exact direction_01_01
  · exact direction_01_02
  · exact direction_01_03
  · exact direction_01_04
  · exact direction_01_05
  · exact direction_01_06
  · exact direction_01_07
  · exact direction_01_08
  · exact direction_01_09
  · exact direction_01_10
  · exact direction_01_11

end Loneliness.SixPlane.Data
