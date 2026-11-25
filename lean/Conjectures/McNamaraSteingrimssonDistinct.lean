module

public import Conjectures.McNamaraSteingrimssonNormalize

@[expose] public section
namespace McNamaraSteingrimsson

theorem layerSubword_length_le {u v : List Bool} (h : LayerSubword u v) :
    u.length≤v.length := by
  induction h with
  | nil => simp
  | cons _ _ ih => exact Nat.succ_le_succ ih
  | cons_right _ ih => exact ih.trans (Nat.le_succ _)

theorem layerSubword_same_length {u v : List Bool} (h : LayerSubword u v)
    (hl : u.length=v.length) : List.Forall₂ (fun a b => layerSize a≤layerSize b) u v := by
  induction h with
  | @nil l => cases l with
    | nil => exact .nil
    | cons x l => simp at hl
  | cons h₁ _ ih =>
    exact .cons h₁ (ih (Nat.succ.inj hl))
  | cons_right h₁ _ =>
    have hle := layerSubword_length_le h₁
    simp only [List.length_cons] at hl
    omega

theorem layerSubword_antisymm {u v : List Bool} (hu : LayerSubword u v)
    (hv : LayerSubword v u) : u=v := by
  have hl := le_antisymm (layerSubword_length_le hu) (layerSubword_length_le hv)
  have h₁ := layerSubword_same_length hu hl
  have h₂ := layerSubword_same_length hv hl.symm
  clear hu hv hl
  induction h₁ with
  | nil => rfl
  | @cons a b l₁ l₂ hab _ ih =>
    cases h₂ with
    | cons hba htail =>
      have h : a=b := by cases a <;> cases b <;> simp [layerSize] at hab hba ⊢
      subst b
      rw [ih htail]

/-- Two distinct layer words cannot represent the same classical permutation
pattern, even when their lengths are presented by different finiteness proofs. -/
theorem layerPermutation_distinct_of_pattern_both {u v : List Bool}
    (hu : ClassicalPattern (layerPermutation u) (layerPermutation v))
    (hv : ClassicalPattern (layerPermutation v) (layerPermutation u)) : u=v :=
  layerSubword_antisymm (layerPermutation_pattern_iff_subword.mp hu)
    (layerPermutation_pattern_iff_subword.mp hv)

end McNamaraSteingrimsson
