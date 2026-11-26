module

public import Mathlib.Analysis.SpecialFunctions.Exp
public import Mathlib.Topology.Algebra.InfiniteSum.Real

/-! Two limit steps for the spine argument: divergent conditional
hit probabilities eliminate survival, and atomwise convergence of
finite records transfers high-probability hit events. -/

@[expose] public section

open scoped BigOperators Topology
open Filter

namespace SeparableDerangements

/-- When the conditional hit probabilities have divergent partial
    sums, the product of the conditional miss probabilities tends to zero. -/
theorem tendsto_missProduct_zero {p : ℕ → ℝ} (hBound : ∀ j, p j ≤ 1)
    (hDiverges : Tendsto (fun n => ∑ j ∈ Finset.range n, p j) atTop atTop) :
    Tendsto (fun n => ∏ j ∈ Finset.range n, (1 - p j)) atTop (𝓝 0) := by
  have hExp : Tendsto (fun n => Real.exp (-(∑ j ∈ Finset.range n, p j))) atTop (𝓝 0) :=
    Real.tendsto_exp_atBot.comp (tendsto_neg_atTop_atBot.comp hDiverges)
  refine tendsto_of_tendsto_of_tendsto_of_le_of_le tendsto_const_nhds hExp ?_ ?_
  · intro n
    exact Finset.prod_nonneg (fun j _ => sub_nonneg.mpr (hBound j))
  · intro n
    dsimp only
    rw [← Finset.sum_neg_distrib, Real.exp_sum]
    exact Finset.prod_le_prod₀ (fun j _ => sub_nonneg.mpr (hBound j))
      (fun j _ => Real.one_sub_le_exp_neg (p j))

/-- Finite subsets of the record events suffice to transfer a
    limiting hit probability of one. Each finite set of hit records
    contributes its finite-instance mass to the event when defined. -/
theorem tendsto_one_of_spine_record_hits
    {Record : ℕ → Type*}
    (mass : ∀ h, Record h → ℝ) (finiteMass : ∀ h, ℕ → Record h → ℝ)
    (hit : ∀ h, Set (Record h)) (score : ℕ → ℝ)
    (hUpper : ∀ n, score n ≤ 1)
    (hAtom : ∀ h r, Tendsto (fun n => finiteMass h n r) atTop (𝓝 (mass h r)))
    (hHit : ∀ ε : ℝ, 0 < ε → ∃ h : ℕ,
      Summable (fun r : hit h => mass h r) ∧
        1 - ε < ∑' r : hit h, mass h r)
    (hLower : ∀ (h : ℕ) (F : Finset (hit h)),
      ∀ᶠ n in atTop, (∑ r ∈ F, finiteMass h n r) ≤ score n) :
    Tendsto score atTop (𝓝 1) := by
  apply tendsto_order.2
  constructor
  · intro a ha
    obtain ⟨h, hSummable, hExpected⟩ := hHit (1 - a) (sub_pos.mpr ha)
    have hLimit : a < ∑' r : hit h, mass h r := by linarith
    obtain ⟨F, hF⟩ := eventually_atTop.1 ((tendsto_order.1 hSummable.hasSum).1 a hLimit)
    have hFinite : Tendsto (fun n => ∑ r ∈ F, finiteMass h n r) atTop
        (𝓝 (∑ r ∈ F, mass h r)) :=
      tendsto_finsetSum _ (fun r _ => hAtom h r)
    filter_upwards [(tendsto_order.1 hFinite).1 a (hF F le_rfl), hLower h F] with n hn hle
    exact lt_of_lt_of_le hn hle
  · intro b hb
    exact Eventually.of_forall fun n => lt_of_le_of_lt (hUpper n) hb

end SeparableDerangements
