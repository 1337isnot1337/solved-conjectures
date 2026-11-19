import Conjectures.LonelinessFiveSpeedRootStarCachedBlocks
import Conjectures.LonelinessFiveSpeedRootFoldedList

/-! Cached root blocks with proved structural shortcuts. The optional
four-coordinate check can be enabled independently of the cheap C cases. -/

namespace Loneliness.FiveSpeedCertificate

def rootQuickPrefixCheck (p : ℕ) (usePrefix : Bool) (b c d : ℕ) : Bool :=
  usePrefix && rootPrefix134Check p b c d

def rootQuickBlockCheck (p : ℕ) (G inv : ℕ → ℕ) (usePrefix : Bool)
    (b : ℕ) (values : List ℕ) (eligible start count : ℕ) : Bool :=
  rootStarCachedAcceptedCBlockCheck p G inv (rootStarListLeaf p)
    rootCheapCCheck (rootQuickPrefixCheck p usePrefix) b values eligible start count

theorem rootQuickBlockCheck_eq (p : ℕ) (hp : 0 < p) (G inv : ℕ → ℕ)
    (usePrefix : Bool) (b : ℕ) (values : List ℕ) (eligible start count : ℕ)
    (hvalues : values = rootStarValues p inv b)
    (heligible : eligible = rootStarEligibleMask p inv b) :
    rootQuickBlockCheck p G inv usePrefix b values eligible start count =
      rootStarCBlockCheck p G inv (rootStarFastLeaf p) b start count := by
  have hleaf : rootStarListLeaf p = rootStarFastLeaf p := by
    funext b c d e
    exact rootStarListLeaf_eq p b c d e
  unfold rootQuickBlockCheck
  rw [hleaf]
  apply rootStarCachedAcceptedCBlockCheck_eq_original p G inv (rootStarFastLeaf p)
    rootCheapCCheck (rootQuickPrefixCheck p usePrefix) b values eligible start count
    hvalues heligible
  · intro c hc d e _
    exact rootCheapCCheck_accept p hp b c hc d e
  · intro c d hd e _
    have hprefix : rootPrefix134Check p b c d = true :=
      (Bool.and_eq_true_iff.mp hd).2
    exact rootPrefix134Check_accept p hp b c d hprefix e

theorem rootQuickBlockCheck_append (p : ℕ) (G inv : ℕ → ℕ) (usePrefix : Bool)
    (b : ℕ) (values : List ℕ) (eligible start m n : ℕ)
    (hm : rootQuickBlockCheck p G inv usePrefix b values eligible start m = true)
    (hn : rootQuickBlockCheck p G inv usePrefix b values eligible (start + m) n = true) :
    rootQuickBlockCheck p G inv usePrefix b values eligible start (m + n) = true :=
  rootStarCachedAcceptedCBlockCheck_append p G inv (rootStarListLeaf p)
    rootCheapCCheck (rootQuickPrefixCheck p usePrefix) b values eligible start m n hm hn

theorem normalizedRootCover_of_rootQuickBlocks (p : ℕ) (hp : 0 < p)
    (G inv : ℕ → ℕ) (usePrefix : Bool)
    (values : ℕ → List ℕ) (eligible : ℕ → ℕ)
    (hG : ∀ a, GoodMask p a (G a))
    (hvalues : ∀ b, b ≤ p / 2 → values b = rootStarValues p inv b)
    (heligible : ∀ b, b ≤ p / 2 → eligible b = rootStarEligibleMask p inv b)
    (hcheck : ∀ b, b ≤ p / 2 → rootQuickBlockCheck p G inv usePrefix b
      (values b) (eligible b) 0 (p / 2 + 1) = true) :
    Loneliness.FiveSpeedRoot.NormalizedRootCover p inv := by
  apply normalizedRootCover_of_rootStarBlocks p G inv hG
  intro b hb
  rw [← rootQuickBlockCheck_eq p hp G inv usePrefix b (values b) (eligible b)
    0 (p / 2 + 1) (hvalues b hb) (heligible b hb)]
  exact hcheck b hb

end Loneliness.FiveSpeedCertificate
