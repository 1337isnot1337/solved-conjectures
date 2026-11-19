import Conjectures.LonelinessFiveSpeedRelationDefs

set_option maxRecDepth 8192
set_option maxHeartbeats 0

namespace Loneliness.FiveSpeedCertificate

open Matrix
open scoped Matrix

def relationCertificates39 : Fin 50 → RelationCaseCertificate :=
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
    .repeated 3 4 false { denominator := 1, coefficients := ![-1, 1] },
    .image { index := 2, permutation := ![1, 2, 0, 3, 4], negative := ![false, false, true, true, false] } { denominator := 1, parameters := ![![0, 1, 0, 0, 0], ![0, 0, 0, -1, 0], ![0, 0, 0, 0, 1]], correction := ![![1, 0], ![0, 0], ![-1, 1], ![0, 0], ![0, 0]] } { row := ![1, 3, 4], negative := ![false, true, false] },
    .repeated 2 4 false { denominator := 1, coefficients := ![-1, 1] },
    .image { index := 2, permutation := ![1, 0, 3, 2, 4], negative := ![false, true, true, false, false] } { denominator := 1, parameters := ![![0, 0, 0, 1, 0], ![0, 0, -1, 0, 0], ![0, 0, 0, 0, 1]], correction := ![![1, 0], ![-1, 1], ![0, 0], ![0, 0], ![0, 0]] } { row := ![3, 2, 4], negative := ![false, true, false] },
    .image { index := 2, permutation := ![1, 0, 2, 3, 4], negative := ![false, true, false, true, false] } { denominator := 1, parameters := ![![0, 0, 1, 0, 0], ![0, 0, 0, -1, 0], ![0, 0, 0, 0, 1]], correction := ![![1, 0], ![-1, 1], ![0, 0], ![0, 0], ![0, 0]] } { row := ![2, 3, 4], negative := ![false, true, false] },
    .repeated 1 4 false { denominator := 1, coefficients := ![-1, 1] },
    .image { index := 7, permutation := ![1, 0, 2, 3, 4], negative := ![false, false, false, false, false] } { denominator := -1, parameters := ![![0, 0, -1, 0, 0], ![0, 0, 0, -1, 0], ![0, 0, 0, 0, -1]], correction := ![![-1, 0], ![-2, 1], ![0, 0], ![0, 0], ![0, 0]] } { row := ![2, 3, 4], negative := ![false, false, false] },
    .image { index := 7, permutation := ![1, 2, 0, 3, 4], negative := ![false, false, false, false, false] } { denominator := -1, parameters := ![![0, -1, 0, 0, 0], ![0, 0, 0, -1, 0], ![0, 0, 0, 0, -1]], correction := ![![-1, 0], ![0, 0], ![-2, 1], ![0, 0], ![0, 0]] } { row := ![1, 3, 4], negative := ![false, false, false] },
    .image { index := 7, permutation := ![1, 2, 3, 0, 4], negative := ![false, false, false, false, false] } { denominator := -1, parameters := ![![0, -1, 0, 0, 0], ![0, 0, -1, 0, 0], ![0, 0, 0, 0, -1]], correction := ![![-1, 0], ![0, 0], ![0, 0], ![-2, 1], ![0, 0]] } { row := ![1, 2, 4], negative := ![false, false, false] },
    .zero 0 { denominator := 3, coefficients := ![-1, 2] }]

theorem relationCertificates39_checked : ∀ b : Fin 50,
    (39 : Fin 50) < b →
      relationCaseCheck (pairRelations 39 b) (relationCertificates39 b) = true := by
  decide +kernel

end Loneliness.FiveSpeedCertificate
