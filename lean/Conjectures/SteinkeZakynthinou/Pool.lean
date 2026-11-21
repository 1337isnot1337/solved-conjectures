module

public import Conjectures.SteinkeZakynthinou.Channel
public import Mathlib.Analysis.SpecialFunctions.Log.Basic

/-! Measurability and averaging for the original paired iid supersample. -/

@[expose] public section

open MeasureTheory
open scoped BigOperators

namespace SteinkeZakynthinou

open Learner (selectorMean)

noncomputable def sampleMeasure (n : ℕ) (D : Measure Observation) : Measure (Sample n) :=
  Measure.pi fun _ : Fin n => D

noncomputable def poolMeasure (n : ℕ) (D : Measure Observation) : Measure (Pool n) :=
  Measure.pi fun _ : Fin n => Measure.pi fun _ : Bool => D

instance {n : ℕ} {D : Measure Observation} [IsProbabilityMeasure D] :
    IsProbabilityMeasure (sampleMeasure n D) := by
  unfold sampleMeasure
  infer_instance

instance {n : ℕ} {D : Measure Observation} [IsProbabilityMeasure D] :
    IsProbabilityMeasure (poolMeasure n D) := by
  unfold poolMeasure
  infer_instance

theorem measurable_select {n : ℕ} (s : Selector n) :
    Measurable (fun pool : Pool n => select pool s) :=
  measurable_pi_iff.mpr fun i =>
    (show Measurable (fun r : Bool → Observation => r (s i)) from measurable_pi_apply (s i)).comp
      (show Measurable (fun pool : Pool n => pool i) from measurable_pi_apply i)

theorem measurePreserving_select {n : ℕ} (D : Measure Observation) [IsProbabilityMeasure D]
    (s : Selector n) :
    MeasurePreserving (fun T => select T s) (poolMeasure n D) (sampleMeasure n D) :=
  measurePreserving_pi _ _ (fun i : Fin n => measurePreserving_eval (fun _ : Bool => D) (s i))

theorem integral_select {n : ℕ} (D : Measure Observation) [IsProbabilityMeasure D]
    (s : Selector n) {f : Sample n → ℝ} (hf : Measurable f) :
    (∫ T, f (select T s) ∂poolMeasure n D) = ∫ z, f z ∂sampleMeasure n D := by
  rw [← (measurePreserving_select D s).map_eq, integral_map (measurable_select s).aemeasurable
    hf.aestronglyMeasurable]

theorem measurable_selectorMean {n : ℕ} {X : Type*} [MeasurableSpace X]
    (f : X → Selector n → ℝ) (hf : ∀ s, Measurable (fun x => f x s)) :
    Measurable (fun x => selectorMean (f x)) := by
  unfold selectorMean
  exact (Finset.measurable_sum _ (fun s _ => hf s)).div_const _

namespace Learner

theorem measurable_mass {n : ℕ} (a : Learner n) {X : Type*} [MeasurableSpace X]
    {z : X → Sample n} {t : X → ℝ} (hz : Measurable z) (ht : Measurable t) :
    Measurable (fun x => a.mass (z x) (t x)) := by
  classical
  unfold mass
  apply Finset.measurable_sum
  intro i _
  exact Measurable.ite
    (measurableSet_eq_fun ((a.measurable_threshold i).comp hz) ht)
    ((a.measurable_weight i).comp hz) measurable_const

theorem measurable_poolInformation {n : ℕ} (a : Learner n) :
    Measurable a.poolInformation := by
  unfold poolInformation
  apply measurable_selectorMean
  intro s
  apply Finset.measurable_sum
  intro i _
  have hs := measurable_select s
  have ht := (a.measurable_threshold i).comp hs
  exact ((a.measurable_weight i).comp hs).mul
    (Real.measurable_log.comp ((a.measurable_mass hs ht).div
      (measurable_selectorMean _ (fun v => a.measurable_mass (measurable_select v) ht))))

theorem mass_nonneg {n : ℕ} (a : Learner n) (z : Sample n) (t : ℝ) : 0 ≤ a.mass z t := by
  unfold mass
  exact Finset.sum_nonneg fun i _ => by split; exact a.weight_nonneg z i; exact le_rfl

theorem mass_le_one {n : ℕ} (a : Learner n) (z : Sample n) (t : ℝ) : a.mass z t ≤ 1 := by
  rw [← a.weight_sum z]
  apply Finset.sum_le_sum
  intro i _
  split
  · exact le_rfl
  · exact a.weight_nonneg z i

