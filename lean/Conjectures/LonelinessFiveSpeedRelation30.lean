import Conjectures.LonelinessFiveSpeedRelationDefs

set_option maxRecDepth 8192
set_option maxHeartbeats 0

namespace Loneliness.FiveSpeedCertificate

open Matrix
open scoped Matrix

def relationCertificates30 : Fin 50 → RelationCaseCertificate :=
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
    .image { index := 4, permutation := ![1, 0, 3, 2, 4], negative := ![false, false, false, false, false] } { denominator := 1, parameters := ![![0, 0, 0, 1, 0], ![0, 0, 1, 0, 0], ![0, 0, 0, 0, 1]], correction := ![![0, 1], ![-1, 1], ![0, 0], ![0, 0], ![0, 0]] } { row := ![3, 2, 4], negative := ![false, false, false] },
    .image { index := 1, permutation := ![1, 0, 3, 2, 4], negative := ![false, false, false, false, false] } { denominator := 1, parameters := ![![0, 0, 0, 1, 0], ![0, 0, 1, 0, 0], ![0, 0, 0, 0, 1]], correction := ![![0, 1], ![-1, 1], ![0, 0], ![0, 0], ![0, 0]] } { row := ![3, 2, 4], negative := ![false, false, false] },
    .image { index := 1, permutation := ![1, 0, 3, 4, 2], negative := ![false, false, false, false, false] } { denominator := 1, parameters := ![![0, 0, 0, 0, 1], ![0, 0, 1, 0, 0], ![0, 0, 0, 1, 0]], correction := ![![0, 1], ![-1, 1], ![0, 0], ![0, 0], ![0, 0]] } { row := ![4, 2, 3], negative := ![false, false, false] },
    .image { index := 1, permutation := ![1, 0, 3, 4, 2], negative := ![false, false, false, false, true] } { denominator := 1, parameters := ![![0, 0, 0, 0, -1], ![0, 0, 1, 0, 0], ![0, 0, 0, 1, 0]], correction := ![![0, 1], ![-1, 1], ![0, 0], ![0, 0], ![0, 0]] } { row := ![4, 2, 3], negative := ![true, false, false] },
    .image { index := 1, permutation := ![1, 0, 3, 2, 4], negative := ![false, false, false, true, false] } { denominator := 1, parameters := ![![0, 0, 0, -1, 0], ![0, 0, 1, 0, 0], ![0, 0, 0, 0, 1]], correction := ![![0, 1], ![-1, 1], ![0, 0], ![0, 0], ![0, 0]] } { row := ![3, 2, 4], negative := ![true, false, false] },
    .image { index := 2, permutation := ![1, 0, 3, 4, 2], negative := ![false, false, false, false, false] } { denominator := 1, parameters := ![![0, 0, 0, 0, 1], ![0, 0, 1, 0, 0], ![0, 0, 0, 1, 0]], correction := ![![0, 1], ![-1, 1], ![0, 0], ![0, 0], ![0, 0]] } { row := ![4, 2, 3], negative := ![false, false, false] },
    .image { index := 5, permutation := ![0, 1, 3, 2, 4], negative := ![false, false, true, false, false] } { denominator := 1, parameters := ![![0, 0, 0, 1, 0], ![0, 0, -1, 0, 0], ![0, 0, 0, 0, 1]], correction := ![![0, 1], ![-1, 1], ![0, 0], ![0, 0], ![0, 0]] } { row := ![3, 2, 4], negative := ![false, true, false] },
    .image { index := 5, permutation := ![0, 1, 3, 2, 4], negative := ![false, false, true, false, true] } { denominator := 1, parameters := ![![0, 0, 0, 1, 0], ![0, 0, -1, 0, 0], ![0, 0, 0, 0, -1]], correction := ![![0, 1], ![-1, 1], ![0, 0], ![0, 0], ![0, 0]] } { row := ![3, 2, 4], negative := ![false, true, true] },
    .image { index := 2, permutation := ![1, 0, 3, 2, 4], negative := ![false, false, false, false, false] } { denominator := 1, parameters := ![![0, 0, 0, 1, 0], ![0, 0, 1, 0, 0], ![0, 0, 0, 0, 1]], correction := ![![0, 1], ![-1, 1], ![0, 0], ![0, 0], ![0, 0]] } { row := ![3, 2, 4], negative := ![false, false, false] },
    .image { index := 5, permutation := ![0, 1, 3, 2, 4], negative := ![false, false, true, true, false] } { denominator := 1, parameters := ![![0, 0, 0, -1, 0], ![0, 0, -1, 0, 0], ![0, 0, 0, 0, 1]], correction := ![![0, 1], ![-1, 1], ![0, 0], ![0, 0], ![0, 0]] } { row := ![3, 2, 4], negative := ![true, true, false] },
    .repeated 1 3 true { denominator := 1, coefficients := ![-1, 1] },
    .repeated 1 4 true { denominator := 1, coefficients := ![-1, 1] },
    .zero 0 { denominator := 2, coefficients := ![1, 1] },
    .image { index := 1, permutation := ![1, 3, 0, 2, 4], negative := ![false, true, true, false, false] } { denominator := 2, parameters := ![![0, 0, 0, 2, 0], ![0, -2, 0, 0, 0], ![0, 0, 0, 0, 2]], correction := ![![0, 2], ![0, 0], ![2, -2], ![0, 0], ![0, 0]] } { row := ![3, 1, 4], negative := ![false, true, false] },
    .image { index := 1, permutation := ![1, 3, 0, 4, 2], negative := ![false, true, true, false, false] } { denominator := 2, parameters := ![![0, 0, 0, 0, 2], ![0, -2, 0, 0, 0], ![0, 0, 0, 2, 0]], correction := ![![0, 2], ![0, 0], ![2, -2], ![0, 0], ![0, 0]] } { row := ![4, 1, 3], negative := ![false, true, false] },
    .repeated 0 2 true { denominator := 1, coefficients := ![-1, 1] },
    .image { index := 4, permutation := ![3, 0, 1, 2, 4], negative := ![false, false, false, false, false] } { denominator := 2, parameters := ![![0, 0, 0, 2, 0], ![2, 0, 0, 0, 0], ![0, 0, 0, 0, 2]], correction := ![![0, 0], ![-2, -2], ![0, -2], ![0, 0], ![0, 0]] } { row := ![3, 0, 4], negative := ![false, false, false] },
    .image { index := 3, permutation := ![3, 0, 1, 2, 4], negative := ![false, false, false, false, false] } { denominator := 2, parameters := ![![0, 0, 2, 0, 0], ![2, 0, 0, 0, 0], ![0, 0, 0, 0, 2]], correction := ![![0, 0], ![-2, 0], ![0, 0], ![0, -2], ![0, 0]] } { row := ![2, 0, 4], negative := ![false, false, false] },
    .image { index := 3, permutation := ![3, 0, 1, 4, 2], negative := ![false, false, false, false, false] } { denominator := 2, parameters := ![![0, 0, 2, 0, 0], ![2, 0, 0, 0, 0], ![0, 0, 0, 2, 0]], correction := ![![0, 0], ![-2, 0], ![0, 0], ![0, 0], ![0, -2]] } { row := ![2, 0, 3], negative := ![false, false, false] }]

theorem relationCertificates30_checked : ∀ b : Fin 50,
    (30 : Fin 50) < b →
      relationCaseCheck (pairRelations 30 b) (relationCertificates30 b) = true := by
  decide +kernel

end Loneliness.FiveSpeedCertificate
