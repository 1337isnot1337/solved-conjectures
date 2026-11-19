import Conjectures.LonelinessFiveSpeedRelationDefs

set_option maxRecDepth 8192
set_option maxHeartbeats 0

namespace Loneliness.FiveSpeedCertificate

open Matrix
open scoped Matrix

def relationCertificates26 : Fin 50 → RelationCaseCertificate :=
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
    .repeated 3 4 true { denominator := 1, coefficients := ![-1, 1] },
    .repeated 3 4 false { denominator := 1, coefficients := ![-1, 1] },
    .zero 3 { denominator := 2, coefficients := ![-1, 1] },
    .repeated 2 3 false { denominator := 1, coefficients := ![-1, 1] },
    .image { index := 2, permutation := ![1, 0, 4, 3, 2], negative := ![false, false, false, true, false] } { denominator := 1, parameters := ![![0, 0, 0, 0, 1], ![0, 0, 0, -1, 0], ![0, 0, 1, 0, 0]], correction := ![![0, 1], ![-1, 1], ![0, 0], ![0, 0], ![0, 0]] } { row := ![4, 3, 2], negative := ![false, true, false] },
    .repeated 1 2 true { denominator := 1, coefficients := ![-1, 1] },
    .image { index := 5, permutation := ![0, 1, 2, 3, 4], negative := ![false, false, false, false, false] } { denominator := 1, parameters := ![![0, 0, 1, 0, 0], ![0, 0, 0, 1, 0], ![0, 0, 0, 0, 1]], correction := ![![0, 1], ![-1, 1], ![0, 0], ![0, 0], ![0, 0]] } { row := ![2, 3, 4], negative := ![false, false, false] },
    .image { index := 5, permutation := ![0, 1, 2, 3, 4], negative := ![false, false, false, false, true] } { denominator := 1, parameters := ![![0, 0, 1, 0, 0], ![0, 0, 0, 1, 0], ![0, 0, 0, 0, -1]], correction := ![![0, 1], ![-1, 1], ![0, 0], ![0, 0], ![0, 0]] } { row := ![2, 3, 4], negative := ![false, false, true] },
    .image { index := 1, permutation := ![1, 0, 2, 3, 4], negative := ![false, false, false, true, false] } { denominator := 1, parameters := ![![0, 0, 1, 0, 0], ![0, 0, 0, -1, 0], ![0, 0, 0, 0, 1]], correction := ![![0, 1], ![-1, 1], ![0, 0], ![0, 0], ![0, 0]] } { row := ![2, 3, 4], negative := ![false, true, false] },
    .repeated 1 3 true { denominator := 1, coefficients := ![-1, 1] },
    .repeated 1 4 true { denominator := 1, coefficients := ![-1, 1] },
    .repeated 1 4 false { denominator := 1, coefficients := ![-1, 1] },
    .image { index := 2, permutation := ![1, 0, 2, 3, 4], negative := ![false, false, false, true, false] } { denominator := 1, parameters := ![![0, 0, 1, 0, 0], ![0, 0, 0, -1, 0], ![0, 0, 0, 0, 1]], correction := ![![0, 1], ![-1, 1], ![0, 0], ![0, 0], ![0, 0]] } { row := ![2, 3, 4], negative := ![false, true, false] },
    .image { index := 1, permutation := ![1, 0, 4, 3, 2], negative := ![false, false, false, true, false] } { denominator := 1, parameters := ![![0, 0, 0, 0, 1], ![0, 0, 0, -1, 0], ![0, 0, 1, 0, 0]], correction := ![![0, 1], ![-1, 1], ![0, 0], ![0, 0], ![0, 0]] } { row := ![4, 3, 2], negative := ![false, true, false] },
    .repeated 1 2 false { denominator := 1, coefficients := ![-1, 1] },
    .image { index := 5, permutation := ![0, 1, 2, 3, 4], negative := ![false, false, true, false, false] } { denominator := 1, parameters := ![![0, 0, -1, 0, 0], ![0, 0, 0, 1, 0], ![0, 0, 0, 0, 1]], correction := ![![0, 1], ![-1, 1], ![0, 0], ![0, 0], ![0, 0]] } { row := ![2, 3, 4], negative := ![true, false, false] },
    .image { index := 1, permutation := ![1, 3, 0, 2, 4], negative := ![false, false, false, false, false] } { denominator := 2, parameters := ![![0, 0, 0, 2, 0], ![0, 2, 0, 0, 0], ![0, 0, 0, 0, 2]], correction := ![![2, 0], ![0, 0], ![2, -2], ![0, 0], ![0, 0]] } { row := ![3, 1, 4], negative := ![false, false, false] },
    .zero 1 { denominator := 2, coefficients := ![-1, 1] },
    .image { index := 1, permutation := ![1, 3, 4, 0, 2], negative := ![false, true, false, false, false] } { denominator := 2, parameters := ![![0, 0, 0, 0, 2], ![0, -2, 0, 0, 0], ![0, 0, 2, 0, 0]], correction := ![![0, 2], ![0, 0], ![0, 0], ![-2, 2], ![0, 0]] } { row := ![4, 1, 2], negative := ![false, true, false] },
    .repeated 0 3 false { denominator := 1, coefficients := ![-1, 1] },
    .image { index := 3, permutation := ![3, 0, 2, 1, 4], negative := ![false, false, false, true, false] } { denominator := 2, parameters := ![![0, 0, 0, -2, 0], ![2, 0, 0, 0, 0], ![0, 0, 0, 0, 2]], correction := ![![0, 0], ![-2, 0], ![0, -2], ![0, 0], ![0, 0]] } { row := ![3, 0, 4], negative := ![true, false, false] },
    .repeated 0 1 false { denominator := 2, coefficients := ![-2, 2] },
    .image { index := 3, permutation := ![3, 0, 4, 1, 2], negative := ![false, false, false, true, false] } { denominator := 2, parameters := ![![0, 0, 0, -2, 0], ![2, 0, 0, 0, 0], ![0, 0, 2, 0, 0]], correction := ![![0, 0], ![-2, 0], ![0, 0], ![0, 0], ![0, -2]] } { row := ![3, 0, 2], negative := ![true, false, false] }]

theorem relationCertificates26_checked : ∀ b : Fin 50,
    (26 : Fin 50) < b →
      relationCaseCheck (pairRelations 26 b) (relationCertificates26 b) = true := by
  decide +kernel

end Loneliness.FiveSpeedCertificate
