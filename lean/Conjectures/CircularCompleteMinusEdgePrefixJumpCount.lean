import Conjectures.CircularCompleteMinusEdgePrefixSteps

/-! The count of long steps in the full prefix is the run gap count. -/

namespace CircularCompleteMinusEdge
open scoped BigOperators

theorem edgeStepPrefix_last_eq_jumpCount {n m : ℕ} (p : Fin (m+1) → ℕ)
    (hp : StrictMono p) (hn : 1 < n) (hmod : ∀ i, runStep p i % n = 1)
    (hsat : jumpCount n p = ∑ i, stepQuotient n p i) :
    edgeStepPrefix p true (Fin.last m) = jumpCount n p := by
  have hgap := saturation_steps_one_or_next_period p hmod hsat
  have hc := exact_two_gap_prefix_position p hp hgap (show 2 ≤ 1+n by omega) (Fin.last m)
  have hs := position_span_eq_quotient_sum p hp hmod
  rw [← hsat] at hs
  have hcount := hc.1
  change edgeStepPrefix p false (Fin.last m) + edgeStepPrefix p true (Fin.last m) = m at hcount
  rw [Nat.add_mul, one_mul] at hc
  have hmul : n * edgeStepPrefix p true (Fin.last m) = n * jumpCount n p := by omega
  exact Nat.eq_of_mul_eq_mul_left (by omega) hmul

end CircularCompleteMinusEdge
