import Conjectures.LonelinessFiveSpeedRelationDefs

set_option maxRecDepth 8192
set_option maxHeartbeats 0

namespace Loneliness.FiveSpeedCertificate

open Matrix
open scoped Matrix

def relationCertificate134 : RelationCaseCertificate :=
  .image { index := 0, permutation := ![0, 1, 2, 3, 4], negative := ![false, false, false, false, false] } { denominator := -4, parameters := ![![4, 0, 0, 0, 0], ![0, 0, 0, 4, 0], ![0, 0, 0, 0, 4]], correction := ![![0, 0], ![0, 4], ![4, 4], ![0, 0], ![0, 0]] } { row := ![0, 3, 4], negative := ![true, true, true] }

theorem relationCertificate134_checked :
    relationCaseCheck special134Relations relationCertificate134 = true := by
  decide +kernel

end Loneliness.FiveSpeedCertificate
