import Conjectures.LonelinessSixPlaneDataDefs
import Mathlib.Tactic.FinCases

namespace Loneliness.SixPlane.Data

set_option maxRecDepth 100000 in
theorem pair_02_01_00 : partialCheck 2 1 0 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_02_01_01 : partialCheck 2 1 40 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_02_01_02 : partialCheck 2 1 80 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_02_01_03 : partialCheck 2 1 120 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_02_01_04 : partialCheck 2 1 160 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_02_01_05 : partialCheck 2 1 200 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_02_01_06 : partialCheck 2 1 240 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_02_01_07 : partialCheck 2 1 280 40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
theorem pair_02_01_08 : partialCheck 2 1 320 40 = true := by
  decide +kernel

theorem pair_cases_02_01 (block : Fin 9) :
    partialCheck 2 1 (block.val * 40) 40 = true := by
  fin_cases block
  · exact pair_02_01_00
  · exact pair_02_01_01
  · exact pair_02_01_02
  · exact pair_02_01_03
  · exact pair_02_01_04
  · exact pair_02_01_05
  · exact pair_02_01_06
  · exact pair_02_01_07
  · exact pair_02_01_08

end Loneliness.SixPlane.Data
