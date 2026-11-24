import Conjectures.FeldheimWeightedTailWindowsSequence
import Conjectures.FeldheimWeightedTailWindowsConvex
import Conjectures.FeldheimWeightedTailWindowsInverse

/-!
# Feldheim–Feldheim's weighted tail conjecture

The complete convex hazard-window lemma of Section 3. Its hypotheses are
the actual convexity and divergence of the function; neither an inverse
sequence nor an affine-window condition is assumed.
-/

namespace Conjectures.FeldheimWeightedTail

open Set Filter

/-- Arbitrarily far near-affine windows with arbitrarily large affine rise. -/
theorem convex_hazard_windows {h : ℝ → ℝ} {T : ℝ}
    (hc : ConvexOn ℝ (Ici T) h) (htop : Tendsto h atTop atTop)
    (j : ℕ) (hj : 1 ≤ j) (M : ℝ) :
    ∃ m d s c : ℝ, 0 < d ∧ max T M < m - d ∧ (j : ℝ) ≤ s * d ∧
      ∀ x ∈ Icc (m - d) (m + d),
        0 ≤ h x - (s * x + c) ∧ h x - (s * x + c) ≤ 1 := by
  obtain ⟨a, q, ha, hmono, hqa, hqv, hq, hqtop, hinc⟩ :=
    window_inverse_levels hc htop M
  obtain ⟨n, _, hbalanced⟩ := window_exists_balanced_levels hq hqtop hinc hj 0
  let m := q (n + j)
  let d := m - q n
  have hm : a ≤ m := hqa (n + j)
  have hd : 0 < d := sub_pos.mpr (hq (by omega))
  have heq : m - d = q n := by dsimp [d]; ring
  have hfar : max T M < m - d := by rw [heq]; exact ha.trans_le (hqa n)
  have hleft : h (m - d) = h m - j := by
    rw [heq]
    dsimp [m]
    rw [hqv n, hqv (n + j)]
    push_cast
    ring
  have hrightpos : a ≤ m + d := by linarith
  have hrightle : m + d ≤ q (n + 2 * j + 1) := by
    dsimp [d, m]
    linarith
  have hright : h (m + d) ≤ h m + j + 1 := by
    have hh := hmono.monotoneOn hrightpos (hqa (n + 2 * j + 1)) hrightle
    rw [hqv (n + 2 * j + 1)] at hh
    dsimp [m]
    rw [hqv (n + j)]
    push_cast at hh ⊢
    linarith
  have hTm : T < m := (le_max_left T M).trans_lt (ha.trans_le hm)
  obtain ⟨s, hs⟩ := window_exists_support hc hTm
  obtain ⟨hrise, herror⟩ := window_endpoint_defects hc hd
    ((le_max_left T M).trans hfar.le) hleft hright hs
  exact ⟨m, d, s, h m - s * m, hd, hfar, hrise, herror⟩

end Conjectures.FeldheimWeightedTail
