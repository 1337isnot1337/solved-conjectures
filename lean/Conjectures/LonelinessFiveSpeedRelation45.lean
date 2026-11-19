import Conjectures.LonelinessFiveSpeedRelationDefs

set_option maxRecDepth 8192
set_option maxHeartbeats 0

namespace Loneliness.FiveSpeedCertificate

open Matrix
open scoped Matrix

def relationCertificates45 : Fin 50 → RelationCaseCertificate :=
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
    .zero 0 { denominator := 1, coefficients := ![0, 0] },
    .zero 0 { denominator := 1, coefficients := ![0, 0] },
    .image { index := 4, permutation := ![3, 1, 2, 4, 0], negative := ![false, false, false, false, false] } { denominator := -3, parameters := ![![0, 0, -3, 0, 0], ![-3, 0, 0, 0, 0], ![0, 0, 0, -3, 0]], correction := ![![0, 0], ![0, 3], ![0, 0], ![0, 0], ![3, 3]] } { row := ![2, 0, 3], negative := ![false, false, false] },
    .image { index := 3, permutation := ![3, 0, 2, 4, 1], negative := ![false, true, false, false, true] } { denominator := -2, parameters := ![![0, 0, 0, 0, 2], ![-2, 0, 0, 0, 0], ![0, 0, 0, -2, 0]], correction := ![![0, 0], ![-2, 0], ![0, 2], ![0, 0], ![0, 0]] } { row := ![4, 0, 3], negative := ![true, false, false] },
    .image { index := 3, permutation := ![3, 0, 4, 2, 1], negative := ![false, true, false, false, true] } { denominator := -2, parameters := ![![0, 0, 0, 0, 2], ![-2, 0, 0, 0, 0], ![0, 0, -2, 0, 0]], correction := ![![0, 0], ![-2, 0], ![0, 0], ![0, 2], ![0, 0]] } { row := ![4, 0, 2], negative := ![true, false, false] },
    .repeated 0 1 true { denominator := -2, coefficients := ![2, -2] }]

theorem relationCertificates45_checked : ∀ b : Fin 50,
    (45 : Fin 50) < b →
      relationCaseCheck (pairRelations 45 b) (relationCertificates45 b) = true := by
  decide +kernel

end Loneliness.FiveSpeedCertificate
