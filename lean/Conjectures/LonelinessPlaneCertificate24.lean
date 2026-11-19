import Conjectures.LonelinessPlaneWitnessSoundness

/-! Complete finite critical-pattern block `(2,4)`, checked in the kernel. -/
set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.PlaneCertificate

private theorem valid24 : staticCaseCheck 2 4 = true := by decide +kernel

theorem checked24 : ∀ (n : Fin 120) (mask : Fin 16),
    pairTest (canonical 2) (tableCandidate 4 (permutationAt n) mask) = true :=
  staticCaseCheck_sound 2 4 valid24

end Loneliness.PlaneCertificate
