module

public import Conjectures.AgnosticVC.PairedDeletion

/-! An order-preserving transfer from a common-block deletion sum to the iid
selector experiment, counting both neighbors of each sample row. -/

@[expose] public section

open MeasureTheory SteinkeZakynthinou
open SteinkeZakynthinou.Learner (selectorMean)
open scoped BigOperators

namespace AgnosticVC

theorem integral_subtuple {I K Z : Type*} [Fintype I] [Fintype K] [MeasurableSpace Z]
    (D : Measure Z) [IsProbabilityMeasure D] (e : K → I) (he : Function.Injective e)
    {f : (K → Z) → ℝ} (hf : Integrable f (Measure.pi fun _ : K => D)) :
    (∫ z, f (z ∘ e) ∂Measure.pi (fun _ : I => D)) = ∫ z, f z ∂Measure.pi (fun _ : K => D) := by
  have mp := measurePreserving_subtuple D e he
  rw [← mp.map_eq] at hf ⊢
  exact (integral_map mp.measurable.aemeasurable hf.aestronglyMeasurable).symm

private theorem mean_integrable {n : ℕ} {Z : Type*} [MeasurableSpace Z] {μ : Measure Z}
    (f : Selector n → Z → ℝ) (hf : ∀ s, Integrable (f s) μ) :
    Integrable (fun z => selectorMean (fun s => f s z)) μ := by
  unfold selectorMean
  exact (integrable_finsetSum _ (fun s _ => hf s)).div_const _

private theorem integral_mean {n : ℕ} {Z : Type*} [MeasurableSpace Z] {μ : Measure Z}
    (f : Selector n → Z → ℝ) (hf : ∀ s, Integrable (f s) μ) :
    (∫ z, selectorMean (fun s => f s z) ∂μ) = selectorMean (fun s => ∫ z, f s z ∂μ) := by
  unfold selectorMean
  rw [integral_div, integral_finsetSum _ (fun s _ => hf s)]

/-- All row unions have the same iid law. The two neighboring deletion positions
are counted at most twice, so even an order-dependent charge obeys this transfer. -/
theorem paired_integral_le_of_deletion_sum {Z : Type*} [MeasurableSpace Z] {n : ℕ}
    (D : Measure Z) [IsProbabilityMeasure D]
    (F : (Fin n × Bool → Z) → ℝ) (c : Fin (n+1) → (Fin (n+1) → Z) → ℝ)
    (hF : Integrable F (Measure.pi fun _ : Fin n × Bool => D))
    (hc : ∀ j, Integrable (c j) (Measure.pi fun _ : Fin (n+1) => D))
    (hc0 : ∀ j T, 0 ≤ c j T) {K : ℝ} (hK : ∀ T, ∑ j, c j T ≤ K)
    (hp : ∀ z, F z ≤ ∑ i : Fin n, selectorMean fun s =>
      2 * (c i.castSucc (z ∘ unionIndex i s) + c i.succ (z ∘ unionIndex i s))) :
    (∫ z, F z ∂Measure.pi (fun _ : Fin n × Bool => D)) ≤ 4 * K := by
  let ν := Measure.pi fun _ : Fin (n+1) => D
  let μ := Measure.pi fun _ : Fin n × Bool => D
  let a (j : Fin (n+1)) := ∫ T, c j T ∂ν
  let g (i : Fin n) (s : Selector n) (z : Fin n × Bool → Z) :=
    2 * (c i.castSucc (z ∘ unionIndex i s) + c i.succ (z ∘ unionIndex i s))
  have cInt (j : Fin (n+1)) (i : Fin n) (s : Selector n) :
      Integrable (fun z => c j (z ∘ unionIndex i s)) μ :=
    (measurePreserving_subtuple D _ (unionIndex_injective i s)).integrable_comp_of_integrable (hc j)
  have gi (i : Fin n) (s : Selector n) : Integrable (g i s) μ :=
    ((cInt i.castSucc i s).add (cInt i.succ i s)).const_mul 2
  have ig (i : Fin n) (s : Selector n) : (∫ z, g i s z ∂μ) = 2 * (a i.castSucc + a i.succ) := by
    dsimp only [g, a]
    rw [integral_const_mul, integral_add (f := fun z => c i.castSucc (z ∘ unionIndex i s))
      (g := fun z => c i.succ (z ∘ unionIndex i s)) (cInt _ _ _) (cInt _ _ _),
      integral_subtuple D _ (unionIndex_injective i s) (hc i.castSucc),
      integral_subtuple D _ (unionIndex_injective i s) (hc i.succ)]
  have hb : (∑ j, a j) ≤ K := by
    dsimp only [a]
    rw [← integral_finsetSum _ (fun j _ => hc j)]
    simpa [ν] using integral_mono (integrable_finsetSum _ (fun j _ => hc j)) (integrable_const K) hK
  calc
    (∫ z, F z ∂μ) ≤ ∫ z, ∑ i, selectorMean (fun s => g i s z) ∂μ :=
      integral_mono hF (integrable_finsetSum _ (fun i _ => mean_integrable _ (gi i))) hp
    _ = ∑ i : Fin n, 2 * (a i.castSucc + a i.succ) := by
      rw [integral_finsetSum _ (fun i _ => mean_integrable _ (gi i))]
      exact Finset.sum_congr rfl fun i _ => by rw [integral_mean _ (gi i)]; simp only [ig, selectorMean_const]
    _ ≤ 4 * K := by
      rw [← Finset.mul_sum]
      linarith [sum_adjacent_deletions_le a (fun i => integral_nonneg (hc0 i))]

end AgnosticVC
