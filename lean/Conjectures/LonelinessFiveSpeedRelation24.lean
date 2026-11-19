import Conjectures.LonelinessFiveSpeedRelationDefs

set_option maxRecDepth 8192
set_option maxHeartbeats 0

namespace Loneliness.FiveSpeedCertificate

open Matrix
open scoped Matrix

def relationCertificates24 : Fin 50 → RelationCaseCertificate :=
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
    .repeated 1 2 true { denominator := 1, coefficients := ![-1, 1] },
    .repeated 1 3 true { denominator := 1, coefficients := ![-1, 1] },
    .repeated 1 4 true { denominator := 1, coefficients := ![-1, 1] },
    .repeated 1 4 false { denominator := 1, coefficients := ![-1, 1] },
    .repeated 1 3 false { denominator := 1, coefficients := ![-1, 1] },
    .repeated 1 2 false { denominator := 1, coefficients := ![-1, 1] },
    .repeated 1 2 true { denominator := 2, coefficients := ![-1, 1] },
    .image { index := 2, permutation := ![1, 4, 0, 3, 2], negative := ![false, false, false, true, false] } { denominator := 2, parameters := ![![0, 0, 0, 0, 2], ![0, 0, 0, -2, 0], ![0, 2, 0, 0, 0]], correction := ![![2, 0], ![0, 0], ![2, -2], ![0, 0], ![0, 0]] } { row := ![4, 3, 1], negative := ![false, true, false] },
    .image { index := 2, permutation := ![1, 4, 0, 2, 3], negative := ![false, false, false, false, true] } { denominator := 2, parameters := ![![0, 0, 0, 2, 0], ![0, 0, 0, 0, -2], ![0, 2, 0, 0, 0]], correction := ![![2, 0], ![0, 0], ![2, -2], ![0, 0], ![0, 0]] } { row := ![3, 4, 1], negative := ![false, true, false] },
    .image { index := 2, permutation := ![1, 4, 0, 2, 3], negative := ![false, false, false, false, false] } { denominator := 2, parameters := ![![0, 0, 0, 2, 0], ![0, 0, 0, 0, 2], ![0, 2, 0, 0, 0]], correction := ![![2, 0], ![0, 0], ![2, -2], ![0, 0], ![0, 0]] } { row := ![3, 4, 1], negative := ![false, false, false] },
    .image { index := 2, permutation := ![1, 4, 0, 3, 2], negative := ![false, false, false, false, false] } { denominator := 2, parameters := ![![0, 0, 0, 0, 2], ![0, 0, 0, 2, 0], ![0, 2, 0, 0, 0]], correction := ![![2, 0], ![0, 0], ![2, -2], ![0, 0], ![0, 0]] } { row := ![4, 3, 1], negative := ![false, false, false] },
    .repeated 1 3 true { denominator := 2, coefficients := ![-1, 1] },
    .image { index := 2, permutation := ![1, 4, 2, 0, 3], negative := ![false, false, false, false, true] } { denominator := 2, parameters := ![![0, 0, 2, 0, 0], ![0, 0, 0, 0, -2], ![0, 2, 0, 0, 0]], correction := ![![2, 0], ![0, 0], ![0, 0], ![2, -2], ![0, 0]] } { row := ![2, 4, 1], negative := ![false, true, false] },
    .image { index := 2, permutation := ![1, 4, 2, 0, 3], negative := ![false, false, false, false, false] } { denominator := 2, parameters := ![![0, 0, 2, 0, 0], ![0, 0, 0, 0, 2], ![0, 2, 0, 0, 0]], correction := ![![2, 0], ![0, 0], ![0, 0], ![2, -2], ![0, 0]] } { row := ![2, 4, 1], negative := ![false, false, false] },
    .repeated 1 4 true { denominator := 2, coefficients := ![-1, 1] },
    .image { index := 2, permutation := ![1, 4, 2, 0, 3], negative := ![false, false, false, true, true] } { denominator := 2, parameters := ![![0, 0, 2, 0, 0], ![0, 0, 0, 0, -2], ![0, 2, 0, 0, 0]], correction := ![![2, 0], ![0, 0], ![0, 0], ![-2, 2], ![0, 0]] } { row := ![2, 4, 1], negative := ![false, true, false] },
    .image { index := 2, permutation := ![1, 4, 0, 3, 2], negative := ![false, false, true, true, false] } { denominator := 2, parameters := ![![0, 0, 0, 0, 2], ![0, 0, 0, -2, 0], ![0, 2, 0, 0, 0]], correction := ![![2, 0], ![0, 0], ![-2, 2], ![0, 0], ![0, 0]] } { row := ![4, 3, 1], negative := ![false, true, false] },
    .image { index := 2, permutation := ![1, 4, 0, 2, 3], negative := ![false, false, true, false, true] } { denominator := 2, parameters := ![![0, 0, 0, 2, 0], ![0, 0, 0, 0, -2], ![0, 2, 0, 0, 0]], correction := ![![2, 0], ![0, 0], ![-2, 2], ![0, 0], ![0, 0]] } { row := ![3, 4, 1], negative := ![false, true, false] },
    .image { index := 4, permutation := ![1, 3, 0, 2, 4], negative := ![false, false, false, false, false] } { denominator := 3, parameters := ![![0, 0, 0, 3, 0], ![0, 3, 0, 0, 0], ![0, 0, 0, 0, 3]], correction := ![![3, 0], ![0, 0], ![3, -3], ![0, 0], ![0, 0]] } { row := ![3, 1, 4], negative := ![false, false, false] },
    .image { index := 4, permutation := ![1, 3, 2, 0, 4], negative := ![false, false, false, false, false] } { denominator := 3, parameters := ![![0, 0, 3, 0, 0], ![0, 3, 0, 0, 0], ![0, 0, 0, 0, 3]], correction := ![![3, 0], ![0, 0], ![0, 0], ![3, -3], ![0, 0]] } { row := ![2, 1, 4], negative := ![false, false, false] },
    .image { index := 4, permutation := ![1, 3, 2, 4, 0], negative := ![false, false, false, false, false] } { denominator := 3, parameters := ![![0, 0, 3, 0, 0], ![0, 3, 0, 0, 0], ![0, 0, 0, 3, 0]], correction := ![![3, 0], ![0, 0], ![0, 0], ![0, 0], ![3, -3]] } { row := ![2, 1, 3], negative := ![false, false, false] },
    .zero 0 { denominator := 3, coefficients := ![-1, 2] },
    .image { index := 7, permutation := ![1, 4, 0, 2, 3], negative := ![false, false, false, false, false] } { denominator := 4, parameters := ![![0, 0, 0, 4, 0], ![0, 0, 0, 0, 4], ![0, 4, 0, 0, 0]], correction := ![![4, 0], ![0, 0], ![8, -4], ![0, 0], ![0, 0]] } { row := ![3, 4, 1], negative := ![false, false, false] },
    .image { index := 7, permutation := ![1, 4, 2, 0, 3], negative := ![false, false, false, false, false] } { denominator := 4, parameters := ![![0, 0, 4, 0, 0], ![0, 0, 0, 0, 4], ![0, 4, 0, 0, 0]], correction := ![![4, 0], ![0, 0], ![0, 0], ![8, -4], ![0, 0]] } { row := ![2, 4, 1], negative := ![false, false, false] },
    .image { index := 7, permutation := ![1, 4, 2, 3, 0], negative := ![false, false, false, false, false] } { denominator := 4, parameters := ![![0, 0, 4, 0, 0], ![0, 0, 0, 4, 0], ![0, 4, 0, 0, 0]], correction := ![![4, 0], ![0, 0], ![0, 0], ![0, 0], ![8, -4]] } { row := ![2, 3, 1], negative := ![false, false, false] }]

theorem relationCertificates24_checked : ∀ b : Fin 50,
    (24 : Fin 50) < b →
      relationCaseCheck (pairRelations 24 b) (relationCertificates24 b) = true := by
  decide +kernel

end Loneliness.FiveSpeedCertificate
