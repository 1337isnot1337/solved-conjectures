import Conjectures.LonelinessFiveSpeedLineReductionData

/-! Exact row bounds and pure-axis witnesses for all retained maps. -/
namespace Loneliness.FiveSpeedCertificate

set_option maxRecDepth 16384 in
set_option maxHeartbeats 0 in
theorem boundedMapFacts_checked : ∀ m : Fin 164,
    lineMapFactsCheck (boundedMaps m) (boundedMapL m) (boundedMapFactsPayloads m) = true := by
  decide +kernel

end Loneliness.FiveSpeedCertificate
