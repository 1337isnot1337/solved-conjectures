import Conjectures.SteinerbergerFeldheimLaw
import Mathlib.Probability.Independence.Basic

/-!
# Steinerberger's quantitative Feldheim-tail conjecture

The original joint event ratio, on the product of two copies of the explicitly
constructed probability law, and its exact reduction to the analytic integral.
-/

open Set MeasureTheory Real Filter
open scoped Topology ENNReal

namespace Conjectures.SteinerbergerFeldheim

def numeratorEvent (z : ℝ) : Set (ℝ × ℝ) :=
  {p | 2 * z ≤ p.1 + p.2 ∧ min p.1 p.2 ≤ z}

def denominatorEvent (z : ℝ) : Set (ℝ × ℝ) :=
  {p | 2 * z ≤ p.1 + p.2 ∧ z ≤ min p.1 p.2}

def crossingEvent (z : ℝ) : Set (ℝ × ℝ) :=
  {p | p.1 ≤ z ∧ 2 * z ≤ p.1 + p.2}

def crossingEvent' (z : ℝ) : Set (ℝ × ℝ) :=
  {p | p.2 ≤ z ∧ 2 * z ≤ p.1 + p.2}

noncomputable def crossingIntegral (z : ℝ) : ℝ :=
  ∫ x in (0 : ℝ)..z, density x * survival (2 * z - x)

lemma measurableSet_crossingEvent (z : ℝ) : MeasurableSet (crossingEvent z) := by
  unfold crossingEvent
  exact (measurable_fst measurableSet_Iic).inter
    (measurableSet_le measurable_const (measurable_fst.add measurable_snd))

lemma measurableSet_crossingEvent' (z : ℝ) : MeasurableSet (crossingEvent' z) := by
  unfold crossingEvent'
  exact (measurable_snd measurableSet_Iic).inter
    (measurableSet_le measurable_const (measurable_fst.add measurable_snd))

lemma crossingIntegral_nonneg {z : ℝ} (hz : 0 ≤ z) : 0 ≤ crossingIntegral z := by
  unfold crossingIntegral
  apply intervalIntegral.integral_nonneg hz
  intro x hx
  exact mul_nonneg (density_pos hx.1).le (survival_pos _).le

