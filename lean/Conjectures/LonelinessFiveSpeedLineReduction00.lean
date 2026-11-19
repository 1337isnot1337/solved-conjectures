import Conjectures.LonelinessFiveSpeedLineReductionData

/-! Kernel-reduced checks for every parameter relation of canonical map 0. -/
namespace Loneliness.FiveSpeedCertificate

set_option maxRecDepth 16384 in
set_option maxHeartbeats 0 in
theorem lineTable_0_checked :
    lineTableCheck boundedMaps (canonicalMaps 0)
      (planeParameterForms 0) (lineCertificates 0) = true := by
  decide +kernel

end Loneliness.FiveSpeedCertificate
