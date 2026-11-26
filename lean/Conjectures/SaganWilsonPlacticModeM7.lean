import Conjectures.SaganWilsonPlacticModeCardinality

namespace SaganWilsonPlacticMode
set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem countFast10_7 : countFast 7 10 = 3456369 := by decide
theorem centralizer_count10_7 : (centralizerWords 7 10).length = 3456369 := by
  rw [← countFast_eq_card, countFast10_7]

end SaganWilsonPlacticMode
