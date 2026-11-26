import Conjectures.AsgarliGhiocaYipPlaneFactor
import Conjectures.AsgarliGhiocaYipUniversalResolvent
import Mathlib.RingTheory.Polynomial.Vieta

/-! # A single plane model for every twist of the cover

Use a separator with coefficients in the ground field. Right translation on
the labels is represented by a rational function on one plane model; its
denominator is the ordinate derivative of that model, not its discriminant.
-/

namespace Conjectures.AsgarliGhiocaYip

open Finset Polynomial
open scoped Classical

variable {K E : Type*} [Field K] [Field E] [Algebra K E]
variable {k d : ℕ}

private noncomputable def coordinatePolynomial (v : Fin k → Fin d → E) : E[X] :=
  ∑ e : Fin (k * d), monomial e.val
    (v (finProdFinEquiv.symm e).1 (finProdFinEquiv.symm e).2)

private theorem coeff_coordinatePolynomial (v : Fin k → Fin d → E) (e : Fin (k * d)) :
    (coordinatePolynomial v).coeff e.val =
      v (finProdFinEquiv.symm e).1 (finProdFinEquiv.symm e).2 := by
  rw [coordinatePolynomial, finsetSum_coeff, sum_eq_single e]
  · exact coeff_monomial_same ..
  · intro l _ hl
    exact coeff_monomial_of_ne _ (fun h ↦ hl (Fin.ext h.symm))
  · simp

/-- Base-field coefficients separate the orderings at the common seed. -/
theorem exists_ground_separator [Fintype K] (hd : 2 ≤ d) (hk : 0 < k)
    (hq : (d ^ (d * k)) ^ 8 ≤ Fintype.card K) {r : Fin d → E} (hr : Function.Injective r) :
    ∃ w : Fin k → Fin d → K, Function.Injective
      (linearOrderingValue (fun i j ↦ algebraMap K E (w i j)) (fun _ ↦ r)) := by
  let V (π : LabelPermutations k d) (i : Fin k) (j : Fin d) : E := r (π i j)
  have hpoly : Function.Injective (fun π ↦ coordinatePolynomial (V π)) := by
    intro π ρ h
    funext i; apply Equiv.ext; intro j
    apply hr
    have hv := congrArg (fun p : E[X] ↦ p.coeff (finProdFinEquiv (i, j)).val) h
    simpa only [coeff_coordinatePolynomial, Equiv.symm_apply_apply, V] using hv
  have hdeg (π : LabelPermutations k d) : (coordinatePolynomial (V π)).natDegree ≤ k * d - 1 := by
    unfold coordinatePolynomial
    apply natDegree_sum_le_of_forall_le
    intro e _
    exact (natDegree_monomial_le _).trans (Nat.le_sub_one_of_lt e.isLt)
  obtain ⟨s, hs⟩ := exists_injective_evaluation (K := K) hpoly hdeg (label_collision_budget hd hk hq)
  let w (i : Fin k) (j : Fin d) := s ^ (finProdFinEquiv (i,j)).val
  have he (π : LabelPermutations k d) : (coordinatePolynomial (V π)).eval (algebraMap K E s) =
      linearOrderingValue (fun i j ↦ algebraMap K E (w i j)) (fun _ ↦ r) π := by
    simp only [coordinatePolynomial, eval_finsetSum, eval_monomial]
    rw [← Equiv.sum_comp finProdFinEquiv]
    simp only [Equiv.symm_apply_apply, Fintype.sum_prod_type, V, linearOrderingValue, w, map_pow]
    simp only [mul_comm]
  exact ⟨w, by simpa only [he] using hs⟩

variable (A : Fin k → PlanePolynomial K)

private noncomputable def twistInput (a : Fin k × Fin d) : K[X] :=
  (-1) ^ (a.2.val + 1) * (A a.1).coeff (d - (a.2.val + 1))

private theorem natDegree_twistInput_le (hA : ∀ i j, ((A i).coeff j).natDegree ≤ d - j)
    (a : Fin k × Fin d) : (twistInput A a).natDegree ≤ a.2.val + 1 := by
  have hm : a.2.val + 1 ≤ d := a.2.isLt
  have hs : (-1 : K[X]) ^ (a.2.val + 1) = C ((-1 : K) ^ (a.2.val + 1)) := by simp
  rw [twistInput, hs]
  exact (natDegree_C_mul_le _ _).trans (by
    simpa only [Nat.sub_sub_self hm] using (hA a.1 (d - (a.2.val + 1))))

/-- The monic plane resolvent for a ground-field separator. -/
noncomputable def groundResolvent (w : Fin k → Fin d → K) : PlanePolynomial K :=
  (coefficientResolvent w).map (MvPolynomial.aeval (twistInput A)).toRingHom

/-- The numerator for the right translation by `τ`. -/
noncomputable def groundTwist (w : Fin k → Fin d → K) (τ : LabelPermutations k d) : PlanePolynomial K :=
  (coefficientTwist w τ).map (MvPolynomial.aeval (twistInput A)).toRingHom

variable (w : Fin k → Fin d → K)

theorem groundResolvent_monic : (groundResolvent A w).Monic := (coefficientResolvent_monic w).map _

theorem natDegree_groundResolvent : (groundResolvent A w).natDegree = d.factorial ^ k :=
  ((coefficientResolvent_monic w).natDegree_map _).trans (natDegree_coefficientResolvent w)

