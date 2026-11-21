module

public import Conjectures.ChenKhareSahiOrthogonalityData

/-! Exact rational transition certificates for the source Hall construction. -/

@[expose] public section

namespace ChenKhareSahi.Orthogonality

set_option maxRecDepth 8192 in
set_option maxHeartbeats 10000000 in
theorem transition_inverse : powerTransition * monomialInPower = 1 := by
  ext i j
  change (∑ k : Index, powerTransition i k * monomialInPower k j) =
    if i = j then 1 else 0
  fin_cases i <;> fin_cases j <;>
    norm_num [powerTransition, monomialInPower, Fin.sum_univ_succ]

set_option maxRecDepth 8192 in
set_option maxHeartbeats 10000000 in
theorem evaluation_inverse : evaluationInverse * evaluationMatrix = 1 := by
  ext i j
  change (∑ k : Index, evaluationInverse i k * evaluationMatrix k j) =
    if i = j then 1 else 0
  fin_cases i <;> fin_cases j <;>
    norm_num [evaluationInverse, evaluationMatrix, Fin.sum_univ_succ]

end ChenKhareSahi.Orthogonality
