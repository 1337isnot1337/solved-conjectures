import Conjectures.LonelinessSevenCoordinateFiniteDefs

namespace Loneliness.SevenCoordinateCritical.Finite

/-- Every nonzero integer of absolute value at most six has a finite code. -/
theorem small_surjective (z : ℤ) (hne : z ≠ 0) (hbound : |z| ≤ 6) :
    ∃ a : Fin 12, small a = z := by
  have hlo := (abs_le.mp hbound).1
  have hhi := (abs_le.mp hbound).2
  interval_cases z <;> first
    | exact ⟨0, rfl⟩
    | exact ⟨1, rfl⟩
    | exact ⟨2, rfl⟩
    | exact ⟨3, rfl⟩
    | exact ⟨4, rfl⟩
    | exact ⟨5, rfl⟩
    | exact ⟨6, rfl⟩
    | exact ⟨7, rfl⟩
    | exact ⟨8, rfl⟩
    | exact ⟨9, rfl⟩
    | exact ⟨10, rfl⟩
    | exact ⟨11, rfl⟩
    | contradiction

private theorem pair_one_six (x y : ℤ) (hne : x ≠ 0)
    (hx : |x| ≤ 6) (hy : |y| ≤ 6) (hpair : 6 * x = 1 * y) :
    ∃ positive : Bool, x = signed positive 1 ∧ y = signed positive 6 := by
  have hx' := abs_le.mp hx
  have hy' := abs_le.mp hy
  by_cases hpos : 0 < x
  · refine ⟨true, ?_, ?_⟩ <;> norm_num [signed, sign] <;> omega
  · refine ⟨false, ?_, ?_⟩ <;> norm_num [signed, sign] <;> omega

private theorem pair_two_five (x y : ℤ) (hne : x ≠ 0)
    (hx : |x| ≤ 6) (hy : |y| ≤ 6) (hpair : 5 * x = 2 * y) :
    ∃ positive : Bool, x = signed positive 2 ∧ y = signed positive 5 := by
  have hx' := abs_le.mp hx
  have hy' := abs_le.mp hy
  by_cases hpos : 0 < x
  · refine ⟨true, ?_, ?_⟩ <;> norm_num [signed, sign] <;> omega
  · refine ⟨false, ?_, ?_⟩ <;> norm_num [signed, sign] <;> omega

private theorem pair_three_four (x y : ℤ) (hne : x ≠ 0)
    (hx : |x| ≤ 6) (hy : |y| ≤ 6) (hpair : 4 * x = 3 * y) :
    ∃ positive : Bool, x = signed positive 3 ∧ y = signed positive 4 := by
  have hx' := abs_le.mp hx
  have hy' := abs_le.mp hy
  by_cases hpos : 0 < x
  · refine ⟨true, ?_, ?_⟩ <;> norm_num [signed, sign] <;> omega
  · refine ⟨false, ?_, ?_⟩ <;> norm_num [signed, sign] <;> omega

