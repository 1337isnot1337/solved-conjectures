import Mathlib.Topology.Order.OrderClosed
import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.Tactic.FunProp
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Ring
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.NormNum

/-! Exact inverse-ratio and limiting calculations for the truncated square. -/

noncomputable section

namespace MeylenderThalmaier

open Filter Topology

def cut (a b : ℝ) := a+b-a*b
def legX (a b : ℝ) := b/cut a b
def legY (a b : ℝ) := a/cut a b
def parallelRatioInv (a b : ℝ) := (2-a*b)/(2-a)
def trapezoidRatioInv (a b : ℝ) :=
  let α := 1-legX a b
  let β := 1-legY a b
  let γ := 1-α-β
  1+(α^2+β^2)*γ^2/(1-α^2-β^2-γ^2)

theorem normal_legs {a b : ℝ} (ha : 0<a) (ha' : a<1) (hb : 0<b) (hb' : b<1) :
    0<cut a b ∧ 0<legX a b ∧ legX a b≤1 ∧ 0<legY a b ∧ legY a b≤1 ∧
    legY a b+(1-a)*legX a b=1 := by
  have h₁ : 0<(1-a)*b := mul_pos (by linarith) hb
  have h₂ : 0<(1-b)*a := mul_pos (by linarith) ha
  have hc : 0<cut a b := by unfold cut; nlinarith
  unfold legX legY
  refine ⟨hc,div_pos hb hc,(div_le_one hc).mpr ?_,div_pos ha hc,(div_le_one hc).mpr ?_,?_⟩
  · unfold cut; nlinarith
  · unfold cut; nlinarith
  · field_simp
    unfold cut
    ring

theorem parallel_ratio_identity {a b : ℝ} (ha : a<1) :
    parallelRatioInv a b=1+a*(1-b)/(2-a) := by
  unfold parallelRatioInv
  field_simp [show 2-a≠0 by linarith]
  ring

/-- The exact numerical comparison for the interior example with legs 1/2 and 9/10. -/
theorem concrete_comparison :
    parallelRatioInv (1/2) (9/10)=31/30 ∧
    trapezoidRatioInv (1/2) (9/10)=4340/3971 ∧
    parallelRatioInv (1/2) (9/10)<trapezoidRatioInv (1/2) (9/10) := by
  norm_num [parallelRatioInv,trapezoidRatioInv,legX,legY,cut]

theorem boundary_values {a : ℝ} (ha : 0<a) (ha' : a<1) :
    parallelRatioInv a 1=1 ∧ trapezoidRatioInv a 1=1+a*(1-a)/2 := by
  have hd : 1-(1-a)^2-a^2≠0 := by nlinarith [mul_pos ha (show 0<1-a by linarith)]
  constructor
  · simp [parallelRatioInv,show 2-a≠0 by linarith]
  · have hc : cut a 1=1 := by unfold cut; ring
    have hx : legX a 1=1 := by simp [legX,hc]
    have hy : legY a 1=a := by simp [legY,hc]
    calc trapezoidRatioInv a 1 = 1+(1-a)^2*a^2/(1-(1-a)^2-a^2) := by
           simp [trapezoidRatioInv,hx,hy]
         _ = _ := by field_simp [hd]; ring

/-- The strict improvement holds throughout a left neighbourhood of 1,
for every fixed nondegenerate first truncation leg. -/
theorem eventually_better {a : ℝ} (ha : 0<a) (ha' : a<1) :
    ∀ᶠ b in 𝓝[<] (1 : ℝ), parallelRatioInv a b<trapezoidRatioInv a b := by
  have hcut : cut a 1=1 := by unfold cut; ring
  have cx : ContinuousAt (legX a) 1 := by
    unfold legX cut
    fun_prop (disch := first | linarith | ring)
  have cy : ContinuousAt (legY a) 1 := by
    unfold legY cut
    fun_prop (disch := first | linarith | ring)
  have hx : legX a 1=1 := by simp [legX,hcut]
  have hy : legY a 1=a := by simp [legY,hcut]
  have hd : 1-(1-legX a 1)^2-(1-legY a 1)^2-(1-(1-legX a 1)-(1-legY a 1))^2 ≠ 0 := by
    rw [hx,hy]
    nlinarith [mul_pos ha (show 0<1-a by linarith)]
  have cp : ContinuousAt (parallelRatioInv a) 1 := by
    unfold parallelRatioInv
    fun_prop
  have ct : ContinuousAt (trapezoidRatioInv a) 1 := by
    unfold trapezoidRatioInv
    fun_prop (disch := assumption)
  obtain ⟨hp,ht⟩ := boundary_values ha ha'
  have h : parallelRatioInv a 1<trapezoidRatioInv a 1 := by
    rw [hp,ht]; nlinarith [mul_pos ha (show 0<1-a by linarith)]
  exact (cp.eventually_lt ct h).filter_mono nhdsWithin_le_nhds

end MeylenderThalmaier
