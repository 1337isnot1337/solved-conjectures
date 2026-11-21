module

public import Mathlib.Analysis.Calculus.Deriv.MeanValue
public import Mathlib.Analysis.Calculus.Deriv.Comp
public import Mathlib.Analysis.Calculus.Deriv.Prod
public import Mathlib.Analysis.Normed.Module.FiniteDimension
public import Mathlib.LinearAlgebra.Matrix.Block
public import Mathlib.Algebra.BigOperators.Fin
public import Mathlib.Data.Fin.Tuple.Basic
public import Mathlib.Tactic.Ring
public import Lean.Elab.Tactic.Omega

/-!
# Exact determinant mean-value reduction

The scalar mean value theorem is applied to one determinant row at a time.
Each row uses its own interval, so adjacent disjoint intervals produce ordered
intermediate points. This supplies an exact reduction of evaluation
determinants without a limiting Taylor or divided-difference argument.
-/

@[expose] public section

namespace KVZGamma

open Matrix Set
open scoped BigOperators

noncomputable def evaluationDet {n : ℕ} (f : Fin n → ℝ → ℝ) (x : Fin n → ℝ) : ℝ :=
  Matrix.det (fun i j => f j (x i))

theorem evaluationDet_eq {n : ℕ} (f : Fin n → ℝ → ℝ) (x : Fin n → ℝ) :
    evaluationDet f x = Matrix.det (fun i j => f j (x i)) := by
  simp only [evaluationDet]

private noncomputable def rowDetLinear {n : ℕ} (A : Matrix (Fin n) (Fin n) ℝ)
    (i : Fin n) : (Fin n → ℝ) →ₗ[ℝ] ℝ where
  toFun u := Matrix.det (A.updateRow i u)
  map_add' u v := Matrix.det_updateRow_add A i u v
  map_smul' c u := Matrix.det_updateRow_smul A i c u

private noncomputable def rowDetCLM {n : ℕ} (A : Matrix (Fin n) (Fin n) ℝ)
    (i : Fin n) : (Fin n → ℝ) →L[ℝ] ℝ :=
  (rowDetLinear A i).toContinuousLinearMap

