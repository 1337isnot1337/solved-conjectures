import Conjectures.LonelinessPlaneWitnessSoundness

/-! Complete finite critical-pattern block `(1,3)`, checked in the kernel. -/
set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.PlaneCertificate

private theorem valid13 : staticCaseCheck 1 3 = true := by decide +kernel

theorem checked13 : ∀ (n : Fin 120) (mask : Fin 16),
    pairTest (canonical 1) (tableCandidate 3 (permutationAt n) mask) = true :=
  staticCaseCheck_sound 1 3 valid13

end Loneliness.PlaneCertificate
