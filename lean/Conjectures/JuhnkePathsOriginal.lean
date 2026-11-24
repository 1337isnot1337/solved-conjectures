import Conjectures.JuhnkePathsBoundary

/-!
# Juhnke's conjecture

The exact endpoint convention of Martina Juhnke's Conjecture 6:
start at `(2,1)` and end at `(d-1,d)` or `(d,d-1)`. The steps have
arbitrary positive integer length in the east or north direction.
-/

namespace Juhnke

open scoped BigOperators
open Polynomial

/-- The two endpoint alternatives in the original conjecture. -/
def OriginalEndpoint (d : ℕ) {N : ℕ} (p : LiteralPath N) : Prop :=
  (2 + p.east = d - 1 ∧ 1 + p.north = d) ∨
  (2 + p.east = d ∧ 1 + p.north = d - 1)

instance originalEndpointDecidable (d : ℕ) {N : ℕ} (p : LiteralPath N) :
    Decidable (OriginalEndpoint d p) := by
  unfold OriginalEndpoint
  infer_instance

theorem originalEndpoint_total {d N : ℕ} (hd : 2 ≤ d) (p : LiteralPath N)
    (hp : OriginalEndpoint d p) : N = 2 * d - 4 := by
  have ht := p.east_add_north
  unfold OriginalEndpoint at hp
  omega

/-- The literal original path-counting polynomial, including dimension two. -/
noncomputable def originalPathPolynomial (d : ℕ) : ℝ[X] :=
  ∑ p : LiteralPath (2 * d - 4), if OriginalEndpoint d p then X ^ p.stepCount else 0

/-- The sequence asked about in the original conjecture. -/
noncomputable def originalPathCount (d k : ℕ) : ℕ :=
  Fintype.card {p : LiteralPath (2 * d - 4) // OriginalEndpoint d p ∧ p.stepCount = k}

theorem originalPathPolynomial_coeff (d k : ℕ) :
    (originalPathPolynomial d).coeff k = (originalPathCount d k : ℝ) := by
  classical
  simp only [originalPathPolynomial, finsetSum_coeff]
  unfold originalPathCount
  rw [Fintype.card_subtype, Finset.card_eq_sum_ones, Finset.sum_filter, Nat.cast_sum]
  apply Finset.sum_congr rfl
  intro p _
  by_cases ha : OriginalEndpoint d p <;> by_cases hk : p.stepCount = k <;>
    simp [ha, hk, coeff_X_pow, eq_comm]
  exact Ne.symm hk

theorem originalEndpoint_translated (m : ℕ) (p : LiteralPath (2 * m + 2)) :
    OriginalEndpoint (m + 3) p ↔ p.east = m ∨ p.east = m + 1 := by
  have ht := p.east_add_north
  unfold OriginalEndpoint
  omega

/-- Translate `(2,1)` to the origin and keep both distinct endpoint families. -/
theorem originalPathPolynomial_translated (m : ℕ) :
    originalPathPolynomial (m + 3) =
      pathPolynomial (2 * m + 2) m + pathPolynomial (2 * m + 2) (m + 1) := by
  classical
  simp only [originalPathPolynomial, pathPolynomial, ← Finset.sum_add_distrib]
  apply Finset.sum_congr rfl
  intro p _
  simp only [originalEndpoint_translated]
  by_cases h0 : p.east = m <;> by_cases h1 : p.east = m + 1
  · omega
  · simp [h0]
  · simp [h1]
  · simp [h0, h1]

/-- Dimension two has exactly the empty path to `(2,1)`. -/
theorem originalPathPolynomial_two : originalPathPolynomial 2 = 1 := by
  classical
  have he (p : LiteralPath 0) : p.east = 0 ∧ p.north = 0 := by
    have ht := p.east_add_north
    omega
  have horig (p : LiteralPath 0) : OriginalEndpoint 2 p := by
    simp [OriginalEndpoint, (he p).1, (he p).2]
  have heast (p : LiteralPath 0) : p.east = 0 := (he p).1
  calc
    originalPathPolynomial 2 = pathPolynomial 0 0 := by
      simp [originalPathPolynomial, pathPolynomial, horig, heast]
    _ = 1 := pathPolynomial_zero

theorem originalPathPolynomial_three : originalPathPolynomial 3 = X + 3 * X ^ 2 := by
  simpa using (originalPathPolynomial_translated 0).trans pathPolynomial_dimension_three

end Juhnke
