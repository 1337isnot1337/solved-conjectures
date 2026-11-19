import Conjectures.LonelinessEightPlaneCertificate

/-! Composition rules join separately checked subtrees without reducing
their arithmetic checks again. The original checker is unchanged. -/

namespace Loneliness.EightPlane

theorem checkBranches_nil (check : ℤ → Certificate → Bool) :
    checkBranches check [] [] = true := rfl

theorem checkBranches_cons (check : ℤ → Certificate → Bool)
    (z : ℤ) (choices : List ℤ) (child : Certificate) (children : List Certificate)
    (hhead : check z child = true)
    (htail : checkBranches check choices children = true) :
    checkBranches check (z :: choices) (child :: children) = true :=
  Bool.and_eq_true_iff.mpr ⟨hhead, htail⟩

theorem checkCertificate_split (fuel : ℕ) (family : Fin 3) (repeatIndex : Fin 7)
    (assigned : List ℤ) (remaining : List ℕ) (children : List Certificate)
    (hremaining : remaining.isEmpty = false)
    (hchildren : checkBranches
      (fun z child => checkCertificate fuel family repeatIndex
        (assigned ++ [z]) (remaining.erase z.natAbs) child)
      (branchChoices assigned remaining) children = true) :
    checkCertificate (fuel + 1) family repeatIndex assigned remaining (.split children) = true := by
  apply Bool.and_eq_true_iff.mpr
  exact ⟨by simp only [hremaining, Bool.not_false], hchildren⟩

end Loneliness.EightPlane

