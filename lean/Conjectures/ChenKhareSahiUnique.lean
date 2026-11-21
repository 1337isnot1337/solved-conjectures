import Conjectures.ChenKhareSahiParameter
import Mathlib.LinearAlgebra.Matrix.NonsingularInverse

namespace ChenKhareSahi

noncomputable def eigenResidual (q t η : ℝ) (f : SymFun) (v : ℝ × ℝ × ℝ) : ℝ :=
  paramOperator q t f v.1 v.2.1 v.2.2 - η * realDelta v.1 v.2.1 v.2.2 * f v.1 v.2.1 v.2.2

noncomputable def basis420 : Fin 4 → SymFun := ![realMonomial 4 1 1, realMonomial 3 3 0, realMonomial 3 2 1, realMonomial 2 2 2]

def points420 : Fin 4 → ℝ × ℝ × ℝ := ![(1,2,3),(1,2,4),(1,3,5),(2,3,5)]

noncomputable def matrix420 (q t : ℝ) : Matrix (Fin 4) (Fin 4) ℝ :=
  fun i j => eigenResidual q t (q^4*t^2+q^2*t+1) (basis420 j) (points420 i)

set_option maxRecDepth 8192 in
set_option maxHeartbeats 6000000 in
theorem matrix420_det (q t : ℝ) :
    (matrix420 q t).det = 1247494348800*q^2*t*(q-1)^4*(q+1)*(q*t-1)^3*(q*t+1)*(q^3*t^2-1) := by
  rw [Matrix.det_succ_row_zero, Fin.sum_univ_four]
  simp only [Matrix.det_fin_three]
  norm_num [matrix420, eigenResidual, paramOperator, realDelta, basis420, points420,
    realMonomial, realM_average, orbit, Matrix.submatrix, Fin.succ, Fin.succAbove]
  <;> ring


noncomputable def linear420 (a b c d : ℝ) : SymFun := fun x y z =>
  a*realMonomial 4 1 1 x y z + b*realMonomial 3 3 0 x y z +
    c*realMonomial 3 2 1 x y z + d*realMonomial 2 2 2 x y z

theorem matrix420_mulVec (q t a b c d : ℝ) (i : Fin 4) :
    (matrix420 q t).mulVec ![a,b,c,d] i =
      eigenResidual q t (q^4*t^2+q^2*t+1) (linear420 a b c d) (points420 i) := by
  fin_cases i <;>
    simp [Matrix.mulVec, dotProduct, Matrix.vecHead, Matrix.vecTail, Fin.sum_univ_four, matrix420, eigenResidual, paramOperator,
      realDelta, basis420, points420, linear420] <;> ring

theorem residual420_difference (q t a b c d : ℝ) (v : ℝ × ℝ × ℝ) :
    eigenResidual q t (q^4*t^2+q^2*t+1) (candidate420 a b c d) v -
      eigenResidual q t (q^4*t^2+q^2*t+1) (paramP420 q t) v =
    eigenResidual q t (q^4*t^2+q^2*t+1)
      (linear420 (a-cA q t) (b-cA q t) (c-cC q t) (d-cD q t)) v := by
  simp only [eigenResidual, paramOperator, candidate420, paramP420, linear420]
  ring


