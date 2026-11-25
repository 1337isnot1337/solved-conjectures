module

public import Conjectures.McNamaraSteingrimssonLayerRestriction
public import Conjectures.McNamaraSteingrimssonUnpoint
public import Conjectures.McNamaraSteingrimssonMiddleLayers

@[expose] public section
namespace McNamaraSteingrimsson

/-- Every literal intermediate pattern between the two pointed layered
endpoints is itself pointed layered, with the specified tail-word inclusions. -/
theorem pointedInterval_classifies {a b : List Bool} {n : ℕ}
    {p : Equiv.Perm (Fin (n+1))} (ha : 2≤a.length)
    (hl : ClassicalPattern (pointedPermutation (layerPermutation a)) p)
    (hr : ClassicalPattern p (pointedPermutation (layerPermutation b))) :
    ∃ w : List Bool, LayerSubword a w ∧ LayerSubword w b ∧
      ClassicalPattern p (pointedPermutation (layerPermutation w)) ∧
      ClassicalPattern (pointedPermutation (layerPermutation w)) p := by
  have h312 : Has312 p := (pointedLayer_contains312 a ha).of_pattern hl
  obtain ⟨hmax,htail⟩ := (pattern_in_pointed_iff h312 (layerPermutation_avoids312 b)).mp hr
  obtain ⟨w,hwb,hpw,hwp⟩ := subpattern_of_layered_is_layered htail
  have hright : ClassicalPattern p (pointedPermutation (layerPermutation w)) := by
    rw [← pointed_unpoint p hmax]
    exact pointedPattern_lift hpw
  have hleft : ClassicalPattern (pointedPermutation (layerPermutation w)) p := by
    rw [← pointed_unpoint p hmax]
    exact pointedPattern_lift hwp
  have haw := (pointedLayer_pattern_iff_subword ha).mp (classicalPattern_trans hl hright)
  exact ⟨w,haw,hwb,hright,hleft⟩

theorem pointedInterval_all_twos_classifies {a : List Bool} {n : ℕ}
    {p : Equiv.Perm (Fin (n+1))} (ha : 2≤a.length)
    (hl : ClassicalPattern (pointedPermutation (layerPermutation a)) p)
    (hr : ClassicalPattern p
      (pointedPermutation (layerPermutation (List.replicate a.length true)))) :
    ∃ w∈layerChoices a, ClassicalPattern p (pointedPermutation (layerPermutation w)) ∧
      ClassicalPattern (pointedPermutation (layerPermutation w)) p := by
  obtain ⟨w,h₁,h₂,h₃,h₄⟩ := pointedInterval_classifies ha hl hr
  refine ⟨w,layerChoices_iff_layered_interval.mpr ⟨?_,?_⟩,h₃,h₄⟩
  · exact layerPermutation_pattern_iff_subword.mpr h₁
  · exact layerPermutation_pattern_iff_subword.mpr h₂

end McNamaraSteingrimsson
