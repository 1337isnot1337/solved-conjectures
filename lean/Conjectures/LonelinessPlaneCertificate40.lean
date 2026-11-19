import Conjectures.LonelinessPlaneWitnessSoundness

/-! Complete finite critical-pattern block `(4,0)`, checked in the kernel. -/
set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.PlaneCertificate

private theorem valid40 : staticCaseCheck 4 0 = true := by decide +kernel

theorem checked40 : ∀ (n : Fin 120) (mask : Fin 16),
    pairTest (canonical 4) (tableCandidate 0 (permutationAt n) mask) = true :=
  staticCaseCheck_sound 4 0 valid40

end Loneliness.PlaneCertificate
