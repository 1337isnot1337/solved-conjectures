import Conjectures.LonelinessPlaneWitnessSoundness

/-! Complete finite critical-pattern block `(5,1)`, checked in the kernel. -/
set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.PlaneCertificate

private theorem valid51 : staticCaseCheck 5 1 = true := by decide +kernel

theorem checked51 : ∀ (n : Fin 120) (mask : Fin 16),
    pairTest (canonical 5) (tableCandidate 1 (permutationAt n) mask) = true :=
  staticCaseCheck_sound 5 1 valid51

end Loneliness.PlaneCertificate
