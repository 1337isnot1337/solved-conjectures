module

public import Conjectures.AgnosticVC.Traces

/-! Nested positive supports cannot shatter two points, but they can fit any finite
positive sample whose features all belong to the union of the supports. -/

@[expose] public section

namespace AgnosticVC

variable {X H : Type*}

/-- A chain of positive supports has VC dimension at most one. -/
theorem nullChain_vc_le_one (predict : H → X → Bool)
    (hchain : ∀ a b : H,
      {x | predict a x = true} ⊆ {x | predict b x = true} ∨
      {x | predict b x = true} ⊆ {x | predict a x = true}) :
    HasVCDimensionAtMost predict 1 := by
  classical
  intro S hs
  apply Finset.card_le_one.mpr
  intro x hx y hy
  by_contra hxy
  obtain ⟨a, ha⟩ := hs {x} (Finset.singleton_subset_iff.mpr hx)
  obtain ⟨b, hb⟩ := hs {y} (Finset.singleton_subset_iff.mpr hy)
  have hax : predict a x = true := (ha x hx).mpr (Finset.mem_singleton_self x)
  have hby : predict b y = true := (hb y hy).mpr (Finset.mem_singleton_self y)
  rcases hchain a b with hab | hba
  · exact hxy (Finset.mem_singleton.mp ((hb x hx).mp (hab hax)))
  · exact hxy (Finset.mem_singleton.mp ((ha y hy).mp (hba hby))).symm

/-- If a class contains the zero classifier and a nonzero classifier, its dimension is
at least one. -/
theorem nullChain_vc_not_zero (predict : H → X → Bool)
    (hzero : ∃ h, ∀ x, predict h x = false) (hpos : ∃ x h, predict h x = true) :
    ¬ HasVCDimensionAtMost predict 0 := by
  classical
  obtain ⟨a, ha⟩ := hzero
  obtain ⟨x, b, hb⟩ := hpos
  intro hd
  have hcard := hd {x} (by
    intro t _
    by_cases ht : x ∈ t
    · exact ⟨b, by simp [hb, ht]⟩
    · exact ⟨a, by simp [ha, ht]⟩)
  simp at hcard

/-- A finite collection covered pointwise by a chain is contained in a single member. -/
theorem nullChain_exists_fits [Nonempty H] (predict : H → X → Bool)
    (hchain : ∀ a b : H,
      {x | predict a x = true} ⊆ {x | predict b x = true} ∨
      {x | predict b x = true} ⊆ {x | predict a x = true})
    {I : Type*} [Fintype I] (x : I → X) (hcovered : ∀ i, ∃ h, predict h (x i) = true) :
    ∃ h, ∀ i, predict h (x i) = true := by
  classical
  have hfit (s : Finset I) : ∃ h, ∀ i ∈ s, predict h (x i) = true := by
    induction s using Finset.induction with
    | empty => exact ⟨Classical.choice inferInstance, by simp⟩
    | @insert i s _ ih =>
      obtain ⟨a, ha⟩ := ih
      obtain ⟨b, hb⟩ := hcovered i
      rcases hchain a b with hab | hba
      · refine ⟨b, fun j hj => ?_⟩
        rcases Finset.mem_insert.mp hj with rfl | hj
        · exact hb
        · exact hab (ha j hj)
      · refine ⟨a, fun j hj => ?_⟩
        rcases Finset.mem_insert.mp hj with rfl | hj
        · exact hba hb
        · exact ha j hj
  simpa using hfit Finset.univ

end AgnosticVC
