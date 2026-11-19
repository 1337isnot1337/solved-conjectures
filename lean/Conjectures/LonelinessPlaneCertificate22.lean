import Conjectures.LonelinessPlaneWitnessSoundness

/-! Complete finite critical-pattern block `(2,2)`, checked in the kernel. -/
set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.PlaneCertificate

private theorem valid22 : staticCaseCheck 2 2 = true := by decide +kernel

theorem checked22 : ∀ (n : Fin 120) (mask : Fin 16),
    pairTest (canonical 2) (tableCandidate 2 (permutationAt n) mask) = true :=
  staticCaseCheck_sound 2 2 valid22

end Loneliness.PlaneCertificate
