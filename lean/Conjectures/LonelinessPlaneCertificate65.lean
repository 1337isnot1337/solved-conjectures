import Conjectures.LonelinessPlaneWitnessSoundness

/-! Complete finite critical-pattern block `(6,5)`, checked in the kernel. -/
set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.PlaneCertificate

private theorem valid65 : staticCaseCheck 6 5 = true := by decide +kernel

theorem checked65 : ∀ (n : Fin 120) (mask : Fin 16),
    pairTest (canonical 6) (tableCandidate 5 (permutationAt n) mask) = true :=
  staticCaseCheck_sound 6 5 valid65

end Loneliness.PlaneCertificate
