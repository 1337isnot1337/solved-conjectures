import Conjectures.SymmetricFourPointDensity

/-! The overlap-count definitions are equivalent to the usual statements that
distinct translates of `{0,a,b,a+b}` are disjoint, or that they cover `ℤ`. -/

namespace SymmetricFourPoint

def tile (a b : ℤ) : Finset ℤ := {0, a, b, a + b}

theorem mem_tile_iff_corner (a b r : ℤ) :
    r ∈ tile a b ↔ ∃ ef : Fin 2 × Fin 2, cornerOffset a b ef = r := by
  constructor
  · intro hr
    simp only [tile, Finset.mem_insert, Finset.mem_singleton] at hr
    rcases hr with rfl | rfl | rfl | rfl
    · exact ⟨(0,0), by simp [cornerOffset]⟩
    · exact ⟨(0,1), by simp [cornerOffset]⟩
    · exact ⟨(1,0), by simp [cornerOffset]⟩
    · exact ⟨(1,1), by simp [cornerOffset]; ring⟩
  · rintro ⟨⟨e,f⟩,rfl⟩
    fin_cases e <;> fin_cases f <;> simp [cornerOffset, tile, add_comm]

theorem cornerOffset_injective (a b : ℤ) (ha : 0 < a) (hab : a < b) :
    Function.Injective (cornerOffset a b) := by
  rintro ⟨e,f⟩ ⟨e',f'⟩ h
  fin_cases e <;> fin_cases f <;> fin_cases e' <;> fin_cases f' <;>
    simp [cornerOffset] at h ⊢ <;> omega

theorem packing_iff_unique_corners (A : Set ℤ) (a b : ℤ) :
    IsPacking A a b ↔ ∀ t ef ef', t - cornerOffset a b ef ∈ A →
      t - cornerOffset a b ef' ∈ A → ef = ef' := by
  classical
  constructor
  · intro h t ef ef' hef hef'
    have hm := h t
    rw [multiplicity_eq_card] at hm
    have hc : (coveredCorners A a b t).card ≤ 1 := by exact_mod_cast hm
    apply Finset.card_le_one.mp hc ef _ ef' _
    · exact Finset.mem_filter.mpr ⟨Finset.mem_univ _, hef⟩
    · exact Finset.mem_filter.mpr ⟨Finset.mem_univ _, hef'⟩
  · exact packing_of_unique_corners A a b

theorem covering_iff_corners (A : Set ℤ) (a b : ℤ) :
    IsCovering A a b ↔ ∀ t, ∃ ef, t - cornerOffset a b ef ∈ A := by
  classical
  constructor
  · intro h t
    have hm := h t
    rw [multiplicity_eq_card] at hm
    have hc : 0 < (coveredCorners A a b t).card := by omega
    obtain ⟨ef,hef⟩ := Finset.card_pos.mp hc
    exact ⟨ef, (Finset.mem_filter.mp hef).2⟩
  · exact covering_of_corners A a b

/-- Distinct centers cannot have a site in both translated tiles. -/
theorem packing_iff_disjoint_translates (A : Set ℤ) (a b : ℤ)
    (ha : 0 < a) (hab : a < b) :
    IsPacking A a b ↔
      ∀ (t c d : ℤ), c ∈ A → d ∈ A → t - c ∈ tile a b → t - d ∈ tile a b → c = d := by
  rw [packing_iff_unique_corners]
  constructor
  · intro h t c d hc hd htc htd
    obtain ⟨ef,hef⟩ := (mem_tile_iff_corner a b (t - c)).mp htc
    obtain ⟨ef',hef'⟩ := (mem_tile_iff_corner a b (t - d)).mp htd
    have ht1 : t - cornerOffset a b ef = c := by omega
    have ht2 : t - cornerOffset a b ef' = d := by omega
    have he := h t ef ef' (by rwa [ht1]) (by rwa [ht2])
    rw [he] at ht1
    omega
  · intro h t ef ef' hef hef'
    apply cornerOffset_injective a b ha hab
    have hc : t - (t - cornerOffset a b ef) ∈ tile a b := by
      apply (mem_tile_iff_corner a b _).mpr
      exact ⟨ef, by ring⟩
    have hd : t - (t - cornerOffset a b ef') ∈ tile a b := by
      apply (mem_tile_iff_corner a b _).mpr
      exact ⟨ef', by ring⟩
    have he := h t _ _ hef hef' hc hd
    omega

/-- Every integer belongs to a translate whose center is in `A`. -/
theorem covering_iff_translates_cover (A : Set ℤ) (a b : ℤ) :
    IsCovering A a b ↔ ∀ t : ℤ, ∃ c ∈ A, t - c ∈ tile a b := by
  rw [covering_iff_corners]
  constructor
  · intro h t
    obtain ⟨ef,hef⟩ := h t
    refine ⟨t - cornerOffset a b ef, hef, (mem_tile_iff_corner a b _).mpr ?_⟩
    exact ⟨ef, by ring⟩
  · intro h t
    obtain ⟨c,hc,htc⟩ := h t
    obtain ⟨ef,hef⟩ := (mem_tile_iff_corner a b (t - c)).mp htc
    refine ⟨ef, ?_⟩
    have he : t - cornerOffset a b ef = c := by omega
    rwa [he]

end SymmetricFourPoint
