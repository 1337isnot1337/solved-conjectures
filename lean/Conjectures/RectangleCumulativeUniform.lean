import Conjectures.RectangleCumulativeLimit
import Mathlib.Order.Filter.AtTopBot.Prod

namespace RectanglePartitionAsymptotics

open Filter
open scoped Topology

/-- A uniform form of the cumulative partition lower bound. One pair of
thresholds works for every total budget and every sufficiently large cutoff. -/
theorem uniform_log_boundedParts_lower {ε : ℝ} (hε : 0 < ε) :
    ∃ T0 : ℕ, ∃ R : ℝ, 0 < R ∧ ∀ B T : ℕ,
      T0 ≤ T → R ≤ (B:ℝ)/Real.sqrt (T:ℝ) →
      (2*Real.sqrt RectangleEuler.basel-ε)*Real.sqrt (T:ℝ) ≤
        Real.log ((RectanglePartitions.boundedParts 1 B T).card:ℝ) := by
  let θ : ℕ×ℕ → ℝ×ℝ := fun p => ((p.2:ℝ),(p.1:ℝ)/Real.sqrt (p.2:ℝ))
  let l : Filter (ℕ×ℕ) := Filter.comap θ (atTop : Filter (ℝ×ℝ))
  have hg : Tendsto θ l ((atTop : Filter ℝ) ×ˢ (atTop : Filter ℝ)) := by
    rw [Filter.prod_atTop_atTop_eq]
    exact Filter.tendsto_comap
  have hT : Tendsto (fun p : ℕ×ℕ => (p.2:ℝ)) l atTop := hg.fst
  have hB : Tendsto (fun p : ℕ×ℕ => (p.1:ℝ)/Real.sqrt (p.2:ℝ)) l atTop := hg.snd
  have hh := tendsto_log_boundedParts_sqrt (fun p : ℕ×ℕ => p.1)
    (fun p : ℕ×ℕ => p.2) hT hB
  have he := (tendsto_order.mp hh).1 (2*Real.sqrt RectangleEuler.basel-ε) (by linarith)
  have he' := Filter.eventually_comap.mp he
  obtain ⟨q,hq⟩ := Filter.eventually_atTop.mp he'
  obtain ⟨T0,hT0⟩ := exists_nat_gt (max q.1 (1:ℝ))
  refine ⟨T0,max q.2 1,lt_of_lt_of_le (by norm_num) (le_max_right _ _),?_⟩
  intro B T hTge hBge
  have hcast : (T0:ℝ) ≤ T := by exact_mod_cast hTge
  have hfirst : q.1 ≤ (T:ℝ) := by
    have hx := le_max_left q.1 (1:ℝ)
    linarith
  have hsecond : q.2 ≤ (B:ℝ)/Real.sqrt (T:ℝ) := (le_max_left _ _).trans hBge
  have hpositive : (0:ℝ)<T := by
    have hx := le_max_right q.1 (1:ℝ)
    linarith
  have hb := hq (θ (B,T)) ⟨hfirst,hsecond⟩ (B,T) rfl
  have hs : (0:ℝ)<Real.sqrt (T:ℝ) := Real.sqrt_pos.mpr hpositive
  exact ((lt_div_iff₀ hs).mp hb).le

end RectanglePartitionAsymptotics
