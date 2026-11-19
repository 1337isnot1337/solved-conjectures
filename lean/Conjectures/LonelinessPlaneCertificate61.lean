import Conjectures.LonelinessPlaneWitnessSoundness

/-! Complete finite critical-pattern block `(6,1)`, checked in the kernel. -/
set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.PlaneCertificate

private theorem valid61 : staticCaseCheck 6 1 = true := by decide +kernel

theorem checked61 : ∀ (n : Fin 120) (mask : Fin 16),
    pairTest (canonical 6) (tableCandidate 1 (permutationAt n) mask) = true :=
  staticCaseCheck_sound 6 1 valid61

end Loneliness.PlaneCertificate
