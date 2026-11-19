import Conjectures.LonelinessFiveSpeedLineReductionData

/-! Kernel-reduced checks for every parameter relation of canonical map 7. -/
namespace Loneliness.FiveSpeedCertificate

set_option maxRecDepth 16384 in
set_option maxHeartbeats 0 in
theorem lineTable_7_checked :
    lineTableCheck boundedMaps (canonicalMaps 7)
      (planeParameterForms 7) (lineCertificates 7) = true := by
  decide +kernel

end Loneliness.FiveSpeedCertificate
