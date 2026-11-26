import Conjectures.HeimNeuhauserPlanePartitionThirdMoment
import Conjectures.HeimNeuhauserPlanePartitionTailCoverage
import Conjectures.HeimNeuhauserPlanePartitionOuterIntegral

/-! Strict Turán inequality for every real parameter at least one and every index from 251 onward. -/

namespace PlanePartition

open Real MeasureTheory
open scoped Interval
open OrdinaryDarcais (normalizedIntegrand)

theorem outer_integral_at_saddle {x r : ℝ} (hx : 1 ≤ x) (hr : r ∈ Set.Ioo (0 : ℝ) 1)
    (hn : 251 ≤ x*moment 0 r) :
    -(2/5 : ℝ) ≤ ∫ u in (3 : ℝ)..(π*sqrt (x*moment 1 r)),
      normalizedIntegrand (x*moment 1 r) (damping x r) (phase x r) u := by
  let f := normalizedIntegrand (variance x r) (damping x r) (phase x r)
  have hf : Continuous f := normalized_continuous (by linarith) hr
  have h := tailParameters_at_saddle hx hr hn
  have h₁ := middle_integral_bound hx hr (saddle_variance_lower hx hr hn) h
  have h₂ := far_integral_bound hx hr hn h
  change -(3/10 : ℝ) ≤ ∫ u in (3 : ℝ)..12, f u at h₁
  change -(1/10 : ℝ) ≤ ∫ u in (12 : ℝ)..(π*sqrt (variance x r)), f u at h₂
  change -(2/5 : ℝ) ≤ ∫ u in (3 : ℝ)..(π*sqrt (variance x r)), f u
  rw [← intervalIntegral.integral_add_adjacent_intervals (hf.intervalIntegrable ..) (hf.intervalIntegrable ..) (b := (12 : ℝ))]
  linarith

/-- For every index in the analytic range the original plane-partition coefficient
is strictly log-concave, uniformly in the full real-parameter range. -/
theorem strictTuran_tail {x : ℝ} (hx : 1 ≤ x) {n : ℕ} (hn : 251 ≤ n) :
    planePartition x (n-1)*planePartition x (n+1) < planePartition x n^2 := by
  apply strictTuran_of_outer_integral hx hn
  intro r hr hs
  apply outer_integral_at_saddle hx hr
  rw [hs]
  exact_mod_cast hn

end PlanePartition
