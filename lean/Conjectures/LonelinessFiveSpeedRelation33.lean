import Conjectures.LonelinessFiveSpeedRelationDefs

set_option maxRecDepth 8192
set_option maxHeartbeats 0

namespace Loneliness.FiveSpeedCertificate

open Matrix
open scoped Matrix

def relationCertificates33 : Fin 50 → RelationCaseCertificate :=
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
    .zero 4 { denominator := 2, coefficients := ![-1, 1] },
    .repeated 3 4 false { denominator := 1, coefficients := ![-1, 1] },
    .image { index := 2, permutation := ![1, 2, 0, 4, 3], negative := ![false, false, false, false, true] } { denominator := 1, parameters := ![![0, 1, 0, 0, 0], ![0, 0, 0, 0, -1], ![0, 0, 0, 1, 0]], correction := ![![0, 1], ![0, 0], ![-1, 1], ![0, 0], ![0, 0]] } { row := ![1, 4, 3], negative := ![false, true, false] },
    .repeated 2 3 true { denominator := 1, coefficients := ![-1, 1] },
    .image { index := 1, permutation := ![1, 4, 0, 2, 3], negative := ![false, false, false, false, true] } { denominator := 1, parameters := ![![0, 0, 0, 1, 0], ![0, 0, 0, 0, -1], ![0, 1, 0, 0, 0]], correction := ![![0, 1], ![0, 0], ![-1, 1], ![0, 0], ![0, 0]] } { row := ![3, 4, 1], negative := ![false, true, false] },
    .repeated 2 4 true { denominator := 1, coefficients := ![-1, 1] },
    .repeated 2 3 false { denominator := 1, coefficients := ![-1, 1] },
    .image { index := 1, permutation := ![1, 4, 3, 0, 2], negative := ![false, false, false, false, false] } { denominator := 2, parameters := ![![0, 0, 0, 0, 2], ![0, 0, 2, 0, 0], ![0, 2, 0, 0, 0]], correction := ![![2, 0], ![0, 0], ![0, 0], ![2, -2], ![0, 0]] } { row := ![4, 2, 1], negative := ![false, false, false] },
    .zero 2 { denominator := 2, coefficients := ![-1, 1] },
    .repeated 1 4 false { denominator := 1, coefficients := ![-1, 1] },
    .image { index := 5, permutation := ![0, 1, 2, 3, 4], negative := ![false, true, false, false, false] } { denominator := 1, parameters := ![![0, 0, 1, 0, 0], ![0, 0, 0, 1, 0], ![0, 0, 0, 0, 1]], correction := ![![1, 0], ![-1, 1], ![0, 0], ![0, 0], ![0, 0]] } { row := ![2, 3, 4], negative := ![false, false, false] },
    .repeated 1 2 false { denominator := 1, coefficients := ![-1, 1] },
    .image { index := 3, permutation := ![3, 2, 0, 4, 1], negative := ![false, false, false, false, true] } { denominator := -1, parameters := ![![0, 0, 0, 0, 1], ![-1, 0, 0, 0, 0], ![0, 0, 0, -1, 0]], correction := ![![0, 0], ![0, 1], ![1, 0], ![0, 0], ![0, 0]] } { row := ![4, 0, 3], negative := ![true, false, false] },
    .repeated 0 4 false { denominator := 1, coefficients := ![-1, 1] },
    .image { index := 3, permutation := ![3, 4, 0, 2, 1], negative := ![false, false, false, false, true] } { denominator := 2, parameters := ![![0, 0, 0, 0, -2], ![2, 0, 0, 0, 0], ![0, 2, 0, 0, 0]], correction := ![![0, 0], ![0, 0], ![-2, 0], ![0, -2], ![0, 0]] } { row := ![4, 0, 1], negative := ![true, false, false] },
    .repeated 0 2 false { denominator := 2, coefficients := ![-2, 2] }]

theorem relationCertificates33_checked : ∀ b : Fin 50,
    (33 : Fin 50) < b →
      relationCaseCheck (pairRelations 33 b) (relationCertificates33 b) = true := by
  decide +kernel

end Loneliness.FiveSpeedCertificate
