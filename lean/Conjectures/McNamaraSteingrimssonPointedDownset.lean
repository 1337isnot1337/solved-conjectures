module

public import Conjectures.McNamaraSteingrimssonLayerRestriction
public import Conjectures.McNamaraSteingrimssonUnpoint

@[expose] public section
namespace McNamaraSteingrimsson

theorem firstMaximum_of_selection {m n : ℕ} {p : Equiv.Perm (Fin (m+1))}
    {q : Equiv.Perm (Fin n)} (f : Fin (m+1)→Fin (n+1))
    (ho : ∀ i j, p i < p j ↔ pointedPermutation q (f i) < pointedPermutation q (f j))
    (h0 : f 0=0) :
    p 0=Fin.last m := by
  apply le_antisymm (Fin.le_last _)
  by_contra! ht
  have hb : p 0 < p (p.symm (Fin.last m)) := by rwa [Equiv.apply_symm_apply]
  have hc := (ho _ _).mp hb
  rw [h0,pointed_zero] at hc
  exact (not_lt_of_ge (Fin.le_last _)) hc

/-- A nonempty literal subpattern of a pointed layered permutation either
omits the maximum (and is layered) or starts with the maximum and has a
layered tail. Each tail word is a generalized subword of the host. -/
theorem pointedLayered_subpattern_cases {m : ℕ} {v : List Bool}
    {p : Equiv.Perm (Fin (m+1))}
    (h : ClassicalPattern p (pointedPermutation (layerPermutation v))) :
    (∃ w, LayerSubword w v ∧ ClassicalPattern p (layerPermutation w)
        ∧ ClassicalPattern (layerPermutation w) p) ∨
      (∃ w, LayerSubword w v ∧ ClassicalPattern p (pointedPermutation (layerPermutation w))
        ∧ ClassicalPattern (pointedPermutation (layerPermutation w)) p) := by
  obtain ⟨f,hf,ho⟩ := h
  by_cases h0 : f 0=0
  · apply Or.inr
    have hmax := firstMaximum_of_selection f ho h0
    have ht : ∀ i j,
        pointedPermutation (unpoint p hmax) i < pointedPermutation (unpoint p hmax) j ↔
          pointedPermutation (layerPermutation v) (f i) <
            pointedPermutation (layerPermutation v) (f j) := by
      simpa only [pointed_unpoint] using ho
    have hp := pointedPattern_project f hf ht h0
    obtain ⟨w,hw,hl,hr⟩ := subpattern_of_layered_is_layered hp
    refine ⟨w,hw,?_,?_⟩
    · simpa only [pointed_unpoint] using pointedPattern_lift hl
    · simpa only [pointed_unpoint] using pointedPattern_lift hr
  · apply Or.inl
    apply subpattern_of_layered_is_layered
    refine pointedPattern_omit f hf ho fun i => ?_
    exact Fin.pos_iff_ne_zero.mp ((Fin.pos_iff_ne_zero.mpr h0).trans_le (hf.monotone (Fin.zero_le i)))

end McNamaraSteingrimsson
