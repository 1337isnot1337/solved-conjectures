module
public import Conjectures.NovelliThibonJacobiInterpolation

@[expose] public section
namespace NovelliThibon

open Polynomial Matrix
open Classical

variable {n : ℕ} {I : Type*} [Fintype I]

/-- Checks the final coefficient extraction for any stable ordinary
Jacobi–Trudi expansion of the source. Its input is the exact Schur
expansion identity at all ordinary repeated alphabets. It does not
assert that an expansion exists or assume the requested hook equality. -/
theorem hook_coeff_of_stable_JacobiTrudi (μ : YoungDiagram) (h : μ.card=n+1)
    (q : ℚ) (hq : q≠0) (hq1 : q≠1) (t : ℕ → ℚ)
    (a : ℕ → ℚ) (b : I → ℚ) (r : I → ℕ)
    (rows : ∀ i : I,Fin (r i+2) → ℕ)
    (hFirst : ∀ i : I,0 < rows i 0) (hSecond : ∀ i : I,2 ≤ rows i 1)
    (hOrd : ∀ (m : ℕ) (z : ℚ),
      sourceShapeEvaluation μ h (repeatedLetterWeight m z) q t =
        (∑ j : Fin (n+1),a j.val *
          (ordinaryJacobiTrudi (hookRows j.val (n+1-j.val)) z m).det) +
        ∑ i : I,b i*(ordinaryJacobiTrudi (rows i) z m).det)
    (k : ℕ) (hk : k < μ.card) :
    a k = ∑ T ∈ (Finset.univ.erase (distinguishedHookCell μ (by omega))).powersetCard k,
      ∏ c ∈ T,hookCellWeight q t c := by
  have hpol (z : ℚ) :
      sourceRepeatedPolynomial μ h q z t =
        (∑ j : Fin (n+1),C (a j.val) *
          (repeatedJacobiTrudi (hookRows j.val (n+1-j.val)) z).det) +
        ∑ i : I,C (b i)*(repeatedJacobiTrudi (rows i) z).det := by
    apply Polynomial.eq_of_infinite_eval_eq
    apply (Set.infinite_range_of_injective (Nat.cast_injective (R:=ℚ))).mono
    rintro _ ⟨m,rfl⟩
    simp only [Set.mem_ofPred_eq,sourceRepeatedPolynomial_eval_nat,eval_add,eval_finsetSum,
      eval_mul,eval_C,repeatedJacobiTrudi_eval_nat]
    exact hOrd m z
  have hpointwise (z : ℚ) :
      (1-z)*(residualHookProduct μ (by omega) q t).eval z =
        (1-z)*∑ j : Fin (n+1),a j.val*(-z)^j.val := by
    have he := congrArg (fun p : ℚ[X] => p.eval (-1)) (hpol z)
    have hh (j : Fin (n+1)) :
        (specializedJacobiTrudi (hookRows j.val (n+1-j.val)) z).det = (1-z)*(-z)^j.val :=
      specializedJacobiTrudi_hook _ _ (Nat.sub_pos_of_lt j.isLt) z
    have hn (i : I) :
        (specializedJacobiTrudi (rows i) z).det = 0 :=
      specializedJacobiTrudi_nonhook _ (hFirst i) (hSecond i) z
    simp only [sourceRepeatedPolynomial_eval_neg_one,
      signedSourceShapeEvaluation_eq_residualHookProduct μ h q z hq hq1,
      eval_add,eval_finsetSum,eval_mul,eval_C,repeatedJacobiTrudi_eval_neg_one,hh,hn,
      mul_zero,Finset.sum_const_zero,add_zero] at he
    rw [he,Finset.mul_sum]
    apply Finset.sum_congr rfl
    intro j _
    ac_rfl
  have hp :
      (1-X) * signedHookSeries μ.card a = (1-X) * residualHookProduct μ (by omega) q t := by
    apply Polynomial.funext
    intro z
    have hv : (signedHookSeries μ.card a).eval z = ∑ j : Fin (n+1), a j.val*(-z)^j.val := by
      rw [signedHookSeries,eval_finsetSum,h,(Fin.sum_univ_eq_sum_range (fun j : ℕ => a j*(-z)^j) (n+1))]
      apply Finset.sum_congr rfl
      intro j _
      simp only [eval_mul,eval_C,eval_pow,eval_X]
      rw [← neg_one_mul z,mul_pow]
      ring
    simp only [eval_mul,eval_sub,eval_one,eval_X,hv]
    exact (hpointwise z).symm
  exact hook_coeff_from_signed_polynomial μ (by omega) q t a hp k hk

end NovelliThibon
