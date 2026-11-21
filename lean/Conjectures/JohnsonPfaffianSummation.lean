import Conjectures.JohnsonPfaffianIntervals
namespace JohnsonPfaffian

theorem summation_by_parts (a z : ℕ → ℝ) : ∀ n,
    (∑ j ∈ Finset.range (n+1), a j*(z (j+1)-z j)) =
      a n*z (n+1)-a 0*z 0 + ∑ j ∈ Finset.range n, (a j-a (j+1))*z (j+1) := by
  intro n
  induction n with
  | zero => simp; ring
  | succ n ih =>
    rw [Finset.sum_range_succ, ih, Finset.sum_range_succ]
    ring

theorem nonnegative_prefix_expansion (a z : ℕ → ℝ) (n : ℕ)
    (hz0 : z 0 = 0) (ha : 0 ≤ a n)
    (hz : ∀ j ≤ n+1, 0 ≤ z j)
    (hmono : ∀ j < n, a (j+1) ≤ a j) :
    0 ≤ ∑ j ∈ Finset.range (n+1), a j*(z (j+1)-z j) := by
  rw [summation_by_parts, hz0]
  have hsum : 0 ≤ ∑ j ∈ Finset.range n, (a j-a (j+1))*z (j+1) := by
    apply Finset.sum_nonneg
    intro j hj
    have hj' := Finset.mem_range.mp hj
    exact mul_nonneg (sub_nonneg.mpr (hmono j hj')) (hz (j+1) (by omega))
  have hp := mul_nonneg ha (hz (n+1) le_rfl)
  nlinarith

theorem endpoint_from_nonnegative_prefixes (a z : ℕ → ℝ) (n : ℕ) (pf endpoint : ℝ)
    (hz0 : z 0 = 0) (ha : 0 ≤ a n)
    (hz : ∀ j ≤ n+1, 0 ≤ z j)
    (hmono : ∀ j < n, a (j+1) ≤ a j)
    (hexp : pf-endpoint = ∑ j ∈ Finset.range (n+1), a j*(z (j+1)-z j)) :
    endpoint ≤ pf := by
  have hh := nonnegative_prefix_expansion a z n hz0 ha hz hmono
  linarith
end JohnsonPfaffian
