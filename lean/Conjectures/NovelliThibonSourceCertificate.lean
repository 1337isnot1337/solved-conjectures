module
public import Conjectures.NovelliThibonSourceLaurent
public import Conjectures.NovelliThibonLaurentProduct
public import Mathlib.Algebra.MonoidAlgebra.Lift
public import Mathlib.Algebra.MvPolynomial.Eval

@[expose] public section
namespace NovelliThibon

abbrev ParameterVector := ℤ × (ℕ → ℤ)

def ParameterPowers.vector (s : ParameterPowers) : ParameterVector := (s.qPower,s.tPower)

theorem parameterVector_injective : Function.Injective ParameterPowers.vector := by
  rintro ⟨q,t⟩ ⟨q',t'⟩ h
  exact congrArg (fun x : ParameterVector => ParameterPowers.mk x.1 x.2) h

/-- Genuine formal Laurent polynomial, with symmetric-function variables
in the coefficient ring and independent integral parameter exponents. -/
noncomputable def sourceLaurentPolynomial (m : ℕ) (μ : YoungDiagram) :
    AddMonoidAlgebra (MvPolynomial (Fin (m+2)) ℤ) ParameterVector :=
  ∑ w : Cell μ → Fin (m+2), AddMonoidAlgebra.single (fillingPowers m μ w).vector
    (cellWordWeight MvPolynomial.X w)

theorem sourceLaurentPolynomial_schur_coeff (m : ℕ) (μ lam : YoungDiagram) (s : ParameterPowers) :
    schurExtract (m:=m) lam ((sourceLaurentPolynomial m μ).coeff s.vector) =
      powerSchurCoefficient m μ lam s := by
  classical
  unfold sourceLaurentPolynomial powerSchurCoefficient
  congr 1
  simp only [AddMonoidAlgebra.coeff_sum,Finsupp.finsetSum_apply,
    AddMonoidAlgebra.coeff_single,Finset.sum_filter,Finsupp.single_apply]
  apply Finset.sum_congr rfl
  intro w _
  by_cases h : fillingPowers m μ w=s
  · simp [h]
  · have hv : (fillingPowers m μ w).vector ≠ s.vector := fun e => h (parameterVector_injective e)
    simp [h,hv]

noncomputable def parameterUnitEvaluation {K : Type*} [CommRing K]
    (J : Finset ℕ) (q : Kˣ) (t : ℕ → Kˣ) : Multiplicative ParameterVector →* Kˣ where
  toFun s := q^s.toAdd.1 * ∏ j∈J,t j^(s.toAdd.2 j)
  map_one' := by
    change q^(0:ℤ) * (∏ j∈J,t j^(0:ℤ)) = _
    simp
  map_mul' s r := by
    change q^(s.toAdd.1+r.toAdd.1) * (∏ j∈J,t j^(s.toAdd.2 j+r.toAdd.2 j)) =
      (q^s.toAdd.1 * ∏ j∈J,t j^(s.toAdd.2 j)) *
        (q^r.toAdd.1 * ∏ j∈J,t j^(r.toAdd.2 j))
    simp only [zpow_add,Finset.prod_mul_distrib]
    ac_rfl

/-- Evaluation of the formal Laurent ring at independent units, and
evaluation of the ordinary alphabet variables at the prescribed letters. -/
noncomputable def sourceLaurentSpecialization {K : Type*} [Field K] (m : ℕ)
    (J : Finset ℕ) (x : Fin (m+2) → K) (q : Kˣ) (t : ℕ → Kˣ) :
    AddMonoidAlgebra (MvPolynomial (Fin (m+2)) ℤ) ParameterVector →+* K :=
  AddMonoidAlgebra.liftNCRingHom (MvPolynomial.eval₂Hom (Int.castRingHom K) x)
    ((Units.coeHom K).comp (parameterUnitEvaluation J q t)) (fun _ _ => Commute.all _ _)

/-- The original modified graph sum specializes the same genuine
Laurent polynomial whose exact Schur coefficient product is checked. -/
theorem sourceShapeEvaluation_eq_specialization {K : Type*} [Field K]
    (m : ℕ) (μ : YoungDiagram) {n : ℕ} (h : μ.card=n+1) (x : Fin (m+2) → K)
    (q : Kˣ) (hq1 : (q:K)≠1) (t : ℕ → Kˣ) :
    sourceShapeEvaluation μ h x (q:K) (fun j => (t j:K)) =
      sourceLaurentSpecialization m (activeLegs μ) x q t (sourceLaurentPolynomial m μ) := by
  rw [sourceShapeEvaluation_eq_Laurent_fillings μ h x (q:K) q.ne_zero hq1]
  unfold sourceLaurentPolynomial
  rw [map_sum]
  apply Finset.sum_congr rfl
  intro w _
  unfold sourceLaurentSpecialization
  rw [AddMonoidAlgebra.liftNCRingHom_single]
  have hh : (MvPolynomial.eval₂Hom (Int.castRingHom K) x) (cellWordWeight MvPolynomial.X w) =
      cellWordWeight x w := by
    unfold cellWordWeight
    rw [map_prod]
    simp
  rw [hh,mul_comm]
  simp [parameterUnitEvaluation,ParameterPowers.vector,fillingPowers]

/-- Conjecture 5.7 with the source's printed shape index corrected:
the exact product of the parameter monomials in a Schur coordinate,
with their signed coefficients, is the proposed monomial to the
cardinality of the literal vertical-start standard tableaux. -/
theorem sourceLaurentPolynomial_monomial_product {G : Type*} [CommGroup G] (m : ℕ)
    (μ : YoungDiagram) (lam : BoundedDiagram (m+2)) (q : G) (t : ℕ → G) :
    (∏ s ∈ fillingPowerSupport m μ,
      (q^s.qPower * ∏ j ∈ activeLegs μ,t j^s.tPower j) ^
        schurExtract (m:=m) lam.val ((sourceLaurentPolynomial m μ).coeff s.vector)) =
      (q^(∑ r : Fin (μ.colLen 0),((μ.rowLen r.val).choose 2:ℤ)) *
        ∏ j ∈ activeLegs μ,t j^(μ.rowLen j:ℤ)) ^
          (Fintype.card (VerticalStandardTableau (μ.card-2) lam.val):ℤ) := by
  simp_rw [sourceLaurentPolynomial_schur_coeff]
  exact normalized_filling_monomial_product m μ lam q t

end NovelliThibon
