import Conjectures.LonelinessPlaneWitnessSoundness

/-! Complete finite critical-pattern block `(3,3)`, checked in the kernel. -/
set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.PlaneCertificate

private theorem valid33 : staticCaseCheck 3 3 = true := by decide +kernel

theorem checked33 : ∀ (n : Fin 120) (mask : Fin 16),
    pairTest (canonical 3) (tableCandidate 3 (permutationAt n) mask) = true :=
  staticCaseCheck_sound 3 3 valid33

end Loneliness.PlaneCertificate
