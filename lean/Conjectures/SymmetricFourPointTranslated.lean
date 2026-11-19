import Conjectures.SymmetricFourPointScaling

/-! Literal translated-tile semantics. Translating the tile shifts every
covered site by the same amount; the set of centers is unchanged. -/

namespace SymmetricFourPoint

/-- No site belongs to tiles placed at two distinct centers. -/
def PacksTile (A : Set ℤ) (S : Finset ℤ) : Prop :=
  ∀ (t c d : ℤ), c ∈ A → d ∈ A → t-c ∈ S → t-d ∈ S → c=d

/-- Every integer belongs to a tile placed at one of the centers. -/
def CoversTile (A : Set ℤ) (S : Finset ℤ) : Prop :=
  ∀ t : ℤ, ∃ c ∈ A, t-c ∈ S

noncomputable def tilePackingDensity (S : Finset ℤ) : ℝ :=
  sSup {d : ℝ | ∃ A : Set ℤ, PacksTile A S ∧ NonmixedGap.upperDensity A = d}

noncomputable def tileCoveringDensity (S : Finset ℤ) : ℝ :=
  sInf {d : ℝ | ∃ A : Set ℤ, CoversTile A S ∧ NonmixedGap.lowerDensity A = d}

def translatedTile (q a b : ℤ) : Finset ℤ := {q,q+a,q+b,q+a+b}

theorem mem_translatedTile (q a b t : ℤ) :
    t ∈ translatedTile q a b ↔ t-q ∈ tile a b := by
  simp only [translatedTile, tile, Finset.mem_insert, Finset.mem_singleton]
  omega

theorem mem_translatedTile_sub (q a b t c : ℤ) :
    t-c ∈ translatedTile q a b ↔ (t-q)-c ∈ tile a b := by
  rw [mem_translatedTile]
  have he : t-c-q = t-q-c := by ring
  rw [he]

theorem packs_translatedTile_iff (A : Set ℤ) (q a b : ℤ) :
    PacksTile A (translatedTile q a b) ↔ PacksTile A (tile a b) := by
  constructor
  · intro h t c d hc hd htc htd
    apply h (t+q) c d hc hd
    · apply (mem_translatedTile_sub q a b (t+q) c).2
      simpa only [add_sub_cancel_right] using htc
    · apply (mem_translatedTile_sub q a b (t+q) d).2
      simpa only [add_sub_cancel_right] using htd
  · intro h t c d hc hd htc htd
    exact h (t-q) c d hc hd
      ((mem_translatedTile_sub q a b t c).1 htc)
      ((mem_translatedTile_sub q a b t d).1 htd)

theorem covers_translatedTile_iff (A : Set ℤ) (q a b : ℤ) :
    CoversTile A (translatedTile q a b) ↔ CoversTile A (tile a b) := by
  constructor
  · intro h t
    obtain ⟨c,hc,htc⟩ := h (t+q)
    refine ⟨c,hc,?_⟩
    simpa only [add_sub_cancel_right] using (mem_translatedTile_sub q a b (t+q) c).1 htc
  · intro h t
    obtain ⟨c,hc,htc⟩ := h (t-q)
    exact ⟨c,hc,(mem_translatedTile_sub q a b t c).2 htc⟩

theorem tilePackingDensity_translated (q a b : ℤ) (ha : 0 < a) (hab : a < b) :
    tilePackingDensity (translatedTile q a b) = packingDensity a b := by
  unfold tilePackingDensity packingDensity
  congr 1
  ext d
  constructor
  · rintro ⟨A,hA,hd⟩
    refine ⟨A,?_,hd⟩
    apply (packing_iff_disjoint_translates A a b ha hab).2
    exact (packs_translatedTile_iff A q a b).1 hA
  · rintro ⟨A,hA,hd⟩
    refine ⟨A,?_,hd⟩
    apply (packs_translatedTile_iff A q a b).2
    exact (packing_iff_disjoint_translates A a b ha hab).1 hA

theorem tileCoveringDensity_translated (q a b : ℤ) :
    tileCoveringDensity (translatedTile q a b) = coveringDensity a b := by
  unfold tileCoveringDensity coveringDensity
  congr 1
  ext d
  constructor
  · rintro ⟨A,hA,hd⟩
    refine ⟨A,?_,hd⟩
    apply (covering_iff_translates_cover A a b).2
    exact (covers_translatedTile_iff A q a b).1 hA
  · rintro ⟨A,hA,hd⟩
    refine ⟨A,?_,hd⟩
    apply (covers_translatedTile_iff A q a b).2
    exact (covering_iff_translates_cover A a b).1 hA

/-- Exact packing and covering densities for every translated symmetric
four-point set of integers. No coprimality hypothesis is required. -/
theorem translated_symmetric_four_point_densities (q : ℤ) (a b : ℕ)
    (ha : 0 < a) (hab : a < b) :
    tilePackingDensity {q,q+a,q+b,q+a+b} =
      packingTarget (a / Nat.gcd a b) (b / Nat.gcd a b) ∧
    tileCoveringDensity {q,q+a,q+b,q+a+b} =
      coveringTarget (a / Nat.gcd a b) (b / Nat.gcd a b) := by
  change tilePackingDensity (translatedTile q a b) = _ ∧
    tileCoveringDensity (translatedTile q a b) = _
  rw [tilePackingDensity_translated q a b (by exact_mod_cast ha) (by exact_mod_cast hab),
    tileCoveringDensity_translated]
  exact symmetric_four_point_densities_general a b ha hab

end SymmetricFourPoint
