import Conjectures.LonelinessFiveSpeedLineReductionData

/-! Kernel-reduced checks for every parameter relation of canonical map 2. -/
namespace Loneliness.FiveSpeedCertificate

set_option maxRecDepth 16384 in
set_option maxHeartbeats 0 in
theorem lineTable_2_checked :
    lineTableCheck boundedMaps (canonicalMaps 2)
      (planeParameterForms 2) (lineCertificates 2) = true := by
  decide +kernel

end Loneliness.FiveSpeedCertificate
