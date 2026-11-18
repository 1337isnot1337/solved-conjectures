import Conjectures.CutPeriodMex
import Conjectures.CutPeriodCollisionACertificate
import Conjectures.CutPeriodCollisionBCertificate
import Conjectures.CutPeriodMissingACertificate
import Conjectures.CutPeriodMissingBCertificate

/-! The four error certificates are checked. Only the correspondence between
the numerical option DFAs and actual legal splits remains a hypothesis here. -/
namespace CutPeriod
open BinaryAutomata CutFamily

theorem gameA_mex_of_options
    (hoptions : ∀ w, OptionData.machineA.accepts w=true ↔
      OptionValue cutsA value (decodeHigh sizeBit w) (decodeHigh valueBit w)) :
    SatisfiesMex cutsA value := by
  apply mex_of_error_languages cutsA OptionData.machineA hoptions
  · intro w
    simpa only [CollisionACertificate.semantic,DFA.product_accepts] using CollisionACertificate.rejects w
  · intro w
    simpa only [MissingACertificate.semantic,DFA.product_accepts] using MissingACertificate.rejects w

theorem gameB_mex_of_options
    (hoptions : ∀ w, OptionData.machineB.accepts w=true ↔
      OptionValue cutsB value (decodeHigh sizeBit w) (decodeHigh valueBit w)) :
    SatisfiesMex cutsB value := by
  apply mex_of_error_languages cutsB OptionData.machineB hoptions
  · intro w
    simpa only [CollisionBCertificate.semantic,DFA.product_accepts] using CollisionBCertificate.rejects w
  · intro w
    simpa only [MissingBCertificate.semantic,DFA.product_accepts] using MissingBCertificate.rejects w

#print axioms gameA_mex_of_options
#print axioms gameB_mex_of_options
end CutPeriod
