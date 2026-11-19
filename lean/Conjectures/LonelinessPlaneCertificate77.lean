import Conjectures.LonelinessPlaneWitnessSoundness

/-! Complete finite critical-pattern block `(7,7)`, checked in the kernel. -/
set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.PlaneCertificate

private theorem valid77 : staticCaseCheck 7 7 = true := by decide +kernel

theorem checked77 : ∀ (n : Fin 120) (mask : Fin 16),
    pairTest (canonical 7) (tableCandidate 7 (permutationAt n) mask) = true :=
  staticCaseCheck_sound 7 7 valid77

end Loneliness.PlaneCertificate
