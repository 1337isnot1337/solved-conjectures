import Conjectures.LonelinessSixPlaneDataCoverageSoundness
import Mathlib.Tactic.FinCases

namespace Loneliness.SixPlane.Data

set_option maxRecDepth 100000 in
theorem direction_02_00 : partialDirectionCheck 2 0 60 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem direction_02_01 : partialDirectionCheck 2 60 60 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem direction_02_02 : partialDirectionCheck 2 120 60 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem direction_02_03 : partialDirectionCheck 2 180 60 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem direction_02_04 : partialDirectionCheck 2 240 60 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem direction_02_05 : partialDirectionCheck 2 300 60 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem direction_02_06 : partialDirectionCheck 2 360 60 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem direction_02_07 : partialDirectionCheck 2 420 60 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem direction_02_08 : partialDirectionCheck 2 480 60 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem direction_02_09 : partialDirectionCheck 2 540 60 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem direction_02_10 : partialDirectionCheck 2 600 60 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem direction_02_11 : partialDirectionCheck 2 660 60 = true := by
  decide +kernel

theorem direction_cases_02 (block : Fin 12) :
    partialDirectionCheck 2 (block.val * 60) 60 = true := by
  fin_cases block
  · exact direction_02_00
  · exact direction_02_01
  · exact direction_02_02
  · exact direction_02_03
  · exact direction_02_04
  · exact direction_02_05
  · exact direction_02_06
  · exact direction_02_07
  · exact direction_02_08
  · exact direction_02_09
  · exact direction_02_10
  · exact direction_02_11

end Loneliness.SixPlane.Data
