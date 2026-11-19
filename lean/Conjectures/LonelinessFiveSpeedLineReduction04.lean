import Conjectures.LonelinessFiveSpeedLineReductionData

/-! Kernel-reduced checks for every parameter relation of canonical map 4. -/
namespace Loneliness.FiveSpeedCertificate

set_option maxRecDepth 16384 in
set_option maxHeartbeats 0 in
theorem lineTable_4_checked :
    lineTableCheck boundedMaps (canonicalMaps 4)
      (planeParameterForms 4) (lineCertificates 4) = true := by
  decide +kernel

end Loneliness.FiveSpeedCertificate
