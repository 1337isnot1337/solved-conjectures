import Conjectures.LiWeighted2
import Conjectures.LiCoefficientExtraction

/-!
# Exact interpolation of the five elementary coefficients at `e₁ = 0`

A symmetric homogeneous polynomial of degree `31` in three variables has only
five elementary monomials that survive `e₁ = 0`:
`e₂¹⁴ e₃`, `e₂¹¹ e₃³`, `e₂⁸ e₃⁵`, `e₂⁵ e₃⁷`, and `e₂² e₃⁹`.

This file proves exact coefficient extraction from the five colour evaluations
`(1, r, -1-r)` with `r = 1, ..., 5`. The integer matrix identities are proved
in Lean. No value of the chromatic polynomial is assumed or computed here.
The concrete tree evaluations are a separate input to applications.
-/

open MvPolynomial
open scoped BigOperators

namespace LiInterpolation

/-- The powers of `e₂` in the five surviving monomials. -/
def powersTwo : Fin 5 → ℕ := ![14, 11, 8, 5, 2]

/-- The powers of `e₃` in the five surviving monomials. -/
def powersThree : Fin 5 → ℕ := ![1, 3, 5, 7, 9]

/-- Exponents of the five monomials, in elementary coordinates. -/
noncomputable def exponents (i : Fin 5) : Fin 3 →₀ ℕ :=
  Finsupp.single 1 (powersTwo i) + Finsupp.single 2 (powersThree i)

/-- `e₂` at the five colour evaluations. -/
def elementaryTwo : Fin 5 → ℚ := ![-3, -7, -13, -21, -31]

/-- `e₃` at the five colour evaluations. -/
def elementaryThree : Fin 5 → ℚ := ![-2, -6, -12, -20, -30]

/-- The elementary coordinates of `(1, r, -1-r)` for `r = 1, ..., 5`. -/
def elementaryWeights (j : Fin 5) : Fin 3 → ℚ :=
  ![0, elementaryTwo j, elementaryThree j]

/-- Positive integer denominators of the five inverse-matrix rows. -/
def denominators : Fin 5 → ℚ :=
  ![87607769991047287581600,
    105129323989256745097920000,
    7569311327226485647050240000,
    408742811670230224940712960000,
    353087408850215073914880000]

/-- Integer numerators of the inverse-matrix rows. Their exactness is proved by
`matrix_identity`; these literals carry no unproved certificate assumption. -/
def numerators : Fin 5 → Fin 5 → ℚ :=
  ![![-1861444452030800, 34709446050, -14631225, 22103, -42],
    ![-181018027182187176800, 3259656637078300, -1273467684475,
      1714374989, -2756236],
    ![-370866128361274837046392, 6319657635842595427, -2207652091019494,
      2590499317162, -3784001263],
    ![-235979106037956016077582968, 3669371941924359836433,
      -1098540895402054251, 1168460256880349, -1610773518501],
    ![-835774920567846949775176, 11040763070606103081, -2906405127959382,
      2893319258362, -3845472813]]

theorem denominators_pos (i : Fin 5) : 0 < denominators i := by
  fin_cases i <;> norm_num [denominators]

/-- The integer-scaled inverse really inverts the five evaluation columns. -/
theorem matrix_identity (i k : Fin 5) :
    (∑ j : Fin 5, numerators i j *
      (elementaryTwo j ^ powersTwo k * elementaryThree j ^ powersThree k)) =
      if k = i then denominators i else 0 := by
  fin_cases i <;> fin_cases k <;>
    norm_num [numerators, denominators, elementaryTwo, elementaryThree,
      powersTwo, powersThree, Fin.sum_univ_succ]

/-- Exact recovery of any of the five elementary coefficients from the five
evaluations. The exhaustive five-term expansion is supplied by
`LiCoefficientExtraction.aeval_eq_five_terms`. -/
theorem scaled_coefficient (p : MvPolynomial (Fin 3) ℚ)
    (hp : MvPolynomial.IsWeightedHomogeneous LiWeighted.wt p 31) (i : Fin 5) :
    denominators i * p.coeff (exponents i) =
      ∑ j : Fin 5, numerators i j * MvPolynomial.aeval (elementaryWeights j) p := by
  have hindex (k : Fin 5) : LiCoefficientExtraction.index k = exponents k := by
    fin_cases k <;> rfl
  have hpowersTwo (k : Fin 5) : (LiCoefficientExtraction.powers k).1 = powersTwo k := by
    fin_cases k <;> rfl
  have hpowersThree (k : Fin 5) : (LiCoefficientExtraction.powers k).2 = powersThree k := by
    fin_cases k <;> rfl
  have heval (j : Fin 5) :
      MvPolynomial.aeval (elementaryWeights j) p =
        ∑ k : Fin 5, p.coeff (exponents k) *
          (elementaryTwo j ^ powersTwo k * elementaryThree j ^ powersThree k) := by
    simpa [hindex, hpowersTwo, hpowersThree, elementaryWeights, mul_assoc] using
      (LiCoefficientExtraction.aeval_eq_five_terms p hp (elementaryTwo j) (elementaryThree j))
  have hfactor (k : Fin 5) :
      (∑ j : Fin 5, numerators i j * (p.coeff (exponents k) *
        (elementaryTwo j ^ powersTwo k * elementaryThree j ^ powersThree k))) =
      p.coeff (exponents k) * ∑ j : Fin 5, numerators i j *
        (elementaryTwo j ^ powersTwo k * elementaryThree j ^ powersThree k) := by
    rw [Finset.mul_sum]
    apply Finset.sum_congr rfl
    intro j _
    ring
  symm
  simp_rw [heval, Finset.mul_sum]
  rw [Finset.sum_comm]
  simp_rw [hfactor, matrix_identity]
  simp [mul_comm]

