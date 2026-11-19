import Conjectures.LonelinessFiveSpeedRootStarQuickBlocks

/-! Outer base-coordinate blocks for the cached root checker. Arbitrary
adjacent blocks combine by an append theorem, permitting balanced proof
trees instead of one large case split over all base coordinates. -/

namespace Loneliness.FiveSpeedCertificate

def rootQuickBaseBlockCheck (p : ℕ) (G inv : ℕ → ℕ) (usePrefix : Bool)
    (values : ℕ → List ℕ) (eligible : ℕ → ℕ) (start count : ℕ) : Bool :=
  (List.range' start count).all (fun b => rootQuickBlockCheck p G inv usePrefix b
    (values b) (eligible b) 0 (p / 2 + 1))

theorem rootQuickBaseBlockCheck_iff (p : ℕ) (G inv : ℕ → ℕ) (usePrefix : Bool)
    (values : ℕ → List ℕ) (eligible : ℕ → ℕ) (start count : ℕ) :
    rootQuickBaseBlockCheck p G inv usePrefix values eligible start count = true ↔
      ∀ b, start ≤ b → b < start + count →
        rootQuickBlockCheck p G inv usePrefix b (values b) (eligible b) 0 (p / 2 + 1) = true := by
  simp only [rootQuickBaseBlockCheck, List.all_eq_true, List.mem_range'_1]
  constructor
  · intro h b hlo hhi
    exact h b ⟨hlo, hhi⟩
  · intro h b hb
    exact h b hb.1 hb.2

theorem rootQuickBaseBlockCheck_zero (p : ℕ) (G inv : ℕ → ℕ) (usePrefix : Bool)
    (values : ℕ → List ℕ) (eligible : ℕ → ℕ) (start : ℕ) :
    rootQuickBaseBlockCheck p G inv usePrefix values eligible start 0 = true := rfl

theorem rootQuickBaseBlockCheck_singleton (p : ℕ) (G inv : ℕ → ℕ) (usePrefix : Bool)
    (values : ℕ → List ℕ) (eligible : ℕ → ℕ) (b : ℕ) :
    rootQuickBaseBlockCheck p G inv usePrefix values eligible b 1 =
      rootQuickBlockCheck p G inv usePrefix b (values b) (eligible b) 0 (p / 2 + 1) := by
  simp [rootQuickBaseBlockCheck, List.range']

theorem rootQuickBaseBlockCheck_of_cblock (p : ℕ) (G inv : ℕ → ℕ) (usePrefix : Bool)
    (values : ℕ → List ℕ) (eligible : ℕ → ℕ) (b : ℕ)
    (h : rootQuickBlockCheck p G inv usePrefix b (values b) (eligible b) 0 (p / 2 + 1) = true) :
    rootQuickBaseBlockCheck p G inv usePrefix values eligible b 1 = true := by
  rw [rootQuickBaseBlockCheck_singleton]
  exact h

theorem rootQuickBaseBlockCheck_append_eq (p : ℕ) (G inv : ℕ → ℕ) (usePrefix : Bool)
    (values : ℕ → List ℕ) (eligible : ℕ → ℕ) (start m n : ℕ) :
    rootQuickBaseBlockCheck p G inv usePrefix values eligible start (m + n) =
      (rootQuickBaseBlockCheck p G inv usePrefix values eligible start m &&
        rootQuickBaseBlockCheck p G inv usePrefix values eligible (start + m) n) := by
  unfold rootQuickBaseBlockCheck
  rw [← List.range'_append_1, List.all_append]

theorem rootQuickBaseBlockCheck_append (p : ℕ) (G inv : ℕ → ℕ) (usePrefix : Bool)
    (values : ℕ → List ℕ) (eligible : ℕ → ℕ) (start m n : ℕ)
    (hm : rootQuickBaseBlockCheck p G inv usePrefix values eligible start m = true)
    (hn : rootQuickBaseBlockCheck p G inv usePrefix values eligible (start + m) n = true) :
    rootQuickBaseBlockCheck p G inv usePrefix values eligible start (m + n) = true := by
  rw [rootQuickBaseBlockCheck_append_eq, hm, hn]
  rfl

theorem rootQuickBaseBlockCheck_append_iff (p : ℕ) (G inv : ℕ → ℕ) (usePrefix : Bool)
    (values : ℕ → List ℕ) (eligible : ℕ → ℕ) (start m n : ℕ) :
    rootQuickBaseBlockCheck p G inv usePrefix values eligible start (m + n) = true ↔
      rootQuickBaseBlockCheck p G inv usePrefix values eligible start m = true ∧
      rootQuickBaseBlockCheck p G inv usePrefix values eligible (start + m) n = true := by
  rw [rootQuickBaseBlockCheck_append_eq, Bool.and_eq_true]

theorem normalizedRootCover_of_rootQuickBaseBlocks (p : ℕ) (hp : 0 < p)
    (G inv : ℕ → ℕ) (usePrefix : Bool) (values : ℕ → List ℕ) (eligible : ℕ → ℕ)
    (hG : ∀ a, GoodMask p a (G a))
    (hvalues : ∀ b, b ≤ p / 2 → values b = rootStarValues p inv b)
    (heligible : ∀ b, b ≤ p / 2 → eligible b = rootStarEligibleMask p inv b)
    (hcheck : rootQuickBaseBlockCheck p G inv usePrefix values eligible 0 (p / 2 + 1) = true) :
    Loneliness.FiveSpeedRoot.NormalizedRootCover p inv := by
  apply normalizedRootCover_of_rootQuickBlocks p hp G inv usePrefix values eligible hG hvalues heligible
  intro b hb
  exact (rootQuickBaseBlockCheck_iff p G inv usePrefix values eligible 0 (p / 2 + 1)).mp
    hcheck b (Nat.zero_le b) (by omega)

end Loneliness.FiveSpeedCertificate
