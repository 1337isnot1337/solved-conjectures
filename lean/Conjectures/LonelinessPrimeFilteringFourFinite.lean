import Conjectures.LonelinessPrimeFilteringFourTransport
import Conjectures.LonelinessPrimeFilteringFourCertificate1
import Conjectures.LonelinessPrimeFilteringFourCertificate2
import Conjectures.LonelinessPrimeFilteringFourCertificate3
import Conjectures.LonelinessPrimeFilteringFourCertificate4
import Conjectures.LonelinessPrimeFilteringFourCertificate5
import Conjectures.LonelinessPrimeFilteringFourCertificate6
import Conjectures.LonelinessPrimeFilteringFourCertificate7
import Conjectures.LonelinessPrimeFilteringFourCertificate8
import Conjectures.LonelinessPrimeFilteringFourCertificate9

namespace Loneliness.PrimeFilteringFourProfiles

theorem canonical_checks_verified : ∀ f : Fin 10, canonicalCheck f = true := by
  intro f
  fin_cases f
  · exact canonicalCheck_zero
  · exact canonicalCheck_1
  · exact canonicalCheck_2
  · exact canonicalCheck_3
  · exact canonicalCheck_4
  · exact canonicalCheck_5
  · exact canonicalCheck_6
  · exact canonicalCheck_7
  · exact canonicalCheck_8
  · exact canonicalCheck_9

theorem every_four_profiles_good (a b c d : Fin 210) : GoodFour a b c d :=
  goodFour_of_canonical_checks canonical_checks_verified a b c d

theorem four_filter {M : ℕ} (hM : 0 < M) (ns : Fin 4 → ℕ)
    (hn : ∀ i, ns i % 7 ≠ 0) :
    ∃ (j : Fin 5) (k : Fin 7), ∀ i : Fin 4,
      ((j.val + 1 + k.val * M) * ns i / M) % 7 ≠ 0 ∧
      ((j.val + 1 + k.val * M) * ns i / M) % 7 ≠ 6 :=
  four_filter_of_canonical_checks canonical_checks_verified hM ns hn

end Loneliness.PrimeFilteringFourProfiles