private theorem elementary_eval_three (a b c : ℚ) (i : Fin 3) :
    MvPolynomial.aeval (![a, b, c] : Fin 3 → ℚ)
      (MvPolynomial.esymm (Fin 3) ℚ (i.val + 1)) =
      (![a + b + c, a * b + a * c + b * c, a * b * c] : Fin 3 → ℚ) i := by
  fin_cases i
  · rw [MvPolynomial.esymm_one]
    simp [Fin.sum_univ_three]
  · rw [MvPolynomial.aeval_esymm_eq_multiset_esymm, Finset.esymm_map_val]
    rw [show Finset.powersetCard 2 (Finset.univ : Finset (Fin 3)) =
        ({{0, 1}, {0, 2}, {1, 2}} : Finset (Finset (Fin 3))) by decide]
    rw [Finset.sum_insert (by decide), Finset.sum_insert (by decide), Finset.sum_singleton]
    simp [Finset.prod_insert, Finset.prod_singleton, add_assoc]
  · rw [MvPolynomial.aeval_esymm_eq_multiset_esymm, Finset.esymm_map_val]
    rw [show Finset.powersetCard 3 (Finset.univ : Finset (Fin 3)) =
        ({Finset.univ} : Finset (Finset (Fin 3))) by decide]
    simp [Fin.prod_univ_three]

/-- The elementary-coordinate evaluations correspond to the five stated
colour evaluations. -/
theorem elementary_eval (j : Fin 5) (i : Fin 3) :
    MvPolynomial.aeval (![1, (j.val + 1 : ℚ), -(j.val + 2 : ℚ)] : Fin 3 → ℚ)
      (MvPolynomial.esymm (Fin 3) ℚ (i.val + 1)) = elementaryWeights j i := by
  rw [elementary_eval_three]
  fin_cases j <;> fin_cases i <;>
    norm_num [elementaryWeights, elementaryTwo, elementaryThree]

/-- Evaluating elementary coordinates equals evaluating the original symmetric
polynomial at the corresponding colours. -/
theorem eval_elementary_coordinates (g : MvPolynomial (Fin 3) ℚ)
    (hg : g.IsSymmetric) (j : Fin 5) :
    MvPolynomial.aeval (elementaryWeights j)
        ((MvPolynomial.esymmAlgEquiv (Fin 3) ℚ (n := 3) (by decide)).symm ⟨g, hg⟩) =
      MvPolynomial.aeval (![1, (j.val + 1 : ℚ), -(j.val + 2 : ℚ)] : Fin 3 → ℚ) g := by
  let p : MvPolynomial (Fin 3) ℚ :=
    (MvPolynomial.esymmAlgEquiv (Fin 3) ℚ (n := 3) (by decide)).symm ⟨g, hg⟩
  have hgp : MvPolynomial.aeval (fun i : Fin 3 => MvPolynomial.esymm (Fin 3) ℚ (i.val + 1))
      p = g := by
    have h := congrArg Subtype.val
      ((MvPolynomial.esymmAlgEquiv (Fin 3) ℚ (n := 3) (by decide)).apply_symm_apply ⟨g, hg⟩)
    rw [MvPolynomial.esymmAlgEquiv_apply, MvPolynomial.esymmAlgHom_apply] at h
    exact h
  change MvPolynomial.aeval (elementaryWeights j) p = _
  rw [← hgp, MvPolynomial.comp_aeval_apply]
  simp_rw [elementary_eval]

/-- Coefficient extraction directly from ordinary colour evaluations of a
symmetric homogeneous polynomial. In particular row `2` extracts `e₂⁸ e₃⁵`. -/
theorem scaled_chromatic_coefficient (g : MvPolynomial (Fin 3) ℚ)
    (hg : g.IsSymmetric) (hh : g.IsHomogeneous 31) (i : Fin 5) :
    denominators i *
        ((MvPolynomial.esymmAlgEquiv (Fin 3) ℚ (n := 3) (by decide)).symm ⟨g, hg⟩).coeff
          (exponents i) =
      ∑ j : Fin 5, numerators i j *
        MvPolynomial.aeval (![1, (j.val + 1 : ℚ), -(j.val + 2 : ℚ)] : Fin 3 → ℚ) g := by
  rw [scaled_coefficient _ (LiWeighted.weightedHomogeneous_symm g hg hh) i]
  apply Finset.sum_congr rfl
  intro j _
  rw [eval_elementary_coordinates g hg j]

end LiInterpolation
