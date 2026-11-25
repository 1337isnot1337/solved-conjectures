import Conjectures.KauersKoutschanRowEnumeration
import Conjectures.KauersKoutschanBlockSigns

/-! The original permutation count has the signed factorial block expansion. -/

open scoped BigOperators

namespace KauersKoutschan

/-- Exact signed expansion of the original permutation count.
Each selected edge set contributes the product of its block signs and the sum
of row-order factorials over its legal assignments. -/
theorem permutationCount_signed_factorial_blocks (n : ℕ) :
    (permutationCount n : ℚ) =
      ∑ s ∈ (Finset.univ : Finset (Fin (n - 2))).powerset,
        (∏ b : BlockHeads s, sign (runLength s b.1 - 1)) * (factorialAssignmentCount s : ℚ) := by
  classical
  have h := congrArg (fun z : ℤ => (z : ℚ)) (permutationCount_inclusion_exclusion n)
  push_cast at h
  change (permutationCount n : ℚ) =
    ∑ s ∈ (Finset.univ : Finset (Fin (n - 2))).powerset,
      sign s.card * ((s.inf edgeEvent).card : ℚ) at h
  simp_rw [sign_eq_prod_block_signs, card_edge_intersection_eq_factorials] at h
  exact h

end KauersKoutschan
