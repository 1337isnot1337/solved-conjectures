import Conjectures.LonelinessFiveSpeedLineReductionData

/-! Kernel-reduced checks for every parameter relation of canonical map 8. -/
namespace Loneliness.FiveSpeedCertificate

set_option maxRecDepth 16384 in
set_option maxHeartbeats 0 in
theorem lineTable_8_checked :
    lineTableCheck boundedMaps (canonicalMaps 8)
      (planeParameterForms 8) (lineCertificates 8) = true := by
  decide +kernel

end Loneliness.FiveSpeedCertificate
