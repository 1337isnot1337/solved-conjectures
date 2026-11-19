import Conjectures.LonelinessPlaneWitnessSoundness

/-! Complete finite critical-pattern block `(1,5)`, checked in the kernel. -/
set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.PlaneCertificate

private theorem valid15 : staticCaseCheck 1 5 = true := by decide +kernel

theorem checked15 : ∀ (n : Fin 120) (mask : Fin 16),
    pairTest (canonical 1) (tableCandidate 5 (permutationAt n) mask) = true :=
  staticCaseCheck_sound 1 5 valid15

end Loneliness.PlaneCertificate