theorem natDegree_coeff_groundResolvent_le (hA : ∀ i j, ((A i).coeff j).natDegree ≤ d - j) (j : ℕ) :
    ((groundResolvent A w).coeff j).natDegree ≤ d.factorial ^ k - j := by
  rw [groundResolvent, coeff_map]
  exact natDegree_aeval_le_of_weightedHomogeneous (natDegree_twistInput_le A hA)
    (coeff_coefficientResolvent_weighted w j)

theorem natDegree_groundTwist_le (τ : LabelPermutations k d) :
    (groundTwist A w τ).natDegree ≤ d.factorial ^ k - 1 :=
  natDegree_map_le.trans (natDegree_coefficientTwist_le w τ)

theorem natDegree_coeff_groundTwist_le (hA : ∀ i j, ((A i).coeff j).natDegree ≤ d - j)
    (τ : LabelPermutations k d) (j : ℕ) :
    ((groundTwist A w τ).coeff j).natDegree ≤ d.factorial ^ k - j := by
  rw [groundTwist, coeff_map]
  exact natDegree_aeval_le_of_weightedHomogeneous (natDegree_twistInput_le A hA)
    (coeff_coefficientTwist_weighted w τ j)

section Evaluate

variable {S : Type*} [CommRing S] (f : K[X] →+* S) (v : Fin k → Fin d → S)
variable (hv : ∀ i, (A i).map f = ∏ j, (X - C (v i j)))

include hv

private theorem map_twistInput (a : Fin k × Fin d) : f (twistInput A a) =
    ((univ : Finset (Fin d)).val.map (v a.1)).esymm (a.2.val + 1) := by
  let m := a.2.val + 1
  let roots := (univ : Finset (Fin d)).val.map (v a.1)
  have hm : m ≤ d := a.2.isLt
  have hcard : roots.card = d := by simp [roots]
  have hprod : (roots.map fun x ↦ X - C x).prod = (A a.1).map f := by
    rw [hv]
    simp only [roots, Multiset.map_map, Function.comp_def]
    rfl
  have hcoeff := roots.prod_X_sub_C_coeff (k := d - m) (by rw [hcard]; omega)
  rw [hcard, Nat.sub_sub_self hm, hprod, coeff_map] at hcoeff
  change f ((-1) ^ m * (A a.1).coeff (d - m)) = roots.esymm m
  simp only [map_mul, map_pow, map_neg, map_one]
  rw [hcoeff, ← mul_assoc, ← mul_pow, neg_mul_neg, one_mul, one_pow, one_mul]

theorem groundResolvent_map : (groundResolvent A w).map f =
    ∏ π : LabelPermutations k d,
      (X - C (linearOrderingValue (fun i j ↦ f (C (w i j))) v π)) := by
  rw [groundResolvent, Polynomial.map_map]
  change (coefficientResolvent w).map (f.comp (MvPolynomial.eval₂Hom C (twistInput A))) = _
  rw [MvPolynomial.comp_eval₂Hom]
  simp_rw [map_twistInput A f v hv]
  exact coefficientResolvent_eval_of_roots (f.comp C) w v

private theorem groundTwist_map (τ : LabelPermutations k d) : (groundTwist A w τ).map f =
    ∑ π : LabelPermutations k d, C (linearOrderingValue (fun i j ↦ f (C (w i j))) v (π * τ)) *
      ∏ π' ∈ univ.erase π, (X - C (linearOrderingValue (fun i j ↦ f (C (w i j))) v π')) := by
  rw [groundTwist, Polynomial.map_map]
  change (coefficientTwist w τ).map (f.comp (MvPolynomial.eval₂Hom C (twistInput A))) = _
  rw [MvPolynomial.comp_eval₂Hom]
  simp_rw [map_twistInput A f v hv]
  exact coefficientTwist_eval_of_roots (f.comp C) w v τ

/-- At an ordering root, the interpolation numerator equals the derivative
times the value of the translated ordering. This holds even with collisions. -/
theorem eval_groundTwist (π τ : LabelPermutations k d) :
    let x := linearOrderingValue (fun i j ↦ f (C (w i j))) v
    ((groundTwist A w τ).map f).eval (x π) =
      ((groundResolvent A w).derivative.map f).eval (x π) * x (π * τ) := by
  dsimp only
  rw [groundTwist_map A w f v hv, ← derivative_map, groundResolvent_map A w f v hv,
    derivative_prod_finset]
  let x := linearOrderingValue (fun i j ↦ f (C (w i j))) v
  simp only [eval_finsetSum, eval_mul, eval_C, derivative_sub, derivative_X, derivative_C, sub_zero,
    mul_one, eval_prod, eval_sub, eval_X, sum_mul]
  apply sum_congr rfl
  intro ρ _
  by_cases h : ρ = π
  · subst ρ; exact mul_comm ..
  · have hz : (∏ ρ' ∈ univ.erase ρ, (x π - x ρ')) = 0 :=
      prod_eq_zero (mem_erase.mpr ⟨fun he ↦ h he.symm, mem_univ _⟩) (sub_self _)
    change x (ρ * τ) * _ = _ * x (π * τ)
    rw [hz, zero_mul, mul_zero]

end Evaluate

end Conjectures.AsgarliGhiocaYip
