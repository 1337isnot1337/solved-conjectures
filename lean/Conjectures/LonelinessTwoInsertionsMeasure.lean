import Conjectures.LonelinessTwoInsertionsInterval
import Conjectures.LonelinessCriticalBase
import Mathlib.MeasureTheory.Integral.IntervalIntegral.Periodic
import Mathlib.MeasureTheory.Measure.Lebesgue.Basic

/-! Exact periodic bad-length bounds on arbitrary real intervals.
The last theorem supplies the analytic cutoff used by the finite rows. -/

namespace Loneliness.TwoInsertions

open MeasureTheory Set
open scoped Interval

noncomputable section

theorem periodic_integral_upper (f : ℝ → ℝ) (T M a b : ℝ)
    (hT : 0 < T) (hf : Function.Periodic f T) (hnonneg : ∀ x, 0 ≤ f x)
    (hInt : ∀ x y, IntervalIntegrable f volume x y)
    (hM : (∫ x in 0..T, f x) = M) :
    (∫ x in a..b, f x) ≤ (b-a)*M/T+M := by
  let g : ℝ → ℝ := fun x => f (x+a)
  have hg : Function.Periodic g T := by
    intro x
    dsimp [g]
    rw [show x+T+a = (x+a)+T by ring]
    exact hf (x+a)
  have hgInt (x y : ℝ) : IntervalIntegrable g volume x y := by
    simpa only [g, add_sub_cancel_right] using (hInt (x+a) (y+a)).comp_add_right a
  have hgM : (∫ x in 0..T, g x) = M := by
    have hper : (∫ x in a..a+T, f x) = M := by
      simpa only [zero_add, hM] using hf.intervalIntegral_add_eq a 0
    dsimp [g]
    rw [intervalIntegral.integral_comp_add_right]
    simpa only [zero_add, add_comm T a] using hper
  have hMnonneg : 0 ≤ M := by
    rw [← hM]
    exact intervalIntegral.integral_nonneg_of_forall hT.le hnonneg
  have hSup : sSup ((fun t : ℝ => ∫ x in 0..t, g x) '' Icc 0 T) ≤ M := by
    apply csSup_le
    · exact ⟨0, 0, ⟨le_rfl, hT.le⟩, by simp⟩
    · rintro y ⟨t, ht, rfl⟩
      rw [← hgM]
      exact intervalIntegral.integral_mono_interval le_rfl ht.1 ht.2
        (Filter.Eventually.of_forall (fun x => hnonneg (x+a))) (hgInt 0 T)
  have h := hg.integral_le_sSup_add_zsmul_of_pos (hgInt 0 T) hT (b-a)
  rw [hgM] at h
  have hfloor := mul_le_mul_of_nonneg_right (Int.floor_le ((b-a)/T)) hMnonneg
  have hshift : (∫ x in 0..b-a, g x) = ∫ x in a..b, f x := by
    dsimp [g]
    rw [intervalIntegral.integral_comp_add_right]
    simp only [zero_add, sub_add_cancel]
  rw [hshift] at h
  simp only [zsmul_eq_mul] at h
  calc
    (∫ x in a..b, f x) ≤ M + ((b-a)/T)*M := by linarith
    _ = (b-a)*M/T+M := by ring

def badIndicator (δ : ℝ) : ℝ → ℝ := by
  classical
  exact {x | distance x ≤ δ}.indicator (fun _ => 1)

theorem badIndicator_nonneg (δ x : ℝ) : 0 ≤ badIndicator δ x := by
  classical
  by_cases h : distance x ≤ δ <;> simp [badIndicator, h]

theorem badIndicator_eq_one {δ x : ℝ} (h : distance x ≤ δ) :
    badIndicator δ x = 1 := by
  classical
  simp [badIndicator, h]

theorem badIndicator_measurableSet (δ : ℝ) : MeasurableSet {x | distance x ≤ δ} :=
  (isClosed_le continuous_distance continuous_const).measurableSet

theorem badIndicator_intervalIntegrable (δ a b : ℝ) :
    IntervalIntegrable (badIndicator δ) volume a b := by
  have h : IntervalIntegrable (fun _ : ℝ => (1 : ℝ)) volume a b :=
    intervalIntegrable_const
  exact ⟨h.1.indicator (badIndicator_measurableSet δ),
    h.2.indicator (badIndicator_measurableSet δ)⟩

