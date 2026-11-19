import Conjectures.LonelinessPlaneWitnessSoundness

/-! Complete finite critical-pattern block `(5,0)`, checked in the kernel. -/
set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.PlaneCertificate

private theorem valid50 : staticCaseCheck 5 0 = true := by decide +kernel

theorem checked50 : ∀ (n : Fin 120) (mask : Fin 16),
    pairTest (canonical 5) (tableCandidate 0 (permutationAt n) mask) = true :=
  staticCaseCheck_sound 5 0 valid50

end Loneliness.PlaneCertificate
