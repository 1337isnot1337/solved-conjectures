import Conjectures.LonelinessFiveSpeedRelationDefs

set_option maxRecDepth 8192
set_option maxHeartbeats 0

namespace Loneliness.FiveSpeedCertificate

open Matrix
open scoped Matrix

def relationCertificates37 : Fin 50 → RelationCaseCertificate :=
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
    .zero 4 { denominator := 2, coefficients := ![-1, 1] },
    .repeated 3 4 true { denominator := 1, coefficients := ![-1, 1] },
    .zero 3 { denominator := 2, coefficients := ![-1, 1] },
    .repeated 2 4 false { denominator := 1, coefficients := ![-1, 1] },
    .repeated 2 3 false { denominator := 1, coefficients := ![-1, 1] },
    .image { index := 5, permutation := ![0, 1, 3, 2, 4], negative := ![false, true, false, false, false] } { denominator := 1, parameters := ![![0, 0, 0, 1, 0], ![0, 0, 1, 0, 0], ![0, 0, 0, 0, 1]], correction := ![![1, 0], ![-1, 1], ![0, 0], ![0, 0], ![0, 0]] } { row := ![3, 2, 4], negative := ![false, false, false] },
    .repeated 1 4 false { denominator := 1, coefficients := ![-1, 1] },
    .repeated 1 3 false { denominator := 1, coefficients := ![-1, 1] },
    .image { index := 3, permutation := ![3, 2, 4, 0, 1], negative := ![false, false, false, false, true] } { denominator := -1, parameters := ![![0, 0, 0, 0, 1], ![-1, 0, 0, 0, 0], ![0, 0, -1, 0, 0]], correction := ![![0, 0], ![0, 1], ![0, 0], ![1, 0], ![0, 0]] } { row := ![4, 0, 2], negative := ![true, false, false] },
    .image { index := 3, permutation := ![3, 4, 2, 0, 1], negative := ![false, false, false, false, true] } { denominator := -1, parameters := ![![0, 0, 0, 0, 1], ![-1, 0, 0, 0, 0], ![0, -1, 0, 0, 0]], correction := ![![0, 0], ![0, 0], ![0, 1], ![1, 0], ![0, 0]] } { row := ![4, 0, 1], negative := ![true, false, false] },
    .repeated 0 4 false { denominator := 1, coefficients := ![-1, 1] },
    .repeated 0 3 false { denominator := 2, coefficients := ![-2, 2] }]

theorem relationCertificates37_checked : ∀ b : Fin 50,
    (37 : Fin 50) < b →
      relationCaseCheck (pairRelations 37 b) (relationCertificates37 b) = true := by
  decide +kernel

end Loneliness.FiveSpeedCertificate
