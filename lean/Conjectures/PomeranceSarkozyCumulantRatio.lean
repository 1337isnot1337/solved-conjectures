module
public import Mathlib.Analysis.Calculus.Deriv.MeanValue
public import Mathlib.Analysis.SpecificLimits.Basic
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Ring

@[expose] public section
namespace PomeranceSarkozy

open Filter Set
open scoped Topology

/-- An infinity-ratio comparison proved from the one-sided
derivative inequalities. It uses diverging denominators but does
not assume that the numerator itself diverges. -/
theorem real_ratio_tendsto_of_derivative_ratio (f g F G : ℝ→ℝ) (a L : ℝ)
    (hf : ∀ x>a,HasDerivAt f (F x) x) (hg : ∀ x>a,HasDerivAt g (G x) x)
    (hG : ∀ x>a,0<G x) (hTop : Tendsto g atTop atTop)
    (hR : Tendsto (fun x=>F x/G x) atTop (𝓝 L)) :
    Tendsto (fun x=>f x/g x) atTop (𝓝 L) := by
  have hMono (d T : ℝ) (hT : a<T) (hD : ∀ x≥T,d≤F x/G x) :
      MonotoneOn (fun x=>f x-d*g x) (Ici T) := by
    apply monotoneOn_of_hasDerivWithinAt_nonneg (convex_Ici T)
    · intro x hx
      change T≤x at hx
      exact ((hf x (hT.trans_le hx)).sub ((hg x (hT.trans_le hx)).const_mul d)).continuousAt.continuousWithinAt
    · intro x hx
      have hx' : T≤x := interior_subset hx
      exact ((hf x (hT.trans_le hx')).sub ((hg x (hT.trans_le hx')).const_mul d)).hasDerivWithinAt
    · intro x hx
      have hx' : T≤x := interior_subset hx
      exact sub_nonneg.mpr ((le_div_iff₀ (hG x (hT.trans_le hx'))).mp (hD x hx'))
  have hAnti (d T : ℝ) (hT : a<T) (hD : ∀ x≥T,F x/G x≤d) :
      MonotoneOn (fun x=>d*g x-f x) (Ici T) := by
    apply monotoneOn_of_hasDerivWithinAt_nonneg (convex_Ici T)
    · intro x hx
      change T≤x at hx
      exact (((hg x (hT.trans_le hx)).const_mul d).sub (hf x (hT.trans_le hx))).continuousAt.continuousWithinAt
    · intro x hx
      have hx' : T≤x := interior_subset hx
      exact (((hg x (hT.trans_le hx')).const_mul d).sub (hf x (hT.trans_le hx'))).hasDerivWithinAt
    · intro x hx
      have hx' : T≤x := interior_subset hx
      exact sub_nonneg.mpr ((div_le_iff₀ (hG x (hT.trans_le hx'))).mp (hD x hx'))
  refine tendsto_order.2 ⟨?_,?_⟩
  · intro b hb
    let d := (b+L)/2
    have hbd : b<d := by unfold d; linarith
    have hdL : d<L := by unfold d; linarith
    obtain ⟨T,hT⟩ := eventually_atTop.1 (hR.eventually_const_le hdL)
    let U := max T (a+1)
    have hU : a<U := by unfold U; linarith [le_max_right T (a+1)]
    have hMono' := hMono d U hU (fun x hx=>hT x ((le_max_left _ _).trans hx))
    let C := f U-d*g U
    have hC : Tendsto (fun x=>C/(g x)) atTop (𝓝 0) := by
      simpa only [Function.comp_apply,div_eq_mul_inv,mul_zero] using
        (tendsto_inv_atTop_zero.comp hTop).const_mul C
    filter_upwards [eventually_ge_atTop U,hTop.eventually_gt_atTop (0:ℝ),
      hC.eventually_const_lt (show b-d<0 by linarith)] with x hx h0 hSmall
    have hF : C≤f x-d*g x := hMono' (mem_Ici.mpr le_rfl) hx hx
    have hB : b<d+C/g x := by linarith
    apply hB.trans_le
    apply (le_div_iff₀ h0).mpr
    rw [add_mul,div_mul_cancel₀ _ h0.ne']
    linarith
  · intro b hb
    let d := (b+L)/2
    have hbd : d<b := by unfold d; linarith
    have hdL : L<d := by unfold d; linarith
    obtain ⟨T,hT⟩ := eventually_atTop.1 ((hR.eventually_lt_const hdL).mono (fun _ h=>h.le))
    let U := max T (a+1)
    have hU : a<U := by unfold U; linarith [le_max_right T (a+1)]
    have hAnti' := hAnti d U hU (fun x hx=>hT x ((le_max_left _ _).trans hx))
    let C := d*g U-f U
    have hC : Tendsto (fun x=>C/(g x)) atTop (𝓝 0) := by
      simpa only [Function.comp_apply,div_eq_mul_inv,mul_zero] using
        (tendsto_inv_atTop_zero.comp hTop).const_mul C
    filter_upwards [eventually_ge_atTop U,hTop.eventually_gt_atTop (0:ℝ),
      hC.eventually_const_lt (show d-b<0 by linarith)] with x hx h0 hSmall
    have hF : C≤d*g x-f x := hAnti' (mem_Ici.mpr le_rfl) hx hx
    have hB : d-C/g x<b := by linarith
    apply lt_of_le_of_lt _ hB
    apply (div_le_iff₀ h0).mpr
    rw [sub_mul,div_mul_cancel₀ _ h0.ne']
    linarith

end PomeranceSarkozy
