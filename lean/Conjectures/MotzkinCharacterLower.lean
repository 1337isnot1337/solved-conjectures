import Conjectures.MotzkinMeasure
import Mathlib.MeasureTheory.Group.AddCircle
import Mathlib.MeasureTheory.Integral.Prod
import Mathlib.Analysis.Normed.Group.AddCircle
import Mathlib.Tactic.Abel

/-! Averaging circle windows proves the character lower bound without
classifying the closed image of the character. -/
namespace Motzkin

open MeasureTheory MeasureTheory.Measure Metric

variable {G : Type*} [AddCommGroup G] [MeasurableSpace G]

def characterBall (χ : G →+ UnitAddCircle) (r : ℝ) (t : UnitAddCircle) : Set G :=
  χ ⁻¹' ball t (r/2)

theorem measurableSet_characterBall (χ : G →+ UnitAddCircle) (hχ : Measurable χ)
    (r : ℝ) (t : UnitAddCircle) : MeasurableSet (characterBall χ r t) :=
  measurableSet_ball.preimage hχ

omit [MeasurableSpace G] in
theorem characterBall_avoids_step (χ : G →+ UnitAddCircle) (r : ℝ) (t : UnitAddCircle)
    (a : G) (ha : r ≤ ‖χ a‖) : ∀ x ∈ characterBall χ r t, x+a ∉ characterBall χ r t := by
  intro x hx hxa
  change dist (χ x) t < r/2 at hx
  change dist (χ (x+a)) t < r/2 at hxa
  have he : dist (χ (x+a)) (χ x)=‖χ a‖ := by
    rw [dist_eq_norm,map_add]
    congr 1
    abel
  have hh := dist_triangle (χ (x+a)) t (χ x)
  rw [he,dist_comm t (χ x)] at hh
  linarith

omit [AddCommGroup G] [MeasurableSpace G] in
theorem circle_ball_measure (r : ℝ) (hr0 : 0 ≤ r) (hr1 : r ≤ 1) :
    (volume : Measure UnitAddCircle).real (ball 0 (r/2))=r := by
  unfold Measure.real
  rw [← measure_congr (AddCircle.closedBall_ae_eq_ball (x:=(0:UnitAddCircle)) (ε:=r/2)),
    AddCircle.volume_closedBall]
  have he : 2*(r/2)=r := by ring
  rw [he,min_eq_right hr1,ENNReal.toReal_ofReal hr0]

omit [MeasurableSpace G] in
theorem indicator_characterBall (χ : G →+ UnitAddCircle) (r : ℝ) (t : UnitAddCircle) (x : G) :
    indicator (characterBall χ r t) x = indicator (ball (0:UnitAddCircle) (r/2)) (t-χ x) := by
  classical
  have he : x ∈ characterBall χ r t ↔ t-χ x ∈ ball (0:UnitAddCircle) (r/2) := by
    change dist (χ x) t < r/2 ↔ dist (t-χ x) 0 < r/2
    rw [dist_comm (χ x) t,dist_eq_norm,dist_zero_right]
  simp only [indicator,Set.indicator_apply,he]

/-- A translated circle window captures at least its length under any
probability measure on the source. -/
theorem exists_characterBall_measure (μ : Measure G) [IsProbabilityMeasure μ]
    (χ : G →+ UnitAddCircle) (hχ : Measurable χ) (r : ℝ) (hr0 : 0 ≤ r) (hr1 : r ≤ 1) :
    ∃ t : UnitAddCircle, r ≤ μ.real (characterBall χ r t) := by
  classical
  let : IsProbabilityMeasure (volume : Measure UnitAddCircle) := ⟨UnitAddCircle.measure_univ⟩
  let C : Set UnitAddCircle := ball 0 (r/2)
  have hC : MeasurableSet C := measurableSet_ball
  let E : Set (UnitAddCircle × G) := {p | p.1-χ p.2 ∈ C}
  have hE : MeasurableSet E := hC.preimage (measurable_fst.sub (hχ.comp measurable_snd))
  let F : UnitAddCircle → G → ℝ := fun t x => indicator C (t-χ x)
  have hF : Integrable (Function.uncurry F) ((volume : Measure UnitAddCircle).prod μ) :=
    (integrable_const (1:ℝ)).indicator hE
  have hinner : ∀ x : G, (∫ t, F t x)=r := by
    intro x
    change (∫ t : UnitAddCircle, indicator C (t-χ x))=r
    rw [integral_sub_right_eq_self,integral_indicator volume hC]
    exact circle_ball_measure r hr0 hr1
  have havg : (∫ t : UnitAddCircle, ∫ x, F t x ∂μ)=r := by
    rw [integral_integral_swap hF]
    simp only [hinner]
    simp
  have hfiber : ∀ t : UnitAddCircle, (∫ x, F t x ∂μ)=μ.real (characterBall χ r t) := by
    intro t
    have he : (fun x => F t x)=indicator (characterBall χ r t) := by
      funext x
      exact (indicator_characterBall χ r t x).symm
    rw [he,integral_indicator μ (measurableSet_characterBall χ hχ r t)]
  obtain ⟨t,ht⟩ := exists_integral_le hF.integral_prod_left
  simp only [Function.uncurry] at ht
  rw [havg,hfiber t] at ht
  exact ⟨t,ht⟩

/-- Every measurable circle character gives a Borel/measurable avoiding set
of at least the claimed character value. -/
theorem character_lower_bound (μ : Measure G) [IsProbabilityMeasure μ]
    (χ : G →+ UnitAddCircle) (hχ : Measurable χ) (a b : G) :
    ∃ A : Set G, MeasurableSet A ∧ Avoids A a b ∧ min ‖χ a‖ ‖χ b‖ ≤ μ.real A := by
  let r : ℝ := min ‖χ a‖ ‖χ b‖
  have hr0 : 0 ≤ r := le_min (norm_nonneg _) (norm_nonneg _)
  have hr1 : r ≤ 1 := by
    have ha := AddCircle.norm_le_half_period (1:ℝ) (x:=χ a) (by norm_num)
    have hh : r ≤ ‖χ a‖ := min_le_left _ _
    norm_num only [abs_one] at ha
    linarith
  obtain ⟨t,ht⟩ := exists_characterBall_measure μ χ hχ r hr0 hr1
  refine ⟨characterBall χ r t,measurableSet_characterBall χ hχ r t,?_,ht⟩
  intro x hx
  exact ⟨characterBall_avoids_step χ r t a (min_le_left _ _) x hx,
    characterBall_avoids_step χ r t b (min_le_right _ _) x hx⟩

end Motzkin
