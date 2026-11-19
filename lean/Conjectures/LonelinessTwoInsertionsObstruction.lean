import Conjectures.LonelinessTwoInsertionsInterval

/-! The prescribed-interval assertion fails for three inserted speeds.
The ordinary five-speed list still has a witness elsewhere. -/

namespace Loneliness.TwoInsertions

private theorem near_integer_upper (v : ℕ) (k : ℤ) (t : ℝ)
    (hl : -(1/7 : ℝ) ≤ (v : ℝ)*t-k)
    (hu : (v : ℝ)*t-k ≤ (1/7 : ℝ)) :
    distance ((v : ℝ)*t) ≤ (1/7 : ℝ) :=
  (distance_le_int _ k).trans (abs_le.mpr ⟨hl, hu⟩)

theorem three_speed_interval_upper (t : ℝ)
    (ht : t ∈ Set.Icc (1/6 : ℝ) (1/3)) :
    clearance [4,6,10] t ≤ (1/7 : ℝ) := by
  by_cases h₁ : t ≤ 4/21
  · exact (clearance_le_of_mem (by simp : 6 ∈ [4,6,10]) t).trans
      (near_integer_upper 6 1 t (by norm_num at *; linarith [ht.1])
        (by norm_num at *; linarith))
  by_cases h₂ : t ≤ 3/14
  · exact (clearance_le_of_mem (by simp : 10 ∈ [4,6,10]) t).trans
      (near_integer_upper 10 2 t (by norm_num at *; linarith)
        (by norm_num at *; linarith))
  by_cases h₃ : t ≤ 2/7
  · exact (clearance_le_of_mem (by simp : 4 ∈ [4,6,10]) t).trans
      (near_integer_upper 4 1 t (by norm_num at *; linarith)
        (by norm_num at *; linarith))
  by_cases h₄ : t ≤ 11/35
  · exact (clearance_le_of_mem (by simp : 10 ∈ [4,6,10]) t).trans
      (near_integer_upper 10 3 t (by norm_num at *; linarith)
        (by norm_num at *; linarith))
  · exact (clearance_le_of_mem (by simp : 6 ∈ [4,6,10]) t).trans
      (near_integer_upper 6 2 t (by norm_num at *; linarith)
        (by norm_num at *; linarith [ht.2]))

theorem three_speed_interval_obstruction :
    ¬ ∃ t ∈ Set.Icc (1/6 : ℝ) (1/3),
      ∀ v ∈ ([4,6,10] : List ℕ), (1/6 : ℝ) ≤ distance ((v : ℝ)*t) := by
  rintro ⟨t, ht, hgood⟩
  have hlower := le_clearance (by norm_num : (1/6 : ℝ) ≤ 1/2) hgood
  have hupper := three_speed_interval_upper t ht
  norm_num at hlower hupper
  linarith

theorem five_speed_outside_witness :
    (1/6 : ℝ) ≤ clearance [1,2,4,6,10] (3/8) := by
  have hcert : LowerCertificate [1,2,4,6,10] (1/6) (3/8) [0,0,1,2,3] :=
    by decide +kernel
  have hgood := lowerCertificate_sound hcert
  norm_num at hgood
  exact le_clearance (by norm_num) hgood

end Loneliness.TwoInsertions
