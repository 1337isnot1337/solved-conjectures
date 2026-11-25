module

public import Conjectures.NuttallThetaKernel
public import Mathlib.Analysis.SpecialFunctions.ImproperIntegrals
public import Mathlib.MeasureTheory.Integral.DominatedConvergence

public section
namespace NuttallCumulants

open MeasureTheory

/-- The repeated tail-integral recursion in Nuttall's definition. -/
noncomputable def repeatedTail : ℕ → ℝ → ℝ
  | 0 => thetaKernel
  | n+1 => fun u => ∫ t in Set.Ioi u, repeatedTail n t

private theorem dominated_tail_integrable {f : ℝ → ℝ} {u : ℝ} (hu : 0 ≤ u)
    (hcont : ContinuousOn f (Set.Ici 0))
    (hpos : ∀ t ≥ 0, 0 < f t)
    (hbound : ∀ t ≥ 0, f t ≤ decayConstant * Real.exp (-t)) :
    IntegrableOn f (Set.Ioi u) := by
  have hsub : Set.Ioi u ⊆ Set.Ici (0:ℝ) := fun _ ht => hu.trans (le_of_lt ht)
  refine ((integrableOn_exp_neg_Ioi u).const_mul decayConstant).mono'
    ((hcont.mono hsub).aestronglyMeasurable measurableSet_Ioi) ?_
  filter_upwards [ae_restrict_mem (μ := volume) (measurableSet_Ioi : MeasurableSet (Set.Ioi u))]
    with t ht
  have hnonneg : 0 ≤ t := hsub ht
  rw [Real.norm_eq_abs, abs_of_pos (hpos t hnonneg)]
  exact hbound t hnonneg

/-- Every literal repeated tail retains continuity, positivity, and the same
global exponential majorant. -/
theorem repeatedTail_invariant (m : ℕ) :
    ContinuousOn (repeatedTail m) (Set.Ici 0) ∧
    ∀ u ≥ 0, 0 < repeatedTail m u ∧ repeatedTail m u ≤ decayConstant * Real.exp (-u) := by
  induction m with
  | zero =>
    exact ⟨thetaKernel_continuousOn, fun _ hu => ⟨thetaKernel_pos hu, thetaKernel_le_decay hu⟩⟩
  | succ m ih =>
    have hp : ∀ t ≥ 0, 0 < repeatedTail m t := fun t ht => (ih.2 t ht).1
    have hb : ∀ t ≥ 0, repeatedTail m t ≤ decayConstant * Real.exp (-t) :=
      fun t ht => (ih.2 t ht).2
    have hi {u : ℝ} (hu : 0 ≤ u) := dominated_tail_integrable hu ih.1 hp hb
    refine ⟨(hi le_rfl).continuousOn_Ici_primitive_Ioi, fun u hu => ⟨?_, ?_⟩⟩
    · change 0 < ∫ t in Set.Ioi u, repeatedTail m t
      have hnonneg : 0 ≤ᵐ[volume.restrict (Set.Ioi u)] repeatedTail m := by
        filter_upwards [ae_restrict_mem (μ := volume) (measurableSet_Ioi : MeasurableSet (Set.Ioi u))]
          with t ht
        exact (hp t (hu.trans (le_of_lt ht))).le
      apply (setIntegral_pos_iff_support_of_nonneg_ae hnonneg (hi hu)).2
      have hsub : Set.Ioo u (u+1) ⊆ Function.support (repeatedTail m) ∩ Set.Ioi u := by
        intro t ht
        exact ⟨(hp t (hu.trans ht.1.le)).ne', ht.1⟩
      refine lt_of_lt_of_le ?_ (measure_mono hsub)
      rw [Real.volume_Ioo]
      simp
    · change (∫ t in Set.Ioi u, repeatedTail m t) ≤ decayConstant * Real.exp (-u)
      calc
        _ ≤ ∫ t in Set.Ioi u, decayConstant * Real.exp (-t) :=
          setIntegral_mono_on (hi hu) ((integrableOn_exp_neg_Ioi u).const_mul decayConstant)
            measurableSet_Ioi (fun t ht => hb t (hu.trans (le_of_lt ht)))
        _ = _ := by rw [integral_const_mul, integral_exp_neg_Ioi]

theorem repeatedTail_integrable (m : ℕ) {u : ℝ} (hu : 0 ≤ u) :
    IntegrableOn (repeatedTail m) (Set.Ioi u) :=
  dominated_tail_integrable hu (repeatedTail_invariant m).1
    (fun t ht => ((repeatedTail_invariant m).2 t ht).1)
    (fun t ht => ((repeatedTail_invariant m).2 t ht).2)

/-- The order-one minor for the literal repeated-tail kernel, at every order. -/
theorem repeatedTail_kernel_order_one (m : ℕ) {x y : ℝ} (hx : 0 ≤ x) (hy : 0 ≤ y) :
    0 < repeatedTail m (x+y) :=
  ((repeatedTail_invariant m).2 (x+y) (add_nonneg hx hy)).1

end NuttallCumulants
