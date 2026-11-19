import Conjectures.LiDualFull
import Conjectures.LiWeighted
import Mathlib.RingTheory.MvPolynomial.Symmetric.Defs
import Mathlib.Algebra.MvPolynomial.Eval
import Mathlib.Tactic

/-!
# `e`-basis values at the truncated dual weights
-/

namespace LiEmap

open MvPolynomial
open scoped BigOperators

/-- The truncated dual weights. -/
noncomputable def wD : Fin 3 → Dual := fun i =>
  if i = 0 then Dual.mk 1 (1/2)
  else if i = 1 then Dual.mk (-1) (1/2)
  else Dual.mk 0 (-1)

@[simp] theorem wD_zero : wD 0 = Dual.mk 1 (1/2) := by simp [wD]
@[simp] theorem wD_one : wD 1 = Dual.mk (-1) (1/2) := by simp [wD]
@[simp] theorem wD_two : wD 2 = Dual.mk 0 (-1) := by simp [wD]

theorem aeval_esymm_one :
    MvPolynomial.aeval wD (MvPolynomial.esymm (Fin 3) ℚ 1) = 0 := by
  rw [MvPolynomial.esymm_one]
  simp only [Fin.sum_univ_three]
  apply Dual.ext <;> norm_num

theorem aeval_esymm_two :
    MvPolynomial.aeval wD (MvPolynomial.esymm (Fin 3) ℚ 2) = Dual.mk (-1) 0 := by
  rw [MvPolynomial.aeval_esymm_eq_multiset_esymm, Finset.esymm_map_val]
  rw [show Finset.powersetCard 2 (Finset.univ : Finset (Fin 3))
      = ({{0, 1}, {0, 2}, {1, 2}} : Finset (Finset (Fin 3))) from by decide]
  rw [Finset.sum_insert (by decide), Finset.sum_insert (by decide), Finset.sum_singleton]
  simp [Finset.prod_insert, Finset.prod_singleton, wD_zero, wD_one, wD_two]
  apply Dual.ext <;> norm_num

theorem aeval_esymm_three :
    MvPolynomial.aeval wD (MvPolynomial.esymm (Fin 3) ℚ 3) = Dual.mk 0 1 := by
  rw [MvPolynomial.aeval_esymm_eq_multiset_esymm, Finset.esymm_map_val]
  rw [show Finset.powersetCard 3 (Finset.univ : Finset (Fin 3))
      = ({Finset.univ} : Finset (Finset (Fin 3))) from by decide]
  rw [Finset.sum_singleton]
  rw [show (Finset.univ : Finset (Fin 3)).prod wD = wD 0 * wD 1 * wD 2 from by
    rw [Fin.prod_univ_three]]
  simp [wD_zero, wD_one, wD_two]
  apply Dual.ext <;> norm_num

/-- The general form: `aeval wD (e_{i+1})` is the vector `[0, -1, ε]`. -/
theorem aeval_esymm_vec (i : Fin 3) :
    MvPolynomial.aeval wD (MvPolynomial.esymm (Fin 3) ℚ (i + 1))
      = ![0, Dual.mk (-1) 0, Dual.mk 0 1] i := by
  fin_cases i
  · simpa using aeval_esymm_one
  · simpa using aeval_esymm_two
  · simpa using aeval_esymm_three

end LiEmap
