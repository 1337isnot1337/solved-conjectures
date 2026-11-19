import Conjectures.LonelinessNearestPlane
import Mathlib.Analysis.InnerProductSpace.GramMatrix
import Mathlib.Algebra.BigOperators.Fin
import Mathlib.LinearAlgebra.Matrix.Block
import Mathlib.LinearAlgebra.Matrix.Transvection

/-! Gram determinants under changes of generators, and the exact product of
squared Gram–Schmidt lengths for every finite prefix. These statements apply
to arbitrary real vector families and do not assume a reduced lattice basis. -/

namespace Loneliness.KZBasis

open scoped BigOperators

noncomputable section

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
variable {ι : Type*} [Fintype ι] [DecidableEq ι]

theorem gram_linearCombination (v : ι → E) (C : Matrix ι ι ℝ) :
    Matrix.gram ℝ (fun j => ∑ i, C i j • v i) =
      C.transpose * Matrix.gram ℝ v * C := by
  ext i j
  simp only [Matrix.gram_apply, sum_inner, inner_sum, real_inner_smul_left,
    real_inner_smul_right, Matrix.mul_apply, Matrix.transpose_apply, Finset.sum_mul]
  rw [Finset.sum_comm]
  apply Finset.sum_congr rfl
  intro a ha
  apply Finset.sum_congr rfl
  intro b hb
  ring

theorem gram_det_linearCombination (v : ι → E) (C : Matrix ι ι ℝ) :
    (Matrix.gram ℝ (fun j => ∑ i, C i j • v i)).det =
      C.det ^ 2 * (Matrix.gram ℝ v).det := by
  rw [gram_linearCombination, Matrix.det_mul, Matrix.det_mul, Matrix.det_transpose]
  ring

theorem gram_det_reindex (v : ι → E) (e : ι ≃ ι) :
    (Matrix.gram ℝ (v ∘ e)).det = (Matrix.gram ℝ v).det := by
  change ((Matrix.gram ℝ v).submatrix e e).det = _
  exact Matrix.det_submatrix_equiv_self e (Matrix.gram ℝ v)

theorem linearCombination_transvection (v : ι → E) (i j : ι) (c : ℝ) :
    (fun k => ∑ a, (Matrix.transvection i j c) a k • v a) =
      Function.update v j (v j + c • v i) := by
  funext k
  simp only [Matrix.transvection, Matrix.add_apply, add_smul, Finset.sum_add_distrib]
  have hone : (∑ a, (1 : Matrix ι ι ℝ) a k • v a) = v k := by
    simp [Matrix.one_apply, ite_smul]
  rw [hone]
  by_cases hk : k = j
  · subst k
    simp [Matrix.single_apply, ite_smul]
  · simp [Matrix.single_apply, hk, Ne.symm hk]

theorem gram_det_add_smul (v : ι → E) (i j : ι) (hij : i ≠ j) (c : ℝ) :
    (Matrix.gram ℝ (Function.update v j (v j + c • v i))).det =
      (Matrix.gram ℝ v).det := by
  rw [← linearCombination_transvection v i j c, gram_det_linearCombination,
    Matrix.det_transvection_of_ne i j hij c]
  ring

theorem sum_fin_prefix (n r : ℕ) (hr : r ≤ n) (f : ℕ → E) :
    (∑ i : Fin n, if i.val < r then f i.val else 0) =
      ∑ i ∈ Finset.range r, f i := by
  rw [Fin.sum_univ_eq_sum_range (fun i => if i < r then f i else 0) n,
    ← Finset.sum_filter]
  congr 1
  ext i
  simp only [Finset.mem_filter, Finset.mem_range]
  omega

def gsCoefficients (b : ℕ → E) (r : ℕ) : Matrix (Fin r) (Fin r) ℝ :=
  fun i j => (if i = j then 1 else 0) +
    if i.val < j.val then
      inner ℝ (InnerProductSpace.gramSchmidt ℝ b i.val) (b j.val) /
        ‖InnerProductSpace.gramSchmidt ℝ b i.val‖ ^ 2
    else 0

@[simp]
theorem gsCoefficients_diag (b : ℕ → E) (r : ℕ) (i : Fin r) :
    gsCoefficients b r i i = 1 := by
  simp [gsCoefficients]

theorem gsCoefficients_upper_triangular (b : ℕ → E) (r : ℕ) :
    (gsCoefficients b r).IsUpperTriangular := by
  intro i j hij
  have hne : i ≠ j := ne_of_gt hij
  have hnlt : ¬i.val < j.val := by change j.val < i.val at hij; omega
  simp [gsCoefficients, hne, hnlt]

@[simp]
theorem gsCoefficients_det (b : ℕ → E) (r : ℕ) : (gsCoefficients b r).det = 1 := by
  rw [Matrix.det_of_isUpperTriangular (gsCoefficients_upper_triangular b r)]
  simp