theorem badIndicator_periodic (δ : ℝ) : Function.Periodic (badIndicator δ) 1 := by
  classical
  intro x
  have hd : distance (x+1) = distance x := by
    simpa using CriticalFamilies.distance_add_int x 1
  simp only [badIndicator, Set.indicator_apply, mem_ofPred_eq, hd]

theorem distance_on_unit (x : ℝ) (hx : x ∈ Icc (0 : ℝ) 1) :
    distance x = min x (1-x) := by
  rcases lt_or_eq_of_le hx.2 with hx1 | rfl
  · unfold distance
    rw [abs_sub_round_eq_min, Int.fract_eq_self.mpr ⟨hx.1, hx1⟩]
  · norm_num [distance]

theorem badIndicator_integral_one (δ : ℝ) (hδ : 0 ≤ δ) (hhalf : δ < 1/2) :
    (∫ x in 0..1, badIndicator δ x) = 2*δ := by
  classical
  have hset : {x : ℝ | distance x ≤ δ} ∩ Ioc 0 1 = Ioc 0 δ ∪ Icc (1-δ) 1 := by
    ext x
    constructor
    · rintro ⟨hbad, hx0, hx1⟩
      change distance x ≤ δ at hbad
      rw [distance_on_unit x ⟨hx0.le, hx1⟩] at hbad
      rcases min_le_iff.mp hbad with hleft | hright
      · exact Or.inl ⟨hx0, hleft⟩
      · exact Or.inr ⟨by linarith, hx1⟩
    · rintro (hx | hx)
      · have hx1 : x ≤ 1 := by linarith [hx.2]
        refine ⟨?_, hx.1, hx1⟩
        change distance x ≤ δ
        rw [distance_on_unit x ⟨hx.1.le, hx1⟩]
        exact (min_le_left _ _).trans hx.2
      · have hx0 : 0 < x := by linarith [hx.1]
        refine ⟨?_, hx0, hx.2⟩
        change distance x ≤ δ
        rw [distance_on_unit x ⟨hx0.le, hx.2⟩]
        exact (min_le_right _ _).trans (by linarith [hx.1])
  have hd : Disjoint (Ioc (0 : ℝ) δ) (Icc (1-δ) 1) := by
    apply Set.disjoint_left.mpr
    intro x hx hy
    linarith [hx.2, hy.1]
  rw [intervalIntegral.integral_of_le (by norm_num : (0 : ℝ) ≤ 1)]
  change (∫ x in Ioc (0 : ℝ) 1,
    ({x : ℝ | distance x ≤ δ}.indicator (fun _ => (1 : ℝ))) x) = _
  rw [integral_indicator_const (1 : ℝ) (badIndicator_measurableSet δ),
    measureReal_restrict_apply (badIndicator_measurableSet δ), hset,
    measureReal_union hd measurableSet_Icc measure_Ioc_lt_top.ne measure_Icc_lt_top.ne,
    Real.volume_real_Ioc_of_le hδ,
    Real.volume_real_Icc_of_le (by linarith : 1-δ ≤ (1 : ℝ))]
  simp only [smul_eq_mul, mul_one]
  ring

