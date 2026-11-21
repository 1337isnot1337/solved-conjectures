module

public import Conjectures.ChenKhareSahiOrthogonalityData

/-! Exact rational dual certificates for the source Hall construction. -/

@[expose] public section

namespace ChenKhareSahi.Orthogonality

set_option maxRecDepth 8192 in
set_option maxHeartbeats 20000000 in
theorem gram_macdonald (i : Index) : gram.mulVec (macdonald i) = dual i := by
  funext j
  fin_cases i <;> fin_cases j <;>
    norm_num [gram, macdonald, dual, Matrix.mulVec, dotProduct, Fin.sum_univ_succ]

theorem dual_upper (i j : Index) (h : j < i) : dual i j = 0 := by
  fin_cases i <;> fin_cases j <;> norm_num [dual] at *

theorem dual_diagonal_positive (i : Index) : 0 < dual i i := by
  fin_cases i <;> norm_num [dual]

end ChenKhareSahi.Orthogonality
