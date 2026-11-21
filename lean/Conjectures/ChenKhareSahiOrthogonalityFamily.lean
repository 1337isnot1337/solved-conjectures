module

public import Conjectures.ChenKhareSahiOrthogonalityData

/-! Exact rational family certificates for the source Hall construction. -/

@[expose] public section

namespace ChenKhareSahi.Orthogonality

theorem macdonald_monic (i : Index) : macdonald i i = 1 := by
  fin_cases i <;> norm_num [macdonald]

theorem macdonald_triangular (i j : Index) (h : ¬ dominates i j) : macdonald i j = 0 := by
  fin_cases i <;> fin_cases j <;> norm_num [dominates, parts, Fin.forall_fin_succ, macdonald] at *

set_option maxRecDepth 8192 in
set_option maxHeartbeats 10000000 in
theorem macdonald_dual (i j : Index) :
    dotProduct (macdonald i) (dual j) = if i = j then dual i i else 0 := by
  fin_cases i <;> fin_cases j <;>
    norm_num [macdonald, dual, dotProduct, Fin.sum_univ_succ]

end ChenKhareSahi.Orthogonality
