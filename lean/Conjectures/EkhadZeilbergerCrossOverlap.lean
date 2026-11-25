import Conjectures.EkhadZeilbergerWords

namespace EkhadZeilberger
noncomputable section
variable {α : Type*}

private theorem alternating_two_orientations {n : ℕ}
    (A B : Fin (n+2) → α) (hAB : WordOverlap A B 1) (hBA : WordOverlap B A 1)
    (i : Fin (n+2)) :
    (A i = A 0 ∧ B i = B 0) ∨ (A i = B 0 ∧ B i = A 0) := by
  obtain ⟨i,hi⟩ := i
  induction i with
  | zero => exact Or.inl ⟨rfl,rfl⟩
  | succ i ih =>
    have hi' : i < n+2 := by omega
    have h1 := hAB i hi
    have h2 := hBA i hi
    rcases ih hi' with h | h
    · exact Or.inr ⟨h1.trans h.2,h2.trans h.1⟩
    · exact Or.inl ⟨h1.trans h.2,h2.trans h.1⟩

/-- Two opposite one-step cross-overlaps force the same border lengths. -/
theorem self_overlap_iff_of_cross_one_both {n : ℕ}
    (A B : Fin (n+2) → α) (hAB : WordOverlap A B 1) (hBA : WordOverlap B A 1)
    (d : ℕ) : WordOverlap A A d ↔ WordOverlap B B d := by
  have theEq (i j : Fin (n+2)) : A i = A j ↔ B i = B j := by
    rcases alternating_two_orientations A B hAB hBA i with ⟨ha,hb⟩ | ⟨ha,hb⟩ <;>
      rcases alternating_two_orientations A B hAB hBA j with ⟨hc,hd⟩ | ⟨hc,hd⟩ <;>
      rw [ha,hb,hc,hd] <;> constructor <;> intro h <;> first | rfl | exact h.symm
  exact ⟨fun h i hi => (theEq _ _).mp (h i hi),fun h i hi => (theEq _ _).mpr (h i hi)⟩

theorem self_weight_eq_of_cross_one_both {n : ℕ} (t : ℝ)
    (A B : Fin (n+2) → α) (hAB : WordOverlap A B 1) (hBA : WordOverlap B A 1) :
    overlapWeight t A A (n+1) = overlapWeight t B B (n+1) := by
  classical
  unfold overlapWeight overlapTerm
  apply Finset.sum_congr rfl
  intro i _
  rw [propext (self_overlap_iff_of_cross_one_both A B hAB hBA (i+1))]

theorem missing_cross_one_of_unequal_self {n : ℕ} (t : ℝ)
    (A B : Fin (n+2) → α) (h : overlapWeight t A A (n+1) ≠ overlapWeight t B B (n+1)) :
    ¬ WordOverlap A B 1 ∨ ¬ WordOverlap B A 1 := by
  by_contra! hf
  exact h (self_weight_eq_of_cross_one_both t A B hf.1 hf.2)

/-- For at least three equiprobable letters, a missing one-step cross-overlap
gives the needed variance floor whenever self-overlaps differ. -/
theorem wordVariance_ge_weight_of_unequal_self {n : ℕ} (t : ℝ)
    (A B : Fin (n+2) → α) (ht : 0<t) (ht3 : t ≤ 1/3)
    (h : overlapWeight t A A (n+1) ≠ overlapWeight t B B (n+1)) :
    t ≤ wordVariance t A B := by
  have hnonnegA := overlapWeight_nonneg t ht.le A A (n+1)
  have hnonnegB := overlapWeight_nonneg t ht.le B B (n+1)
  have hmaxA := overlapWeight_le_mass t ht.le A B (n+1)
  have hmaxB := overlapWeight_le_mass t ht.le B A (n+1)
  have hMass := overlapMass_bound t ht.le (n+1)
  have hden : 0 < 1-t := by linarith
  have hle : overlapMass t (n+1) ≤ 1/2 := by
    have hLt : (1-t)*((1:ℝ)/2) ≤ 1/2 := by nlinarith
    apply le_of_not_gt
    intro hc
    nlinarith [mul_lt_mul_of_pos_left hc hden]
  unfold wordVariance
  rcases missing_cross_one_of_unequal_self t A B h with ha | hb
  · linarith [overlapWeight_missing_first_le t ht.le A B n ha]
  · linarith [overlapWeight_missing_first_le t ht.le B A n hb]

end
end EkhadZeilberger