/-- The tangent equations force two complementary coordinate pairs. The
remaining pair and seventh coordinate are encoded without further assumptions. -/
theorem exists_reduced (k : Fin 6) (z : Vector)
    (hne : ∀ i, z i ≠ 0) (hbound : ∀ i, |z i| ≤ 6)
    (hpairs : ∀ a : Fin 6, k ≠ a → k ≠ a.rev →
      (6-(a.val : ℤ)) * z a.castSucc = ((a.val : ℤ)+1) * z a.rev.castSucc) :
    ∃ (left right : Bool) (a b c : Fin 12), z = reduced k left right a b c := by
  fin_cases k
  · have hp0 : 5 * z 1 = 2 * z 4 :=
      hpairs 1 (by decide) (by decide)
    obtain ⟨left, h0a, h0b⟩ :=
      pair_two_five (z 1) (z 4) (hne 1) (hbound 1) (hbound 4) hp0
    have hp1 : 4 * z 2 = 3 * z 3 :=
      hpairs 2 (by decide) (by decide)
    obtain ⟨right, h1a, h1b⟩ :=
      pair_three_four (z 2) (z 3) (hne 2) (hbound 2) (hbound 3) hp1
    obtain ⟨a, ha⟩ := small_surjective (z 0) (hne 0) (hbound 0)
    obtain ⟨b, hb⟩ := small_surjective (z 5) (hne 5) (hbound 5)
    obtain ⟨c, hc⟩ := small_surjective (z 6) (hne 6) (hbound 6)
    refine ⟨left, right, a, b, c, ?_⟩
    funext i
    fin_cases i <;> simp [reduced, h0a, h0b, h1a, h1b, ha, hb, hc]
  · have hp0 : 6 * z 0 = 1 * z 5 :=
      hpairs 0 (by decide) (by decide)
    obtain ⟨left, h0a, h0b⟩ :=
      pair_one_six (z 0) (z 5) (hne 0) (hbound 0) (hbound 5) hp0
    have hp1 : 4 * z 2 = 3 * z 3 :=
      hpairs 2 (by decide) (by decide)
    obtain ⟨right, h1a, h1b⟩ :=
      pair_three_four (z 2) (z 3) (hne 2) (hbound 2) (hbound 3) hp1
    obtain ⟨a, ha⟩ := small_surjective (z 1) (hne 1) (hbound 1)
    obtain ⟨b, hb⟩ := small_surjective (z 4) (hne 4) (hbound 4)
    obtain ⟨c, hc⟩ := small_surjective (z 6) (hne 6) (hbound 6)
    refine ⟨left, right, a, b, c, ?_⟩
    funext i
    fin_cases i <;> simp [reduced, h0a, h0b, h1a, h1b, ha, hb, hc]
  · have hp0 : 6 * z 0 = 1 * z 5 :=
      hpairs 0 (by decide) (by decide)
    obtain ⟨left, h0a, h0b⟩ :=
      pair_one_six (z 0) (z 5) (hne 0) (hbound 0) (hbound 5) hp0
    have hp1 : 5 * z 1 = 2 * z 4 :=
      hpairs 1 (by decide) (by decide)
    obtain ⟨right, h1a, h1b⟩ :=
      pair_two_five (z 1) (z 4) (hne 1) (hbound 1) (hbound 4) hp1
    obtain ⟨a, ha⟩ := small_surjective (z 2) (hne 2) (hbound 2)
    obtain ⟨b, hb⟩ := small_surjective (z 3) (hne 3) (hbound 3)
    obtain ⟨c, hc⟩ := small_surjective (z 6) (hne 6) (hbound 6)
    refine ⟨left, right, a, b, c, ?_⟩
    funext i
    fin_cases i <;> simp [reduced, h0a, h0b, h1a, h1b, ha, hb, hc]
  · have hp0 : 6 * z 0 = 1 * z 5 :=
      hpairs 0 (by decide) (by decide)
    obtain ⟨left, h0a, h0b⟩ :=
      pair_one_six (z 0) (z 5) (hne 0) (hbound 0) (hbound 5) hp0
    have hp1 : 5 * z 1 = 2 * z 4 :=
      hpairs 1 (by decide) (by decide)
    obtain ⟨right, h1a, h1b⟩ :=
      pair_two_five (z 1) (z 4) (hne 1) (hbound 1) (hbound 4) hp1
    obtain ⟨a, ha⟩ := small_surjective (z 2) (hne 2) (hbound 2)
    obtain ⟨b, hb⟩ := small_surjective (z 3) (hne 3) (hbound 3)
    obtain ⟨c, hc⟩ := small_surjective (z 6) (hne 6) (hbound 6)
    refine ⟨left, right, a, b, c, ?_⟩
    funext i
    fin_cases i <;> simp [reduced, h0a, h0b, h1a, h1b, ha, hb, hc]
  · have hp0 : 6 * z 0 = 1 * z 5 :=
      hpairs 0 (by decide) (by decide)
    obtain ⟨left, h0a, h0b⟩ :=
      pair_one_six (z 0) (z 5) (hne 0) (hbound 0) (hbound 5) hp0
    have hp1 : 4 * z 2 = 3 * z 3 :=
      hpairs 2 (by decide) (by decide)
    obtain ⟨right, h1a, h1b⟩ :=
      pair_three_four (z 2) (z 3) (hne 2) (hbound 2) (hbound 3) hp1
    obtain ⟨a, ha⟩ := small_surjective (z 1) (hne 1) (hbound 1)
    obtain ⟨b, hb⟩ := small_surjective (z 4) (hne 4) (hbound 4)
    obtain ⟨c, hc⟩ := small_surjective (z 6) (hne 6) (hbound 6)
    refine ⟨left, right, a, b, c, ?_⟩
    funext i
    fin_cases i <;> simp [reduced, h0a, h0b, h1a, h1b, ha, hb, hc]
  · have hp0 : 5 * z 1 = 2 * z 4 :=
      hpairs 1 (by decide) (by decide)
    obtain ⟨left, h0a, h0b⟩ :=
      pair_two_five (z 1) (z 4) (hne 1) (hbound 1) (hbound 4) hp0
    have hp1 : 4 * z 2 = 3 * z 3 :=
      hpairs 2 (by decide) (by decide)
    obtain ⟨right, h1a, h1b⟩ :=
      pair_three_four (z 2) (z 3) (hne 2) (hbound 2) (hbound 3) hp1
    obtain ⟨a, ha⟩ := small_surjective (z 0) (hne 0) (hbound 0)
    obtain ⟨b, hb⟩ := small_surjective (z 5) (hne 5) (hbound 5)
    obtain ⟨c, hc⟩ := small_surjective (z 6) (hne 6) (hbound 6)
    refine ⟨left, right, a, b, c, ?_⟩
    funext i
    fin_cases i <;> simp [reduced, h0a, h0b, h1a, h1b, ha, hb, hc]

end Loneliness.SevenCoordinateCritical.Finite
