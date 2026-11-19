import Conjectures.LonelinessFiveSpeedRelationDefs

set_option maxRecDepth 8192
set_option maxHeartbeats 0

namespace Loneliness.FiveSpeedCertificate

open Matrix
open scoped Matrix

def relationCertificates05 : Fin 50 → RelationCaseCertificate :=
  ![
    .zero 0 { denominator := 1, coefficients := ![0, 0] },
    .zero 0 { denominator := 1, coefficients := ![0, 0] },
    .zero 0 { denominator := 1, coefficients := ![0, 0] },
    .zero 0 { denominator := 1, coefficients := ![0, 0] },
    .zero 0 { denominator := 1, coefficients := ![0, 0] },
    .zero 0 { denominator := 1, coefficients := ![0, 0] },
    .repeated 3 4 false { denominator := 1, coefficients := ![-1, 1] },
    .image { index := 7, permutation := ![2, 3, 1, 0, 4], negative := ![false, false, false, false, false] } { denominator := -1, parameters := ![![-1, 0, 0, 0, 0], ![0, -1, 0, 0, 0], ![0, 0, 0, 0, -1]], correction := ![![0, 0], ![0, 0], ![-1, 0], ![-2, 1], ![0, 0]] } { row := ![0, 1, 4], negative := ![false, false, false] },
    .zero 2 { denominator := 3, coefficients := ![-1, 2] },
    .image { index := 7, permutation := ![2, 0, 1, 3, 4], negative := ![false, false, false, false, false] } { denominator := -1, parameters := ![![-1, 0, 0, 0, 0], ![0, 0, 0, -1, 0], ![0, 0, 0, 0, -1]], correction := ![![0, 0], ![-2, -1], ![-1, 0], ![0, 0], ![0, 0]] } { row := ![0, 3, 4], negative := ![false, false, false] },
    .image { index := 2, permutation := ![2, 0, 1, 3, 4], negative := ![false, false, false, false, false] } { denominator := -1, parameters := ![![-1, 0, 0, 0, 0], ![0, 0, 0, -1, 0], ![0, 0, 0, 0, -1]], correction := ![![0, 0], ![-1, -1], ![-1, 0], ![0, 0], ![0, 0]] } { row := ![0, 3, 4], negative := ![false, false, false] },
    .image { index := 4, permutation := ![2, 0, 1, 4, 3], negative := ![false, false, false, false, false] } { denominator := -1, parameters := ![![-1, 0, 0, 0, 0], ![0, 0, 0, 0, -1], ![0, 0, 0, -1, 0]], correction := ![![0, 0], ![-1, -1], ![-1, 0], ![0, 0], ![0, 0]] } { row := ![0, 4, 3], negative := ![false, false, false] },
    .repeated 1 4 true { denominator := -1, coefficients := ![-1, -1] },
    .image { index := 2, permutation := ![2, 0, 1, 3, 4], negative := ![false, false, false, true, false] } { denominator := -1, parameters := ![![-1, 0, 0, 0, 0], ![0, 0, 0, 1, 0], ![0, 0, 0, 0, -1]], correction := ![![0, 0], ![-1, -1], ![-1, 0], ![0, 0], ![0, 0]] } { row := ![0, 3, 4], negative := ![false, true, false] },
    .image { index := 8, permutation := ![4, 0, 2, 1, 3], negative := ![false, false, false, false, false] } { denominator := -1, parameters := ![![0, 0, 0, -1, 0], ![0, 0, 0, 0, -1], ![-1, 0, 0, 0, 0]], correction := ![![0, 0], ![0, -1], ![-1, 0], ![0, 0], ![0, 0]] } { row := ![3, 4, 0], negative := ![false, false, false] },
    .image { index := 3, permutation := ![4, 0, 2, 1, 3], negative := ![false, false, false, false, false] } { denominator := -1, parameters := ![![0, 0, 0, -1, 0], ![0, 0, 0, 0, -1], ![-1, 0, 0, 0, 0]], correction := ![![0, 0], ![0, -1], ![-1, 0], ![0, 0], ![0, 0]] } { row := ![3, 4, 0], negative := ![false, false, false] },
    .image { index := 3, permutation := ![4, 0, 2, 1, 3], negative := ![false, false, true, false, true] } { denominator := -1, parameters := ![![0, 0, 0, -1, 0], ![0, 0, 0, 0, 1], ![-1, 0, 0, 0, 0]], correction := ![![0, 0], ![0, -1], ![-1, 0], ![0, 0], ![0, 0]] } { row := ![3, 4, 0], negative := ![false, true, false] },
    .repeated 1 2 true { denominator := -1, coefficients := ![1, -1] },
    .image { index := 3, permutation := ![4, 0, 2, 1, 3], negative := ![false, false, false, true, false] } { denominator := -1, parameters := ![![0, 0, 0, 1, 0], ![0, 0, 0, 0, -1], ![-1, 0, 0, 0, 0]], correction := ![![0, 0], ![0, -1], ![-1, 0], ![0, 0], ![0, 0]] } { row := ![3, 4, 0], negative := ![true, false, false] },
    .image { index := 2, permutation := ![2, 0, 1, 3, 4], negative := ![false, false, true, false, true] } { denominator := -1, parameters := ![![-1, 0, 0, 0, 0], ![0, 0, 0, -1, 0], ![0, 0, 0, 0, 1]], correction := ![![0, 0], ![1, -1], ![-1, 0], ![0, 0], ![0, 0]] } { row := ![0, 3, 4], negative := ![false, false, true] },
    .repeated 1 4 false { denominator := -1, coefficients := ![1, -1] },
    .repeated 1 4 true { denominator := -2, coefficients := ![-1, -1] },
    .image { index := 8, permutation := ![4, 1, 2, 0, 3], negative := ![false, false, false, false, false] } { denominator := -2, parameters := ![![0, -2, 0, 0, 0], ![0, 0, 0, 0, -2], ![-2, 0, 0, 0, 0]], correction := ![![0, 0], ![0, 0], ![-2, 0], ![0, 2], ![0, 0]] } { row := ![1, 4, 0], negative := ![false, false, false] },
    .image { index := 7, permutation := ![2, 4, 0, 3, 1], negative := ![false, false, false, false, false] } { denominator := -2, parameters := ![![-2, 0, 0, 0, 0], ![0, 0, 0, -2, 0], ![0, -2, 0, 0, 0]], correction := ![![0, 0], ![0, 0], ![-2, 4], ![0, 0], ![0, 2]] } { row := ![0, 3, 1], negative := ![false, false, false] },
    .image { index := 8, permutation := ![0, 1, 2, 4, 3], negative := ![false, false, false, false, false] } { denominator := -1, parameters := ![![0, -1, 0, 0, 0], ![0, 0, 0, 0, -1], ![0, 0, 0, -1, 0]], correction := ![![0, -1], ![0, 0], ![-1, 0], ![0, 0], ![0, 0]] } { row := ![1, 4, 3], negative := ![false, false, false] },
    .image { index := 2, permutation := ![0, 3, 1, 2, 4], negative := ![false, false, false, false, false] } { denominator := -1, parameters := ![![0, 0, 0, -1, 0], ![0, -1, 0, 0, 0], ![0, 0, 0, 0, -1]], correction := ![![-1, -1], ![0, 0], ![-1, 0], ![0, 0], ![0, 0]] } { row := ![3, 1, 4], negative := ![false, false, false] },
    .image { index := 6, permutation := ![0, 1, 2, 3, 4], negative := ![false, false, false, false, false] } { denominator := -1, parameters := ![![0, -1, 0, 0, 0], ![0, 0, 0, -1, 0], ![0, 0, 0, 0, -1]], correction := ![![0, -1], ![0, 0], ![-1, 0], ![0, 0], ![0, 0]] } { row := ![1, 3, 4], negative := ![false, false, false] },
    .image { index := 3, permutation := ![0, 1, 2, 4, 3], negative := ![false, false, false, false, false] } { denominator := -1, parameters := ![![0, -1, 0, 0, 0], ![0, 0, 0, 0, -1], ![0, 0, 0, -1, 0]], correction := ![![0, -1], ![0, 0], ![-1, 0], ![0, 0], ![0, 0]] } { row := ![1, 4, 3], negative := ![false, false, false] },
    .image { index := 3, permutation := ![0, 1, 2, 4, 3], negative := ![false, false, true, false, true] } { denominator := -1, parameters := ![![0, -1, 0, 0, 0], ![0, 0, 0, 0, 1], ![0, 0, 0, -1, 0]], correction := ![![0, -1], ![0, 0], ![-1, 0], ![0, 0], ![0, 0]] } { row := ![1, 4, 3], negative := ![false, true, false] },
    .image { index := 6, permutation := ![0, 1, 2, 3, 4], negative := ![false, false, false, true, false] } { denominator := -1, parameters := ![![0, -1, 0, 0, 0], ![0, 0, 0, 1, 0], ![0, 0, 0, 0, -1]], correction := ![![0, -1], ![0, 0], ![-1, 0], ![0, 0], ![0, 0]] } { row := ![1, 3, 4], negative := ![false, true, false] },
    .image { index := 2, permutation := ![0, 3, 1, 2, 4], negative := ![false, false, true, false, true] } { denominator := -1, parameters := ![![0, 0, 0, -1, 0], ![0, -1, 0, 0, 0], ![0, 0, 0, 0, 1]], correction := ![![1, -1], ![0, 0], ![-1, 0], ![0, 0], ![0, 0]] } { row := ![3, 1, 4], negative := ![false, false, true] },
    .image { index := 7, permutation := ![0, 2, 1, 3, 4], negative := ![false, false, false, false, false] } { denominator := -1, parameters := ![![0, -1, 0, 0, 0], ![0, 0, 0, -1, 0], ![0, 0, 0, 0, -1]], correction := ![![-2, -1], ![0, 0], ![-1, 0], ![0, 0], ![0, 0]] } { row := ![1, 3, 4], negative := ![false, false, false] },
    .image { index := 2, permutation := ![0, 2, 1, 3, 4], negative := ![false, false, false, false, false] } { denominator := -1, parameters := ![![0, -1, 0, 0, 0], ![0, 0, 0, -1, 0], ![0, 0, 0, 0, -1]], correction := ![![-1, -1], ![0, 0], ![-1, 0], ![0, 0], ![0, 0]] } { row := ![1, 3, 4], negative := ![false, false, false] },
    .image { index := 4, permutation := ![0, 2, 1, 4, 3], negative := ![false, false, false, false, false] } { denominator := -1, parameters := ![![0, -1, 0, 0, 0], ![0, 0, 0, 0, -1], ![0, 0, 0, -1, 0]], correction := ![![-1, -1], ![0, 0], ![-1, 0], ![0, 0], ![0, 0]] } { row := ![1, 4, 3], negative := ![false, false, false] },
    .repeated 0 4 true { denominator := -1, coefficients := ![-1, -1] },
    .image { index := 2, permutation := ![0, 2, 1, 3, 4], negative := ![false, false, false, true, false] } { denominator := -1, parameters := ![![0, -1, 0, 0, 0], ![0, 0, 0, 1, 0], ![0, 0, 0, 0, -1]], correction := ![![-1, -1], ![0, 0], ![-1, 0], ![0, 0], ![0, 0]] } { row := ![1, 3, 4], negative := ![false, true, false] },
    .image { index := 8, permutation := ![0, 4, 2, 1, 3], negative := ![false, false, false, false, false] } { denominator := -1, parameters := ![![0, 0, 0, -1, 0], ![0, 0, 0, 0, -1], ![0, -1, 0, 0, 0]], correction := ![![0, -1], ![0, 0], ![-1, 0], ![0, 0], ![0, 0]] } { row := ![3, 4, 1], negative := ![false, false, false] },
    .image { index := 3, permutation := ![0, 4, 2, 1, 3], negative := ![false, false, false, false, false] } { denominator := -1, parameters := ![![0, 0, 0, -1, 0], ![0, 0, 0, 0, -1], ![0, -1, 0, 0, 0]], correction := ![![0, -1], ![0, 0], ![-1, 0], ![0, 0], ![0, 0]] } { row := ![3, 4, 1], negative := ![false, false, false] },
    .image { index := 3, permutation := ![0, 4, 2, 1, 3], negative := ![false, false, true, false, true] } { denominator := -1, parameters := ![![0, 0, 0, -1, 0], ![0, 0, 0, 0, 1], ![0, -1, 0, 0, 0]], correction := ![![0, -1], ![0, 0], ![-1, 0], ![0, 0], ![0, 0]] } { row := ![3, 4, 1], negative := ![false, true, false] },
    .repeated 0 2 true { denominator := -1, coefficients := ![1, -1] },
    .image { index := 3, permutation := ![0, 4, 2, 1, 3], negative := ![false, false, false, true, false] } { denominator := -1, parameters := ![![0, 0, 0, 1, 0], ![0, 0, 0, 0, -1], ![0, -1, 0, 0, 0]], correction := ![![0, -1], ![0, 0], ![-1, 0], ![0, 0], ![0, 0]] } { row := ![3, 4, 1], negative := ![true, false, false] },
    .image { index := 2, permutation := ![0, 2, 1, 3, 4], negative := ![false, false, true, false, true] } { denominator := -1, parameters := ![![0, -1, 0, 0, 0], ![0, 0, 0, -1, 0], ![0, 0, 0, 0, 1]], correction := ![![1, -1], ![0, 0], ![-1, 0], ![0, 0], ![0, 0]] } { row := ![1, 3, 4], negative := ![false, false, true] },
    .repeated 0 4 false { denominator := -1, coefficients := ![1, -1] },
    .image { index := 2, permutation := ![0, 3, 1, 2, 4], negative := ![false, true, false, false, false] } { denominator := -1, parameters := ![![0, 0, 0, -1, 0], ![0, 1, 0, 0, 0], ![0, 0, 0, 0, -1]], correction := ![![-1, -1], ![0, 0], ![-1, 0], ![0, 0], ![0, 0]] } { row := ![3, 1, 4], negative := ![false, true, false] },
    .image { index := 6, permutation := ![0, 1, 2, 3, 4], negative := ![false, true, false, false, false] } { denominator := -1, parameters := ![![0, 1, 0, 0, 0], ![0, 0, 0, -1, 0], ![0, 0, 0, 0, -1]], correction := ![![0, -1], ![0, 0], ![-1, 0], ![0, 0], ![0, 0]] } { row := ![1, 3, 4], negative := ![true, false, false] },
    .image { index := 3, permutation := ![0, 1, 2, 4, 3], negative := ![false, true, false, false, false] } { denominator := -1, parameters := ![![0, 1, 0, 0, 0], ![0, 0, 0, 0, -1], ![0, 0, 0, -1, 0]], correction := ![![0, -1], ![0, 0], ![-1, 0], ![0, 0], ![0, 0]] } { row := ![1, 4, 3], negative := ![true, false, false] },
    .image { index := 8, permutation := ![1, 0, 2, 4, 3], negative := ![false, false, false, false, false] } { denominator := -2, parameters := ![![-2, 0, 0, 0, 0], ![0, 0, 0, 0, -2], ![0, 0, 0, -2, 0]], correction := ![![0, 0], ![0, 2], ![-2, 0], ![0, 0], ![0, 0]] } { row := ![0, 4, 3], negative := ![false, false, false] },
    .repeated 0 4 true { denominator := -2, coefficients := ![-1, -1] },
    .image { index := 8, permutation := ![1, 4, 2, 0, 3], negative := ![false, false, false, false, false] } { denominator := -2, parameters := ![![-2, 0, 0, 0, 0], ![0, 0, 0, 0, -2], ![0, -2, 0, 0, 0]], correction := ![![0, 0], ![0, 0], ![-2, 0], ![0, 2], ![0, 0]] } { row := ![0, 4, 1], negative := ![false, false, false] },
    .image { index := 7, permutation := ![4, 2, 0, 3, 1], negative := ![false, false, false, false, false] } { denominator := -2, parameters := ![![0, -2, 0, 0, 0], ![0, 0, 0, -2, 0], ![-2, 0, 0, 0, 0]], correction := ![![0, 0], ![0, 0], ![-2, 4], ![0, 0], ![0, 2]] } { row := ![1, 3, 0], negative := ![false, false, false] }]

theorem relationCertificates05_checked : ∀ b : Fin 50,
    (5 : Fin 50) < b →
      relationCaseCheck (pairRelations 5 b) (relationCertificates05 b) = true := by
  decide +kernel

end Loneliness.FiveSpeedCertificate
