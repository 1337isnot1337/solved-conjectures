import Conjectures.LonelinessFiveSpeedLineReductionData

/-! Kernel-reduced checks for every parameter relation of canonical map 5. -/
namespace Loneliness.FiveSpeedCertificate

set_option maxRecDepth 16384 in
set_option maxHeartbeats 0 in
theorem lineTable_5_checked :
    lineTableCheck boundedMaps (canonicalMaps 5)
      (planeParameterForms 5) (lineCertificates 5) = true := by
  decide +kernel

end Loneliness.FiveSpeedCertificate