theorem param420_unique_of_det (q t a b c d : ℝ) (hdet : (matrix420 q t).det ≠ 0)
    (h1 : q*t-1 ≠ 0) (h2 : q*t+1 ≠ 0) (h3 : q^3*t^2-1 ≠ 0)
    (h : ∀ x y z, paramOperator q t (candidate420 a b c d) x y z =
      (q^4*t^2+q^2*t+1) * realDelta x y z * candidate420 a b c d x y z) :
    a=cA q t ∧ b=cA q t ∧ c=cC q t ∧ d=cD q t := by
  let w : Fin 4 → ℝ := ![a-cA q t,b-cA q t,c-cC q t,d-cD q t]
  have hv : (matrix420 q t).mulVec w = 0 := by
    funext i
    rw [show (matrix420 q t).mulVec w i =
      eigenResidual q t (q^4*t^2+q^2*t+1)
        (linear420 (a-cA q t) (b-cA q t) (c-cC q t) (d-cD q t)) (points420 i) from
          matrix420_mulVec q t _ _ _ _ i]
    have hc : eigenResidual q t (q^4*t^2+q^2*t+1) (candidate420 a b c d) (points420 i) = 0 := by
      unfold eigenResidual
      rw [h]
      ring
    have hp : eigenResidual q t (q^4*t^2+q^2*t+1) (paramP420 q t) (points420 i) = 0 := by
      unfold eigenResidual
      rw [paramP420_eigen q t _ _ _ h1 h2 h3]
      ring
    have hd := residual420_difference q t a b c d (points420 i)
    rw [hc, hp] at hd
    simpa using hd.symm
  have hu : IsUnit (matrix420 q t) := (Matrix.isUnit_iff_isUnit_det _).mpr (isUnit_iff_ne_zero.mpr hdet)
  have hw : w = 0 := Matrix.mulVec_injective_of_isUnit hu (by simpa using hv)
  have h0 := congrFun hw (0 : Fin 4)
  have h1' := congrFun hw (1 : Fin 4)
  have h2' := congrFun hw (2 : Fin 4)
  have h3' := congrFun hw (3 : Fin 4)
  simp [w] at h0 h1' h2' h3'
  exact ⟨sub_eq_zero.mp h0, sub_eq_zero.mp h1', sub_eq_zero.mp h2', sub_eq_zero.mp h3'⟩


noncomputable def basis411 : Fin 2 → SymFun := ![realMonomial 3 2 1, realMonomial 2 2 2]
def points411 : Fin 2 → ℝ × ℝ × ℝ := ![(1,2,3),(1,2,4)]
noncomputable def matrix411 (q t : ℝ) : Matrix (Fin 2) (Fin 2) ℝ :=
  fun i j => eigenResidual q t (q^4*t^2+q*t+q) (basis411 j) (points411 i)

theorem matrix411_det (q t : ℝ) :
    (matrix411 q t).det = -34560*q^2*t*(q-1)^2*(q*t-1)*(q^2*t-1)*(q*t+t+1) := by
  rw [Matrix.det_fin_two]
  norm_num [matrix411, eigenResidual, paramOperator, realDelta, basis411, points411, realMonomial, realM_average, orbit]
  <;> ring

noncomputable def linear411 (a b : ℝ) : SymFun := fun x y z =>
  a*realMonomial 3 2 1 x y z + b*realMonomial 2 2 2 x y z

theorem matrix411_mulVec (q t a b : ℝ) (i : Fin 2) :
    (matrix411 q t).mulVec ![a,b] i =
      eigenResidual q t (q^4*t^2+q*t+q) (linear411 a b) (points411 i) := by
  fin_cases i <;>
    simp [Matrix.mulVec, dotProduct, Matrix.vecHead, Matrix.vecTail, Fin.sum_univ_two, matrix411,
      eigenResidual, paramOperator, realDelta, basis411, points411, linear411] <;> ring

theorem residual411_difference (q t a b : ℝ) (v : ℝ × ℝ × ℝ) :
    eigenResidual q t (q^4*t^2+q*t+q) (candidate411 a b) v -
      eigenResidual q t (q^4*t^2+q*t+q) (paramP411 q t) v =
    eigenResidual q t (q^4*t^2+q*t+q) (linear411 (a-cE q t) (b-cF q t)) v := by
  simp only [eigenResidual, paramOperator, candidate411, paramP411, linear411]
  ring

