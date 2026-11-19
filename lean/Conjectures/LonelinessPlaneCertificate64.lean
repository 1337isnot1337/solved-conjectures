import Conjectures.LonelinessPlaneWitnessSoundness

/-! Complete finite critical-pattern block `(6,4)`, checked in the kernel. -/
set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.PlaneCertificate

private theorem valid64 : staticCaseCheck 6 4 = true := by decide +kernel

theorem checked64 : ∀ (n : Fin 120) (mask : Fin 16),
    pairTest (canonical 6) (tableCandidate 4 (permutationAt n) mask) = true :=
  staticCaseCheck_sound 6 4 valid64

end Loneliness.PlaneCertificate
