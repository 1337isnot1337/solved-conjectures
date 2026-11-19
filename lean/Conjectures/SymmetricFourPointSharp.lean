import Conjectures.SymmetricFourPointTheorem

/-! The interval lengths in the local obstruction are attained. -/

namespace SymmetricFourPoint

theorem periodic_multiplicity_sum (A : Set ℤ) (a b P : ℕ) (hP : 0 < P)
    (hperiod : NonmixedGap.IsPeriodic A P) (s : ℤ) :
    windowSum (multiplicity (indicator A) a b) s P =
      4 * (NonmixedGap.count A 0 P : ℤ) := by
  have hP' : (0 : ℤ) < P := by omega
  rw [windowSum_multiplicity]
  simp only [windowSum_indicator, NonmixedGap.count_period hP' hperiod]
  ring

theorem packing_period_count (A : Set ℤ) (P : ℕ) (hP : 0 < P)
    (hperiod : NonmixedGap.IsPeriodic A P)
    (hd : NonmixedGap.upperDensity A = ((P : ℝ) - 1) / (4 * P)) :
    4 * (NonmixedGap.count A 0 P : ℤ) = (P : ℤ) - 1 := by
  have hh := NonmixedGap.periodic_upperDensity (by omega : (0 : ℤ) < P) hperiod
  simp only [Int.cast_natCast] at hh
  have hquot : (NonmixedGap.count A 0 P : ℝ) / P = ((P : ℝ) - 1) / (4 * P) := hh.symm.trans hd
  have hP0 : (P : ℝ) ≠ 0 := by exact_mod_cast ne_of_gt hP
  have hreal : 4 * (NonmixedGap.count A 0 P : ℝ) = (P : ℝ) - 1 := by
    field_simp at hquot
    nlinarith only [hquot]
  exact_mod_cast hreal

theorem covering_period_count (A : Set ℤ) (P : ℕ) (hP : 0 < P)
    (hperiod : NonmixedGap.IsPeriodic A P)
    (hd : NonmixedGap.lowerDensity A = ((P : ℝ) + 1) / (4 * P)) :
    4 * (NonmixedGap.count A 0 P : ℤ) = (P : ℤ) + 1 := by
  have hh := NonmixedGap.periodic_lowerDensity (by omega : (0 : ℤ) < P) hperiod
  simp only [Int.cast_natCast] at hh
  have hquot : (NonmixedGap.count A 0 P : ℝ) / P = ((P : ℝ) + 1) / (4 * P) := hh.symm.trans hd
  have hP0 : (P : ℝ) ≠ 0 := by exact_mod_cast ne_of_gt hP
  have hreal : 4 * (NonmixedGap.count A 0 P : ℝ) = (P : ℝ) + 1 := by
    field_simp at hquot
    nlinarith only [hquot]
  exact_mod_cast hreal

/-- A packing attains an exactly covered interval of length `ab+b-a-1`.
Together with `packing_uncovered`, this is the sharp local packing length. -/
theorem sharp_packing_interval (a b : ℕ) (ha : 0 < a) (hab : a < b)
    (hcop : Nat.Coprime a b) (haodd : a % 2 = 1) (hbodd : b % 2 = 1) :
    ∃ A : Set ℤ, IsPacking A a b ∧ ∃ s : ℤ,
      ∀ t : ℤ, s ≤ t → t < s + (packingLength a b - 1 : ℕ) →
        multiplicity (indicator A) a b t = 1 := by
  obtain ⟨A,hA,hperiod,hd,_⟩ := odd_packing_witness a b ha hab hcop haodd hbodd
  let P := packingLength a b
  have hp : 0 < P := by dsimp [P, packingLength]; omega
  have hc := packing_period_count A P hp hperiod hd
  have hfull : ∀ s, windowSum (multiplicity (indicator A) a b) s P = (P : ℤ) - 1 := by
    intro s
    rw [periodic_multiplicity_sum A a b P hp hperiod, hc]
  obtain ⟨z,_,_,hz⟩ := packing_uncovered a b ha hab haodd hbodd (indicator A)
    (indicator_nonneg A) hA 0
  have hsplit := windowSum_add (multiplicity (indicator A) a b) z 1 (P - 1)
  have hpadd : 1 + (P - 1) = P := by omega
  have hone : windowSum (multiplicity (indicator A) a b) z 1 =
      multiplicity (indicator A) a b z := by simp [windowSum]
  rw [hpadd, hfull, hone, hz, zero_add] at hsplit
  simp only [Nat.cast_one] at hsplit
  refine ⟨A,hA,z + 1,?_⟩
  intro t htl htu
  by_contra hne
  have hnonneg := multiplicity_nonneg (indicator_nonneg A) (a : ℤ) b t
  have hle := hA t
  have hzero : multiplicity (indicator A) a b t = 0 := by omega
  have hbad := windowSum_upper_of_zero hA (z + 1) (P - 1) ⟨t,htl,htu,hzero⟩
  omega

/-- A covering attains an exactly covered interval of length `ab+b+a-1`.
Together with `no_exact_cover_interval`, this is the sharp unrestricted length. -/
theorem sharp_covering_interval (a b : ℕ) (ha : 0 < a) (hab : a < b)
    (hcop : Nat.Coprime a b) (haodd : a % 2 = 1) (hbodd : b % 2 = 1) :
    ∃ A : Set ℤ, IsCovering A a b ∧ ∃ s : ℤ,
      ∀ t : ℤ, s ≤ t → t < s + (coveringLength a b - 1 : ℕ) →
        multiplicity (indicator A) a b t = 1 := by
  obtain ⟨A,hA,hperiod,_,hd⟩ := odd_covering_witness a b ha hab hcop haodd hbodd
  let P := coveringLength a b
  have hp : 0 < P := by dsimp [P, coveringLength]; omega
  have hc := covering_period_count A P hp hperiod hd
  have hfull : ∀ s, windowSum (multiplicity (indicator A) a b) s P = (P : ℤ) + 1 := by
    intro s
    rw [periodic_multiplicity_sum A a b P hp hperiod, hc]
  obtain ⟨z,_,_,hz⟩ := covering_overlap a b ha hab haodd hbodd (indicator A)
    (indicator_nonneg A) hA 0
  have hsplit := windowSum_add (multiplicity (indicator A) a b) z 1 (P - 1)
  have hpadd : 1 + (P - 1) = P := by omega
  have hone : windowSum (multiplicity (indicator A) a b) z 1 =
      multiplicity (indicator A) a b z := by simp [windowSum]
  rw [hpadd, hfull, hone] at hsplit
  simp only [Nat.cast_one] at hsplit
  have hrest := le_windowSum hA (z + 1) (P - 1)
  have hsum : windowSum (multiplicity (indicator A) a b) (z + 1) (P - 1) = (P : ℤ) - 1 := by
    omega
  refine ⟨A,hA,z + 1,?_⟩
  intro t htl htu
  by_contra hne
  have hle := hA t
  have htwo : 2 ≤ multiplicity (indicator A) a b t := by omega
  have hbad := windowSum_lower_of_two hA (z + 1) (P - 1) ⟨t,htl,htu,htwo⟩
  omega

end SymmetricFourPoint
