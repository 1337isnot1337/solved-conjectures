import Conjectures.LonelinessPlaneWitnessSoundness

/-! Complete finite critical-pattern block `(1,7)`, checked in the kernel. -/
set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.PlaneCertificate

private theorem valid17 : staticCaseCheck 1 7 = true := by decide +kernel

theorem checked17 : ∀ (n : Fin 120) (mask : Fin 16),
    pairTest (canonical 1) (tableCandidate 7 (permutationAt n) mask) = true :=
  staticCaseCheck_sound 1 7 valid17

end Loneliness.PlaneCertificate
