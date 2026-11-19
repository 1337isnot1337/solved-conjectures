import Conjectures.LonelinessPrimeFilteringFourCanonicalCheck

namespace Loneliness.PrimeFilteringFourProfiles

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem canonicalCheck_4 : canonicalCheck 4 = true := by decide

end Loneliness.PrimeFilteringFourProfiles
