import Conjectures.LonelinessPlaneWitnessSoundness

/-! Complete finite critical-pattern block `(0,2)`, checked in the kernel. -/
set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.PlaneCertificate

private theorem valid02 : staticCaseCheck 0 2 = true := by decide +kernel

theorem checked02 : ∀ (n : Fin 120) (mask : Fin 16),
    pairTest (canonical 0) (tableCandidate 2 (permutationAt n) mask) = true :=
  staticCaseCheck_sound 0 2 valid02

end Loneliness.PlaneCertificate
