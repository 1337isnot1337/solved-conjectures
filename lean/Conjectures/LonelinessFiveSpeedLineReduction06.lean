import Conjectures.LonelinessFiveSpeedLineReductionData

/-! Kernel-reduced checks for every parameter relation of canonical map 6. -/
namespace Loneliness.FiveSpeedCertificate

set_option maxRecDepth 16384 in
set_option maxHeartbeats 0 in
theorem lineTable_6_checked :
    lineTableCheck boundedMaps (canonicalMaps 6)
      (planeParameterForms 6) (lineCertificates 6) = true := by
  decide +kernel

end Loneliness.FiveSpeedCertificate
