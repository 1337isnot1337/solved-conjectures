import Conjectures.LonelinessSixPlaneDataCoverageSoundness
import Mathlib.Tactic.FinCases

namespace Loneliness.SixPlane.Data

set_option maxRecDepth 100000 in
theorem direction_08_00 : partialDirectionCheck 8 0 60 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem direction_08_01 : partialDirectionCheck 8 60 60 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem direction_08_02 : partialDirectionCheck 8 120 60 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem direction_08_03 : partialDirectionCheck 8 180 60 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem direction_08_04 : partialDirectionCheck 8 240 60 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem direction_08_05 : partialDirectionCheck 8 300 60 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem direction_08_06 : partialDirectionCheck 8 360 60 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem direction_08_07 : partialDirectionCheck 8 420 60 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem direction_08_08 : partialDirectionCheck 8 480 60 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem direction_08_09 : partialDirectionCheck 8 540 60 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem direction_08_10 : partialDirectionCheck 8 600 60 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem direction_08_11 : partialDirectionCheck 8 660 60 = true := by
  decide +kernel

theorem direction_cases_08 (block : Fin 12) :
    partialDirectionCheck 8 (block.val * 60) 60 = true := by
  fin_cases block
  · exact direction_08_00
  · exact direction_08_01
  · exact direction_08_02
  · exact direction_08_03
  · exact direction_08_04
  · exact direction_08_05
  · exact direction_08_06
  · exact direction_08_07
  · exact direction_08_08
  · exact direction_08_09
  · exact direction_08_10
  · exact direction_08_11

end Loneliness.SixPlane.Data
