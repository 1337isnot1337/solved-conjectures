import Mathlib.Analysis.Convex.Slope
import Mathlib.Analysis.Convex.Continuous
import Mathlib.Analysis.Convex.Jensen
import Mathlib.Tactic

/-!
# Feldheim–Feldheim's weighted tail conjecture

Supporting affine functions and the endpoint-defect estimate for the
inverse-increment windows in Section 3 of the recorded argument.
No differentiability of the convex function is assumed.
-/

namespace Conjectures.FeldheimWeightedTail

open Set

theorem window_exists_support {h : ℝ → ℝ} {T m : ℝ}
    (hc : ConvexOn ℝ (Ici T) h) (hm : T < m) :
    ∃ s : ℝ, ∀ x ∈ Ici T, h m + s * (x - m) ≤ h x := by
  let slopes : Set ℝ := (fun x => (h m - h x) / (m - x)) '' Ico T m
  have hne : slopes.Nonempty :=
    ⟨(h m - h T) / (m - T), T, ⟨le_rfl, hm⟩, rfl⟩
  have hbdd : BddAbove slopes := by
    refine ⟨h (m + 1) - h m, ?_⟩
    rintro y ⟨x, hx, rfl⟩
    have hs := hc.slope_mono_adjacent hx.1
      (show m + 1 ∈ Ici T by simp only [mem_Ici]; linarith) hx.2
      (show m < m + 1 by linarith)
    simpa using hs
  refine ⟨sSup slopes, ?_⟩
  intro x hx
  rcases lt_trichotomy x m with hxm | rfl | hmx
  · have hs : (h m - h x) / (m - x) ≤ sSup slopes :=
      le_csSup hbdd ⟨x, ⟨hx, hxm⟩, rfl⟩
    have hs' := (div_le_iff₀ (sub_pos.mpr hxm)).mp hs
    nlinarith
  · simp
  · have hs : sSup slopes ≤ (h x - h m) / (x - m) := by
      apply csSup_le hne
      rintro y ⟨a, ha, rfl⟩
      exact hc.slope_mono_adjacent ha.1 hx ha.2 hmx
    have hs' := (le_div_iff₀ (sub_pos.mpr hmx)).mp hs
    linarith

theorem window_affine_concave (T s c : ℝ) :
    ConcaveOn ℝ (Ici T) (fun x => s * x + c) := by
  refine ⟨convex_Ici _, ?_⟩
  intro x _ y _ a b _ _ hab
  simp only [smul_eq_mul]
  apply le_of_eq
  linear_combination c * hab

theorem window_endpoint_defects {h : ℝ → ℝ} {T m d j s : ℝ}
    (hc : ConvexOn ℝ (Ici T) h) (hd : 0 < d) (hT : T ≤ m - d)
    (hleft : h (m - d) = h m - j)
    (hright : h (m + d) ≤ h m + j + 1)
    (hs : ∀ x ∈ Ici T, h m + s * (x - m) ≤ h x) :
    j ≤ s * d ∧
      ∀ x ∈ Icc (m - d) (m + d),
        0 ≤ h x - (s * x + (h m - s * m)) ∧
          h x - (s * x + (h m - s * m)) ≤ 1 := by
  have hleft_nonneg := hs (m - d) hT
  have hright_nonneg := hs (m + d) (by simp only [mem_Ici]; linarith)
  have hj : j ≤ s * d := by rw [hleft] at hleft_nonneg; nlinarith
  have hleft_upper : h (m - d) - (s * (m - d) + (h m - s * m)) ≤ 1 := by
    rw [hleft]
    nlinarith
  have hright_upper : h (m + d) - (s * (m + d) + (h m - s * m)) ≤ 1 := by
    nlinarith
  have hdefect := hc.sub (window_affine_concave T s (h m - s * m))
  refine ⟨hj, ?_⟩
  intro x hx
  have hxT : x ∈ Ici T := hT.trans hx.1
  have hnonneg := hs x hxT
  have hupper := hdefect.le_max_of_mem_Icc hT
    (show m + d ∈ Ici T by simp only [mem_Ici]; linarith) hx
  change h x - (s * x + (h m - s * m)) ≤
    max (h (m - d) - (s * (m - d) + (h m - s * m)))
      (h (m + d) - (s * (m + d) + (h m - s * m))) at hupper
  exact ⟨by nlinarith, hupper.trans (max_le hleft_upper hright_upper)⟩

end Conjectures.FeldheimWeightedTail
