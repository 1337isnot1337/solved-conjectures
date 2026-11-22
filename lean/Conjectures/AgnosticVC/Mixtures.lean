module

public import Conjectures.AgnosticVC.Information
public import Conjectures.AgnosticVC.Optimizer
public import Mathlib.MeasureTheory.Integral.Bochner.Basic

/-! Squared Hellinger distance contracts when a shared random weight is hidden. -/

@[expose] public section

open MeasureTheory
open scoped BigOperators

namespace AgnosticVC

private theorem sqrt_affinity_le {Ω : Type*} [MeasurableSpace Ω] {μ : Measure Ω}
    [IsProbabilityMeasure μ] {f g : Ω → ℝ} (hf : Measurable f) (hg : Measurable g)
    (hf0 : ∀ u, 0 ≤ f u) (hf1 : ∀ u, f u ≤ 1)
    (hg0 : ∀ u, 0 ≤ g u) (hg1 : ∀ u, g u ≤ 1) :
    (∫ u, Real.sqrt (f u) * Real.sqrt (g u) ∂μ) ≤
      Real.sqrt (∫ u, f u ∂μ) * Real.sqrt (∫ u, g u ∂μ) := by
  have lp (a : Ω → ℝ) (ham : Measurable a) (h1 : ∀ u, a u ≤ 1) :
      MemLp (fun u => Real.sqrt (a u)) (ENNReal.ofReal (2:ℝ)) μ := by
    apply MemLp.of_bound (Real.continuous_sqrt.measurable.comp ham).aestronglyMeasurable 1
    filter_upwards with u
    change ‖Real.sqrt (a u)‖ ≤ 1
    rw [Real.norm_of_nonneg (Real.sqrt_nonneg _)]
    simpa using Real.sqrt_le_sqrt (h1 u)
  have h := integral_mul_le_Lp_mul_Lq_of_nonneg (μ := μ)
    (show (2:ℝ).HolderConjugate 2 by rw [Real.holderConjugate_iff]; norm_num)
    (Filter.Eventually.of_forall fun u => Real.sqrt_nonneg (f u))
    (Filter.Eventually.of_forall fun u => Real.sqrt_nonneg (g u)) (lp f hf hf1) (lp g hg hg1)
  rw [Real.sqrt_eq_rpow (∫ u, f u ∂μ), Real.sqrt_eq_rpow (∫ u, g u ∂μ)]
  simpa only [Real.rpow_two, Real.sq_sqrt (hf0 _), Real.sq_sqrt (hg0 _)] using h

/-- The law used to mix both channels can be continuous. -/
theorem hellingerSq_mixture_le {Ω α : Type*} [MeasurableSpace Ω] [Fintype α]
    (μ : Measure Ω) [IsProbabilityMeasure μ] (p q : Ω → α → ℝ)
    (hp : ∀ u, IsLaw (p u)) (hq : ∀ u, IsLaw (q u))
    (mp : ∀ a, Measurable fun u => p u a) (mq : ∀ a, Measurable fun u => q u a) :
    hellingerSq (fun a => ∫ u, p u a ∂μ) (fun a => ∫ u, q u a ∂μ) ≤
      ∫ u, hellingerSq (p u) (q u) ∂μ := by
  have bounded (f : Ω → ℝ) (hf : Measurable f) (h0 : ∀ u, 0 ≤ f u) (h1 : ∀ u, f u ≤ 1) :
      Integrable f μ := Integrable.of_bound hf.aestronglyMeasurable 1
        (Filter.Eventually.of_forall fun u => (Real.norm_of_nonneg (h0 u)).le.trans (h1 u))
  have sqle (x : ℝ) (hx : x ≤ 1) : Real.sqrt x ≤ 1 := by
    simpa using Real.sqrt_le_sqrt hx
  have si (a : α) : Integrable (fun u => (Real.sqrt (p u a) - Real.sqrt (q u a))^2) μ := by
    apply bounded _ (((Real.continuous_sqrt.measurable.comp (mp a)).sub
      (Real.continuous_sqrt.measurable.comp (mq a))).pow_const 2)
      (fun u => sq_nonneg _)
    intro u
    have hx := sqle _ ((hp u).le_one a)
    have hy := sqle _ ((hq u).le_one a)
    have hm : |Real.sqrt (p u a) - Real.sqrt (q u a)| ≤ 1 :=
      abs_le.mpr ⟨by linarith [Real.sqrt_nonneg (p u a)], by linarith [Real.sqrt_nonneg (q u a)]⟩
    simpa [sq_abs] using pow_le_pow_left₀ (abs_nonneg _) hm 2
  unfold hellingerSq
  rw [integral_finsetSum _ (fun a _ => si a)]
  apply Finset.sum_le_sum
  intro a _
  have pi := bounded _ (mp a) (fun u => (hp u).1 a) (fun u => (hp u).le_one a)
  have qi := bounded _ (mq a) (fun u => (hq u).1 a) (fun u => (hq u).le_one a)
  let pair := fun u => Real.sqrt (p u a) * Real.sqrt (q u a)
  have bi : Integrable pair μ := bounded pair
    ((Real.continuous_sqrt.measurable.comp (mp a)).mul (Real.continuous_sqrt.measurable.comp (mq a)))
    (fun u => mul_nonneg (Real.sqrt_nonneg _) (Real.sqrt_nonneg _))
    (fun u => by
      simpa [pair] using (mul_le_mul (sqle _ ((hp u).le_one a)) (sqle _ ((hq u).le_one a))
        (Real.sqrt_nonneg _) zero_le_one))
  have hx (u : Ω) : (Real.sqrt (p u a) - Real.sqrt (q u a))^2 =
      p u a + q u a - 2 * pair u := by
    dsimp [pair]
    nlinarith [Real.sq_sqrt ((hp u).1 a), Real.sq_sqrt ((hq u).1 a)]
  simp_rw [hx]
  rw [integral_sub (f := fun u => p u a + q u a) (g := fun u => 2 * pair u) (pi.add qi) (bi.const_mul 2),
    integral_add (f := fun u => p u a) (g := fun u => q u a) pi qi, integral_const_mul]
  have h := sqrt_affinity_le (μ := μ) (mp a) (mq a) (fun u => (hp u).1 a) (fun u => (hp u).le_one a)
    (fun u => (hq u).1 a) (fun u => (hq u).le_one a)
  change (∫ u, pair u ∂μ) ≤ _ at h
  nlinarith [Real.sq_sqrt (integral_nonneg (μ := μ) fun u => (hp u).1 a),
             Real.sq_sqrt (integral_nonneg (μ := μ) fun u => (hq u).1 a)]

end AgnosticVC
