import Conjectures.RectangleEulerUpper
import Mathlib.Analysis.Real.Sqrt

/-! Square-root-scaled Euler-product limits used by finite partition counting. -/
namespace RectangleEuler

open Filter
open scoped Topology

noncomputable def logTruncatedEuler (B : ℕ) (T t : ℝ) : ℝ :=
  logEuler B t - logEuler B ((T + 1) * t)

theorem tendsto_logEuler_sqrt {ι : Type*} {l : Filter ι}
    (B : ι → ℕ) (T : ι → ℝ) {c : ℝ} (hc : 0 < c)
    (hT : Tendsto T l atTop)
    (hB : Tendsto (fun x => (B x : ℝ) / Real.sqrt (T x)) l atTop) :
    Tendsto (fun x => logEuler (B x) (c / Real.sqrt (T x)) / Real.sqrt (T x))
      l (𝓝 (basel / c)) := by
  have hp : ∀ᶠ x in l, 0 < T x := hT.eventually (eventually_gt_atTop 0)
  have hsqrt : Tendsto (fun x => Real.sqrt (T x)) l atTop :=
    Real.tendsto_sqrt_atTop.comp hT
  have ht : Tendsto (fun x => c / Real.sqrt (T x)) l (𝓝 0) :=
    hsqrt.const_div_atTop c
  have hpos : ∀ᶠ x in l, 0 < c / Real.sqrt (T x) := by
    filter_upwards [hp] with x hx
    exact div_pos hc (Real.sqrt_pos.2 hx)
  have hBt : Tendsto (fun x => (B x : ℝ) * (c / Real.sqrt (T x))) l atTop := by
    have hh := Filter.Tendsto.const_mul_atTop hc hB
    convert hh using 1
    funext x
    ring
  have he := (tendsto_scaled_logEuler B (fun x => c / Real.sqrt (T x)) hpos ht hBt).div_const c
  apply he.congr'
  filter_upwards [hp] with x hx
  have hsq : Real.sqrt (T x) ≠ 0 := ne_of_gt (Real.sqrt_pos.2 hx)
  field_simp

lemma truncated_tail_le {B : ℕ} {T c : ℝ} (hT : 0 < T) (hc : 0 < c) :
    0 ≤ logEuler B ((T + 1) * (c / Real.sqrt T)) / Real.sqrt T ∧
      logEuler B ((T + 1) * (c / Real.sqrt T)) / Real.sqrt T ≤ (basel / c) / T := by
  have hs : 0 < Real.sqrt T := Real.sqrt_pos.2 hT
  have hp : 0 < (T + 1) * (c / Real.sqrt T) := by positivity
  constructor
  · exact div_nonneg (logEuler_nonneg B hp) hs.le
  · calc
      _ ≤ (basel / ((T + 1) * (c / Real.sqrt T))) / Real.sqrt T :=
        div_le_div_of_nonneg_right (logEuler_le B hp) hs.le
      _ = (basel / c) / (T + 1) := by field_simp
      _ ≤ (basel / c) / T :=
        div_le_div_of_nonneg_left (div_nonneg basel_pos.le hc.le) hT (by linarith)

theorem tendsto_truncated_tail_sqrt {ι : Type*} {l : Filter ι}
    (B : ι → ℕ) (T : ι → ℝ) {c : ℝ} (hc : 0 < c)
    (hT : Tendsto T l atTop) :
    Tendsto (fun x => logEuler (B x) ((T x + 1) * (c / Real.sqrt (T x))) /
      Real.sqrt (T x)) l (𝓝 0) := by
  have hp : ∀ᶠ x in l, 0 < T x := hT.eventually (eventually_gt_atTop 0)
  have hb := hT.const_div_atTop (basel / c)
  apply squeeze_zero' ?_ ?_ hb
  · filter_upwards [hp] with x hx
    exact (truncated_tail_le (B := B x) hx hc).1
  · filter_upwards [hp] with x hx
    exact (truncated_tail_le (B := B x) hx hc).2

/-- Truncating every multiplicity at the total-size budget leaves the leading
logarithmic Euler-product constant unchanged. -/
theorem tendsto_logTruncatedEuler_sqrt {ι : Type*} {l : Filter ι}
    (B : ι → ℕ) (T : ι → ℝ) {c : ℝ} (hc : 0 < c)
    (hT : Tendsto T l atTop)
    (hB : Tendsto (fun x => (B x : ℝ) / Real.sqrt (T x)) l atTop) :
    Tendsto (fun x => logTruncatedEuler (B x) (T x) (c / Real.sqrt (T x)) /
      Real.sqrt (T x)) l (𝓝 (basel / c)) := by
  simpa only [logTruncatedEuler, sub_div, sub_zero] using
    (tendsto_logEuler_sqrt B T hc hT hB).sub (tendsto_truncated_tail_sqrt B T hc hT)

end RectangleEuler
