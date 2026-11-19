import Conjectures.LonelinessFiveSpeedRelationDefs

set_option maxRecDepth 8192
set_option maxHeartbeats 0

namespace Loneliness.FiveSpeedCertificate

open Matrix
open scoped Matrix

def relationCertificates40 : Fin 50 → RelationCaseCertificate :=
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
    .image { index := 1, permutation := ![1, 4, 0, 3, 2], negative := ![false, false, true, true, false] } { denominator := 1, parameters := ![![0, 0, 0, 0, 1], ![0, 0, 0, -1, 0], ![0, 1, 0, 0, 0]], correction := ![![1, 0], ![0, 0], ![-1, 1], ![0, 0], ![0, 0]] } { row := ![4, 3, 1], negative := ![false, true, false] },
    .repeated 2 3 true { denominator := 1, coefficients := ![-1, 1] },
    .image { index := 5, permutation := ![0, 1, 3, 2, 4], negative := ![false, true, false, true, false] } { denominator := 1, parameters := ![![0, 0, 0, -1, 0], ![0, 0, 1, 0, 0], ![0, 0, 0, 0, 1]], correction := ![![1, 0], ![-1, 1], ![0, 0], ![0, 0], ![0, 0]] } { row := ![3, 2, 4], negative := ![true, false, false] },
    .image { index := 1, permutation := ![1, 0, 4, 3, 2], negative := ![false, true, false, true, false] } { denominator := 1, parameters := ![![0, 0, 0, 0, 1], ![0, 0, 0, -1, 0], ![0, 0, 1, 0, 0]], correction := ![![1, 0], ![-1, 1], ![0, 0], ![0, 0], ![0, 0]] } { row := ![4, 3, 2], negative := ![false, true, false] },
    .repeated 1 3 true { denominator := 1, coefficients := ![-1, 1] },
    .image { index := 3, permutation := ![3, 2, 4, 0, 1], negative := ![false, false, false, true, true] } { denominator := -1, parameters := ![![0, 0, 0, 0, 1], ![-1, 0, 0, 0, 0], ![0, 0, -1, 0, 0]], correction := ![![0, 0], ![0, 1], ![0, 0], ![-1, 0], ![0, 0]] } { row := ![4, 0, 2], negative := ![true, false, false] },
    .image { index := 3, permutation := ![3, 4, 2, 0, 1], negative := ![false, false, false, true, true] } { denominator := -1, parameters := ![![0, 0, 0, 0, 1], ![-1, 0, 0, 0, 0], ![0, -1, 0, 0, 0]], correction := ![![0, 0], ![0, 0], ![0, 1], ![-1, 0], ![0, 0]] } { row := ![4, 0, 1], negative := ![true, false, false] },
    .image { index := 4, permutation := ![3, 2, 4, 1, 0], negative := ![false, false, false, false, false] } { denominator := -3, parameters := ![![0, -3, 0, 0, 0], ![-3, 0, 0, 0, 0], ![0, 0, -3, 0, 0]], correction := ![![0, 0], ![0, 0], ![0, 0], ![0, 3], ![3, 3]] } { row := ![1, 0, 2], negative := ![false, false, false] },
    .repeated 0 3 true { denominator := -2, coefficients := ![2, -2] }]

theorem relationCertificates40_checked : ∀ b : Fin 50,
    (40 : Fin 50) < b →
      relationCaseCheck (pairRelations 40 b) (relationCertificates40 b) = true := by
  decide +kernel

end Loneliness.FiveSpeedCertificate
