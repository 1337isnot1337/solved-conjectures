import Conjectures.AsgarliGhiocaYipRootLabels
import Mathlib.Algebra.Polynomial.Lifts
import Mathlib.RingTheory.Polynomial.UniqueFactorization

/-! # Descent of a monic plane factor through a simple rational root

The inner polynomial variable is the parameter `T`; the outer variable is `Z`.
Only the derivative in `Z` is used. A simple rational root of one specialization
identifies an irreducible factor uniquely, so Frobenius must preserve the monic factor.
-/

namespace Conjectures.AsgarliGhiocaYip

open Polynomial

/-- Polynomials in the parameter `T` and the separator value `Z`, in that order. -/
abbrev PlanePolynomial (R : Type*) [Semiring R] := Polynomial (Polynomial R)

section CommRing

variable {R S : Type*} [CommRing R] [CommRing S]

/-- Specialize the parameter of a plane polynomial, leaving the `Z` variable. -/
noncomputable def specialize (t : R) : PlanePolynomial R →+* R[X] :=
  mapRingHom (evalRingHom t)

/-- Evaluate first at `T = t` and then at `Z = z`. -/
noncomputable def planeEval (t z : R) : PlanePolynomial R →+* R :=
  (evalRingHom z).comp (specialize t)

/-- Map the scalar coefficients of a plane polynomial. -/
noncomputable def planeMap (f : R →+* S) : PlanePolynomial R →+* PlanePolynomial S :=
  mapRingHom (mapRingHom f)

theorem specialize_planeMap (f : R →+* S) (t : R) (P : PlanePolynomial R) :
    specialize (f t) (planeMap f P) = (specialize t P).map f := by
  ext n
  simp [specialize, planeMap, eval_map]

theorem planeEval_map (f : R →+* S) (t z : R) (P : PlanePolynomial R) :
    planeEval (f t) (f z) (planeMap f P) = f (planeEval t z P) := by
  simp [planeEval, specialize_planeMap]

theorem derivative_planeMap (f : R →+* S) (P : PlanePolynomial R) :
    (planeMap f P).derivative = planeMap f P.derivative := by
  exact derivative_map P (mapRingHom f)

/-- A factor through a simple zero is itself simple there. In particular, this
proves that its ordinate derivative is nonzero even in finite characteristic. -/
theorem planeEval_derivative_ne_zero_of_dvd {F P : PlanePolynomial R} {t z : R}
    (hdiv : F ∣ P) (hroot : planeEval t z F = 0)
    (hsimple : planeEval t z P.derivative ≠ 0) : planeEval t z F.derivative ≠ 0 := by
  intro hF
  obtain ⟨H, rfl⟩ := hdiv
  apply hsimple
  rw [derivative_mul, map_add, map_mul, map_mul, hroot, hF, zero_mul, zero_mul, add_zero]

end CommRing

private theorem split_monic {R : Type*} [CommRing R] [IsDomain R] {P A B : R[X]}
    (hP : P.Monic) (h : P = A * B) (hA : ¬ IsUnit A) (hB : ¬ IsUnit B) :
    ∃ U V : R[X], U.Monic ∧ V.Monic ∧ ¬ IsUnit U ∧ ¬ IsUnit V ∧ P = U * V := by
  have hcoeff : A.leadingCoeff * B.leadingCoeff = 1 := by
    rw [← leadingCoeff_mul, ← h, hP.leadingCoeff]
  let u : Rˣ := ⟨A.leadingCoeff, B.leadingCoeff, hcoeff, (mul_comm ..).trans hcoeff⟩
  have hunit : IsUnit (C B.leadingCoeff) := (isUnit_C).mpr (u⁻¹).isUnit
  have hunit' : IsUnit (C A.leadingCoeff) := (isUnit_C).mpr u.isUnit
  refine ⟨A * C B.leadingCoeff, B * C A.leadingCoeff, ?_, ?_,
    fun hu ↦ hA (IsUnit.mul_iff.mp hu).1, fun hv ↦ hB (IsUnit.mul_iff.mp hv).1, ?_⟩
  · simp [Monic, hcoeff]
  · simp [Monic, mul_comm B.leadingCoeff, hcoeff]
  · rw [mul_mul_mul_comm, ← map_mul, mul_comm B.leadingCoeff, hcoeff, map_one, mul_one, ← h]