theorem hasDerivAt_det_updateRow {n : ℕ} (A : Matrix (Fin n) (Fin n) ℝ)
    (i : Fin n) (f : Fin n → ℝ → ℝ) (f' : Fin n → ℝ) (x : ℝ)
    (hf : ∀ j, HasDerivAt (f j) (f' j) x) :
    HasDerivAt (fun t => Matrix.det (A.updateRow i (fun j => f j t)))
      (Matrix.det (A.updateRow i f')) x := by
  have hvec : HasDerivAt (fun t j => f j t) f' x := hasDerivAt_pi.mpr hf
  exact (rowDetCLM A i).hasFDerivAt.comp_hasDerivAt x hvec

theorem det_updateRow_interval_mvt {n : ℕ} (A : Matrix (Fin n) (Fin n) ℝ)
    (i : Fin n) (f f' : Fin n → ℝ → ℝ) {a b : ℝ} (hab : a < b)
    (hf : ∀ j, ContinuousOn (f j) (Icc a b))
    (hder : ∀ t ∈ Ioo a b, ∀ j, HasDerivAt (f j) (f' j t) t) :
    ∃ c ∈ Ioo a b,
      Matrix.det (A.updateRow i (fun j => f j b - f j a)) =
        (b - a) * Matrix.det (A.updateRow i (fun j => f' j c)) := by
  have hc : ContinuousOn (fun t => Matrix.det (A.updateRow i (fun j => f j t)))
      (Icc a b) :=
    (rowDetCLM A i).continuous.comp_continuousOn (continuousOn_pi.mpr hf)
  obtain ⟨c, hc, heq⟩ := exists_hasDerivAt_eq_slope
    (fun t => Matrix.det (A.updateRow i (fun j => f j t)))
    (fun t => Matrix.det (A.updateRow i (fun j => f' j t))) hab hc
    (fun t ht => hasDerivAt_det_updateRow A i f (fun j => f' j t) t (hder t ht))
  refine ⟨c, hc, ?_⟩
  have hsub : Matrix.det (A.updateRow i (fun j => f j b - f j a)) =
      Matrix.det (A.updateRow i (fun j => f j b)) -
        Matrix.det (A.updateRow i (fun j => f j a)) :=
    (rowDetLinear A i).map_sub _ _
  rw [hsub]
  exact (div_eq_iff (sub_ne_zero.mpr hab.ne')).mp heq.symm |>.trans (mul_comm _ _)

/-- Successive scalar mean value theorems replace every row difference by a
row of derivatives at an interior point of that row's interval. -/
theorem det_interval_differences_mvt {n : ℕ}
    (f f' : Fin n → Fin n → ℝ → ℝ) (a b : Fin n → ℝ)
    (hab : ∀ i : Fin n, a i < b i)
    (hf : ∀ i j : Fin n, ContinuousOn (f i j) (Icc (a i) (b i)))
    (hder : ∀ (i : Fin n) (t : ℝ), t ∈ Ioo (a i) (b i) →
      ∀ j, HasDerivAt (f i j) (f' i j t) t) :
    ∃ c : Fin n → ℝ, (∀ i, c i ∈ Ioo (a i) (b i)) ∧
      Matrix.det (fun i j : Fin n => f i j (b i) - f i j (a i)) =
        (∏ i : Fin n, (b i - a i : ℝ)) * Matrix.det (fun i j : Fin n => f' i j (c i)) := by
  classical
  let D : Matrix (Fin n) (Fin n) ℝ := fun i j => f i j (b i) - f i j (a i)
  let B (s : Finset (Fin n)) (c : Fin n → ℝ) : Matrix (Fin n) (Fin n) ℝ :=
    fun i j => if i ∈ s then (b i - a i) * f' i j (c i) else D i j
  have hreplace (s : Finset (Fin n)) :
      ∃ c : Fin n → ℝ, (∀ i ∈ s, c i ∈ Ioo (a i) (b i)) ∧ D.det = (B s c).det := by
    induction s using Finset.induction_on with
    | empty => exact ⟨a, by simp, by simp [B]⟩
    | @insert i s his ih =>
      obtain ⟨c, hc, hdet⟩ := ih
      obtain ⟨v, hv, hmvt⟩ := det_updateRow_interval_mvt (B s c) i (f i) (f' i)
        (hab i) (hf i) (hder i)
      let c' := Function.update c i v
      refine ⟨c', ?_, hdet.trans ?_⟩
      · intro j hj
        rcases Finset.mem_insert.mp hj with rfl | hj
        · simpa [c'] using hv
        · have hji : j ≠ i := fun h => his (h ▸ hj)
          simpa [c', hji] using hc j hj
      · have horig : (B s c).updateRow i (fun j => f i j (b i) - f i j (a i)) = B s c := by
          ext j k
          by_cases hji : j = i
          · subst j
            simp [B, D, his, Matrix.updateRow]
          · exact congrFun (Function.update_of_ne hji _ (B s c)) k
        have hnew : (B s c).updateRow i ((b i - a i) • (fun j => f' i j v)) =
            B (insert i s) c' := by
          ext j k
          by_cases hji : j = i
          · subst j
            simp [B, c', Matrix.updateRow]
          · simp [B, c', Matrix.updateRow, hji]
        calc
          (B s c).det = ((B s c).updateRow i (fun j => f i j (b i) - f i j (a i))).det :=
            congrArg Matrix.det horig.symm
          _ = (b i - a i) * ((B s c).updateRow i (fun j => f' i j v)).det := hmvt
          _ = ((B s c).updateRow i ((b i - a i) • (fun j => f' i j v))).det :=
            (Matrix.det_updateRow_smul _ _ _ _).symm
          _ = (B (insert i s) c').det := congrArg Matrix.det hnew
  obtain ⟨c, hc, hdet⟩ := hreplace Finset.univ
  refine ⟨c, fun i => hc i (Finset.mem_univ i), ?_⟩
  calc
    Matrix.det (fun i j => f i j (b i) - f i j (a i)) = (B Finset.univ c).det := hdet
    _ = (∏ i : Fin n, (b i - a i)) * Matrix.det (fun i j => f' i j (c i)) := by
      simp only [B, Finset.mem_univ, ite_true]
      exact Matrix.det_mul_column (fun i => b i - a i) (fun i j => f' i j (c i))

/-- The row operation that keeps row zero and replaces every later row by
the difference from its predecessor. -/
def adjacentRowOperator (n : ℕ) : Matrix (Fin (n + 1)) (Fin (n + 1)) ℝ :=
  Fin.cases (Pi.single 0 1)
    (fun i => Pi.single i.succ 1 - Pi.single i.castSucc 1)

theorem adjacentRowOperator_lower (n : ℕ) : (adjacentRowOperator n).IsLowerTriangular := by
  intro i j hij
  change i < j at hij
  revert hij
  refine Fin.cases (fun hij => ?_) (fun i hij => ?_) i
  · have hj : j ≠ 0 := ne_of_gt hij
    simp [adjacentRowOperator, hj]
  · have hji : j ≠ i.succ := ne_of_gt hij
    have hjc : j ≠ i.castSucc := ne_of_gt (i.castSucc_lt_succ.trans hij)
    simp [adjacentRowOperator, hji, hjc]

@[simp] theorem adjacentRowOperator_diag (n : ℕ) (i : Fin (n + 1)) :
    adjacentRowOperator n i i = 1 := by
  refine Fin.cases ?_ (fun i => ?_) i
  · simp [adjacentRowOperator]
  · simp [adjacentRowOperator, ne_of_gt i.castSucc_lt_succ]

@[simp] theorem adjacentRowOperator_det (n : ℕ) : (adjacentRowOperator n).det = 1 := by
  rw [Matrix.det_of_isLowerTriangular _ (adjacentRowOperator_lower n)]
  simp

theorem adjacentRowOperator_mul {n : ℕ} (A : Matrix (Fin (n + 1)) (Fin (n + 1)) ℝ) :
    adjacentRowOperator n * A = Fin.cases (A 0) (fun i => A i.succ - A i.castSucc) := by
  ext i j
  refine Fin.cases ?_ (fun i => ?_) i
  · simp [Matrix.mul_apply, adjacentRowOperator, Pi.single_apply]
  · simp [Matrix.mul_apply, adjacentRowOperator, Pi.single_apply, sub_mul,
      Finset.sum_sub_distrib]

theorem det_adjacent_rows {n : ℕ} (A : Matrix (Fin (n + 1)) (Fin (n + 1)) ℝ) :
    Matrix.det (Fin.cases (A 0) (fun i => A i.succ - A i.castSucc)) = A.det := by
  rw [← adjacentRowOperator_mul, Matrix.det_mul, adjacentRowOperator_det, one_mul]

theorem det_of_first_column_one {n : ℕ}
    (A : Matrix (Fin (n + 1)) (Fin (n + 1)) ℝ) (hA : ∀ i, A i 0 = 1) :
    A.det = Matrix.det (fun i j : Fin n => A i.succ j.succ - A i.castSucc j.succ) := by
  let B : Matrix (Fin (n + 1)) (Fin (n + 1)) ℝ := fun i j =>
    Fin.cases (A 0 j) (fun k => A k.succ j - A k.castSucc j) i
  have hB : B = Fin.cases (A 0) (fun i => A i.succ - A i.castSucc) := by
    ext i j
    refine Fin.cases ?_ (fun k => ?_) i <;> rfl
  calc
    A.det = B.det := by rw [hB, det_adjacent_rows]
    _ = _ := by
      rw [Matrix.det_succ_column_zero B, Fin.sum_univ_succ]
      simp [B, hA, Matrix.submatrix]
      rfl

/-- Normalizing the first function and subtracting adjacent rows is an exact
identity, with no regularity assumptions. -/
theorem evaluationDet_normalize {n : ℕ} (f : Fin (n + 1) → ℝ → ℝ)
    (x : Fin (n + 1) → ℝ) (hf : ∀ i, f 0 (x i) ≠ 0) :
    evaluationDet f x = (∏ i, f 0 (x i)) * Matrix.det
      (fun i j : Fin n => f j.succ (x i.succ) / f 0 (x i.succ) -
        f j.succ (x i.castSucc) / f 0 (x i.castSucc)) := by
  let A : Matrix (Fin (n + 1)) (Fin (n + 1)) ℝ := fun i j => f j (x i) / f 0 (x i)
  have hcol : ∀ i, A i 0 = 1 := fun i => div_self (hf i)
  calc
    evaluationDet f x = Matrix.det (fun i j => f 0 (x i) * A i j) := by
      unfold evaluationDet
      apply congrArg Matrix.det
      funext i j
      dsimp [A]
      field_simp [hf i]
    _ = (∏ i, f 0 (x i)) * A.det := Matrix.det_mul_column _ _
    _ = _ := congrArg ((∏ i, f 0 (x i)) * ·) (det_of_first_column_one A hcol)

end KVZGamma
