import Conjectures.LonelinessPlaneWitnessSoundness

/-! Complete finite critical-pattern block `(6,0)`, checked in the kernel. -/
set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.PlaneCertificate

private theorem valid60 : staticCaseCheck 6 0 = true := by decide +kernel

theorem checked60 : ∀ (n : Fin 120) (mask : Fin 16),
    pairTest (canonical 6) (tableCandidate 0 (permutationAt n) mask) = true :=
  staticCaseCheck_sound 6 0 valid60

end Loneliness.PlaneCertificate