theorem param411_unique_of_det (q t a b : ℝ) (hdet : (matrix411 q t).det ≠ 0)
    (h1 : q*t-1 ≠ 0) (h2 : q^2*t-1 ≠ 0)
    (h : ∀ x y z, paramOperator q t (candidate411 a b) x y z =
      (q^4*t^2+q*t+q) * realDelta x y z * candidate411 a b x y z) :
    a=cE q t ∧ b=cF q t := by
  let w : Fin 2 → ℝ := ![a-cE q t,b-cF q t]
  have hv : (matrix411 q t).mulVec w = 0 := by
    funext i
    rw [show (matrix411 q t).mulVec w i =
      eigenResidual q t (q^4*t^2+q*t+q) (linear411 (a-cE q t) (b-cF q t)) (points411 i) from
        matrix411_mulVec q t _ _ i]
    have hc : eigenResidual q t (q^4*t^2+q*t+q) (candidate411 a b) (points411 i) = 0 := by
      unfold eigenResidual
      rw [h]
      ring
    have hp : eigenResidual q t (q^4*t^2+q*t+q) (paramP411 q t) (points411 i) = 0 := by
      unfold eigenResidual
      rw [paramP411_eigen q t _ _ _ h1 h2]
      ring
    have hd := residual411_difference q t a b (points411 i)
    rw [hc, hp] at hd
    simpa using hd.symm
  have hu : IsUnit (matrix411 q t) := (Matrix.isUnit_iff_isUnit_det _).mpr (isUnit_iff_ne_zero.mpr hdet)
  have hw : w = 0 := Matrix.mulVec_injective_of_isUnit hu (by simpa using hv)
  have h0 := congrFun hw (0 : Fin 2)
  have h1' := congrFun hw (1 : Fin 2)
  simp [w] at h0 h1'
  exact ⟨sub_eq_zero.mp h0, sub_eq_zero.mp h1'⟩


theorem parameter_nonzero (q t : ℝ) (hq0 : 0 < q) (hq1 : q < 1) (ht0 : 0 < t) (ht1 : t < 1) :
    q*t-1 ≠ 0 ∧ q*t+1 ≠ 0 ∧ q^2*t-1 ≠ 0 ∧ q^3*t^2-1 ≠ 0 ∧ q*t+t+1 ≠ 0 := by
  have hq2 : q^2 < 1 := pow_lt_one₀ (le_of_lt hq0) hq1 (by norm_num)
  have hq3 : q^3 < 1 := pow_lt_one₀ (le_of_lt hq0) hq1 (by norm_num)
  have ht2 : t^2 ≤ 1 := pow_le_one₀ (le_of_lt ht0) (le_of_lt ht1)
  have hqt : q*t < 1 := mul_lt_one_of_nonneg_of_lt_one_left (le_of_lt hq0) hq1 (le_of_lt ht1)
  have hq2t : q^2*t < 1 := mul_lt_one_of_nonneg_of_lt_one_left (sq_nonneg q) hq2 (le_of_lt ht1)
  have hq3t2 : q^3*t^2 < 1 := mul_lt_one_of_nonneg_of_lt_one_left (by positivity) hq3 ht2
  have hqtp : 0 < q*t := mul_pos hq0 ht0
  exact ⟨by linarith, by linarith, by linarith, by linarith, by linarith⟩

theorem matrix420_det_ne (q t : ℝ) (hq0 : 0 < q) (hq1 : q < 1) (ht0 : 0 < t) (ht1 : t < 1) :
    (matrix420 q t).det ≠ 0 := by
  have hn := parameter_nonzero q t hq0 hq1 ht0 ht1
  have hq : q ≠ 0 := ne_of_gt hq0
  have ht : t ≠ 0 := ne_of_gt ht0
  have hqm : q-1 ≠ 0 := by linarith
  have hqp : q+1 ≠ 0 := by linarith
  rw [matrix420_det]
  exact mul_ne_zero (mul_ne_zero (mul_ne_zero (mul_ne_zero (mul_ne_zero
    (mul_ne_zero (mul_ne_zero (by norm_num) (pow_ne_zero 2 hq)) ht) (pow_ne_zero 4 hqm))
      hqp) (pow_ne_zero 3 hn.1)) hn.2.1) hn.2.2.2.1

theorem matrix411_det_ne (q t : ℝ) (hq0 : 0 < q) (hq1 : q < 1) (ht0 : 0 < t) (ht1 : t < 1) :
    (matrix411 q t).det ≠ 0 := by
  have hn := parameter_nonzero q t hq0 hq1 ht0 ht1
  have hq : q ≠ 0 := ne_of_gt hq0
  have ht : t ≠ 0 := ne_of_gt ht0
  have hqm : q-1 ≠ 0 := by linarith
  rw [matrix411_det]
  exact mul_ne_zero (mul_ne_zero (mul_ne_zero (mul_ne_zero (mul_ne_zero
    (mul_ne_zero (by norm_num) (pow_ne_zero 2 hq)) ht) (pow_ne_zero 2 hqm))
      hn.1) hn.2.2.1) hn.2.2.2.2