theorem weight_le_mass {n : ℕ} (a : Learner n) (z : Sample n) (i : Fin a.outcomes) :
    a.weight z i ≤ a.mass z (a.threshold z i) := by
  classical
  unfold mass
  simpa using (Finset.single_le_sum (s := Finset.univ)
    (f := fun j => if a.threshold z j = a.threshold z i then a.weight z j else 0)
    (fun j _ => by split; exact a.weight_nonneg z j; exact le_rfl) (Finset.mem_univ i))

theorem abs_poolInformation_le {n : ℕ} (a : Learner n) (T : Pool n) :
    |a.poolInformation T| ≤ a.outcomes * (1 + Fintype.card (Selector n)) := by
  let N : ℝ := Fintype.card (Selector n)
  have hN : 0 < N := by dsimp [N]; positivity
  have hN1 : 1 ≤ N := by dsimp [N]; exact_mod_cast Fintype.card_pos (α := Selector n)
  unfold poolInformation selectorMean
  apply (abs_div _ _).trans_le
  rw [abs_of_pos hN]
  apply (div_le_div_of_nonneg_right (Finset.abs_sum_le_sum_abs _ _) hN.le).trans
  calc
    _ ≤ (∑ _ : Selector n, (a.outcomes : ℝ) * (1 + N)) / N := by
      apply div_le_div_of_nonneg_right _ hN.le
      apply Finset.sum_le_sum
      intro s _
      apply (Finset.abs_sum_le_sum_abs _ _).trans
      have he : (∑ _ : Fin a.outcomes, (1 + N)) = a.outcomes * (1 + N) := by
        simp only [Finset.sum_const, Finset.card_univ, Fintype.card_fin, nsmul_eq_mul]
      rw [← he]
      apply Finset.sum_le_sum
      intro i _
      let z := select T s
      let t := a.threshold z i
      let w := a.weight z i
      let p := a.mass z t
      let q := selectorMean (fun v => a.mass (select T v) t)
      change |w * Real.log (p / q)| ≤ 1 + N
      have hw := a.weight_nonneg z i
      rcases hw.eq_or_lt with hw | hw
      · rw [show w = 0 from hw.symm, zero_mul, abs_zero]
        positivity
      have hwp : w ≤ p := a.weight_le_mass z i
      have hp : 0 < p := hw.trans_le hwp
      have hp1 : p ≤ 1 := a.mass_le_one z t
      have hqp : p / N ≤ q := div_le_div_of_nonneg_right
        (Finset.single_le_sum (f := fun v => a.mass (select T v) t)
          (fun v _ => a.mass_nonneg (select T v) t) (Finset.mem_univ s)) hN.le
      have hq := (div_pos hp hN).trans_le hqp
      have hq1 : q ≤ 1 :=
        (selectorMean_mono (fun v => a.mass_le_one (select T v) t)).trans
          (le_of_eq (selectorMean_const 1))
      have hup : p / q ≤ N := by
        rw [div_le_iff₀ hq, mul_comm]
        exact (div_le_iff₀ hN).mp hqp
      have hlow : w ≤ p / q := hwp.trans (le_div_iff₀ hq |>.mpr (by nlinarith))
      have hlog := Real.log_le_log hw hlow
      have hlo := mul_le_mul_of_nonneg_left hlog hw.le
      have hneg := Real.abs_log_mul_self_lt w hw (hwp.trans hp1)
      have hh := (Real.log_le_log (div_pos hp hq) hup).trans (Real.log_le_self hN.le)
      have hu := mul_le_mul_of_nonneg_left hh hw.le
      exact abs_le.mpr ⟨by linarith [(abs_lt.mp hneg).1], by nlinarith⟩
    _ = _ := by
      rw [Finset.sum_const, Finset.card_univ, nsmul_eq_mul, mul_comm, mul_div_cancel_right₀ _ hN.ne']

theorem integrable_poolInformation {n : ℕ} (a : Learner n) (D : Measure Observation)
    [IsProbabilityMeasure D] : Integrable a.poolInformation (poolMeasure n D) :=
  Integrable.of_bound a.measurable_poolInformation.aestronglyMeasurable _
    (Filter.Eventually.of_forall (fun T => by
      rw [Real.norm_eq_abs]
      exact a.abs_poolInformation_le T))

end Learner
end SteinkeZakynthinou
