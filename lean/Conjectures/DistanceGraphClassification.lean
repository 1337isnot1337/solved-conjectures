import Conjectures.DistanceGraphSeven
import Conjectures.DistanceGraphSmall

/-! Complete character-value tables for every positive parameter at gaps
five and seven. Density equality is a separate Haralambis obligation. -/
namespace DistanceGraph

noncomputable def gapFiveFormula (k : ℕ) : ℝ :=
  if k=2 then 1/3 else
  if k=3 then 4/11 else
  if k=4 then 2/5 else
  if k=5 then 1/3 else
  if k=7 then 3/8 else
  if k=12 then 5/13 else gapFiveGeneric k

noncomputable def gapSevenFormula (k : ℕ) : ℝ :=
  if k=2 then 3/10 else
  if k=3 then 5/13 else
  if k=4 then 2/5 else
  if k=5 then 6/17 else
  if k=6 then 3/7 else
  if k=7 then 1/3 else
  if k=9 then 2/5 else
  if k=11 then 5/12 else
  if k=14 then 2/5 else
  if k=16 then 7/17 else
  if k=18 then 8/19 else
  if k=23 then 5/12 else
  if k=25 then 11/26 else
  if k=32 then 14/33 else gapSevenGeneric k

theorem gap_five_value (k : ℕ) (hk : 0 < k) :
    Loneliness.value [1,k,k+5] = gapFiveFormula k := by
  unfold gapFiveFormula
  split_ifs with h2 h3 h4 h5 h7 h12
  · subst k; exact Small.gap5_k2
  · subst k; exact Small.gap5_k3
  · subst k; exact Small.gap5_k4
  · subst k; exact Small.gap5_k5
  · subst k; exact Small.gap5_k7
  · subst k; exact Small.gap5_k12
  · exact gap_five_generic_value k hk h2 h3 h5 h7 h12

theorem gap_seven_value (k : ℕ) (hk : 0 < k) :
    Loneliness.value [1,k,k+7] = gapSevenFormula k := by
  by_cases h2 : k=2
  · subst k; exact Small.gap7_k2
  by_cases h3 : k=3
  · subst k; exact Small.gap7_k3
  by_cases h4 : k=4
  · subst k; exact Small.gap7_k4
  by_cases h5 : k=5
  · subst k; exact Small.gap7_k5
  by_cases h6 : k=6
  · subst k; exact Small.gap7_k6
  by_cases h7 : k=7
  · subst k; exact Small.gap7_k7
  by_cases h9 : k=9
  · subst k; exact Small.gap7_k9
  by_cases h11 : k=11
  · subst k; exact Small.gap7_k11
  by_cases h14 : k=14
  · subst k; exact Small.gap7_k14
  by_cases h16 : k=16
  · subst k; exact Small.gap7_k16
  by_cases h18 : k=18
  · subst k; exact Small.gap7_k18
  by_cases h23 : k=23
  · subst k; exact Small.gap7_k23
  by_cases h25 : k=25
  · subst k; exact Small.gap7_k25
  by_cases h32 : k=32
  · subst k; exact Small.gap7_k32
  simp only [gapSevenFormula,ite_eq_right h2,ite_eq_right h3,ite_eq_right h4,
    ite_eq_right h5,ite_eq_right h6,ite_eq_right h7,ite_eq_right h9,ite_eq_right h11,
    ite_eq_right h14,ite_eq_right h16,ite_eq_right h18,ite_eq_right h23,
    ite_eq_right h25,ite_eq_right h32]
  by_cases h12 : k=12
  · subst k
    have he : gapSevenGeneric 12 = (13 : ℝ)/31 := by norm_num [gapSevenGeneric, characterFraction]
    rw [he]
    exact Small.gap7_k12
  · apply gap_seven_generic_value k hk
    simp only [List.mem_cons, List.not_mem_nil, or_false, not_or]
    exact ⟨h2,h3,h4,h5,h7,h9,h11,h12,h14,h16,h18,h23,h25,h32⟩

/-- The seven-branch table in Theorem 1, at the actual real character value. -/
theorem gap_five_table (k : ℕ) (hk : 6 ≤ k) (h7 : k ≠ 7) (h12 : k ≠ 12) :
    Loneliness.value [1,k,k+5] = gapFiveGeneric k :=
  gap_five_generic_value k (by omega) (by omega) (by omega) (by omega) h7 h12