theorem speed_bad_integral_bound (v δ a b : ℝ) (hv : 0 < v)
    (hδ : 0 ≤ δ) (hhalf : δ < 1/2) :
    (∫ t in a..b, badIndicator δ (v*t)) ≤ 2*δ*(b-a)+2*δ/v := by
  have h := periodic_integral_upper (badIndicator δ) 1 (2*δ) (v*a) (v*b)
    (by norm_num) (badIndicator_periodic δ) (badIndicator_nonneg δ)
    (badIndicator_intervalIntegrable δ) (badIndicator_integral_one δ hδ hhalf)
  rw [intervalIntegral.integral_comp_mul_left (badIndicator δ) hv.ne']
  simp only [smul_eq_mul]
  calc
    v⁻¹*(∫ x in v*a..v*b, badIndicator δ x) ≤
        v⁻¹*((v*b-v*a)*(2*δ)/1+2*δ) :=
      mul_le_mul_of_nonneg_left h (inv_nonneg.mpr hv.le)
    _ = 2*δ*(b-a)+2*δ/v := by field_simp [hv.ne']

theorem two_speed_interval_of_length (v w δ a b : ℝ)
    (hv : 0 < v) (hw : 0 < w) (hδ : 0 ≤ δ) (hhalf : δ < 1/2)
    (hab : a ≤ b) (hbound : 4*δ*(b-a)+2*δ/v+2*δ/w < b-a) :
    ∃ t ∈ Icc a b, δ ≤ distance (v*t) ∧ δ ≤ distance (w*t) := by
  classical
  by_contra hn
  have hcover : ∀ t ∈ Icc a b, (1 : ℝ) ≤ badIndicator δ (v*t)+badIndicator δ (w*t) := by
    intro t ht
    by_cases hbad : distance (v*t) ≤ δ
    · rw [badIndicator_eq_one hbad]
      linarith [badIndicator_nonneg δ (w*t)]
    · have hbad' : distance (w*t) ≤ δ := by
        by_contra hw'
        exact hn ⟨t, ht, (lt_of_not_ge hbad).le, (lt_of_not_ge hw').le⟩
      rw [badIndicator_eq_one hbad']
      linarith [badIndicator_nonneg δ (v*t)]
  have hi (u : ℝ) (hu : 0 < u) :
      IntervalIntegrable (fun t => badIndicator δ (u*t)) volume a b := by
    simpa only [mul_div_cancel_left₀ _ hu.ne'] using
      (badIndicator_intervalIntegrable δ (u*a) (u*b)).comp_mul_left (c := u)
  have h := intervalIntegral.integral_mono_on hab intervalIntegrable_const
    ((hi v hv).add (hi w hw)) hcover
  rw [intervalIntegral.integral_add (hi v hv) (hi w hw)] at h
  simp only [intervalIntegral.integral_const, smul_eq_mul, mul_one] at h
  linarith [speed_bad_integral_bound v δ a b hv hδ hhalf,
    speed_bad_integral_bound w δ a b hw hδ hhalf]

theorem window_of_measure (p b c : ℕ) (hp : 3 ≤ p) (hb : 0 < b) (hc : 0 < c)
    (hbound : 4/(p+2 : ℝ)+(p : ℝ)/b+(p : ℝ)/c < 1) :
    TwoSpeedWindow p b c := by
  have hpR : (0 : ℝ) < p := by exact_mod_cast (show 0 < p by omega)
  have hbR : (0 : ℝ) < b := by exact_mod_cast hb
  have hcR : (0 : ℝ) < c := by exact_mod_cast hc
  have hq : (0 : ℝ) < p+2 := by positivity
  have hp3 : (3 : ℝ) ≤ p := by exact_mod_cast hp
  have hwidth : 1/(p : ℝ)-1/(p+2 : ℝ) = 2/((p : ℝ)*(p+2)) := by
    field_simp [hpR.ne', hq.ne']
    ring
  have hpos : (0 : ℝ) < 1/(p : ℝ)-1/(p+2 : ℝ) := by rw [hwidth]; positivity
  have heq : 4*(1/(p+2 : ℝ))*(1/(p : ℝ)-1/(p+2 : ℝ))+
        2*(1/(p+2 : ℝ))/(b : ℝ)+2*(1/(p+2 : ℝ))/(c : ℝ) =
      (4/(p+2 : ℝ)+(p : ℝ)/b+(p : ℝ)/c)*
        (1/(p : ℝ)-1/(p+2 : ℝ)) := by
    rw [hwidth]
    field_simp [hpR.ne', hq.ne', hbR.ne', hcR.ne']
  apply two_speed_interval_of_length (b : ℝ) (c : ℝ) (1/(p+2 : ℝ))
    (1/(p+2 : ℝ)) (1/(p : ℝ)) hbR hcR (by positivity)
  · apply (div_lt_iff₀ hq).mpr
    linarith
  · linarith
  · rw [heq]
    simpa only [one_mul] using mul_lt_mul_of_pos_right hbound hpos

end

end Loneliness.TwoInsertions
