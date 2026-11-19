import Conjectures.LonelinessFiveSpeedLineReductionData

/-! Kernel-reduced checks for every parameter relation of canonical map 3. -/
namespace Loneliness.FiveSpeedCertificate

set_option maxRecDepth 16384 in
set_option maxHeartbeats 0 in
theorem lineTable_3_checked :
    lineTableCheck boundedMaps (canonicalMaps 3)
      (planeParameterForms 3) (lineCertificates 3) = true := by
  decide +kernel

end Loneliness.FiveSpeedCertificate