lemma crossingEvent_measure {z : ℝ} (hz : 0 ≤ z) :
    (law.prod law) (crossingEvent z) = ENNReal.ofReal (crossingIntegral z) := by
  rw [Measure.prod_apply (measurableSet_crossingEvent z)]
  have hsection (x : ℝ) : law (Prod.mk x ⁻¹' crossingEvent z) =
      (Iic z).indicator (fun x => law (Ici (2 * z - x))) x := by
    by_cases hx : x ≤ z
    · rw [indicator_of_mem (show x ∈ Iic z from hx)]
      congr 1
      ext y
      simp only [crossingEvent, mem_preimage, mem_ofPred_eq, mem_Ici]
      constructor
      · rintro ⟨_, hxy⟩
        linarith
      · intro hy
        exact ⟨hx, by linarith⟩
    · rw [indicator_of_notMem (show x ∉ Iic z from hx)]
      have he : Prod.mk x ⁻¹' crossingEvent z = ∅ := by
        ext y
        simp [crossingEvent, hx]
      simp [he]
  simp_rw [hsection]
  rw [lintegral_indicator measurableSet_Iic]
  calc
    _ = ∫⁻ x in Iic z, ENNReal.ofReal (survival (2 * z - x)) ∂law := by
      apply setLIntegral_congr_fun measurableSet_Iic
      intro x hx
      exact law_Ici (by have hx' : x ≤ z := hx; linarith)
    _ = ∫⁻ x in Ioc (0 : ℝ) z,
        ENNReal.ofReal (density x) * ENNReal.ofReal (survival (2 * z - x)) := by
      unfold law
      rw [setLIntegral_withDensity_eq_lintegral_mul₀ (by fun_prop) (by fun_prop) measurableSet_Iic,
        Measure.restrict_restrict measurableSet_Iic]
      have hi : Iic z ∩ Ioi (0 : ℝ) = Ioc 0 z := by ext x; simp only [mem_inter_iff, mem_Iic, mem_Ioi, mem_Ioc]; tauto
      rw [hi]
      rfl
    _ = ∫⁻ x in Ioc (0 : ℝ) z, ENNReal.ofReal (density x * survival (2 * z - x)) := by
      apply setLIntegral_congr_fun measurableSet_Ioc
      intro x hx
      exact (ENNReal.ofReal_mul (density_pos hx.1.le).le).symm
    _ = ENNReal.ofReal (∫ x in Ioc (0 : ℝ) z, density x * survival (2 * z - x)) := by
      symm
      apply ofReal_integral_eq_lintegral_ofReal
      · exact (by fun_prop : Continuous (fun x => density x * survival (2 * z - x))).integrableOn_Ioc
      · filter_upwards [ae_restrict_mem measurableSet_Ioc] with x hx
        exact mul_nonneg (density_pos hx.1.le).le (survival_pos _).le
    _ = _ := by rw [crossingIntegral, intervalIntegral.integral_of_le hz]

lemma crossingEvent'_measure (z : ℝ) :
    (law.prod law) (crossingEvent' z) = (law.prod law) (crossingEvent z) := by
  rw [Measure.prod_apply_symm (measurableSet_crossingEvent' z),
    Measure.prod_apply (measurableSet_crossingEvent z)]
  apply lintegral_congr
  intro x
  congr 1
  ext y
  simp [crossingEvent, crossingEvent', add_comm]

lemma numeratorEvent_eq (z : ℝ) : numeratorEvent z = crossingEvent z ∪ crossingEvent' z := by
  ext p
  simp only [numeratorEvent, crossingEvent, crossingEvent', mem_ofPred_eq, mem_union, min_le_iff]
  tauto

lemma crossingEvents_inter_null (z : ℝ) :
    (law.prod law) (crossingEvent z ∩ crossingEvent' z) = 0 := by
  apply measure_mono_null (t := ({z} : Set ℝ) ×ˢ univ)
  · intro p hp
    have hp1 := hp.1.1
    have hp2 := hp.2.1
    have hp3 := hp.1.2
    simp only [mem_prod, mem_singleton_iff, mem_univ, and_true]
    linarith
  · rw [Measure.prod_prod, measure_singleton, zero_mul]

lemma numeratorEvent_measure {z : ℝ} (hz : 0 ≤ z) :
    (law.prod law) (numeratorEvent z) = ENNReal.ofReal (2 * crossingIntegral z) := by
  rw [numeratorEvent_eq, measure_union₀ (measurableSet_crossingEvent' z).nullMeasurableSet
    (crossingEvents_inter_null z), crossingEvent'_measure, crossingEvent_measure hz]
  rw [← ENNReal.ofReal_add (crossingIntegral_nonneg hz) (crossingIntegral_nonneg hz)]
  congr 1
  ring

lemma denominatorEvent_eq (z : ℝ) : denominatorEvent z = Ici z ×ˢ Ici z := by
  ext p
  simp only [denominatorEvent, mem_ofPred_eq, le_min_iff, mem_prod, mem_Ici]
  constructor
  · exact fun hp => hp.2
  · rintro ⟨hx, hy⟩
    exact ⟨by linarith, hx, hy⟩

lemma denominatorEvent_measure {z : ℝ} (hz : 0 ≤ z) :
    (law.prod law) (denominatorEvent z) = ENNReal.ofReal (survival z ^ 2) := by
  rw [denominatorEvent_eq, Measure.prod_prod, law_Ici hz, ← ENNReal.ofReal_mul (survival_pos z).le]
  congr 1
  ring

lemma crossing_integrand_identity (z t : ℝ) :
    density (z - z * t) * survival (2 * z - (z - z * t)) =
      survival z ^ 2 * ((1 + z / 100 * (1 - t)) * exp (-(z ^ 2 / 100) * t ^ 2)) := by
  have he : survival (z - z * t) * survival (2 * z - (z - z * t)) =
      survival z ^ 2 * exp (-(z ^ 2 / 100) * t ^ 2) := by
    unfold survival
    simp only [pow_two]
    rw [← exp_add, ← exp_add, ← exp_add]
    congr 1
    ring
  unfold density
  rw [mul_assoc, he]
  ring

lemma crossingIntegral_eq (z : ℝ) :
    crossingIntegral z = z * survival z ^ 2 * tailIntegral z := by
  have hsub := intervalIntegral.smul_integral_comp_sub_mul
    (fun x => density x * survival (2 * z - x)) (a := (0 : ℝ)) (b := 1) z z
  simp only [mul_one, sub_self, mul_zero, sub_zero, smul_eq_mul] at hsub
  unfold crossingIntegral
  rw [← hsub]
  simp_rw [crossing_integrand_identity]
  rw [intervalIntegral.integral_const_mul]
  unfold tailIntegral
  ring

/-- The ratio appearing verbatim in the two original conjectures, evaluated
on the product probability measure, so its coordinates are iid. -/
noncomputable def eventRatio (μ : Measure ℝ) (z : ℝ) : ℝ :=
  (μ.prod μ).real (numeratorEvent z) / (μ.prod μ).real (denominatorEvent z)

lemma eventRatio_eq {z : ℝ} (hz : 0 ≤ z) : eventRatio law z = 2 * z * tailIntegral z := by
  unfold eventRatio Measure.real
  rw [numeratorEvent_measure hz, denominatorEvent_measure hz,
    ENNReal.toReal_ofReal (mul_nonneg (by norm_num) (crossingIntegral_nonneg hz)),
    ENNReal.toReal_ofReal (sq_nonneg _), crossingIntegral_eq]
  have hs : survival z ≠ 0 := (survival_pos z).ne'
  field_simp

lemma denominatorEvent_pos (z : ℝ) (hz : 0 ≤ z) :
    0 < (law.prod law).real (denominatorEvent z) := by
  unfold Measure.real
  rw [denominatorEvent_measure hz, ENNReal.toReal_ofReal (sq_nonneg _)]
  exact sq_pos_of_pos (survival_pos z)

lemma coordinates_independent :
    ProbabilityTheory.IndepFun (Prod.fst : ℝ × ℝ → ℝ) Prod.snd (law.prod law) := by
  exact ProbabilityTheory.indepFun_prod (X := id) (Y := id) measurable_id measurable_id

lemma coordinates_identically_distributed :
    Measure.map (Prod.fst : ℝ × ℝ → ℝ) (law.prod law) = law ∧
    Measure.map (Prod.snd : ℝ × ℝ → ℝ) (law.prod law) = law := by
  simp

end Conjectures.SteinerbergerFeldheim
