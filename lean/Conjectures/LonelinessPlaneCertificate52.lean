import Conjectures.LonelinessPlaneWitnessSoundness

/-! Complete finite critical-pattern block `(5,2)`, checked in the kernel. -/
set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.PlaneCertificate

private theorem valid52 : staticCaseCheck 5 2 = true := by decide +kernel

theorem checked52 : ∀ (n : Fin 120) (mask : Fin 16),
    pairTest (canonical 5) (tableCandidate 2 (permutationAt n) mask) = true :=
  staticCaseCheck_sound 5 2 valid52

end Loneliness.PlaneCertificate
