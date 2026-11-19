import Conjectures.LonelinessFiveSpeedRelationDefs

set_option maxRecDepth 8192
set_option maxHeartbeats 0

namespace Loneliness.FiveSpeedCertificate

open Matrix
open scoped Matrix

def relationCertificates16 : Fin 50 → RelationCaseCertificate :=
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
    .image { index := 4, permutation := ![2, 1, 4, 0, 3], negative := ![false, false, false, false, false] } { denominator := 1, parameters := ![![1, 0, 0, 0, 0], ![0, 0, 0, 0, 1], ![0, 0, 1, 0, 0]], correction := ![![0, 0], ![0, 1], ![0, 0], ![-1, 1], ![0, 0]] } { row := ![0, 4, 2], negative := ![false, false, false] },
    .zero 1 { denominator := 2, coefficients := ![1, 1] },
    .repeated 2 4 true { denominator := 1, coefficients := ![-1, 1] },
    .image { index := 1, permutation := ![4, 1, 0, 2, 3], negative := ![false, false, true, false, true] } { denominator := 1, parameters := ![![0, 0, 0, 1, 0], ![0, 0, 0, 0, -1], ![1, 0, 0, 0, 0]], correction := ![![0, 0], ![1, 0], ![-1, 1], ![0, 0], ![0, 0]] } { row := ![3, 4, 0], negative := ![false, true, false] },
    .image { index := 3, permutation := ![4, 3, 2, 0, 1], negative := ![false, false, false, false, false] } { denominator := -1, parameters := ![![0, 0, 0, 0, -1], ![0, -1, 0, 0, 0], ![-1, 0, 0, 0, 0]], correction := ![![0, 0], ![0, 0], ![0, 1], ![1, 0], ![0, 0]] } { row := ![4, 1, 0], negative := ![false, false, false] },
    .repeated 1 4 true { denominator := 1, coefficients := ![-1, 1] },
    .image { index := 4, permutation := ![2, 3, 4, 0, 1], negative := ![false, false, false, false, false] } { denominator := 2, parameters := ![![2, 0, 0, 0, 0], ![0, 2, 0, 0, 0], ![0, 0, 2, 0, 0]], correction := ![![0, 0], ![0, 0], ![0, 0], ![-2, -2], ![0, -2]] } { row := ![0, 1, 2], negative := ![false, false, false] },
    .image { index := 3, permutation := ![2, 3, 4, 0, 1], negative := ![false, false, false, false, false] } { denominator := -1, parameters := ![![0, 0, 0, 0, -1], ![0, -1, 0, 0, 0], ![0, 0, -1, 0, 0]], correction := ![![0, -1], ![0, 0], ![0, 0], ![1, 0], ![0, 0]] } { row := ![4, 1, 2], negative := ![false, false, false] },
    .image { index := 5, permutation := ![1, 0, 3, 2, 4], negative := ![false, false, true, false, true] } { denominator := -1, parameters := ![![0, 0, 0, -1, 0], ![0, 0, 1, 0, 0], ![0, 0, 0, 0, 1]], correction := ![![-1, -1], ![-1, 0], ![0, 0], ![0, 0], ![0, 0]] } { row := ![3, 2, 4], negative := ![false, true, true] },
    .image { index := 1, permutation := ![0, 1, 4, 3, 2], negative := ![false, false, false, false, true] } { denominator := -1, parameters := ![![0, 0, 0, 0, 1], ![0, 0, 0, -1, 0], ![0, 0, -1, 0, 0]], correction := ![![-1, -1], ![-1, 0], ![0, 0], ![0, 0], ![0, 0]] } { row := ![4, 3, 2], negative := ![true, false, false] },
    .repeated 0 3 true { denominator := -1, coefficients := ![-1, -1] },
    .image { index := 1, permutation := ![0, 1, 4, 2, 3], negative := ![false, false, false, false, true] } { denominator := -1, parameters := ![![0, 0, 0, -1, 0], ![0, 0, 0, 0, 1], ![0, 0, -1, 0, 0]], correction := ![![-1, -1], ![-1, 0], ![0, 0], ![0, 0], ![0, 0]] } { row := ![3, 4, 2], negative := ![false, true, false] },
    .repeated 0 4 false { denominator := -1, coefficients := ![-1, -1] },
    .image { index := 5, permutation := ![1, 0, 3, 2, 4], negative := ![false, false, false, false, true] } { denominator := -1, parameters := ![![0, 0, 0, -1, 0], ![0, 0, -1, 0, 0], ![0, 0, 0, 0, 1]], correction := ![![-1, -1], ![-1, 0], ![0, 0], ![0, 0], ![0, 0]] } { row := ![3, 2, 4], negative := ![false, false, true] },
    .image { index := 6, permutation := ![2, 0, 4, 1, 3], negative := ![false, false, false, false, true] } { denominator := -1, parameters := ![![0, 0, 0, -1, 0], ![0, 0, 0, 0, 1], ![0, 0, -1, 0, 0]], correction := ![![0, -1], ![-1, 0], ![0, 0], ![0, 0], ![0, 0]] } { row := ![3, 4, 2], negative := ![false, true, false] },
    .image { index := 5, permutation := ![1, 2, 3, 0, 4], negative := ![false, false, true, false, false] } { denominator := -1, parameters := ![![0, -1, 0, 0, 0], ![0, 0, 1, 0, 0], ![0, 0, 0, 0, -1]], correction := ![![1, -1], ![0, 0], ![0, 0], ![1, 0], ![0, 0]] } { row := ![1, 2, 4], negative := ![false, true, false] },
    .image { index := 5, permutation := ![1, 2, 3, 4, 0], negative := ![false, true, true, false, false] } { denominator := -1, parameters := ![![0, 1, 0, 0, 0], ![0, 0, 1, 0, 0], ![0, 0, 0, -1, 0]], correction := ![![-1, -1], ![0, 0], ![0, 0], ![0, 0], ![-1, 0]] } { row := ![1, 2, 3], negative := ![true, true, false] },
    .image { index := 5, permutation := ![1, 2, 3, 4, 0], negative := ![false, false, true, true, true] } { denominator := -1, parameters := ![![0, -1, 0, 0, 0], ![0, 0, 1, 0, 0], ![0, 0, 0, 1, 0]], correction := ![![1, -1], ![0, 0], ![0, 0], ![0, 0], ![-1, 0]] } { row := ![1, 2, 3], negative := ![false, true, true] },
    .image { index := 5, permutation := ![1, 2, 3, 0, 4], negative := ![false, true, true, true, true] } { denominator := -1, parameters := ![![0, 1, 0, 0, 0], ![0, 0, 1, 0, 0], ![0, 0, 0, 0, 1]], correction := ![![-1, -1], ![0, 0], ![0, 0], ![1, 0], ![0, 0]] } { row := ![1, 2, 4], negative := ![true, true, true] },
    .image { index := 3, permutation := ![2, 0, 4, 3, 1], negative := ![false, false, false, false, true] } { denominator := -1, parameters := ![![0, 0, 0, 0, 1], ![0, 0, 0, -1, 0], ![0, 0, -1, 0, 0]], correction := ![![0, -1], ![-1, 0], ![0, 0], ![0, 0], ![0, 0]] } { row := ![4, 3, 2], negative := ![true, false, false] },
    .image { index := 1, permutation := ![0, 2, 4, 1, 3], negative := ![false, false, false, false, false] } { denominator := -1, parameters := ![![0, -1, 0, 0, 0], ![0, 0, 0, 0, -1], ![0, 0, -1, 0, 0]], correction := ![![1, -1], ![0, 0], ![0, 0], ![1, 0], ![0, 0]] } { row := ![1, 4, 2], negative := ![false, false, false] },
    .repeated 0 1 true { denominator := -1, coefficients := ![1, -1] },
    .image { index := 3, permutation := ![2, 0, 4, 1, 3], negative := ![false, true, false, true, false] } { denominator := -1, parameters := ![![0, 0, 0, 1, 0], ![0, 0, 0, 0, -1], ![0, 0, -1, 0, 0]], correction := ![![0, -1], ![-1, 0], ![0, 0], ![0, 0], ![0, 0]] } { row := ![3, 4, 2], negative := ![true, false, false] },
    .repeated 0 1 false { denominator := -1, coefficients := ![-1, -1] },
    .image { index := 5, permutation := ![1, 2, 3, 0, 4], negative := ![false, false, false, false, false] } { denominator := -1, parameters := ![![0, -1, 0, 0, 0], ![0, 0, -1, 0, 0], ![0, 0, 0, 0, -1]], correction := ![![1, -1], ![0, 0], ![0, 0], ![1, 0], ![0, 0]] } { row := ![1, 2, 4], negative := ![false, false, false] },
    .image { index := 5, permutation := ![1, 2, 3, 4, 0], negative := ![false, true, false, false, false] } { denominator := -1, parameters := ![![0, 1, 0, 0, 0], ![0, 0, -1, 0, 0], ![0, 0, 0, -1, 0]], correction := ![![-1, -1], ![0, 0], ![0, 0], ![0, 0], ![-1, 0]] } { row := ![1, 2, 3], negative := ![true, false, false] },
    .image { index := 5, permutation := ![1, 0, 3, 2, 4], negative := ![false, true, true, true, false] } { denominator := -1, parameters := ![![0, 0, 0, 1, 0], ![0, 0, 1, 0, 0], ![0, 0, 0, 0, -1]], correction := ![![1, -1], ![-1, 0], ![0, 0], ![0, 0], ![0, 0]] } { row := ![3, 2, 4], negative := ![true, true, false] },
    .repeated 0 4 true { denominator := -1, coefficients := ![1, -1] },
    .image { index := 1, permutation := ![0, 1, 4, 2, 3], negative := ![false, true, false, true, false] } { denominator := -1, parameters := ![![0, 0, 0, 1, 0], ![0, 0, 0, 0, -1], ![0, 0, -1, 0, 0]], correction := ![![1, -1], ![-1, 0], ![0, 0], ![0, 0], ![0, 0]] } { row := ![3, 4, 2], negative := ![true, false, false] },
    .image { index := 2, permutation := ![4, 1, 2, 0, 3], negative := ![false, false, false, false, false] } { denominator := -2, parameters := ![![0, 0, -2, 0, 0], ![0, 0, 0, 0, -2], ![-2, 0, 0, 0, 0]], correction := ![![0, 0], ![0, 2], ![0, 0], ![2, 2], ![0, 0]] } { row := ![2, 4, 0], negative := ![false, false, false] },
    .image { index := 6, permutation := ![4, 0, 2, 1, 3], negative := ![false, false, false, false, true] } { denominator := -2, parameters := ![![0, 0, 0, -2, 0], ![0, 0, 0, 0, 2], ![-2, 0, 0, 0, 0]], correction := ![![0, 0], ![-2, 0], ![0, 2], ![0, 0], ![0, 0]] } { row := ![3, 4, 0], negative := ![false, true, false] },
    .image { index := 2, permutation := ![4, 0, 2, 1, 3], negative := ![false, false, false, false, true] } { denominator := -2, parameters := ![![0, 0, -2, 0, 0], ![0, 0, 0, 0, 2], ![-2, 0, 0, 0, 0]], correction := ![![0, 0], ![-2, 2], ![0, 0], ![0, 2], ![0, 0]] } { row := ![2, 4, 0], negative := ![false, true, false] },
    .image { index := 2, permutation := ![4, 0, 2, 3, 1], negative := ![false, true, false, true, false] } { denominator := -2, parameters := ![![0, 0, -2, 0, 0], ![0, 0, 0, 2, 0], ![-2, 0, 0, 0, 0]], correction := ![![0, 0], ![-2, -2], ![0, 0], ![0, 0], ![0, 2]] } { row := ![2, 3, 0], negative := ![false, true, false] }]

theorem relationCertificates16_checked : ∀ b : Fin 50,
    (16 : Fin 50) < b →
      relationCaseCheck (pairRelations 16 b) (relationCertificates16 b) = true := by
  decide +kernel

end Loneliness.FiveSpeedCertificate
