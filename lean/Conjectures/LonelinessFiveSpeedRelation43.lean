import Conjectures.LonelinessFiveSpeedRelationDefs

set_option maxRecDepth 8192
set_option maxHeartbeats 0

namespace Loneliness.FiveSpeedCertificate

open Matrix
open scoped Matrix

def relationCertificates43 : Fin 50 → RelationCaseCertificate :=
  ![
    .zero 0 { denominator := 1, coefficients := ![0, 0] },
    .zero 0 { denominator := 1, coefficients := ![0, 0] },
    .zero 0 { denominator := 1, coefficients := ![0, 0] },
    .zero 0 { denominator := 1, coefficients := ![0, 0] },
    .zero 0 { denominator := 1, coefficients := ![0, 0] },
    .zero 0 { denominator := 1, coefficients := ![0, 0] },
    .zero 0 { denominator := 1, coefficients := ![0, 0] },
    .zero 0 { denominator := 1, coefficients := ![0, 0] },
    .zero 0 { denominator := 1, coefficients := ![0, 0] },
    .zero 0 { denominator := 1, coefficients := ![0, 0] },
    .zero 0 { denominator := 1, coefficients := ![0, 0] },
    .zero 0 { denominator := 1, coefficients := ![0, 0] },
    .zero 0 { denominator := 1, coefficients := ![0, 0] },
    .zero 0 { denominator := 1, coefficients := ![0, 0] },
    .zero 0 { denominator := 1, coefficients := ![0, 0] },
    .zero 0 { denominator := 1, coefficients := ![0, 0] },
    .zero 0 { denominator := 1, coefficients := ![0, 0] },
    .zero 0 { denominator := 1, coefficients := ![0, 0] },
    .zero 0 { denominator := 1, coefficients := ![0, 0] },
    .zero 0 { denominator := 1, coefficients := ![0, 0] },
    .zero 0 { denominator := 1, coefficients := ![0, 0] },
    .zero 0 { denominator := 1, coefficients := ![0, 0] },
    .zero 0 { denominator := 1, coefficients := ![0, 0] },
    .zero 0 { denominator := 1, coefficients := ![0, 0] },
    .zero 0 { denominator := 1, coefficients := ![0, 0] },
    .zero 0 { denominator := 1, coefficients := ![0, 0] },
    .zero 0 { denominator := 1, coefficients := ![0, 0] },
    .zero 0 { denominator := 1, coefficients := ![0, 0] },
    .zero 0 { denominator := 1, coefficients := ![0, 0] },
    .zero 0 { denominator := 1, coefficients := ![0, 0] },
    .zero 0 { denominator := 1, coefficients := ![0, 0] },
    .zero 0 { denominator := 1, coefficients := ![0, 0] },
    .zero 0 { denominator := 1, coefficients := ![0, 0] },
    .zero 0 { denominator := 1, coefficients := ![0, 0] },
    .zero 0 { denominator := 1, coefficients := ![0, 0] },
    .zero 0 { denominator := 1, coefficients := ![0, 0] },
    .zero 0 { denominator := 1, coefficients := ![0, 0] },
    .zero 0 { denominator := 1, coefficients := ![0, 0] },
    .zero 0 { denominator := 1, coefficients := ![0, 0] },
    .zero 0 { denominator := 1, coefficients := ![0, 0] },
    .zero 0 { denominator := 1, coefficients := ![0, 0] },
    .zero 0 { denominator := 1, coefficients := ![0, 0] },
    .zero 0 { denominator := 1, coefficients := ![0, 0] },
    .zero 0 { denominator := 1, coefficients := ![0, 0] },
    .repeated 2 3 true { denominator := 1, coefficients := ![-1, 1] },
    .repeated 2 4 true { denominator := 1, coefficients := ![-1, 1] },
    .image { index := 4, permutation := ![3, 1, 0, 2, 4], negative := ![false, false, false, false, false] } { denominator := -3, parameters := ![![0, 0, 0, -3, 0], ![-3, 0, 0, 0, 0], ![0, 0, 0, 0, -3]], correction := ![![0, 0], ![0, 3], ![3, 3], ![0, 0], ![0, 0]] } { row := ![3, 0, 4], negative := ![false, false, false] },
    .repeated 0 1 true { denominator := -2, coefficients := ![2, -2] },
    .image { index := 3, permutation := ![3, 0, 1, 2, 4], negative := ![false, true, true, false, false] } { denominator := -2, parameters := ![![0, 0, 2, 0, 0], ![-2, 0, 0, 0, 0], ![0, 0, 0, 0, -2]], correction := ![![0, 0], ![-2, 0], ![0, 0], ![0, 2], ![0, 0]] } { row := ![2, 0, 4], negative := ![true, false, false] },
    .image { index := 3, permutation := ![3, 0, 1, 4, 2], negative := ![false, true, true, false, false] } { denominator := -2, parameters := ![![0, 0, 2, 0, 0], ![-2, 0, 0, 0, 0], ![0, 0, 0, -2, 0]], correction := ![![0, 0], ![-2, 0], ![0, 0], ![0, 0], ![0, 2]] } { row := ![2, 0, 3], negative := ![true, false, false] }]

theorem relationCertificates43_checked : ∀ b : Fin 50,
    (43 : Fin 50) < b →
      relationCaseCheck (pairRelations 43 b) (relationCertificates43 b) = true := by
  decide +kernel

end Loneliness.FiveSpeedCertificate
