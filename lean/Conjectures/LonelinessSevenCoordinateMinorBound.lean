import Conjectures.LonelinessKZBasisGram
import Conjectures.LonelinessKZBasisVectors
import Conjectures.LonelinessSevenCoordinateFiniteDefs

/-! Euclidean bounds for the actual integer generators of repeat lines.
The bound uses two-coordinate Cauchy--Schwarz after subtracting the first
Gram--Schmidt projection; no lattice covolume theorem is assumed. -/

namespace Loneliness.SevenCoordinateCritical.Quantitative

open scoped BigOperators

noncomputable section

variable {ι : Type*} [Fintype ι] [DecidableEq ι]

def minor (u w : ι → ℤ) (i j : ι) : ℤ := u i*w j - u j*w i

theorem two_coordinate_squares_le (x : EuclideanSpace ℝ ι) (i j : ι)
    (hij : i ≠ j) : (x i)^2 + (x j)^2 ≤ ‖x‖^2 := by
  rw [EuclideanSpace.real_norm_sq_eq]
  have hsum : (∑ a ∈ ({i,j} : Finset ι), (x a)^2) ≤ ∑ a, (x a)^2 :=
    Finset.sum_le_sum_of_subset_of_nonneg (by simp) (fun _ _ _ => sq_nonneg _)
  simpa only [Finset.sum_pair hij] using hsum

theorem real_minor_abs_le (x y : EuclideanSpace ℝ ι) (i j : ι) :
    |x i*y j - x j*y i| ≤ ‖x‖*‖y‖ := by
  by_cases hij : i = j
  · subst j
    simp only [sub_self, abs_zero]
    positivity
  have hx := two_coordinate_squares_le x i j hij
  have hy := two_coordinate_squares_le y i j hij
  have hproduct := mul_le_mul hx hy
    (add_nonneg (sq_nonneg _) (sq_nonneg _)) (sq_nonneg ‖x‖)
  apply abs_le_of_sq_le_sq _ (mul_nonneg (norm_nonneg _) (norm_nonneg _))
  nlinarith [sq_nonneg (x i*y i+x j*y j)]

theorem minor_abs_le_residual (u w : ι → ℤ) (e : EuclideanSpace ℝ ι) (c : ℝ)
    (hdecompose : KZBasis.realVector w = e + c • KZBasis.realVector u)
    (i j : ι) : |(minor u w i j : ℝ)| ≤ ‖KZBasis.realVector u‖*‖e‖ := by
  have hi := congrArg (fun x : EuclideanSpace ℝ ι => x i) hdecompose
  have hj := congrArg (fun x : EuclideanSpace ℝ ι => x j) hdecompose
  simp only [PiLp.add_apply, PiLp.smul_apply, smul_eq_mul, KZBasis.realVector_apply] at hi hj
  have heq : (minor u w i j : ℝ) =
      KZBasis.realVector u i*e j - KZBasis.realVector u j*e i := by
    simp only [minor, Int.cast_sub, Int.cast_mul, KZBasis.realVector_apply]
    rw [hi, hj]
    ring
  rw [heq]
  exact real_minor_abs_le (KZBasis.realVector u) e i j

theorem basis_second_decompose
    (B : Module.Basis (Fin 7) ℤ (Fin 7 → ℤ)) :
    ∃ c : ℝ, KZBasis.realVector (B 1) =
      InnerProductSpace.gramSchmidt ℝ (KZBasis.realFamily B) 1 +
        c • KZBasis.realVector (B 0) := by
  refine ⟨inner ℝ (KZBasis.realFamily B 0) (KZBasis.realFamily B 1) /
    ‖KZBasis.realFamily B 0‖^2, ?_⟩
  have h := InnerProductSpace.gramSchmidt_def'' ℝ (KZBasis.realFamily B) 1
  simpa only [Nat.Iio_eq_range, Finset.sum_range_one, InnerProductSpace.gramSchmidt_bot,
    RCLike.ofReal_real_eq_id, id_eq, KZBasis.realFamily_apply B (0 : Fin 7),
    KZBasis.realFamily_apply B (1 : Fin 7)] using h

theorem basis_minor_abs_le
    (B : Module.Basis (Fin 7) ℤ (Fin 7 → ℤ)) (i j : Fin 7) :
    |(minor (B 0) (B 1) i j : ℝ)| ≤ ‖KZBasis.realVector (B 0)‖ *
      ‖InnerProductSpace.gramSchmidt ℝ (KZBasis.realFamily B) 1‖ := by
  obtain ⟨c, hc⟩ := basis_second_decompose B
  exact minor_abs_le_residual (B 0) (B 1) _ c hc i j

theorem repeatVector_as_minors (u w : Vector) (i j : Fin 7)
    (positive : Bool) (a : Fin 7) :
    Finite.repeatVector u w i j positive a =
      minor u w i a - Finite.sign positive * minor u w j a := by
  simp only [Finite.repeatVector, minor]
  ring

theorem repeatVector_abs_le (u w : Vector) (A : ℝ)
    (hminor : ∀ i j, |(minor u w i j : ℝ)| ≤ A)
    (i j : Fin 7) (positive : Bool) (a : Fin 7) :
    |(Finite.repeatVector u w i j positive a : ℝ)| ≤ 2*A := by
  rw [repeatVector_as_minors]
  push_cast
  calc
    _ ≤ |(minor u w i a : ℝ)| +
        |(Finite.sign positive : ℝ)*(minor u w j a : ℝ)| := by
      simpa only [sub_eq_add_neg, abs_neg] using
        abs_add_le (minor u w i a : ℝ)
          (-((Finite.sign positive : ℝ)*(minor u w j a : ℝ)))
    _ = |(minor u w i a : ℝ)| + |(minor u w j a : ℝ)| := by
      cases positive <;> simp [Finite.sign]
    _ ≤ 2*A := by linarith [hminor i a, hminor j a]

end

end Loneliness.SevenCoordinateCritical.Quantitative
