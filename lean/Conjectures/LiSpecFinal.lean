import Conjectures.LiDualTrunc
import Conjectures.LiMonomial
import Conjectures.LiEmapFinal
import Conjectures.LiWeighted2
import Conjectures.LiChromatic

/-!
# The specialization lemma for the Li coefficient
-/

open MvPolynomial
open scoped BigOperators

namespace Li

/-- The three linear polynomials `1 + t/2`, `-1 + t/2`, `-t`. -/
noncomputable def wPoly : Fin 3 → Polynomial ℚ :=
  ![1 + Polynomial.C (1/2) * Polynomial.X, -1 + Polynomial.C (1/2) * Polynomial.X,
    -Polynomial.X]

/-- The specialization lemma. -/
theorem specialization_coeff (g : MvPolynomial (Fin 3) ℚ) (hg : g.IsSymmetric)
    (hh : g.IsHomogeneous 31) :
    ((MvPolynomial.esymmAlgEquiv (Fin 3) ℚ (n := 3) (by decide)).symm ⟨g, hg⟩).coeff
      (Finsupp.single (1 : Fin 3) 14 + Finsupp.single (2 : Fin 3) 1)
    = (MvPolynomial.aeval wPoly g).coeff 1 := by
  classical
  let p : MvPolynomial (Fin 3) ℚ :=
    (MvPolynomial.esymmAlgEquiv (Fin 3) ℚ (n := 3) (by decide)).symm ⟨g, hg⟩
  have hgp : MvPolynomial.aeval (fun i : Fin 3 => MvPolynomial.esymm (Fin 3) ℚ (i + 1)) p = g := by
    have h2 := (MvPolynomial.esymmAlgEquiv (Fin 3) ℚ (n := 3) (by decide)).apply_symm_apply ⟨g, hg⟩
    have h3 := congrArg Subtype.val h2
    rw [MvPolynomial.esymmAlgEquiv_apply] at h3
    rwa [MvPolynomial.esymmAlgHom_apply] at h3
  have hp : MvPolynomial.IsWeightedHomogeneous LiWeighted.wt p 31 :=
    LiWeighted.weightedHomogeneous_symm g hg hh
  rw [show (MvPolynomial.esymmAlgEquiv (Fin 3) ℚ (n := 3) (by decide)).symm ⟨g, hg⟩ = p from rfl]
  rw [← LiMonomial.snd_aeval_of_weighted p hp]
  rw [← hgp]
  rw [← truncDual_snd (MvPolynomial.aeval wPoly
    (MvPolynomial.aeval (fun i : Fin 3 => MvPolynomial.esymm (Fin 3) ℚ (i + 1)) p))]
  rw [truncDual_aeval]
  rw [aeval_aeval]
  have hwD : (fun j : Fin 3 => truncDual (wPoly j)) = LiEmap.wD := by
    funext j
    fin_cases j
    · change truncDual (1 + Polynomial.C (1/2) * Polynomial.X) = Dual.mk 1 (1/2)
      simp [truncDual_C, truncDual_X]
      ext <;> simp
    · change truncDual (-1 + Polynomial.C (1/2) * Polynomial.X) = Dual.mk (-1) (1/2)
      simp [truncDual_C, truncDual_X]
      ext <;> simp
    · change truncDual (-Polynomial.X) = Dual.mk 0 (-1)
      simp [truncDual_X]
      ext <;> simp
  rw [hwD]
  have hvec : ∀ i : Fin 3, MvPolynomial.aeval LiEmap.wD
      (MvPolynomial.esymm (Fin 3) ℚ (i + 1)) = LiMonomial.v i := by
    intro i
    rw [LiEmap.aeval_esymm_vec]
    fin_cases i <;> rfl
  simp only [hvec]

end Li
