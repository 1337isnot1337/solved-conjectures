module

public import Conjectures.ChenKhareSahiOrthogonalityData

/-! Exact rational gram certificates for the source Hall construction. -/

@[expose] public section

namespace ChenKhareSahi.Orthogonality

set_option maxRecDepth 8192 in
set_option maxHeartbeats 20000000 in
theorem gram_from_power (i j : Index) :
    gram i j = ∑ k : Index, monomialInPower i k * hallWeight k * monomialInPower j k := by
  fin_cases i <;> fin_cases j <;>
    norm_num [gram, monomialInPower, hallWeight_exact, Fin.sum_univ_succ]

end ChenKhareSahi.Orthogonality
