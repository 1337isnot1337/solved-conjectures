import Conjectures.LonelinessPlaneWitnessSoundness

/-! Complete finite critical-pattern block `(7,1)`, checked in the kernel. -/
set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.PlaneCertificate

private theorem valid71 : staticCaseCheck 7 1 = true := by decide +kernel

theorem checked71 : ∀ (n : Fin 120) (mask : Fin 16),
    pairTest (canonical 7) (tableCandidate 1 (permutationAt n) mask) = true :=
  staticCaseCheck_sound 7 1 valid71

end Loneliness.PlaneCertificate
