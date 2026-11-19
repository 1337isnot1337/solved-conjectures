import Conjectures.LonelinessPlaneWitnessSoundness

/-! Complete finite critical-pattern block `(0,6)`, checked in the kernel. -/
set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.PlaneCertificate

private theorem valid06 : staticCaseCheck 0 6 = true := by decide +kernel

theorem checked06 : ∀ (n : Fin 120) (mask : Fin 16),
    pairTest (canonical 0) (tableCandidate 6 (permutationAt n) mask) = true :=
  staticCaseCheck_sound 0 6 valid06

end Loneliness.PlaneCertificate
