import Conjectures.LonelinessFiveSpeedRelationDefs

set_option maxRecDepth 8192
set_option maxHeartbeats 0

namespace Loneliness.FiveSpeedCertificate

open Matrix
open scoped Matrix

def relationCertificates07 : Fin 50 → RelationCaseCertificate :=
  ![
    .zero 0 { denominator := 1, coefficients := ![0, 0] },
    .zero 0 { denominator := 1, coefficients := ![0, 0] },
    .zero 0 { denominator := 1, coefficients := ![0, 0] },
    .zero 0 { denominator := 1, coefficients := ![0, 0] },
    .zero 0 { denominator := 1, coefficients := ![0, 0] },
    .zero 0 { denominator := 1, coefficients := ![0, 0] },
    .zero 0 { denominator := 1, coefficients := ![0, 0] },
    .zero 0 { denominator := 1, coefficients := ![0, 0] },
    .repeated 3 4 true { denominator := 2, coefficients := ![-2, 2] },
    .repeated 1 3 true { denominator := -2, coefficients := ![-2, -2] },
    .image { index := 4, permutation := ![2, 0, 3, 1, 4], negative := ![false, false, false, false, false] } { denominator := -2, parameters := ![![-2, 0, 0, 0, 0], ![0, 0, -2, 0, 0], ![0, 0, 0, 0, -2]], correction := ![![0, 0], ![2, -2], ![0, 0], ![2, 0], ![0, 0]] } { row := ![0, 2, 4], negative := ![false, false, false] },
    .image { index := 3, permutation := ![4, 0, 3, 2, 1], negative := ![false, false, false, false, false] } { denominator := -2, parameters := ![![0, 0, 0, 0, -2], ![0, 0, -2, 0, 0], ![-2, 0, 0, 0, 0]], correction := ![![0, 0], ![0, -2], ![0, 0], ![2, 0], ![0, 0]] } { row := ![4, 2, 0], negative := ![false, false, false] },
    .image { index := 3, permutation := ![4, 0, 3, 2, 1], negative := ![false, false, false, false, true] } { denominator := -2, parameters := ![![0, 0, 0, 0, 2], ![0, 0, -2, 0, 0], ![-2, 0, 0, 0, 0]], correction := ![![0, 0], ![0, -2], ![0, 0], ![2, 0], ![0, 0]] } { row := ![4, 2, 0], negative := ![true, false, false] },
    .repeated 1 2 false { denominator := -2, coefficients := ![-2, -2] },
    .image { index := 7, permutation := ![2, 0, 4, 1, 3], negative := ![false, false, false, false, false] } { denominator := -2, parameters := ![![-2, 0, 0, 0, 0], ![0, 0, 0, 0, -2], ![0, 0, -2, 0, 0]], correction := ![![0, 0], ![4, -2], ![0, 0], ![2, 0], ![0, 0]] } { row := ![0, 4, 2], negative := ![false, false, false] },
    .image { index := 2, permutation := ![2, 0, 4, 1, 3], negative := ![false, false, false, false, false] } { denominator := -2, parameters := ![![-2, 0, 0, 0, 0], ![0, 0, 0, 0, -2], ![0, 0, -2, 0, 0]], correction := ![![0, 0], ![2, -2], ![0, 0], ![2, 0], ![0, 0]] } { row := ![0, 4, 2], negative := ![false, false, false] },
    .image { index := 2, permutation := ![2, 0, 4, 1, 3], negative := ![false, false, false, false, true] } { denominator := -2, parameters := ![![-2, 0, 0, 0, 0], ![0, 0, 0, 0, 2], ![0, 0, -2, 0, 0]], correction := ![![0, 0], ![2, -2], ![0, 0], ![2, 0], ![0, 0]] } { row := ![0, 4, 2], negative := ![false, true, false] },
    .image { index := 8, permutation := ![4, 0, 3, 2, 1], negative := ![false, false, false, false, false] } { denominator := -2, parameters := ![![0, 0, 0, 0, -2], ![0, 0, -2, 0, 0], ![-2, 0, 0, 0, 0]], correction := ![![0, 0], ![0, -2], ![0, 0], ![2, 0], ![0, 0]] } { row := ![4, 2, 0], negative := ![false, false, false] },
    .image { index := 2, permutation := ![2, 0, 4, 1, 3], negative := ![false, false, true, true, false] } { denominator := -2, parameters := ![![-2, 0, 0, 0, 0], ![0, 0, 0, 0, -2], ![0, 0, 2, 0, 0]], correction := ![![0, 0], ![-2, -2], ![0, 0], ![2, 0], ![0, 0]] } { row := ![0, 4, 2], negative := ![false, false, true] },
    .repeated 1 2 true { denominator := -2, coefficients := ![2, -2] },
    .image { index := 3, permutation := ![4, 0, 3, 2, 1], negative := ![false, false, true, true, false] } { denominator := -2, parameters := ![![0, 0, 0, 0, -2], ![0, 0, 2, 0, 0], ![-2, 0, 0, 0, 0]], correction := ![![0, 0], ![0, -2], ![0, 0], ![2, 0], ![0, 0]] } { row := ![4, 2, 0], negative := ![false, true, false] },
    .image { index := 7, permutation := ![2, 4, 1, 0, 3], negative := ![false, false, false, false, false] } { denominator := -4, parameters := ![![-4, 0, 0, 0, 0], ![0, 0, 0, 0, -4], ![0, -4, 0, 0, 0]], correction := ![![0, 0], ![0, 0], ![0, 4], ![4, 8], ![0, 0]] } { row := ![0, 4, 1], negative := ![false, false, false] },
    .repeated 1 2 true { denominator := -4, coefficients := ![2, -2] },
    .image { index := 8, permutation := ![4, 1, 3, 2, 0], negative := ![false, false, false, false, false] } { denominator := -4, parameters := ![![0, -4, 0, 0, 0], ![0, 0, -4, 0, 0], ![-4, 0, 0, 0, 0]], correction := ![![0, 0], ![0, 0], ![0, 0], ![4, 0], ![0, 4]] } { row := ![1, 2, 0], negative := ![false, false, false] },
    .image { index := 8, permutation := ![0, 1, 3, 2, 4], negative := ![false, false, false, false, false] } { denominator := -2, parameters := ![![0, -2, 0, 0, 0], ![0, 0, -2, 0, 0], ![0, 0, 0, 0, -2]], correction := ![![0, -2], ![0, 0], ![0, 0], ![2, 0], ![0, 0]] } { row := ![1, 2, 4], negative := ![false, false, false] },
    .image { index := 3, permutation := ![0, 1, 3, 2, 4], negative := ![false, false, false, false, false] } { denominator := -2, parameters := ![![0, -2, 0, 0, 0], ![0, 0, -2, 0, 0], ![0, 0, 0, 0, -2]], correction := ![![0, -2], ![0, 0], ![0, 0], ![2, 0], ![0, 0]] } { row := ![1, 2, 4], negative := ![false, false, false] },
    .image { index := 2, permutation := ![0, 3, 4, 1, 2], negative := ![false, false, false, false, false] } { denominator := -2, parameters := ![![0, 0, 0, 0, -2], ![0, -2, 0, 0, 0], ![0, 0, -2, 0, 0]], correction := ![![2, -2], ![0, 0], ![0, 0], ![2, 0], ![0, 0]] } { row := ![4, 1, 2], negative := ![false, false, false] },
    .image { index := 6, permutation := ![0, 1, 4, 2, 3], negative := ![false, false, false, false, false] } { denominator := -2, parameters := ![![0, -2, 0, 0, 0], ![0, 0, 0, 0, -2], ![0, 0, -2, 0, 0]], correction := ![![0, -2], ![0, 0], ![0, 0], ![2, 0], ![0, 0]] } { row := ![1, 4, 2], negative := ![false, false, false] },
    .image { index := 6, permutation := ![0, 1, 4, 2, 3], negative := ![false, false, false, false, true] } { denominator := -2, parameters := ![![0, -2, 0, 0, 0], ![0, 0, 0, 0, 2], ![0, 0, -2, 0, 0]], correction := ![![0, -2], ![0, 0], ![0, 0], ![2, 0], ![0, 0]] } { row := ![1, 4, 2], negative := ![false, true, false] },
    .image { index := 2, permutation := ![0, 3, 4, 1, 2], negative := ![false, false, true, true, false] } { denominator := -2, parameters := ![![0, 0, 0, 0, -2], ![0, -2, 0, 0, 0], ![0, 0, 2, 0, 0]], correction := ![![-2, -2], ![0, 0], ![0, 0], ![2, 0], ![0, 0]] } { row := ![4, 1, 2], negative := ![false, false, true] },
    .image { index := 3, permutation := ![0, 1, 3, 2, 4], negative := ![false, false, true, true, false] } { denominator := -2, parameters := ![![0, -2, 0, 0, 0], ![0, 0, 2, 0, 0], ![0, 0, 0, 0, -2]], correction := ![![0, -2], ![0, 0], ![0, 0], ![2, 0], ![0, 0]] } { row := ![1, 2, 4], negative := ![false, true, false] },
    .repeated 0 3 true { denominator := -2, coefficients := ![-2, -2] },
    .image { index := 4, permutation := ![0, 2, 3, 1, 4], negative := ![false, false, false, false, false] } { denominator := -2, parameters := ![![0, -2, 0, 0, 0], ![0, 0, -2, 0, 0], ![0, 0, 0, 0, -2]], correction := ![![2, -2], ![0, 0], ![0, 0], ![2, 0], ![0, 0]] } { row := ![1, 2, 4], negative := ![false, false, false] },
    .image { index := 3, permutation := ![0, 4, 3, 2, 1], negative := ![false, false, false, false, false] } { denominator := -2, parameters := ![![0, 0, 0, 0, -2], ![0, 0, -2, 0, 0], ![0, -2, 0, 0, 0]], correction := ![![0, -2], ![0, 0], ![0, 0], ![2, 0], ![0, 0]] } { row := ![4, 2, 1], negative := ![false, false, false] },
    .image { index := 3, permutation := ![0, 4, 3, 2, 1], negative := ![false, false, false, false, true] } { denominator := -2, parameters := ![![0, 0, 0, 0, 2], ![0, 0, -2, 0, 0], ![0, -2, 0, 0, 0]], correction := ![![0, -2], ![0, 0], ![0, 0], ![2, 0], ![0, 0]] } { row := ![4, 2, 1], negative := ![true, false, false] },
    .repeated 0 2 false { denominator := -2, coefficients := ![-2, -2] },
    .image { index := 7, permutation := ![0, 2, 4, 1, 3], negative := ![false, false, false, false, false] } { denominator := -2, parameters := ![![0, -2, 0, 0, 0], ![0, 0, 0, 0, -2], ![0, 0, -2, 0, 0]], correction := ![![4, -2], ![0, 0], ![0, 0], ![2, 0], ![0, 0]] } { row := ![1, 4, 2], negative := ![false, false, false] },
    .image { index := 2, permutation := ![0, 2, 4, 1, 3], negative := ![false, false, false, false, false] } { denominator := -2, parameters := ![![0, -2, 0, 0, 0], ![0, 0, 0, 0, -2], ![0, 0, -2, 0, 0]], correction := ![![2, -2], ![0, 0], ![0, 0], ![2, 0], ![0, 0]] } { row := ![1, 4, 2], negative := ![false, false, false] },
    .image { index := 2, permutation := ![0, 2, 4, 1, 3], negative := ![false, false, false, false, true] } { denominator := -2, parameters := ![![0, -2, 0, 0, 0], ![0, 0, 0, 0, 2], ![0, 0, -2, 0, 0]], correction := ![![2, -2], ![0, 0], ![0, 0], ![2, 0], ![0, 0]] } { row := ![1, 4, 2], negative := ![false, true, false] },
    .image { index := 8, permutation := ![0, 4, 3, 2, 1], negative := ![false, false, false, false, false] } { denominator := -2, parameters := ![![0, 0, 0, 0, -2], ![0, 0, -2, 0, 0], ![0, -2, 0, 0, 0]], correction := ![![0, -2], ![0, 0], ![0, 0], ![2, 0], ![0, 0]] } { row := ![4, 2, 1], negative := ![false, false, false] },
    .image { index := 2, permutation := ![0, 2, 4, 1, 3], negative := ![false, false, true, true, false] } { denominator := -2, parameters := ![![0, -2, 0, 0, 0], ![0, 0, 0, 0, -2], ![0, 0, 2, 0, 0]], correction := ![![-2, -2], ![0, 0], ![0, 0], ![2, 0], ![0, 0]] } { row := ![1, 4, 2], negative := ![false, false, true] },
    .repeated 0 2 true { denominator := -2, coefficients := ![2, -2] },
    .image { index := 3, permutation := ![0, 4, 3, 2, 1], negative := ![false, false, true, true, false] } { denominator := -2, parameters := ![![0, 0, 0, 0, -2], ![0, 0, 2, 0, 0], ![0, -2, 0, 0, 0]], correction := ![![0, -2], ![0, 0], ![0, 0], ![2, 0], ![0, 0]] } { row := ![4, 2, 1], negative := ![false, true, false] },
    .image { index := 3, permutation := ![0, 1, 3, 2, 4], negative := ![false, true, false, false, false] } { denominator := -2, parameters := ![![0, 2, 0, 0, 0], ![0, 0, -2, 0, 0], ![0, 0, 0, 0, -2]], correction := ![![0, -2], ![0, 0], ![0, 0], ![2, 0], ![0, 0]] } { row := ![1, 2, 4], negative := ![true, false, false] },
    .image { index := 2, permutation := ![0, 3, 4, 1, 2], negative := ![false, true, false, false, false] } { denominator := -2, parameters := ![![0, 0, 0, 0, -2], ![0, 2, 0, 0, 0], ![0, 0, -2, 0, 0]], correction := ![![2, -2], ![0, 0], ![0, 0], ![2, 0], ![0, 0]] } { row := ![4, 1, 2], negative := ![false, true, false] },
    .image { index := 6, permutation := ![0, 1, 4, 2, 3], negative := ![false, true, false, false, false] } { denominator := -2, parameters := ![![0, 2, 0, 0, 0], ![0, 0, 0, 0, -2], ![0, 0, -2, 0, 0]], correction := ![![0, -2], ![0, 0], ![0, 0], ![2, 0], ![0, 0]] } { row := ![1, 4, 2], negative := ![true, false, false] },
    .image { index := 8, permutation := ![1, 0, 3, 2, 4], negative := ![false, false, false, false, false] } { denominator := -4, parameters := ![![-4, 0, 0, 0, 0], ![0, 0, -4, 0, 0], ![0, 0, 0, 0, -4]], correction := ![![0, 0], ![0, 4], ![0, 0], ![4, 0], ![0, 0]] } { row := ![0, 2, 4], negative := ![false, false, false] },
    .image { index := 7, permutation := ![4, 2, 1, 0, 3], negative := ![false, false, false, false, false] } { denominator := -4, parameters := ![![0, -4, 0, 0, 0], ![0, 0, 0, 0, -4], ![-4, 0, 0, 0, 0]], correction := ![![0, 0], ![0, 0], ![0, 4], ![4, 8], ![0, 0]] } { row := ![1, 4, 0], negative := ![false, false, false] },
    .repeated 0 2 true { denominator := -4, coefficients := ![2, -2] },
    .image { index := 8, permutation := ![1, 4, 3, 2, 0], negative := ![false, false, false, false, false] } { denominator := -4, parameters := ![![-4, 0, 0, 0, 0], ![0, 0, -4, 0, 0], ![0, -4, 0, 0, 0]], correction := ![![0, 0], ![0, 0], ![0, 0], ![4, 0], ![0, 4]] } { row := ![0, 2, 1], negative := ![false, false, false] }]

theorem relationCertificates07_checked : ∀ b : Fin 50,
    (7 : Fin 50) < b →
      relationCaseCheck (pairRelations 7 b) (relationCertificates07 b) = true := by
  decide +kernel

end Loneliness.FiveSpeedCertificate
