import Conjectures.LonelinessSevenCoordinateFiniteDefs

namespace Loneliness.SevenCoordinateCritical.Finite

set_option maxRecDepth 32768
set_option maxHeartbeats 0

/-- Exact finite implication for one canonical repeated coordinate and two signs. -/
theorem cases_500 : ∀ a b c : Fin 12, CaseValid 5 false false a b c := by
  decide +kernel

end Loneliness.SevenCoordinateCritical.Finite
