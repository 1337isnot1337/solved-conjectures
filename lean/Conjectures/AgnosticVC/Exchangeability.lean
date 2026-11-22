module

public import Mathlib.Data.Fintype.Perm
public import Mathlib.MeasureTheory.Constructions.Pi
public import Mathlib.MeasureTheory.Integral.Bochner.Basic

/-! Exchangeability transfers a permutation-averaged finite-pool bound to an iid law. -/

@[expose] public section

open MeasureTheory
open scoped BigOperators

namespace AgnosticVC

variable {ι X : Type*} [Fintype ι] [DecidableEq ι] [MeasurableSpace X]

/-- Uniformly permute the named positions of a fixed observation pool. -/
noncomputable def permMean (f : (ι → X) → ℝ) (z : ι → X) : ℝ :=
  (∑ e : Equiv.Perm ι, f (MeasurableEquiv.piCongrLeft (fun _ : ι => X) e z)) /
    Fintype.card (Equiv.Perm ι)

/-- Permuting a fixed pool before evaluating an integrable statistic leaves its
expectation under every iid probability law unchanged. -/
theorem integral_permMean (D : Measure X) [IsProbabilityMeasure D]
    {f : (ι → X) → ℝ} (hf : Integrable f (Measure.pi fun _ : ι => D)) :
    (∫ z, permMean f z ∂Measure.pi (fun _ : ι => D)) =
      ∫ z, f z ∂Measure.pi (fun _ : ι => D) := by
  classical
  let μ := Measure.pi fun _ : ι => D
  let g (e : Equiv.Perm ι) := MeasurableEquiv.piCongrLeft (fun _ : ι => X) e
  have mp (e : Equiv.Perm ι) : MeasurePreserving (g e) μ μ :=
    measurePreserving_piCongrLeft (fun _ : ι => D) e
  have hgi (e : Equiv.Perm ι) : Integrable (fun z => f (g e z)) μ :=
    (mp e).integrable_comp_of_integrable hf
  change (∫ z, (∑ e : Equiv.Perm ι, f (g e z)) / _ ∂μ) = ∫ z, f z ∂μ
  rw [integral_div, integral_finsetSum _ (fun e _ => hgi e)]
  simp only [(mp _).integral_comp' f, Finset.sum_const, Finset.card_univ, nsmul_eq_mul]
  exact mul_div_cancel_left₀ _ (Nat.cast_ne_zero.mpr Fintype.card_ne_zero)

/-- The finite-pool hypothesis averages over the permutation. It need not hold
for a particular pairing of the positions of the deterministic pool. -/
theorem integral_le_of_permMean_le (D : Measure X) [IsProbabilityMeasure D]
    {f : (ι → X) → ℝ} {C : ℝ} (hf : Integrable f (Measure.pi fun _ : ι => D))
    (h : ∀ z, permMean f z ≤ C) :
    (∫ z, f z ∂Measure.pi (fun _ : ι => D)) ≤ C := by
  classical
  have hi (e : Equiv.Perm ι) : Integrable
      (fun z => f (MeasurableEquiv.piCongrLeft (fun _ : ι => X) e z))
      (Measure.pi fun _ : ι => D) :=
    (measurePreserving_piCongrLeft (fun _ : ι => D) e).integrable_comp_of_integrable hf
  have hmean : Integrable (permMean f) (Measure.pi fun _ : ι => D) :=
    (integrable_finsetSum _ (fun e _ => hi e)).div_const _
  rw [← integral_permMean D hf]
  simpa using integral_mono hmean (integrable_const C) h

end AgnosticVC
