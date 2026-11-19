import Conjectures.LonelinessPlaneWitnessSoundness

/-! Complete finite critical-pattern block `(2,6)`, checked in the kernel. -/
set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.PlaneCertificate

private theorem valid26 : staticCaseCheck 2 6 = true := by decide +kernel

theorem checked26 : ∀ (n : Fin 120) (mask : Fin 16),
    pairTest (canonical 2) (tableCandidate 6 (permutationAt n) mask) = true :=
  staticCaseCheck_sound 2 6 valid26

end Loneliness.PlaneCertificate
