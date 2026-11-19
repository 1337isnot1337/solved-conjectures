import Conjectures.LonelinessRenaultAffine
import Conjectures.LonelinessContinuity

/-!
Arithmetic steps in Proposition 3.1 of Renault's five-speed proof.
The phase-fiber implication is an explicit premise of the divisibility step.
The full two-multiples-of-three theorem is assembled separately.
-/

namespace Loneliness.Renault

theorem exists_phase_fiber_maximum (ds : List ℕ) (c : ℕ) (hc : 0 < c) :
    ∃ t : ℝ, distance ((c : ℝ) * t + 1 / 6) = 0 ∧
      ∀ s : ℝ, distance ((c : ℝ) * s + 1 / 6) = 0 →
        clearance ds s ≤ clearance ds t := by
  let F : Set ℝ := {t | distance ((c : ℝ) * t + 1 / 6) = 0}
  have hclosed : IsClosed F :=
    isClosed_eq (continuous_distance.comp
      ((continuous_const.mul continuous_id).add continuous_const)) continuous_const
  have hcR : (0 : ℝ) < c := by exact_mod_cast hc
  have hc1 : (1 : ℝ) ≤ c := by exact_mod_cast hc
  have hne : (Set.Icc (0 : ℝ) 1 ∩ F).Nonempty := by
    refine ⟨5 / (6 * (c : ℝ)), ⟨by positivity, ?_⟩, ?_⟩
    · apply (div_le_iff₀ (by positivity : (0 : ℝ) < 6 * c)).mpr
      linarith
    · change distance ((c : ℝ) * (5 / (6 * c)) + 1 / 6) = 0
      have heq : (c : ℝ) * (5 / (6 * c)) + 1 / 6 = 1 := by
        field_simp
        ring
      rw [heq]
      norm_num [distance]
  obtain ⟨t, ht, hmax⟩ := (isCompact_Icc.inter_right hclosed).exists_isMaxOn
    hne (continuous_clearance ds).continuousOn
  refine ⟨t, ht.2, ?_⟩
  intro s hs
  let u : ℝ := s - (⌊s⌋ : ℝ)
  have hu : u ∈ Set.Icc (0 : ℝ) 1 := by
    exact ⟨Int.fract_nonneg s, le_of_lt (Int.fract_lt_one s)⟩
  have huF : u ∈ F := by
    have heq := CriticalFamilies.distance_add_int ((c : ℝ) * u + 1 / 6)
      ((c : ℤ) * ⌊s⌋)
    have harg : (c : ℝ) * u + 1 / 6 + (((c : ℤ) * ⌊s⌋ : ℤ) : ℝ) =
        (c : ℝ) * s + 1 / 6 := by
      simp only [u, Int.cast_mul, Int.cast_natCast]
      ring
    rw [harg, hs] at heq
    exact heq.symm
  have hclear := CriticalFamilies.clearance_add_int ds u ⌊s⌋
  have hsum : u + (⌊s⌋ : ℝ) = s := by
    simp only [u]
    ring
  rw [hsum] at hclear
  rw [hclear]
  exact hmax ⟨hu, huF⟩

theorem distance_div_nat_eq_zero_iff (a d : ℕ) (hd : 0 < d) :
    distance ((a : ℝ) / d) = 0 ↔ d ∣ a := by
  constructor
  · intro h
    have heq : (a : ℝ) / d = (round ((a : ℝ) / d) : ℝ) := by
      exact sub_eq_zero.mp (abs_eq_zero.mp h)
    have hkR : 0 ≤ (round ((a : ℝ) / d) : ℝ) := by
      rw [← heq]
      positivity
    have hk : 0 ≤ round ((a : ℝ) / d) := by exact_mod_cast hkR
    refine ⟨(round ((a : ℝ) / d)).toNat, ?_⟩
    have hkcast : ((round ((a : ℝ) / d)).toNat : ℝ) =
        (round ((a : ℝ) / d) : ℝ) := by
      exact_mod_cast Int.toNat_of_nonneg hk
    have hdR : (d : ℝ) ≠ 0 := by positivity
    have ha : (a : ℝ) = d * ((round ((a : ℝ) / d)).toNat : ℝ) := by
      rw [hkcast]
      exact (div_eq_iff hdR).mp heq |>.trans (mul_comm _ _)
    exact_mod_cast ha
  · rintro ⟨k, rfl⟩
    have hdR : (d : ℝ) ≠ 0 := by positivity
    have heq : ((d * k : ℕ) : ℝ) / d = k := by
      push_cast
      field_simp
    rw [heq]
    apply le_antisymm ?_ (distance_nonneg _)
    simpa using distance_le_int (k : ℝ) (k : ℤ)

