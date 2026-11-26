import Conjectures.SaganWilsonPlacticModeCardinality
import Conjectures.SwM8Layer10

namespace SaganWilsonPlacticMode

theorem centralizer_count10_8 : (centralizerWords 8 10).length = 9398925 := by
  rw [← countFast_eq_card, CertM8.value]

#print axioms centralizer_count10_8
end SaganWilsonPlacticMode
