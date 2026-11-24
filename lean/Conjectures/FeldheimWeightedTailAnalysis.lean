import Conjectures.FeldheimWeightedTailAverage
import Conjectures.FeldheimWeightedTailWindows
import Conjectures.FeldheimWeightedTailOscillation

/-!
# Feldheim–Feldheim’s weighted tail conjecture

The analytic reduction for arbitrary right-continuous monotone log tails.
Actual forward averages yield the fixed-weight Wright chord bound; an actual
supremum of affine minorants yields the convex function; its proved inverse
levels yield near-affine windows. No stability or window hypothesis remains.
-/

open Set Filter
open scoped Topology

namespace Conjectures.FeldheimWeightedTail

noncomputable section

/-- All analytic bridges needed for the actual probability theorem. -/
theorem monotone_rectangle_windows {f g : ℝ → ℝ} {T t L : ℝ}
    (ht : 0 < t) (ht1 : t < 1) (hL : 0 ≤ L)
    (hf : Monotone f) (hg : Monotone g)
    (hfpos : ∀ x, 0 ≤ f x) (hgpos : ∀ x, 0 ≤ g x)
    (hfRight : ∀ x, ContinuousWithinAt f (Ici x) x)
    (hgRight : ∀ x, ContinuousWithinAt g (Ici x) x)
    (hftop : Tendsto f atTop atTop)
    (hR : RectangleBoundOn f g (Ici T) t L) :
    ∃ E : ℝ, 0 ≤ E ∧ ∀ j : ℕ, 1 ≤ j → ∀ M : ℝ,
      ∃ m d s c : ℝ, 0 < d ∧ max T M < m-d ∧ (j : ℝ) ≤ s*d ∧
        ∀ x ∈ Icc (m-d) (m+d), |f x+g x-(s*x+c)| ≤ E := by
  let H : ℝ → ℝ := fun x => f x+g x
  let u := min t (1-t)
  have hu : 0 < u := lt_min ht (sub_pos.mpr ht1)
  have hu2 : u ≤ 1/2 := by
    have ha := min_le_left t (1-t)
    have hb := min_le_right t (1-t)
    dsimp only [u]
    linarith
  have hW : WrightBoundOn H (Ici T) u (2*L) := by
    by_cases h : t ≤ 1-t
    · simpa only [u, min_eq_left h] using hR.wright
    · simpa only [u, min_eq_right (le_of_not_ge h)] using hR.wright.symm_weight
  have hpos : ∀ x, 0 ≤ H x := fun x => add_nonneg (hfpos x) (hgpos x)
  have hRight : ∀ x, T ≤ x → ContinuousWithinAt H (Ici x) x :=
    fun x _ => (hfRight x).add (hgRight x)
  have hmono : Monotone H := hf.add hg
  let B := wrightConstant u*(2*L)
  have hB : 0 ≤ B :=
    mul_nonneg (le_trans (by norm_num) (wrightConstant_ge_three u)) (by linarith)
  have hchord : ChordBoundOn H T B :=
    monotone_wright_chordBoundOn (hmono.monotoneOn (Ici T)) hRight hu hu2 (by linarith) hW
  let h : ℝ → ℝ := convexMinorant H T
  have hconv : ConvexOn ℝ (Ici T) h := convexMinorant_convex (fun x _ => hpos x)
  have htop : Tendsto h atTop atTop := by
    apply tendsto_atTop.2
    intro A
    filter_upwards [hftop.eventually (eventually_ge_atTop (A+B)), eventually_gt_atTop T] with x hx hxT
    have hminor := le_convexMinorant_add hchord hB hxT
    have hnonneg := hgpos x
    change H x-B ≤ h x at hminor
    dsimp only [H] at hminor
    linarith
  refine ⟨B+1, by linarith, ?_⟩
  intro j hj M
  obtain ⟨m,d,s,c,hd,hfar,hrise,hwin⟩ := convex_hazard_windows hconv htop j hj M
  refine ⟨m,d,s,c,hd,hfar,hrise,?_⟩
  intro x hx
  have hxT : T < x := (le_max_left T M).trans_lt (hfar.trans_le hx.1)
  have hminor := le_convexMinorant_add hchord hB hxT
  have hmajor := convexMinorant_le (fun y _ => hpos y) hxT.le
  have hw := hwin x hx
  change H x-B ≤ h x at hminor
  change h x ≤ H x at hmajor
  dsimp only [H] at hminor hmajor
  exact abs_le.mpr ⟨by linarith [hw.1], by linarith [hw.2]⟩

end

end Conjectures.FeldheimWeightedTail
