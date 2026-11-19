import Conjectures.LonelinessSixPlaneDataDefs

namespace Loneliness.SixPlane.Data

set_option maxRecDepth 100000 in
theorem pilotForty : partialCheck 0 0 0 40 = true := by
  decide +kernel

end Loneliness.SixPlane.Data
