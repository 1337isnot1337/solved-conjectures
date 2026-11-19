import Conjectures.LonelinessSevenCoordinateFiniteDefs

namespace Loneliness.SevenCoordinateCritical.Finite

set_option maxRecDepth 32768
set_option maxHeartbeats 0

/-- Exact finite implication for one canonical repeated coordinate and two signs. -/
theorem cases_201 : ∀ a b c : Fin 12, CaseValid 2 false true a b c := by
  decide +kernel

end Loneliness.SevenCoordinateCritical.Finite
