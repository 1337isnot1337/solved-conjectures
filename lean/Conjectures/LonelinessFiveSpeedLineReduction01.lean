import Conjectures.LonelinessFiveSpeedLineReductionData

/-! Kernel-reduced checks for every parameter relation of canonical map 1. -/
namespace Loneliness.FiveSpeedCertificate

set_option maxRecDepth 16384 in
set_option maxHeartbeats 0 in
theorem lineTable_1_checked :
    lineTableCheck boundedMaps (canonicalMaps 1)
      (planeParameterForms 1) (lineCertificates 1) = true := by
  decide +kernel

end Loneliness.FiveSpeedCertificate
