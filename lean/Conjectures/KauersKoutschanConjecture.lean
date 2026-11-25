import Conjectures.KauersKoutschanCompositionCoefficients
import Conjectures.KauersKoutschanMaskCoefficients
import Conjectures.KauersKoutschanFiniteRecurrence

/-! Kauers–Koutschan Conjecture 10 for the original permutation count. -/

open scoped BigOperators

namespace KauersKoutschan

open KauersKoutschanCertificate (orderEight cells)

/-- The original forbidden-rise count equals the exact sixteen-mask sum
used in the formalized recurrence. -/
theorem permutationCount_eq_finiteSumCount (n : ℕ) :
    (permutationCount n : ℚ) = finiteSumCount n := by
  have h : (permutationCount n : ℝ) = (finiteSumCount n : ℝ) := by
    rw [permutationCount_eq_column_coefficient, markedColumns_product_mask,
      map_sum, MvPolynomial.coeff_sum]
    let f (m : ℕ) :=
      (factorialMomentPair (maskWeight (rowLength n 0) (rowLength n 1) m)).coeff
        (twoDegree (rowLength n 0) (rowLength n 1))
    change (∑ m : Fin 16, f m) = (finiteSumCount n : ℝ)
    rw [Fin.sum_univ_eq_sum_range f 16, finiteSumCount, Rat.cast_sum]
    apply Finset.sum_congr rfl
    intro m _
    exact coeff_maskWeight n m
  exact_mod_cast h

/-- The published order-eight operator annihilates A189281 at every
natural index, including the empty permutation and all initial indices. -/
theorem conjecture10 (n : ℕ) :
    orderEight n (fun j => (permutationCount (n + j) : ℚ)) = 0 :=
  permutationCount_orderEight_of_count permutationCount_eq_finiteSumCount n

end KauersKoutschan