/-- Monic factorization over a domain, using the outer degree as the strictly
decreasing measure. It is not necessary to choose a normalization on `R`. -/
theorem exists_monic_irred_factorization {R : Type*} [CommRing R] [IsDomain R]
    {P : R[X]} (hP : P.Monic) :
    ∃ s : Multiset R[X], s.prod = P ∧ ∀ F ∈ s, F.Monic ∧ Irreducible F := by
  by_cases hu : IsUnit P
  · refine ⟨0, ?_, by simp⟩
    simpa using ((hP.isUnit_iff.mp hu).symm)
  rcases irreducible_or_factor hu with hi | ⟨A, B, hA, hB, he⟩
  · exact ⟨{P}, by simp, by simpa using And.intro hP hi⟩
  obtain ⟨F, G, hF, hG, hFu, hGu, hFG⟩ := split_monic hP he hA hB
  have hdeg : P.natDegree = F.natDegree + G.natDegree := by rw [hFG, hF.natDegree_mul hG]
  have hFpos := hF.natDegree_pos_of_not_isUnit hFu
  have hGpos := hG.natDegree_pos_of_not_isUnit hGu
  obtain ⟨s, hs, hs'⟩ := exists_monic_irred_factorization hF
  obtain ⟨t, ht, ht'⟩ := exists_monic_irred_factorization hG
  refine ⟨s + t, by rw [Multiset.prod_add, hs, ht, ← hFG], ?_⟩
  intro H hH
  exact (Multiset.mem_add.mp hH).elim (hs' H) (ht' H)
termination_by P.natDegree
decreasing_by all_goals omega

private theorem exists_monic_irred_at_root {R E : Type*} [CommRing R] [IsDomain R] [Field E]
    (e : R[X] →+* E) {P : R[X]} (hP : P.Monic) (hroot : e P = 0) :
    ∃ F : R[X], F.Monic ∧ Irreducible F ∧ F ∣ P ∧ e F = 0 := by
  have hU : ¬ IsUnit P := fun hu ↦ (hu.map e).ne_zero hroot
  rcases irreducible_or_factor hU with hI | ⟨A, B, hA, hB, h⟩
  · exact ⟨P, hP, hI, dvd_rfl, hroot⟩
  obtain ⟨U, V, hUm, hVm, hUn, hVn, hUV⟩ := split_monic hP h hA hB
  have hdeg : P.natDegree = U.natDegree + V.natDegree := by
    rw [hUV, natDegree_mul hUm.ne_zero hVm.ne_zero]
  have hUdeg := hUm.natDegree_pos_of_not_isUnit hUn
  have hVdeg := hVm.natDegree_pos_of_not_isUnit hVn
  have hprod : e U * e V = 0 := by rwa [← map_mul, ← hUV]
  rcases mul_eq_zero.mp hprod with h0 | h0
  · obtain ⟨F, hm, hi, hd, he⟩ := exists_monic_irred_at_root e hUm h0
    exact ⟨F, hm, hi, hd.trans (hUV ▸ dvd_mul_right U V), he⟩
  · obtain ⟨F, hm, hi, hd, he⟩ := exists_monic_irred_at_root e hVm h0
    exact ⟨F, hm, hi, hd.trans (hUV ▸ dvd_mul_left V U), he⟩
termination_by P.natDegree
decreasing_by all_goals omega

private theorem unique_monic_irred_at_simple_root {R E : Type*}
    [CommRing R] [IsDomain R] [UniqueFactorizationMonoid R[X]] [Field E]
    (e : R[X] →+* E) {P F G : R[X]} (hsimple : e P.derivative ≠ 0)
    (hF : F.Monic) (hFi : Irreducible F) (hFd : F ∣ P) (hF0 : e F = 0)
    (hG : G.Monic) (hGi : Irreducible G) (hGd : G ∣ P) (hG0 : e G = 0) : F = G := by
  obtain ⟨Q, hQ⟩ := hFd
  have hQ0 : e Q ≠ 0 := by
    intro h
    apply hsimple
    rw [hQ, derivative_mul, map_add, map_mul, map_mul, h, hF0, mul_zero, zero_mul, add_zero]
  rcases hGi.prime.dvd_or_dvd (hQ ▸ hGd) with h | ⟨A, hA⟩
  · exact (eq_of_monic_of_associated hG hF (associated_of_dvd_dvd h (hGi.dvd_symm hFi h))).symm
  · exact (hQ0 (by rw [hA, map_mul, hG0, zero_mul])).elim

section Descent

variable {K E : Type*} [Field K] [Fintype K] [Field E] [Algebra K E]
variable [Algebra.IsAlgebraic K E]

/-- Coefficientwise Frobenius, fixing both plane variables. -/
noncomputable def planeFrobenius : PlanePolynomial E ≃ₐ[K] PlanePolynomial E :=
  mapAlgEquiv (mapAlgEquiv (FiniteField.frobeniusAlgEquivOfAlgebraic K E))

theorem planeFrobenius_apply (P : PlanePolynomial E) :
    planeFrobenius (K := K) P =
      planeMap (FiniteField.frobeniusAlgEquivOfAlgebraic K E).toAlgHom.toRingHom P := rfl

theorem planeFrobenius_lift (P : PlanePolynomial K) :
    planeFrobenius (K := K) (planeMap (algebraMap K E) P) = planeMap (algebraMap K E) P := by
  ext i j
  simp [planeFrobenius_apply, planeMap]

