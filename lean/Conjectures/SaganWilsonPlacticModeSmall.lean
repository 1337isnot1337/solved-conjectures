import Conjectures.SaganWilsonPlacticModeCardinality

namespace SaganWilsonPlacticMode
set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem countFast10_1 : countFast 1 10 = 1 := by decide
theorem centralizer_count10_1 : (centralizerWords 1 10).length = 1 := by
  rw [← countFast_eq_card, countFast10_1]

theorem countFast10_2 : countFast 2 10 = 252 := by decide
theorem centralizer_count10_2 : (centralizerWords 2 10).length = 252 := by
  rw [← countFast_eq_card, countFast10_2]

theorem countFast10_3 : countFast 3 10 = 5670 := by decide
theorem centralizer_count10_3 : (centralizerWords 3 10).length = 5670 := by
  rw [← countFast_eq_card, countFast10_3]

theorem countFast10_4 : countFast 4 10 = 50820 := by decide
theorem centralizer_count10_4 : (centralizerWords 4 10).length = 50820 := by
  rw [← countFast_eq_card, countFast10_4]

theorem countFast10_5 : countFast 5 10 = 275010 := by decide
theorem centralizer_count10_5 : (centralizerWords 5 10).length = 275010 := by
  rw [← countFast_eq_card, countFast10_5]

theorem countFast10_6 : countFast 6 10 = 1086090 := by decide
theorem centralizer_count10_6 : (centralizerWords 6 10).length = 1086090 := by
  rw [← countFast_eq_card, countFast10_6]

end SaganWilsonPlacticMode
