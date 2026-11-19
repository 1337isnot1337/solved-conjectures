import Conjectures.HaralambisTheorem
import Conjectures.LonelinessCoalescenceValue
import Conjectures.LonelinessPackingLower

/-! Haralambis's equality for one, two, or three distinct positive speeds,
and the passage from a packing-density bound to a lonely-runner bound.
Repeated entries pad shorter lists only when applying the equality theorem. -/

namespace Loneliness

namespace Packing

theorem avoids_iff_of_mem {ds es : List ℕ}
    (hmem : ∀ d, d ∈ ds ↔ d ∈ es) (A : Set ℤ) : Avoids ds A ↔ Avoids es A := by
  constructor
  · intro h d hd
    exact h d ((hmem d).mpr hd)
  · intro h d hd
    exact h d ((hmem d).mp hd)

theorem density_eq_of_mem {ds es : List ℕ}
    (hmem : ∀ d, d ∈ ds ↔ d ∈ es) : density ds = density es := by
  unfold density
  congr 1
  ext r
  constructor
  · rintro ⟨A, hA, hr⟩
    exact ⟨A, (avoids_iff_of_mem hmem A).mp hA, hr⟩
  · rintro ⟨A, hA, hr⟩
    exact ⟨A, (avoids_iff_of_mem hmem A).mpr hA, hr⟩

end Packing

namespace SmallRunner

theorem density_eq_value_of_mem_triple (ds : List ℕ) (d : Fin 3 → ℕ)
    (hd : ∀ i, 0 < d i) (hmem : ∀ a, a ∈ ds ↔ a ∈ Haralambis.speeds d) :
    Packing.density ds = value ds := by
  rw [Packing.density_eq_of_mem hmem, CriticalFamilies.value_eq_of_mem hmem]
  exact Haralambis.density_eq_value d hd

theorem density_eq_value_of_length_le_three (ds : List ℕ) (hne : ds ≠ [])
    (hpos : ∀ a ∈ ds, 0 < a) (hlen : ds.length ≤ 3) : Packing.density ds = value ds := by
  rcases ds with _ | ⟨a, ds⟩
  · exact False.elim (hne rfl)
  have ha : 0 < a := hpos a (by simp)
  rcases ds with _ | ⟨b, ds⟩
  · apply density_eq_value_of_mem_triple [a] ![a,a,a]
    · intro i
      fin_cases i <;> simpa using ha
    · intro v
      simp [Haralambis.speeds]
  have hb : 0 < b := hpos b (by simp)
  rcases ds with _ | ⟨c, ds⟩
  · apply density_eq_value_of_mem_triple [a,b] ![a,b,b]
    · intro i
      fin_cases i
      · simpa using ha
      · simpa using hb
      · simpa using hb
    · intro v
      simp [Haralambis.speeds]
  have hc : 0 < c := hpos c (by simp)
  have htail : ds = [] := by
    simp only [List.length_cons] at hlen
    have hz : ds.length = 0 := by omega
    exact List.length_eq_zero_iff.mp hz
  subst ds
  apply density_eq_value_of_mem_triple [a,b,c] ![a,b,c]
  · intro i
    fin_cases i
    · simpa using ha
    · simpa using hb
    · simpa using hc
  · intro v
    simp [Haralambis.speeds]

theorem lonelyRunnerBound_of_density_lower (m : ℕ) (hm : m ≤ 3)
    (hlower : ∀ ds : List ℕ, (∀ a ∈ ds, 0 < a) →
      (1 : ℝ) / ((ds.length : ℝ) + 1) ≤ Packing.density ds) :
    CoordinateSubspace.LonelyRunnerBound m := by
  intro ds hne _hnodup hlen hpos
  have h := hlower ds hpos
  rw [density_eq_value_of_length_le_three ds hne hpos (hlen.trans hm)] at h
  have hlenR : (ds.length : ℝ) ≤ (m : ℝ) := by exact_mod_cast hlen
  have hden : (ds.length : ℝ) + 1 ≤ (m : ℝ) + 1 := by linarith
  exact (one_div_le_one_div_of_le (by positivity) hden).trans h

theorem lonelyRunnerBound (m : ℕ) (hm : m ≤ 3) :
    CoordinateSubspace.LonelyRunnerBound m :=
  lonelyRunnerBound_of_density_lower m hm Packing.one_div_length_add_one_le_density

theorem value_ge_one_div_length_add_one (ds : List ℕ) (hne : ds ≠ [])
    (hpos : ∀ a ∈ ds, 0 < a) (hlen : ds.length ≤ 3) :
    (1 : ℝ) / ((ds.length : ℝ) + 1) ≤ value ds := by
  rw [← density_eq_value_of_length_le_three ds hne hpos hlen]
  exact Packing.one_div_length_add_one_le_density ds hpos

theorem subspace_value_lower {ι : Type*} [Fintype ι] [Nonempty ι]
    (E : Submodule ℚ (ι → ℚ))
    (hfree : CoordinateSubspace.CoordinateFree (CoordinateSubspace.realSpan E))
    (hcodim : Fintype.card ι - Module.finrank ℝ (CoordinateSubspace.realSpan E) + 1 ≤ 3) :
    (1 : ℝ) /
      ((Fintype.card ι - Module.finrank ℝ (CoordinateSubspace.realSpan E) + 1 : ℕ) + 1) ≤
      SubspaceDensity.spaceValue (CoordinateSubspace.realSpan E) :=
  CoordinateSubspace.coalescence_value_lower E hfree (lonelyRunnerBound _ hcodim)

theorem five_coordinate_dimension_three
    (E : Submodule ℚ (Fin 5 → ℚ))
    (hfree : CoordinateSubspace.CoordinateFree (CoordinateSubspace.realSpan E))
    (hdim : Module.finrank ℝ (CoordinateSubspace.realSpan E) = 3) :
    (1 / 4 : ℝ) ≤ SubspaceDensity.spaceValue (CoordinateSubspace.realSpan E) := by
  have h := subspace_value_lower E hfree (by simp [hdim])
  norm_num [hdim] at h
  exact h

theorem five_coordinate_dimension_four
    (E : Submodule ℚ (Fin 5 → ℚ))
    (hfree : CoordinateSubspace.CoordinateFree (CoordinateSubspace.realSpan E))
    (hdim : Module.finrank ℝ (CoordinateSubspace.realSpan E) = 4) :
    (1 / 3 : ℝ) ≤ SubspaceDensity.spaceValue (CoordinateSubspace.realSpan E) := by
  have h := subspace_value_lower E hfree (by simp [hdim])
  norm_num [hdim] at h
  exact h

theorem five_coordinate_dimension_five
    (E : Submodule ℚ (Fin 5 → ℚ))
    (hfree : CoordinateSubspace.CoordinateFree (CoordinateSubspace.realSpan E))
    (hdim : Module.finrank ℝ (CoordinateSubspace.realSpan E) = 5) :
    (1 / 2 : ℝ) ≤ SubspaceDensity.spaceValue (CoordinateSubspace.realSpan E) := by
  have h := subspace_value_lower E hfree (by simp [hdim])
  norm_num [hdim] at h
  exact h

end SmallRunner

end Loneliness
