import Conjectures.ThreeDistanceGraphTables

namespace ThreeDistanceGraph

noncomputable def fiveValue (k : ℕ) : ℝ :=
  if k=1 then 3/7 else
  if k=2 then 1/3 else
  if k=3 then 4/11 else
  if k=4 then 2/5 else
  if k=5 then 1/3 else
  if k=7 then 3/8 else
  if k=12 then 5/13 else
  fiveStableValue k

noncomputable def sevenValue (k : ℕ) : ℝ :=
  if k=1 then 4/9 else
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
  if k=32 then 14/33 else
  sevenStableValue k

theorem gap_five_all_value (k : ℕ) (hk : 0 < k) :
    gapValue k 5=fiveValue k := by
  unfold fiveValue
  split_ifs with h1 h2 h3 h4 h5 h7 h12
  · subst k
    simpa [gapValue,gapSpeeds] using gap5_k1_value
  · subst k
    simpa [gapValue,gapSpeeds] using gap5_k2_value
  · subst k
    simpa [gapValue,gapSpeeds] using gap5_k3_value
  · subst k
    simpa [gapValue,gapSpeeds] using gap5_k4_value
  · subst k
    simpa [gapValue,gapSpeeds] using gap5_k5_value
  · subst k
    simpa [gapValue,gapSpeeds] using gap5_k7_value
  · subst k
    simpa [gapValue,gapSpeeds] using gap5_k12_value
  · exact gap_five_stable_value k (by omega) h7 h12

theorem gap_five_classification (k : ℕ) (hk : 0 < k) :
    gapDensity k 5=fiveValue k ∧ gapValue k 5=fiveValue k := by
  have hv := gap_five_all_value k hk
  exact ⟨(gap_density_eq_value k 5 hk).trans hv,hv⟩

theorem gap_seven_all_value (k : ℕ) (hk : 0 < k) :
    gapValue k 7=sevenValue k := by
  by_cases h1 : k=1
  · subst k
    simpa [gapValue,gapSpeeds,sevenValue] using gap7_k1_value
  by_cases h2 : k=2
  · subst k
    simpa [gapValue,gapSpeeds,sevenValue] using gap7_k2_value
  by_cases h3 : k=3
  · subst k
    simpa [gapValue,gapSpeeds,sevenValue] using gap7_k3_value
  by_cases h4 : k=4
  · subst k
    simpa [gapValue,gapSpeeds,sevenValue] using gap7_k4_value
  by_cases h5 : k=5
  · subst k
    simpa [gapValue,gapSpeeds,sevenValue] using gap7_k5_value
  by_cases h6 : k=6
  · subst k
    simpa [gapValue,gapSpeeds,sevenValue] using gap7_k6_value
  by_cases h7 : k=7
  · subst k
    simpa [gapValue,gapSpeeds,sevenValue] using gap7_k7_value
  by_cases h9 : k=9
  · subst k
    simpa [gapValue,gapSpeeds,sevenValue] using gap7_k9_value
  by_cases h11 : k=11
  · subst k
    simpa [gapValue,gapSpeeds,sevenValue] using gap7_k11_value
  by_cases h14 : k=14
  · subst k
    simpa [gapValue,gapSpeeds,sevenValue] using gap7_k14_value
  by_cases h16 : k=16
  · subst k
    simpa [gapValue,gapSpeeds,sevenValue] using gap7_k16_value
  by_cases h18 : k=18
  · subst k
    simpa [gapValue,gapSpeeds,sevenValue] using gap7_k18_value
  by_cases h23 : k=23
  · subst k
    simpa [gapValue,gapSpeeds,sevenValue] using gap7_k23_value
  by_cases h25 : k=25
  · subst k
    simpa [gapValue,gapSpeeds,sevenValue] using gap7_k25_value
  by_cases h32 : k=32
  · subst k
    simpa [gapValue,gapSpeeds,sevenValue] using gap7_k32_value
  have he : sevenValue k=sevenStableValue k := by
    simp only [sevenValue,h1,h2,h3,h4,h5,h6,h7,h9,h11,h14,h16,h18,h23,h25,h32,ite_false]
  rw [he]
  apply gap_seven_stable_value k (by omega)
  simp_all

theorem gap_seven_classification (k : ℕ) (hk : 0 < k) :
    gapDensity k 7=sevenValue k ∧ gapValue k 7=sevenValue k := by
  have hv := gap_seven_all_value k hk
  exact ⟨(gap_density_eq_value k 7 hk).trans hv,hv⟩

end ThreeDistanceGraph