theorem reconstruct_from_gramSchmidt (b : ℕ → E) (r : ℕ) (j : Fin r) :
    (∑ i : Fin r, gsCoefficients b r i j •
      InnerProductSpace.gramSchmidt ℝ b i.val) = b j.val := by
  have hdiag : (∑ i : Fin r, (if i = j then (1 : ℝ) else 0) •
      InnerProductSpace.gramSchmidt ℝ b i.val) =
        InnerProductSpace.gramSchmidt ℝ b j.val := by
    simp [ite_smul]
  have hprefix : (∑ i : Fin r,
      (if i.val < j.val then
        inner ℝ (InnerProductSpace.gramSchmidt ℝ b i.val) (b j.val) /
          ‖InnerProductSpace.gramSchmidt ℝ b i.val‖ ^ 2 else 0) •
        InnerProductSpace.gramSchmidt ℝ b i.val) =
      ∑ i ∈ Finset.range j.val,
        (inner ℝ (InnerProductSpace.gramSchmidt ℝ b i) (b j.val) /
          ‖InnerProductSpace.gramSchmidt ℝ b i‖ ^ 2) •
            InnerProductSpace.gramSchmidt ℝ b i := by
    simpa only [ite_smul, zero_smul] using
      sum_fin_prefix r j.val j.isLt.le (fun i =>
        (inner ℝ (InnerProductSpace.gramSchmidt ℝ b i) (b j.val) /
          ‖InnerProductSpace.gramSchmidt ℝ b i‖ ^ 2) •
            InnerProductSpace.gramSchmidt ℝ b i)
  rw [show (∑ i : Fin r, gsCoefficients b r i j •
      InnerProductSpace.gramSchmidt ℝ b i.val) =
      (∑ i : Fin r, (if i = j then (1 : ℝ) else 0) •
        InnerProductSpace.gramSchmidt ℝ b i.val) +
      ∑ i : Fin r,
        (if i.val < j.val then
          inner ℝ (InnerProductSpace.gramSchmidt ℝ b i.val) (b j.val) /
            ‖InnerProductSpace.gramSchmidt ℝ b i.val‖ ^ 2 else 0) •
          InnerProductSpace.gramSchmidt ℝ b i.val by
    simp only [gsCoefficients, add_smul, Finset.sum_add_distrib]]
  rw [hdiag, hprefix]
  simpa only [Nat.Iio_eq_range] using
    (InnerProductSpace.gramSchmidt_def'' ℝ b j.val).symm

theorem gramSchmidt_gram_diagonal (b : ℕ → E) (r : ℕ) :
    Matrix.gram ℝ (fun i : Fin r => InnerProductSpace.gramSchmidt ℝ b i.val) =
      Matrix.diagonal (fun i : Fin r => ‖InnerProductSpace.gramSchmidt ℝ b i.val‖ ^ 2) := by
  ext i j
  by_cases hij : i = j
  · subst j
    simp [Matrix.gram_apply, Matrix.diagonal, real_inner_self_eq_norm_mul_norm, pow_two]
  · have hval : i.val ≠ j.val := fun h => hij (Fin.ext h)
    simp [Matrix.gram_apply, Matrix.diagonal, hij,
      InnerProductSpace.gramSchmidt_orthogonal ℝ b hval]

theorem gramSchmidt_prefix_det (b : ℕ → E) (r : ℕ) :
    (Matrix.gram ℝ (fun i : Fin r => b i.val)).det =
      ∏ i : Fin r, ‖InnerProductSpace.gramSchmidt ℝ b i.val‖ ^ 2 := by
  have hfamily : (fun j : Fin r => b j.val) =
      fun j => ∑ i : Fin r, gsCoefficients b r i j •
        InnerProductSpace.gramSchmidt ℝ b i.val := by
    funext j
    exact (reconstruct_from_gramSchmidt b r j).symm
  rw [hfamily, gram_det_linearCombination, gsCoefficients_det, one_pow, one_mul,
    gramSchmidt_gram_diagonal, Matrix.det_diagonal]

theorem gramSchmidt_prefix_det_range (b : ℕ → E) (r : ℕ) :
    (Matrix.gram ℝ (fun i : Fin r => b i.val)).det =
      ∏ i ∈ Finset.range r, ‖InnerProductSpace.gramSchmidt ℝ b i‖ ^ 2 := by
  rw [gramSchmidt_prefix_det,
    Fin.prod_univ_eq_prod_range (fun i => ‖InnerProductSpace.gramSchmidt ℝ b i‖ ^ 2) r]

theorem gramSchmidt_congr_prefix (b c : ℕ → E) :
    ∀ r, (∀ i ≤ r, b i = c i) →
      InnerProductSpace.gramSchmidt ℝ b r = InnerProductSpace.gramSchmidt ℝ c r := by
  intro r
  induction r using Nat.strong_induction_on with
  | h r ih =>
      intro h
      rw [InnerProductSpace.gramSchmidt_def ℝ b r,
        InnerProductSpace.gramSchmidt_def ℝ c r, h r le_rfl]
      congr 1
      apply Finset.sum_congr rfl
      intro i hi
      rw [ih i (Finset.mem_Iio.mp hi)
        (fun j hj => h j (hj.trans (Finset.mem_Iio.mp hi).le))]

end

end Loneliness.KZBasis