theorem phase_fiber_zero_divisibility (a b c : ℕ) (hc : 0 < c)
    (hzero : ∀ t : ℝ, (c : ℝ) * t = -(1 / 6 : ℝ) →
      distance ((a : ℝ) * t) = 0 ∨ distance ((b : ℝ) * t) = 0) :
    6 * c ∣ a ∨ 6 * c ∣ b := by
  have hcR : (c : ℝ) ≠ 0 := by positivity
  have hphase : (c : ℝ) * (-(1 / (6 * (c : ℝ)))) = -(1 / 6 : ℝ) := by
    field_simp
  have hscale (v : ℕ) : (v : ℝ) * (-(1 / (6 * (c : ℝ)))) =
      -((v : ℝ) / (6 * c : ℕ)) := by
    push_cast
    ring
  have hd : 0 < 6 * c := by omega
  rcases hzero _ hphase with ha | hb
  · left
    rw [hscale, CriticalFamilies.distance_neg] at ha
    exact (distance_div_nat_eq_zero_iff a (6 * c) hd).mp ha
  · right
    rw [hscale, CriticalFamilies.distance_neg] at hb
    exact (distance_div_nat_eq_zero_iff b (6 * c) hd).mp hb

theorem two_multiple_final_times (a b c d : ℕ)
    (ha : 0 < a) (hb : 0 < b) (hc : 0 < c) (hd : 0 < d)
    (hca : 6 * c ≤ a) (hda : 6 * d ≤ a)
    (hab : a < 5 * b) (hba : b < 5 * a) :
    ∃ t : ℝ,
      (1 / 6 : ℝ) ≤ distance ((a : ℝ) * t) ∧
      (1 / 6 : ℝ) ≤ distance ((b : ℝ) * t) ∧
      distance ((c : ℝ) * t) < (1 / 6 : ℝ) ∧
      distance ((d : ℝ) * t) < (1 / 6 : ℝ) := by
  have haR : (0 : ℝ) < a := by exact_mod_cast ha
  have hbR : (0 : ℝ) < b := by exact_mod_cast hb
  have hcR : (0 : ℝ) < c := by exact_mod_cast hc
  have hdR : (0 : ℝ) < d := by exact_mod_cast hd
  have hcaR : 6 * (c : ℝ) ≤ a := by exact_mod_cast hca
  have hdaR : 6 * (d : ℝ) ≤ a := by exact_mod_cast hda
  have habR : (a : ℝ) < 5 * b := by exact_mod_cast hab
  have hbaR : (b : ℝ) < 5 * a := by exact_mod_cast hba
  let t : ℝ := 1 / (6 * a)
  have ht : 0 < t := by dsimp [t]; positivity
  have hat : (a : ℝ) * t = 1 / 6 := by dsimp [t]; field_simp
  have hbtlo : (1 / 30 : ℝ) < b * t := by
    dsimp [t]
    rw [mul_one_div]
    apply (lt_div_iff₀ (by positivity : (0 : ℝ) < 6 * a)).mpr
    nlinarith
  have hbthi : (b : ℝ) * t < 5 / 6 := by
    dsimp [t]
    rw [mul_one_div]
    apply (div_lt_iff₀ (by positivity : (0 : ℝ) < 6 * a)).mpr
    nlinarith
  have hct : (c : ℝ) * t ≤ 1 / 36 := by
    dsimp [t]
    rw [mul_one_div]
    apply (div_le_iff₀ (by positivity : (0 : ℝ) < 6 * a)).mpr
    nlinarith
  have hdt : (d : ℝ) * t ≤ 1 / 36 := by
    dsimp [t]
    rw [mul_one_div]
    apply (div_le_iff₀ (by positivity : (0 : ℝ) < 6 * a)).mpr
    nlinarith
  have small (v : ℕ) (hv : 0 < v) (hvt : (v : ℝ) * t ≤ 1 / 36)
      (m : ℝ) (hm₀ : 0 < m) (hm₅ : m ≤ 5) :
      distance ((v : ℝ) * (m * t)) < (1 / 6 : ℝ) := by
    have hvR : (0 : ℝ) < v := by exact_mod_cast hv
    have hx : 0 < (v : ℝ) * (m * t) := by positivity
    have hbnd : (v : ℝ) * (m * t) ≤ 5 / 36 := by nlinarith
    have hz := distance_le_int ((v : ℝ) * (m * t)) 0
    simp only [Int.cast_zero, sub_zero, abs_of_pos hx] at hz
    linarith
  by_cases hsafe : (1 / 6 : ℝ) ≤ distance ((b : ℝ) * t)
  · refine ⟨t, ?_, hsafe, ?_, ?_⟩
    · rw [hat]
      apply distance_lower_of_cell (k := 0) <;> norm_num
    · simpa using small c hc hct 1 (by norm_num) (by norm_num)
    · simpa using small d hd hdt 1 (by norm_num) (by norm_num)
  · have hbt : (b : ℝ) * t < 1 / 6 := by
      by_contra hn
      apply hsafe
      apply distance_lower_of_cell (k := 0)
      · simpa using le_of_not_gt hn
      · norm_num only [Int.cast_zero, sub_zero]
        linarith
    refine ⟨5 * t, ?_, ?_, small c hc hct 5 (by norm_num) le_rfl,
      small d hd hdt 5 (by norm_num) le_rfl⟩
    · have ha5 : (a : ℝ) * (5 * t) = 5 / 6 := by nlinarith [hat]
      rw [ha5]
      apply distance_lower_of_cell (k := 0) <;> norm_num
    · apply distance_lower_of_cell (k := 0) <;>
        norm_num only [Int.cast_zero, sub_zero] <;> nlinarith

end Loneliness.Renault
