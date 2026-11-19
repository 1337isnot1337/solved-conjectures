import Conjectures.LonelinessPlaneWitnessSoundness

/-! Complete finite critical-pattern block `(3,4)`, checked in the kernel. -/
set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.PlaneCertificate

private theorem valid34 : staticCaseCheck 3 4 = true := by decide +kernel

theorem checked34 : ∀ (n : Fin 120) (mask : Fin 16),
    pairTest (canonical 3) (tableCandidate 4 (permutationAt n) mask) = true :=
  staticCaseCheck_sound 3 4 valid34

end Loneliness.PlaneCertificate
