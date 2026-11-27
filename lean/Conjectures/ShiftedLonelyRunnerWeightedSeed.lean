import Conjectures.ShiftedLonelyRunnerData53To57
import Mathlib.Tactic.FieldSimp

/-!
# The 57-runner seed misses the weighted support

The certificate uses open intervals in scaled time. The endpoint checks are
weak inequalities in one integer cell, and strict inequalities follow
at every interior point because the original speeds are positive.
-/

namespace ShiftedLonelyRunner.WeightedResidual

structure Cell where
  left : ℕ
  right : ℕ
  weight : ℕ

def period : ℕ := 59000000
def halfWidth : ℕ := 1000000

/-- The interval is expressed in time coordinates scaled by period. -/
def Cell.times (cell : Cell) : Set ℝ := Set.Ioo (cell.left : ℝ) (cell.right : ℝ)

def seedOK (row : Row) (cell : Cell) (track : Track) : Bool :=
  let left := track.2 * period + track.1 * cell.left * row.scale
  let right := track.2 * period + track.1 * cell.right * row.scale
  let stride := period * row.scale
  let winding := left / stride
  decide (0 < row.scale ∧ 0 < track.1 ∧ cell.left < cell.right ∧
    cell.right ≤ period ∧
    winding * stride + halfWidth * row.scale ≤ left ∧
    right + halfWidth * row.scale ≤ (winding + 1) * stride)

private theorem distance_strict_of_cell {x r : ℝ} {k : ℤ}
    (left : r < x - k) (right : x - k < 1 - r) : r < Loneliness.distance x := by
  rcases le_or_gt (round x) k with hk | hk
  · have h' : (round x : ℝ) ≤ k := by exact_mod_cast hk
    unfold Loneliness.distance
    exact (show r < x - round x by linarith).trans_le (le_abs_self _)
  · have hi : k + 1 ≤ round x := by omega
    have h' : (k : ℝ) + 1 ≤ round x := by exact_mod_cast hi
    unfold Loneliness.distance
    exact (show r < -(x - round x) by linarith).trans_le (neg_le_abs _)

/-- An integer endpoint certificate is sound for every real time inside the interval. -/
theorem seedOK_sound {row : Row} {cell : Cell} {track : Track}
    (checked : seedOK row cell track = true) {x : ℝ} (hx : x ∈ cell.times) :
    (1 : ℝ) / 59 < Loneliness.distance
      ((track.2 : ℝ) / row.scale + track.1 * (x / period)) := by
  let stride := period * row.scale
  let winding := (track.2 * period + track.1 * cell.left * row.scale) / stride
  have hcheck : 0 < row.scale ∧ 0 < track.1 ∧ cell.left < cell.right ∧
      cell.right ≤ period ∧
      winding * stride + halfWidth * row.scale ≤
        track.2 * period + track.1 * cell.left * row.scale ∧
      track.2 * period + track.1 * cell.right * row.scale + halfWidth * row.scale ≤
        (winding + 1) * stride := by
    simpa [seedOK, winding, stride] using checked
  obtain ⟨hscale, hv, _, _, hlo, hhi⟩ := hcheck
  have hscaleR : (0 : ℝ) < row.scale := by exact_mod_cast hscale
  have hvR : (0 : ℝ) < track.1 := by exact_mod_cast hv
  have hpR : (0 : ℝ) < period := by norm_num [period]
  have hQ : (0 : ℝ) < (period : ℝ) * row.scale := mul_pos hpR hscaleR
  have hl : (winding : ℝ) * (period : ℝ) * row.scale + (halfWidth : ℝ) * row.scale ≤
      (track.2 : ℝ) * period + (track.1 : ℝ) * cell.left * row.scale := by
    exact_mod_cast (show winding * period * row.scale + halfWidth * row.scale ≤
      track.2 * period + track.1 * cell.left * row.scale by
      simpa [stride, Nat.mul_assoc] using hlo)
  have hr : (track.2 : ℝ) * period + (track.1 : ℝ) * cell.right * row.scale +
      (halfWidth : ℝ) * row.scale ≤ ((winding : ℝ) + 1) * (period : ℝ) * row.scale := by
    exact_mod_cast (show track.2 * period + track.1 * cell.right * row.scale +
      halfWidth * row.scale ≤ (winding + 1) * period * row.scale by
      simpa [stride, Nat.mul_assoc] using hhi)
  have hxl := mul_lt_mul_of_pos_right (mul_lt_mul_of_pos_left hx.1 hvR) hscaleR
  have hxr := mul_lt_mul_of_pos_right (mul_lt_mul_of_pos_left hx.2 hvR) hscaleR
  apply distance_strict_of_cell (k := (winding : ℤ))
  · apply lt_of_mul_lt_mul_right _ hQ.le
    push_cast
    have hvscale : (track.2 / (row.scale : ℝ) + track.1 * (x / period) -
        (winding : ℝ)) * ((period : ℝ) * row.scale) =
        track.2 * (period : ℝ) + track.1 * x * row.scale - winding * period * row.scale := by
      field_simp [hscaleR.ne', hpR.ne']
    rw [hvscale]
    have hwidth : (1 : ℝ) / 59 * ((period : ℝ) * row.scale) =
        (halfWidth : ℝ) * row.scale := by norm_num [period, halfWidth]; ring
    rw [hwidth]
    linarith only [hl, hxl]
  · apply lt_of_mul_lt_mul_right _ hQ.le
    push_cast
    have hvscale : (track.2 / (row.scale : ℝ) + track.1 * (x / period) -
        (winding : ℝ)) * ((period : ℝ) * row.scale) =
        track.2 * (period : ℝ) + track.1 * x * row.scale - winding * period * row.scale := by
      field_simp [hscaleR.ne', hpR.ne']
    rw [hvscale]
    have hwidth : (1 - (1 : ℝ) / 59) * ((period : ℝ) * row.scale) =
        ((period : ℝ) - halfWidth) * row.scale := by norm_num [period, halfWidth]; ring
    rw [hwidth]
    nlinarith only [hr, hxr]

end ShiftedLonelyRunner.WeightedResidual
