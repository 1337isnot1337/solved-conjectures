import Conjectures.LonelinessPlaneWitnessSoundness

/-! Complete finite critical-pattern block `(0,3)`, checked in the kernel. -/
set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.PlaneCertificate

private theorem valid03 : staticCaseCheck 0 3 = true := by decide +kernel

theorem checked03 : ∀ (n : Fin 120) (mask : Fin 16),
    pairTest (canonical 0) (tableCandidate 3 (permutationAt n) mask) = true :=
  staticCaseCheck_sound 0 3 valid03

end Loneliness.PlaneCertificate
