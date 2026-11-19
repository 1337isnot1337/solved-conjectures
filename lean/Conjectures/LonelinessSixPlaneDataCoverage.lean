import Conjectures.LonelinessSixPlaneDataCoverage00
import Conjectures.LonelinessSixPlaneDataCoverage01
import Conjectures.LonelinessSixPlaneDataCoverage02
import Conjectures.LonelinessSixPlaneDataCoverage03
import Conjectures.LonelinessSixPlaneDataCoverage04
import Conjectures.LonelinessSixPlaneDataCoverage05
import Conjectures.LonelinessSixPlaneDataCoverage06
import Conjectures.LonelinessSixPlaneDataCoverage07
import Conjectures.LonelinessSixPlaneDataCoverage08
import Conjectures.LonelinessSixPlaneDataCoverage09

namespace Loneliness.SixPlane.Data

theorem directions_complete : directionCoverageCheck directionAt rankToRow = true := by
  apply directionCoverageCheck_of_fixed_chunks 60 12 (by decide) (by decide)
  intro j block
  fin_cases j
  · exact direction_cases_00 block
  · exact direction_cases_01 block
  · exact direction_cases_02 block
  · exact direction_cases_03 block
  · exact direction_cases_04 block
  · exact direction_cases_05 block
  · exact direction_cases_06 block
  · exact direction_cases_07 block
  · exact direction_cases_08 block
  · exact direction_cases_09 block

end Loneliness.SixPlane.Data
