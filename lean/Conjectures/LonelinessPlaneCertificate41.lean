import Conjectures.LonelinessPlaneWitnessSoundness

/-! Complete finite critical-pattern block `(4,1)`, checked in the kernel. -/
set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.PlaneCertificate

private theorem valid41 : staticCaseCheck 4 1 = true := by decide +kernel

theorem checked41 : ∀ (n : Fin 120) (mask : Fin 16),
    pairTest (canonical 4) (tableCandidate 1 (permutationAt n) mask) = true :=
  staticCaseCheck_sound 4 1 valid41

end Loneliness.PlaneCertificate
