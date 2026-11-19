import Conjectures.LonelinessEightPlaneCertificateCoverage
import Conjectures.LonelinessEightPlaneData00_00

/-! The first complete canonical-pattern pair is covered by the original
checker, using the checked bounded-subtree decomposition. -/

namespace Loneliness.EightPlane

theorem pair_covered_00_00 : PairCovered 0 0 0 0 :=
  pairCovered_of_certificate 8 0 0 0 0 Data.certificate_00_00_root Data.pattern_checked_00_00

end Loneliness.EightPlane

