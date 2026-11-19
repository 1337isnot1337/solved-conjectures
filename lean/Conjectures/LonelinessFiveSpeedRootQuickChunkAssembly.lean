import Conjectures.LonelinessFiveSpeedRootQuickBaseBlocks

/-! Small assembly lemmas for generated root certificates. The finite
checks may split a C row into literal D lists; their append proofs recover
the complete cached row before the existing root-cover theorem is used. -/

namespace Loneliness.FiveSpeedCertificate

theorem rootQuickBlockCheck_singleton (p : ℕ) (G inv : ℕ → ℕ)
    (usePrefix : Bool) (b : ℕ) (values : List ℕ) (eligible c : ℕ) :
    rootQuickBlockCheck p G inv usePrefix b values eligible c 1 =
      rootStarCachedAcceptedCCheck p G inv (rootStarListLeaf p)
        rootCheapCCheck (rootQuickPrefixCheck p usePrefix) b values eligible c := by
  simp [rootQuickBlockCheck, rootStarCachedAcceptedCBlockCheck, List.range']

theorem rootQuickBlockCheck_singleton_of_dcheck (p : ℕ) (G inv : ℕ → ℕ)
    (usePrefix : Bool) (b : ℕ) (values : List ℕ) (eligible c : ℕ)
    (h : rootStarCachedAcceptedDCheck p G (rootStarListLeaf p)
      (rootQuickPrefixCheck p usePrefix) b c eligible values = true) :
    rootQuickBlockCheck p G inv usePrefix b values eligible c 1 = true := by
  rw [rootQuickBlockCheck_singleton]
  exact rootStarCachedAcceptedCCheck_of_dcheck p G inv (rootStarListLeaf p)
    rootCheapCCheck (rootQuickPrefixCheck p usePrefix) b values eligible c h

end Loneliness.FiveSpeedCertificate
