module

public import Conjectures.AgnosticVC.EmpiricalInfimum
public import Mathlib.Probability.Kernel.Composition.MapComap
public import Mathlib.Probability.Kernel.MeasurableIntegral

/-! A repeated labeled sample turns uniform empirical accuracy into measurability of a
projection of the joint evaluation event. This applies to general proper Markov kernels. -/

@[expose] public section

open MeasureTheory ProbabilityTheory
open scoped BigOperators

namespace AgnosticVC

variable {X H : Type*} {n : ℕ}

/-- The sample consisting of `n` copies of an input labeled `true`. -/
def repeatedPositiveSample (n : ℕ) (x : X) : Fin n → X × Bool := fun _ => (x, true)

/-- On a nonempty repeated sample, the empirical loss is the error of its single prediction. -/
theorem empiricalError_repeatedPositiveSample (hn : 0 < n) (predict : H → X → Bool)
    (x : X) (h : H) : empiricalError predict (repeatedPositiveSample n x) h =
      if predict h x = true then 0 else 1 := by
  rw [empiricalError_eq_zeroOne]
  cases hp : predict h x <;>
    simp [repeatedPositiveSample, hp, Nat.cast_ne_zero.mpr hn.ne']

variable [MeasurableSpace X] [MeasurableSpace H]

/-- Empirical loss is integrable under every finite measure on the hypotheses for a jointly
measurable predictor. In particular its Bochner integral is the expected loss of a Markov law. -/
theorem empiricalError_integrable_of_joint_measurable (predict : H → X → Bool)
    (hpred : Measurable (fun p : X × H => predict p.2 p.1))
    (z : Fin n → X × Bool) (μ : Measure H) [IsFiniteMeasure μ] :
    Integrable (empiricalError predict z) μ := by
  rw [funext (empiricalError_eq_zeroOne predict z)]
  apply Integrable.div_const
  apply integrable_finsetSum
  intro i _
  have hm : Measurable (fun h : H => predict h (z i).1) :=
    hpred.comp (measurable_const.prodMk measurable_id)
  have he : MeasurableSet {h : H | predict h (z i).1 = (z i).2} :=
    hm (measurableSet_singleton (z i).2)
  have hf : Measurable (fun h : H => if predict h (z i).1 = (z i).2 then (0 : ℝ) else 1) :=
    Measurable.ite he measurable_const measurable_const
  apply Integrable.of_bound hf.aestronglyMeasurable 1
  filter_upwards with h
  split <;> norm_num

/-- Expected empirical loss on the repeated sample is a measurable function of the input.
The kernel may have an arbitrary probability law on the hypothesis space. -/
theorem measurable_repeatedPositiveExpectedLoss (hn : 0 < n) (predict : H → X → Bool)
    (hpred : Measurable (fun p : X × H => predict p.2 p.1))
    (K : Kernel (Fin n → X × Bool) H) [IsMarkovKernel K] :
    Measurable (fun x : X => ∫ h, empiricalError predict (repeatedPositiveSample n x) h
      ∂K (repeatedPositiveSample n x)) := by
  let z := repeatedPositiveSample (X := X) n
  have hz : Measurable z := Measurable.of_eval fun i => measurable_id.prodMk measurable_const
  let L := K.comap z hz
  have hL : IsMarkovKernel L := inferInstance
  let f := fun p : X × H => if predict p.2 p.1 = true then (0 : ℝ) else 1
  have hf : Measurable f := measurable_const.ite (hpred (measurableSet_singleton true)) measurable_const
  have hm := (hf.stronglyMeasurable.integral_kernel_prod_right' (κ := L)).measurable
  simpa [z, L, f, Kernel.comap_apply, empiricalError_repeatedPositiveSample hn] using hm

/-- Empirical excess strictly below one on all samples forces the positive-prediction
projection of a jointly measurable class to be measurable. No finite-support assumption
on the output laws of the proper learner is needed. -/
theorem measurableSet_exists_predict_true_of_kernel (hn : 0 < n) (predict : H → X → Bool)
    (hpred : Measurable (fun p : X × H => predict p.2 p.1))
    (K : Kernel (Fin n → X × Bool) H) [IsMarkovKernel K] {ε : ℝ} (hε : ε < 1)
    (hacc : ∀ z, (∫ h, empiricalError predict z h ∂K z) ≤
      (⨅ h : H, empiricalError predict z h) + ε) :
    MeasurableSet {x : X | ∃ h : H, predict h x = true} := by
  let loss := fun x : X => ∫ h, empiricalError predict (repeatedPositiveSample n x) h
    ∂K (repeatedPositiveSample n x)
  have hm : Measurable loss := measurable_repeatedPositiveExpectedLoss hn predict hpred K
  have he : {x : X | ∃ h : H, predict h x = true} = {x : X | loss x < 1} := by
    ext x
    simp only [Set.mem_ofPred_eq]
    constructor
    · rintro ⟨h, hh⟩
      have hbelow : BddBelow (Set.range (empiricalError predict (repeatedPositiveSample n x))) := by
        refine ⟨0, ?_⟩
        rintro _ ⟨a, rfl⟩
        rw [empiricalError_repeatedPositiveSample hn]
        split <;> norm_num
      have hmin := ciInf_le hbelow h
      rw [empiricalError_repeatedPositiveSample hn, ite_eq_left hh] at hmin
      have hb := hacc (repeatedPositiveSample n x)
      change loss x ≤ (⨅ h : H, empiricalError predict (repeatedPositiveSample n x) h) + ε at hb
      linarith only [hb, hmin, hε]
    · intro hx
      by_contra! hnpos
      have hh : (fun h => empiricalError predict (repeatedPositiveSample n x) h) = fun _ => 1 := by
        funext h
        rw [empiricalError_repeatedPositiveSample hn, ite_eq_right (hnpos h)]
      change (∫ h, empiricalError predict (repeatedPositiveSample n x) h
        ∂K (repeatedPositiveSample n x)) < 1 at hx
      rw [hh] at hx
      simp at hx
  rw [he]
  exact measurableSet_lt hm measurable_const

/-- The VC-one rate `c * sqrt (1/n)` is strictly below one when `n > c²`. -/
theorem measurableSet_exists_predict_true_of_kernel_rate (predict : H → X → Bool)
    (hpred : Measurable (fun p : X × H => predict p.2 p.1))
    (K : Kernel (Fin n → X × Bool) H) [IsMarkovKernel K] {c : ℝ} (hnc : c^2 < (n : ℝ))
    (hacc : ∀ z, (∫ h, empiricalError predict z h ∂K z) ≤
      (⨅ h : H, empiricalError predict z h) + c * Real.sqrt (1 / (n : ℝ))) :
    MeasurableSet {x : X | ∃ h : H, predict h x = true} := by
  have hnR : 0 < (n : ℝ) := (sq_nonneg c).trans_lt hnc
  have hn : 0 < n := by exact_mod_cast hnR
  have hc : c < Real.sqrt (n : ℝ) := by
    by_contra! h
    have hsq := pow_le_pow_left₀ (Real.sqrt_nonneg (n : ℝ)) h 2
    rw [Real.sq_sqrt hnR.le] at hsq
    exact hnc.not_ge hsq
  have he : c * Real.sqrt (1 / (n : ℝ)) < 1 := by
    rw [Real.sqrt_div (by norm_num), Real.sqrt_one, mul_one_div]
    exact (div_lt_one (Real.sqrt_pos.mpr hnR)).mpr hc
  exact measurableSet_exists_predict_true_of_kernel hn predict hpred K he hacc

end AgnosticVC
