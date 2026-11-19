import Conjectures.LonelinessFiveSpeedRootStar

/-! Coordinate blocks for the exact normalized root check. Each block is
checked separately, so the kernel need not retain the reduction of an
entire base-coordinate search. The structural check tests the small folded
pattern before counting zero forms. -/

namespace Loneliness.FiveSpeedCertificate

open Loneliness.FiveSpeedRoot

def rootStarFastLeaf (p b c d e : ℕ) : Bool :=
  folded134Check p (rootQuintuple b c d e) ||
    decide (2 ≤ (zeroFormIndices p (rootQuintuple b c d e)).card)

theorem rootStarFastLeaf_eq (p b c d e : ℕ) :
    rootStarFastLeaf p b c d e = rootStarLeaf p b c d e := by
  exact Bool.or_comm _ _

def rootStarCCheck (p : ℕ) (G inv : ℕ → ℕ)
    (leaf : ℕ → ℕ → ℕ → ℕ → Bool) (b c : ℕ) : Bool :=
  if 2 ≤ b ∧ b ≤ p / 2 ∧ b ≤ rootStarRatio p inv 1 b then
    if c ≤ p / 2 ∧ rootStarEligible p inv b c = true then
      let eligible := rootStarEligibleMask p inv b
      (rootStarValues p inv b).all (fun d => if c < d then
        rootPrefixCheck p G b c d (rootStarAfterMask p eligible d) (leaf b c d)
        else true)
    else true
  else true

def rootStarCBlockCheck (p : ℕ) (G inv : ℕ → ℕ)
    (leaf : ℕ → ℕ → ℕ → ℕ → Bool) (b start count : ℕ) : Bool :=
  (List.range' start count).all (rootStarCCheck p G inv leaf b)

theorem rootStarCBlockCheck_append (p : ℕ) (G inv : ℕ → ℕ)
    (leaf : ℕ → ℕ → ℕ → ℕ → Bool) (b start m n : ℕ)
    (hm : rootStarCBlockCheck p G inv leaf b start m = true)
    (hn : rootStarCBlockCheck p G inv leaf b (start + m) n = true) :
    rootStarCBlockCheck p G inv leaf b start (m + n) = true := by
  unfold rootStarCBlockCheck at *
  rw [← List.range'_append_1, List.all_append, hm, hn]
  rfl

theorem rootStarBaseCheck_of_cblock (p : ℕ) (G inv : ℕ → ℕ)
    (leaf : ℕ → ℕ → ℕ → ℕ → Bool) (b : ℕ)
    (hcheck : rootStarCBlockCheck p G inv leaf b 0 (p / 2 + 1) = true) :
    rootStarBaseCheck p G inv leaf b = true := by
  by_cases hb : 2 ≤ b ∧ b ≤ p / 2 ∧ b ≤ rootStarRatio p inv 1 b
  · rw [rootStarBaseCheck, if_pos hb]
    apply List.all_eq_true.mpr
    intro c hc
    have hc' := (rootStarEligibleMask_testBit p inv b c).mp
      ((rootStarValues_mem p inv b c).mp hc)
    have hcguard : c ≤ p / 2 ∧ rootStarEligible p inv b c = true :=
      ⟨hc'.1, decide_eq_true hc'.2⟩
    have hcblock := List.all_eq_true.mp hcheck c
      (List.mem_range'_1.mpr (show 0 ≤ c ∧ c < 0 + (p / 2 + 1) by omega))
    simpa only [rootStarCCheck, if_pos hb, if_pos hcguard] using hcblock
  · simp only [rootStarBaseCheck, if_neg hb]

theorem normalizedRootCover_of_rootStarBlocks (p : ℕ) (G inv : ℕ → ℕ)
    (hG : ∀ a, GoodMask p a (G a))
    (hcheck : ∀ b, b ≤ p / 2 →
      rootStarCBlockCheck p G inv (rootStarFastLeaf p) b 0 (p / 2 + 1) = true) :
    NormalizedRootCover p inv := by
  apply normalizedRootCover_of_rootStarChecks p G inv hG
  intro b hb
  have h := rootStarBaseCheck_of_cblock p G inv (rootStarFastLeaf p) b (hcheck b hb)
  have heq : rootStarFastLeaf p = rootStarLeaf p := by
    funext b c d e
    exact rootStarFastLeaf_eq p b c d e
  simpa only [heq] using h

end Loneliness.FiveSpeedCertificate
