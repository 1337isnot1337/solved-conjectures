module

public import Conjectures.AgnosticVC.DeletionCoupling
public import Conjectures.AgnosticVC.OptimizerCollapse

/-! Tensorize the information of the actual proper learner and average deletion
charges over iid data. -/

@[expose] public section

open MeasureTheory
open scoped BigOperators

namespace AgnosticVC

variable {I K J X H : Type*} [Fintype I] [Fintype K] [Fintype J] [Nonempty H]

/-- Law on full-block trace representatives after training on the specified subtuple. -/
noncomputable def selectedLaw [DecidableEq K] (σ : Schedule) (predict : H → X → Bool)
    (z : I → X × Bool) (e : K → I) : TraceSpace predict (fun i => (z i).1) → ℝ :=
  marginal (extendTrace predict (fun i => (z i).1) e)
    (learnedTraceMass σ predict (fun j => (z (e j)).1) (fun j => (z (e j)).2))

theorem selectedLaw_comp [DecidableEq J] (σ : Schedule) (predict : H → X → Bool)
    (z : I → X × Bool) (e : K → I) (f : J → K) :
    selectedLaw σ predict z (e ∘ f) =
      marginal (extendTrace predict (fun i => (z i).1) e) (selectedLaw σ predict (z ∘ e) f) := by
  unfold selectedLaw
  rw [marginal_comp]
  congr 1
  funext v
  apply Subtype.ext
  change sampleTrace predict (fun i => (z i).1) _ = sampleTrace predict (fun i => (z i).1) _
  apply congrArg
  exact (canonicalRep_extendTrace predict (fun k => (z (e k)).1) f v).symm

private theorem cost_on_union {n : ℕ} (σ : Schedule) (predict : H → X → Bool)
    (z : Pool n X) (e : Fin (n+1) → Fin n × Bool) (k : Fin (n+1)) :
    hellingerSq (selectedLaw σ predict z (e ∘ k.succAbove))
      (selectedLaw σ predict z e) = blockDeletionCharge σ predict (z ∘ e) k := by
  rw [selectedLaw_comp]
  exact hellingerSq_marginal_injective _ (extendTrace_injective ..) _ _

theorem poolInformation_le_blockCharges {n d : ℕ} (hd : 0 < d) (hn : d ≤ n)
    (predict : H → X → Bool) (z : Pool n X) :
    poolInformation hd hn predict z ≤ ∑ i : Fin n, SteinkeZakynthinou.Learner.selectorMean
      (fun s => 2 * (blockDeletionCharge (schedule n d) predict (z ∘ unionIndex i s) i.castSucc +
        blockDeletionCharge (schedule n d) predict (z ∘ unionIndex i s) i.succ)) := by
  let σ := schedule n d
  let poolLaw := outputChannel hd hn predict z
  let common := fun i s => selectedLaw σ predict z (unionIndex i s)
  apply (channelInfo_le_deletionCharges poolLaw (fun s => (outputChannel_isLaw hd hn predict z s).1)
    common).trans
  apply Finset.sum_le_sum
  intro i _
  apply SteinkeZakynthinou.selectorMean_mono
  intro s
  have h₁ : unionIndex i s ∘ i.castSucc.succAbove = fun j => (j,Function.update s i true j) :=
    funext (unionIndex_skip_left i s)
  have h₂ : unionIndex i s ∘ i.succ.succAbove = fun j => (j,Function.update s i false j) :=
    funext (unionIndex_skip_right i s)
  have c₁ := cost_on_union σ predict z (unionIndex i s) i.castSucc
  have c₂ := cost_on_union σ predict z (unionIndex i s) i.succ
  rw [h₁] at c₁
  rw [h₂] at c₂
  change 2 * (hellingerSq (selectedLaw σ predict z (fun j => (j,Function.update s i false j))) _ +
    hellingerSq (selectedLaw σ predict z (fun j => (j,Function.update s i true j))) _) ≤ _
  rw [c₁,c₂,add_comm]

/-- A uniform common-block deletion bound suffices for the original iid CMI
of the concrete proper learner. Integrability is stated separately. -/
theorem cmi_le_of_blockCharges {n d : ℕ} (hd : 0 < d) (hn : d ≤ n) [MeasurableSpace X]
    (predict : H → X → Bool) (D : Measure (X × Bool)) [IsProbabilityMeasure D] {B : ℝ}
    (hf : Integrable (poolInformation hd hn predict) (Measure.pi fun _ : Fin n × Bool => D))
    (hc : ∀ i, Integrable (fun T : Fin (n+1) → X × Bool => blockDeletionCharge (schedule n d) predict T i)
      (Measure.pi fun _ : Fin (n+1) => D))
    (hcost : ∀ T : Fin (n+1) → X × Bool, ∑ i, blockDeletionCharge (schedule n d) predict T i ≤ B) :
    (∫ z, poolInformation hd hn predict z ∂Measure.pi (fun _ : Fin n × Bool => D)) ≤ 4 * B :=
  paired_integral_le_of_deletion_sum D _ _ hf hc
    (fun i T => blockDeletionCharge_nonneg (schedule n d) predict T i) hcost (poolInformation_le_blockCharges hd hn predict)

end AgnosticVC
