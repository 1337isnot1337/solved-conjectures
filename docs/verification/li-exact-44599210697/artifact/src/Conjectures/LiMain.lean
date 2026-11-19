import Conjectures.LiSpecFinal
import Conjectures.LiBridge
import Conjectures.LiCompute
import Conjectures.LiDualTrunc
import Conjectures.LiChromatic
import Conjectures.LiBasic

/-!
# The coefficient theorem for Li's counterexample

The coefficient of `e₃ e₂¹⁴` in the three-variable chromatic symmetric
polynomial of the explicit tree `Li.T` is `+29`.
-/

open MvPolynomial
open scoped BigOperators

namespace Li

/-- The numerical `t`-coefficient is `29`. -/
theorem coeff_eq_29 : (MvPolynomial.aeval wPoly (chromPoly T)).coeff 1 = 29 := by
  rw [← truncDual_snd (MvPolynomial.aeval wPoly (chromPoly T))]
  rw [truncDual_aeval]
  have hw : (fun i => truncDual (wPoly i)) = LiCompute.wR := by
    funext i
    fin_cases i
    · change truncDual (1 + Polynomial.C (1/2) * Polynomial.X) = Dual.mk 1 (1/2)
      simp [truncDual_C, truncDual_X]
      ext <;> simp
    · change truncDual (-1 + Polynomial.C (1/2) * Polynomial.X) = Dual.mk (-1) (1/2)
      simp [truncDual_C, truncDual_X]
      ext <;> simp
    · change truncDual (-Polynomial.X) = Dual.mk 0 (-1)
      simp [truncDual_X]
      ext <;> simp
  rw [hw]
  have hbridge : MvPolynomial.aeval LiCompute.wR (chromPoly T)
      = LiElim.partFunOn T Finset.univ (fun _ => LiCompute.wR) := by
    rw [aeval_chromPoly, Finset.sum_filter, ← LiBridge.partFunOn_univ]
  rw [hbridge]
  exact LiCompute.coeff_29

/-- **The Li coefficient theorem.**  The coefficient of `e₃ e₂¹⁴` in the
three-variable chromatic symmetric polynomial of the explicit 31-vertex tree is
`+29`. -/
theorem li_coefficient :
    ((MvPolynomial.esymmAlgEquiv (Fin 3) ℚ (n := 3) (by decide)).symm
      ⟨chromPoly T, chromPoly_isSymmetric T⟩).coeff
      (Finsupp.single (1 : Fin 3) 14 + Finsupp.single (2 : Fin 3) 1) = 29 := by
  rw [specialization_coeff (chromPoly T) (chromPoly_isSymmetric T)
    (chromPoly_isHomogeneous T)]
  exact coeff_eq_29

end Li
