import Conjectures.LonelinessFiveSpeedBoundedMaps
import Conjectures.LonelinessFiveSpeedFiniteAssembly

/-! The complete 164-map certificate aggregate supplies the bounded-map
coverage input of the five-speed finite assembly. -/

namespace Loneliness.FiveSpeedCertificate

theorem bounded_map_coverage : BoundedMapCoverage :=
  bounded_map_candidates

end Loneliness.FiveSpeedCertificate
