import Conjectures.LonelinessPrimeFilteringSeedCases
import Mathlib.Data.Finset.Max

/-!
# The two remaining minimum-level distributions

A nonempty finite family attains its minimum valuation. The proved sparse
minimum case and the uniform-level case show that a counterexample with at
most six distinct positive speeds must have exactly six distinct speeds,
split four plus two or five plus one at its lowest occupied 7-adic level.
This is a necessary condition for a strict counterexample, not a proof of
the remaining dense cases.
-/

namespace Loneliness.PrimeFiltering

theorem exists_minimum_padic_level (p : ℕ) (ds : List ℕ) (hne : ds ≠ []) :
    ∃ r : ℕ, (∀ d ∈ ds, r ≤ padicValNat p d) ∧
      ∃ d ∈ ds, padicValNat p d = r := by
  have hs : ds.toFinset.Nonempty := by
    cases ds with
    | nil => exact False.elim (hne rfl)
    | cons d ds => exact ⟨d, by simp⟩
  let levels := ds.toFinset.image (padicValNat p)
  have hl : levels.Nonempty := by
    obtain ⟨d, hd⟩ := hs
    exact ⟨padicValNat p d, Finset.mem_image.mpr ⟨d, hd, rfl⟩⟩
  refine ⟨levels.min' hl, ?_, ?_⟩
  · intro d hd
    exact Finset.min'_le levels _
      (Finset.mem_image.mpr ⟨d, List.mem_toFinset.mpr hd, rfl⟩)
  · obtain ⟨d, hd, heq⟩ := Finset.mem_image.mp (Finset.min'_mem levels hl)
    exact ⟨d, List.mem_toFinset.mp hd, heq⟩

theorem minimum_and_higher_card (p : ℕ) (ds : List ℕ) (r : ℕ)
    (hminimum : ∀ d ∈ ds, r ≤ padicValNat p d) :
    (ds.toFinset.filter (fun d => padicValNat p d = r)).card +
      (ds.toFinset.filter (fun d => r < padicValNat p d)).card = ds.toFinset.card := by
  have heq : ds.toFinset.filter (fun d => r < padicValNat p d) =
      ds.toFinset.filter (fun d => ¬ padicValNat p d = r) := by
    ext d
    simp only [Finset.mem_filter]
    constructor
    · rintro ⟨hd, hr⟩
      exact ⟨hd, by omega⟩
    · rintro ⟨hd, hr⟩
      have hbound := hminimum d (List.mem_toFinset.mp hd)
      exact ⟨hd, by omega⟩
  rw [heq]
  exact Finset.card_filter_add_card_filter_not (fun d => padicValNat p d = r)

/-- Every strict counterexample in the six-distinct-speed range has one of
the two dense lowest-level distributions. All higher counts are exact. -/
theorem dense_minimum_of_value_lt_one_seventh
    (ds : List ℕ) (hpos : ∀ d ∈ ds, 0 < d) (htotal : ds.toFinset.card ≤ 6)
    (hbad : value ds < (1 / 7 : ℝ)) :
    ds.toFinset.card = 6 ∧ ∃ r : ℕ,
      (∀ d ∈ ds, r ≤ padicValNat 7 d) ∧ (∃ d ∈ ds, padicValNat 7 d = r) ∧
      (((ds.toFinset.filter (fun d => padicValNat 7 d = r)).card = 4 ∧
        (ds.toFinset.filter (fun d => r < padicValNat 7 d)).card = 2) ∨
       ((ds.toFinset.filter (fun d => padicValNat 7 d = r)).card = 5 ∧
        (ds.toFinset.filter (fun d => r < padicValNat 7 d)).card = 1)) := by
  let : Fact (Nat.Prime 7) := ⟨by decide⟩
  have hcard : ds.toFinset.card = 6 := by
    have hnot : ¬ ds.toFinset.card ≤ 5 := by
      intro hsmall
      exact lt_asymm hbad
        (PrimePowerUnitGrid.one_seventh_lt_value_of_five_distinct ds hpos hsmall)
    omega
  have hne : ds ≠ [] := by
    intro hnil
    simp only [hnil, List.toFinset_nil, Finset.card_empty] at hcard
    omega
  obtain ⟨r, hminimum, hattain⟩ := exists_minimum_padic_level 7 ds hne
  have hlarge : ¬ (ds.toFinset.filter (fun d => padicValNat 7 d = r)).card ≤ 3 := by
    intro hsmall
    exact (not_le_of_gt hbad)
      (one_seventh_of_small_minimum_level ds hpos r htotal hminimum hattain hsmall)
  have hbound : (ds.toFinset.filter (fun d => padicValNat 7 d = r)).card ≤ 6 :=
    (Finset.card_le_card (Finset.filter_subset _ _)).trans htotal
  have hnot_uniform : (ds.toFinset.filter (fun d => padicValNat 7 d = r)).card ≠ 6 := by
    intro huniform
    have heq : ds.toFinset.filter (fun d => padicValNat 7 d = r) = ds.toFinset :=
      Finset.eq_of_subset_of_card_le (Finset.filter_subset _ _) (by omega)
    have hlevel : ∀ d ∈ ds, padicValNat 7 d = r := by
      intro d hd
      have hmem : d ∈ ds.toFinset.filter (fun d => padicValNat 7 d = r) :=
        heq.symm ▸ List.mem_toFinset.mpr hd
      exact (Finset.mem_filter.mp hmem).2
    exact (not_le_of_gt hbad) (uniform_padic_value ds hpos hlevel)
  have hcount : (ds.toFinset.filter (fun d => padicValNat 7 d = r)).card = 4 ∨
      (ds.toFinset.filter (fun d => padicValNat 7 d = r)).card = 5 := by omega
  have hsum := minimum_and_higher_card 7 ds r hminimum
  refine ⟨hcard, r, hminimum, hattain, ?_⟩
  rcases hcount with hfour | hfive
  · exact Or.inl ⟨hfour, by omega⟩
  · exact Or.inr ⟨hfive, by omega⟩

end Loneliness.PrimeFiltering
