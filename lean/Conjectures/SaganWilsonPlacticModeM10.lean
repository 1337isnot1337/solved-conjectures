import Conjectures.SaganWilsonPlacticModeCardinality
import Conjectures.SwM10Layer10

namespace SaganWilsonPlacticMode

theorem centralizer_count10_10 : (centralizerWords 10 10).length = 49807595 := by
  rw [← countFast_eq_card, CertM10.value]

#print axioms centralizer_count10_10
end SaganWilsonPlacticMode
