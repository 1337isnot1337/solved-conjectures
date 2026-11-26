import Conjectures.HeimNeuhauserPlanePartitionFinite
import Conjectures.HeimNeuhauserPlanePartitionTuranTail

/-! Full statements of Heim–Neuhauser–Tröger Conjecture 2 and Heim–Neuhauser Conjecture 1. -/

namespace PlanePartition

/-- Strict polynomial Turán inequality for all real parameters at least one and all indices at least twelve. -/
theorem heim_neuhauser_troeger_turan {x : ℝ} (hx : 1 ≤ x) {n : ℕ} (hn : 12 ≤ n) :
    planePartition x (n-1)*planePartition x (n+1) < planePartition x n^2 := by
  by_cases h : n ≤ 250
  · exact strictTuran_finite hx hn h
  · exact strictTuran_tail hx (by omega)

/-- Both original strict root inequalities, in their stated open and closed parameter ranges. -/
theorem heim_neuhauser_polynomization :
    (∀ (x : ℝ), 5 < x → ∀ n ≥ 1, RootDecrease x n) ∧
    (∀ (x : ℝ), 1 ≤ x → ∀ n ≥ 6, RootDecrease x n) :=
  original_root_of_turan_tail (fun _ hx _ hn => (strictTuran_tail hx hn).le)

end PlanePartition
