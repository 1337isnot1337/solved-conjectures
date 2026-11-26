import Conjectures.SaganWilsonPlacticModeCardinality
import Conjectures.SwM9Layer10

namespace SaganWilsonPlacticMode

theorem centralizer_count10_9 : (centralizerWords 9 10).length = 22677445 := by
  rw [← countFast_eq_card, CertM9.value]

#print axioms centralizer_count10_9
end SaganWilsonPlacticMode