/-- The corrected nine-branch table, including its parameter k=12. -/
theorem gap_seven_table (k : ℕ) (hk : 8 ≤ k)
    (hsmall : k ∉ ([9,11,14,16,18,23,25,32] : List ℕ)) :
    Loneliness.value [1,k,k+7] = gapSevenGeneric k := by
  simp only [List.mem_cons, List.not_mem_nil, or_false, not_or] at hsmall
  rcases hsmall with ⟨h9,h11,h14,h16,h18,h23,h25,h32⟩
  have h2 : k ≠ 2 := by omega
  have h3 : k ≠ 3 := by omega
  have h4 : k ≠ 4 := by omega
  have h5 : k ≠ 5 := by omega
  have h6 : k ≠ 6 := by omega
  have h7 : k ≠ 7 := by omega
  simpa only [gapSevenFormula,ite_eq_right h2,ite_eq_right h3,ite_eq_right h4,
    ite_eq_right h5,ite_eq_right h6,ite_eq_right h7,ite_eq_right h9,ite_eq_right h11,
    ite_eq_right h14,ite_eq_right h16,ite_eq_right h18,ite_eq_right h23,
    ite_eq_right h25,ite_eq_right h32] using gap_seven_value k (by omega)

theorem gap_five_one : Loneliness.value [1,1,6] = 3/7 := by
  have hh := gap_five_value 1 (by decide)
  norm_num [gapFiveFormula,gapFiveGeneric] at hh
  exact hh

theorem gap_seven_one : Loneliness.value [1,1,8] = 4/9 := by
  have hh := gap_seven_value 1 (by decide)
  norm_num [gapSevenFormula,gapSevenGeneric] at hh
  exact hh

theorem gap_seven_fifty : Loneliness.value [1,50,57] = 25/58 := by
  have hh := gap_seven_value 50 (by decide)
  norm_num [gapSevenFormula,gapSevenGeneric,characterFraction] at hh
  exact hh

theorem corrected_residue_five (k : ℕ) (hk : 41 ≤ k) (hmod : k%9 = 5) :
    Loneliness.value [1,k,k+7] = (4*(k : ℝ)+25)/(9*(k : ℝ)+72) := by
  have hh := gap_seven_table k (by omega) (by
    simp only [List.mem_cons, List.not_mem_nil, or_false, not_or]
    omega)
  rw [hh]
  simp only [gapSevenGeneric,hmod,characterFraction]
  norm_num only [Nat.cast_ofNat,Nat.cast_add]
  congr 1 <;> ring

noncomputable def publishedGapSevenPrediction (k : ℕ) : ℝ :=
  (4*(k : ℝ)-2)/(9*((k : ℝ)+1))

theorem corrected_prediction_difference (k : ℕ) (hk : 41 ≤ k) (hmod : k%9 = 5) :
    publishedGapSevenPrediction k-Loneliness.value [1,k,k+7] =
      ((k : ℝ)-41)/(9*((k : ℝ)+1)*((k : ℝ)+8)) := by
  rw [corrected_residue_five k hk hmod, publishedGapSevenPrediction]
  have h1 : (k : ℝ)+1 ≠ 0 := by positivity
  have h8 : (k : ℝ)+8 ≠ 0 := by positivity
  have he : 9*(k : ℝ)+72 = 9*((k : ℝ)+8) := by ring
  rw [he]
  field_simp
  ring

theorem corrected_prediction_strict (k : ℕ) (hk : 41 < k) (hmod : k%9 = 5) :
    Loneliness.value [1,k,k+7] < publishedGapSevenPrediction k := by
  apply sub_pos.mp
  rw [corrected_prediction_difference k hk.le hmod]
  apply div_pos
  · have hh : (41 : ℝ) < k := by exact_mod_cast hk
    linarith
  · positivity

theorem counterexample_character_difference :
    publishedGapSevenPrediction 50-Loneliness.value [1,50,57] = (1 : ℝ)/2958 := by
  have hh := corrected_prediction_difference 50 (by decide) (by decide)
  norm_num at hh
  exact hh

end DistanceGraph
