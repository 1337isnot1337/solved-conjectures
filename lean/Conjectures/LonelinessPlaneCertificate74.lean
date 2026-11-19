import Conjectures.LonelinessPlaneWitnessSoundness

/-! Complete finite critical-pattern block `(7,4)`, checked in the kernel. -/
set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.PlaneCertificate

private theorem valid74 : staticCaseCheck 7 4 = true := by decide +kernel

theorem checked74 : ∀ (n : Fin 120) (mask : Fin 16),
    pairTest (canonical 7) (tableCandidate 4 (permutationAt n) mask) = true :=
  staticCaseCheck_sound 7 4 valid74

end Loneliness.PlaneCertificate