def IsParamEigen420 (q t : ℝ) (f : SymFun) : Prop :=
    (∃ a b c d, f = candidate420 a b c d) ∧
    ∀ x y z, paramOperator q t f x y z = (q^4*t^2+q^2*t+1) * realDelta x y z * f x y z

def IsParamEigen411 (q t : ℝ) (f : SymFun) : Prop :=
    (∃ a b, f = candidate411 a b) ∧
    ∀ x y z, paramOperator q t f x y z = (q^4*t^2+q*t+q) * realDelta x y z * f x y z

theorem paramEigen420_unique (q t : ℝ) (hq0 : 0 < q) (hq1 : q < 1) (ht0 : 0 < t) (ht1 : t < 1) :
    ∃! f : SymFun, IsParamEigen420 q t f := by
  have hn := parameter_nonzero q t hq0 hq1 ht0 ht1
  refine ⟨paramP420 q t, ?_, ?_⟩
  · exact ⟨⟨cA q t,cA q t,cC q t,cD q t,rfl⟩, fun x y z => paramP420_eigen q t x y z hn.1 hn.2.1 hn.2.2.2.1⟩
  · intro f ⟨⟨a,b,c,d,hf⟩, heigen⟩
    rw [hf] at heigen ⊢
    obtain ⟨ha,hb,hc,hd⟩ := param420_unique_of_det q t a b c d
      (matrix420_det_ne q t hq0 hq1 ht0 ht1) hn.1 hn.2.1 hn.2.2.2.1 heigen
    simp [paramP420, ha,hb,hc,hd]

theorem paramEigen411_unique (q t : ℝ) (hq0 : 0 < q) (hq1 : q < 1) (ht0 : 0 < t) (ht1 : t < 1) :
    ∃! f : SymFun, IsParamEigen411 q t f := by
  have hn := parameter_nonzero q t hq0 hq1 ht0 ht1
  refine ⟨paramP411 q t, ?_, ?_⟩
  · exact ⟨⟨cE q t,cF q t,rfl⟩, fun x y z => paramP411_eigen q t x y z hn.1 hn.2.2.1⟩
  · intro f ⟨⟨a,b,hf⟩, heigen⟩
    rw [hf] at heigen ⊢
    obtain ⟨ha,hb⟩ := param411_unique_of_det q t a b
      (matrix411_det_ne q t hq0 hq1 ht0 ht1) hn.1 hn.2.2.1 heigen
    simp [paramP411, ha,hb]

theorem continuous_source_counterexamples (t : ℝ) (ht0 : 3/4 ≤ t) (ht1 : t < 1) :
    ∃ ε > 0, ∀ q, 0 < q → q < ε → ∀ p s : SymFun,
      IsParamEigen420 q t p → IsParamEigen411 q t s →
      ¬ FullSemiring (fun x y z => p x y z / p 1 1 1 - s x y z / s 1 1 1) := by
  obtain ⟨ε,hε,hcounter⟩ := param_nonmembership t ht0 ht1
  refine ⟨min ε 1, lt_min hε (by norm_num), ?_⟩
  intro q hq0 hq p s hp hs
  have hqε : q < ε := lt_of_lt_of_le hq (min_le_left _ _)
  have hq1 : q < 1 := lt_of_lt_of_le hq (min_le_right _ _)
  have htpos : 0 < t := by linarith
  have hn := parameter_nonzero q t hq0 hq1 htpos ht1
  have hp0 : IsParamEigen420 q t (paramP420 q t) :=
    ⟨⟨cA q t,cA q t,cC q t,cD q t,rfl⟩, fun x y z => paramP420_eigen q t x y z hn.1 hn.2.1 hn.2.2.2.1⟩
  have hs0 : IsParamEigen411 q t (paramP411 q t) :=
    ⟨⟨cE q t,cF q t,rfl⟩, fun x y z => paramP411_eigen q t x y z hn.1 hn.2.2.1⟩
  have hp' := (paramEigen420_unique q t hq0 hq1 htpos ht1).unique hp hp0
  have hs' := (paramEigen411_unique q t hq0 hq1 htpos ht1).unique hs hs0
  rw [hp',hs']
  exact hcounter q hq0 hqε

end ChenKhareSahi
