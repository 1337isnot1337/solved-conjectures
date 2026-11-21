module

public import Conjectures.ChenKhareSahiOrthogonalityOrbits
public import Mathlib.Tactic.Ring

/-! The eleven literal power-sum-to-monomial identities in degree six.
Every identity holds for all six-variable real inputs and is proved by ring
normalization of the already checked distinct permutation sums. -/

@[expose] public section

namespace ChenKhareSahi.Orthogonality

set_option maxRecDepth 32768
set_option maxHeartbeats 12000000
set_option linter.unusedSimpArgs false

theorem power_expansion_0 (x : Fin 6 → ℝ) :
    powerSix 0 x = ∑ j : Index, (powerTransition 0 j : ℝ) * monomialSix j x := by
  norm_num [powerTransition, Fin.sum_univ_succ]
  norm_num [powerSix, parts, monomialSix_eq_list, orbitListCertificate,
      termSix, Fin.sum_univ_succ]
  ring

theorem power_expansion_1 (x : Fin 6 → ℝ) :
    powerSix 1 x = ∑ j : Index, (powerTransition 1 j : ℝ) * monomialSix j x := by
  norm_num [powerTransition, Fin.sum_univ_succ]
  norm_num [powerSix, parts, monomialSix_eq_list, orbitListCertificate,
      termSix, Fin.sum_univ_succ]
  ring

theorem power_expansion_2 (x : Fin 6 → ℝ) :
    powerSix 2 x = ∑ j : Index, (powerTransition 2 j : ℝ) * monomialSix j x := by
  norm_num [powerTransition, Fin.sum_univ_succ]
  norm_num [powerSix, parts, monomialSix_eq_list, orbitListCertificate,
      termSix, Fin.sum_univ_succ]
  ring

theorem power_expansion_3 (x : Fin 6 → ℝ) :
    powerSix 3 x = ∑ j : Index, (powerTransition 3 j : ℝ) * monomialSix j x := by
  norm_num [powerTransition, Fin.sum_univ_succ]
  norm_num [powerSix, parts, monomialSix_eq_list, orbitListCertificate,
      termSix, Fin.sum_univ_succ]
  ring

theorem power_expansion_4 (x : Fin 6 → ℝ) :
    powerSix 4 x = ∑ j : Index, (powerTransition 4 j : ℝ) * monomialSix j x := by
  norm_num [powerTransition, Fin.sum_univ_succ]
  norm_num [powerSix, parts, monomialSix_eq_list, orbitListCertificate,
      termSix, Fin.sum_univ_succ]
  ring

theorem power_expansion_5 (x : Fin 6 → ℝ) :
    powerSix 5 x = ∑ j : Index, (powerTransition 5 j : ℝ) * monomialSix j x := by
  norm_num [powerTransition, Fin.sum_univ_succ]
  norm_num [powerSix, parts, monomialSix_eq_list, orbitListCertificate,
      termSix, Fin.sum_univ_succ]
  ring

theorem power_expansion_6 (x : Fin 6 → ℝ) :
    powerSix 6 x = ∑ j : Index, (powerTransition 6 j : ℝ) * monomialSix j x := by
  norm_num [powerTransition, Fin.sum_univ_succ]
  norm_num [powerSix, parts, monomialSix_eq_list, orbitListCertificate,
      termSix, Fin.sum_univ_succ]
  ring

theorem power_expansion_7 (x : Fin 6 → ℝ) :
    powerSix 7 x = ∑ j : Index, (powerTransition 7 j : ℝ) * monomialSix j x := by
  norm_num [powerTransition, Fin.sum_univ_succ]
  norm_num [powerSix, parts, monomialSix_eq_list, orbitListCertificate,
      termSix, Fin.sum_univ_succ]
  ring

theorem power_expansion_8 (x : Fin 6 → ℝ) :
    powerSix 8 x = ∑ j : Index, (powerTransition 8 j : ℝ) * monomialSix j x := by
  norm_num [powerTransition, Fin.sum_univ_succ]
  norm_num [powerSix, parts, monomialSix_eq_list, orbitListCertificate,
      termSix, Fin.sum_univ_succ]
  ring

theorem power_expansion_9 (x : Fin 6 → ℝ) :
    powerSix 9 x = ∑ j : Index, (powerTransition 9 j : ℝ) * monomialSix j x := by
  norm_num [powerTransition, Fin.sum_univ_succ]
  norm_num [powerSix, parts, monomialSix_eq_list, orbitListCertificate,
      termSix, Fin.sum_univ_succ]
  ring

theorem power_expansion_10 (x : Fin 6 → ℝ) :
    powerSix 10 x = ∑ j : Index, (powerTransition 10 j : ℝ) * monomialSix j x := by
  norm_num [powerTransition, Fin.sum_univ_succ]
  norm_num [powerSix, parts, monomialSix_eq_list, orbitListCertificate,
      termSix, Fin.sum_univ_succ]
  ring

/-- The certified matrix is the actual power-sum-to-monomial change of basis. -/
theorem power_expansion (i : Index) (x : Fin 6 → ℝ) :
    powerSix i x = ∑ j : Index, (powerTransition i j : ℝ) * monomialSix j x := by
  fin_cases i
  · exact power_expansion_0 x
  · exact power_expansion_1 x
  · exact power_expansion_2 x
  · exact power_expansion_3 x
  · exact power_expansion_4 x
  · exact power_expansion_5 x
  · exact power_expansion_6 x
  · exact power_expansion_7 x
  · exact power_expansion_8 x
  · exact power_expansion_9 x
  · exact power_expansion_10 x

end ChenKhareSahi.Orthogonality
