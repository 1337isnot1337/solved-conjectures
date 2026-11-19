import Conjectures.LonelinessSixPlaneDataDefs

namespace Loneliness.SixPlane.Data

set_option maxRecDepth 100000 in
theorem pilotEight : partialCheck 0 0 0 8 = true := by
  decide +kernel

end Loneliness.SixPlane.Data