private theorem exists_planeMap_eq_of_fixed {F : PlanePolynomial E}
    (hF : planeFrobenius (K := K) F = F) : ∃ f : PlanePolynomial K, planeMap (algebraMap K E) f = F := by
  apply (mem_lifts (f := mapRingHom (algebraMap K E)) F).mp
  apply (lifts_iff_coeff_lifts _).mpr
  intro i
  apply (mem_lifts _).mp
  apply (lifts_iff_coeff_lifts _).mpr
  intro j
  apply mem_base_of_pow_card
  have he := congrArg (fun P : PlanePolynomial E ↦ (P.coeff i).coeff j) hF
  simp only [planeFrobenius_apply, planeMap, coe_mapRingHom, coeff_map] at he
  change FiniteField.frobeniusAlgEquivOfAlgebraic K E ((F.coeff i).coeff j) = _ at he
  rwa [FiniteField.coe_frobeniusAlgEquivOfAlgebraic] at he

theorem exists_planeMap_eq_of_frobenius_fixed {F : PlanePolynomial E}
    (hF : planeMap (FiniteField.frobeniusAlgEquivOfAlgebraic K E).toAlgHom.toRingHom F = F) :
    ∃ f : PlanePolynomial K, planeMap (algebraMap K E) f = F :=
  exists_planeMap_eq_of_fixed hF

/-- Step 3 of the reduction. A simple rational zero of a monic plane polynomial
pins a monic factor over the ground field that is irreducible over `E`.
Taking `E = AlgebraicClosure K` gives the needed geometric irreducibility. -/
theorem exists_geometric_factor_at_simple_root {P : PlanePolynomial K} (hP : P.Monic)
    {t z : K} (hroot : planeEval t z P = 0) (hsimple : planeEval t z P.derivative ≠ 0) :
    ∃ F : PlanePolynomial K, F.Monic ∧ Irreducible (planeMap (algebraMap K E) F) ∧
      F ∣ P ∧ planeEval t z F = 0 ∧ 0 < F.natDegree ∧ F.natDegree ≤ P.natDegree := by
  let f := algebraMap K E
  let Q := planeMap f P
  let e := planeEval (f t) (f z)
  have hQ : Q.Monic := hP.map _
  have hQ0 : e Q = 0 := by simp [Q, e, planeEval_map, hroot]
  have hQs : e Q.derivative ≠ 0 := by
    change planeEval (f t) (f z) (planeMap f P).derivative ≠ 0
    rw [derivative_planeMap, planeEval_map, ← f.map_zero, f.injective.ne_iff]
    exact hsimple
  obtain ⟨G, hG, hGi, hGd, hG0⟩ := exists_monic_irred_at_root e hQ hQ0
  let φ := planeFrobenius (K := K) (E := E)
  have hφQ : φ Q = Q := planeFrobenius_lift P
  have hφG : φ G = G := by
    have hφG0 : e (φ G) = 0 := by
      let ψ := FiniteField.frobeniusAlgEquivOfAlgebraic K E
      simpa [φ, planeFrobenius_apply, e, f, ψ, AlgEquiv.commutes, hG0] using
        planeEval_map ψ.toAlgHom.toRingHom (f t) (f z) G
    have hφGd : φ G ∣ Q := by
      obtain ⟨H, hH⟩ := hGd
      exact ⟨φ H, hφQ.symm.trans ((congrArg φ hH).trans (map_mul φ G H))⟩
    have hφGi : Irreducible (φ G) := (MulEquiv.irreducible_iff φ.toRingEquiv.toMulEquiv).mpr hGi
    have hφGm : (φ G).Monic := hG.map _
    exact unique_monic_irred_at_simple_root e hQs hφGm hφGi hφGd hφG0 hG hGi hGd hG0
  obtain ⟨F, hF⟩ := exists_planeMap_eq_of_fixed hφG
  obtain ⟨H, hH⟩ := hGd
  have hφH : φ H = H := by
    apply mul_left_cancel₀ hG.ne_zero
    have h := congrArg φ hH
    rw [map_mul, hφG, hφQ, hH] at h
    exact h.symm
  obtain ⟨B, hB⟩ := exists_planeMap_eq_of_fixed hφH
  have hf' : Function.Injective (mapRingHom f) := map_injective f f.injective
  have hf : Function.Injective (planeMap f) := map_injective (mapRingHom f) hf'
  have hFd : F ∣ P := by
    refine ⟨B, hf ?_⟩
    rw [map_mul, hF, hB]; exact hH
  have hFm : F.Monic := monic_of_injective hf' (show (planeMap f F).Monic by rw [hF]; exact hG)
  have hFi : Irreducible (planeMap f F) := hF.symm ▸ hGi
  have hF0 : planeEval t z F = 0 := by
    apply f.injective
    rw [← planeEval_map, hF, hG0, map_zero]
  refine ⟨F, hFm, hFi, hFd, hF0, hFm.natDegree_pos.mpr ?_, natDegree_le_of_dvd hFd hP.ne_zero⟩
  intro h; exact hFi.not_isUnit (by rw [h, map_one]; exact isUnit_one)

end Descent

end Conjectures.AsgarliGhiocaYip
