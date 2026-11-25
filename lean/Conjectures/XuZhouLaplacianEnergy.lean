module

public import Conjectures.XuZhouSpectral
public import Mathlib.Combinatorics.SimpleGraph.LapMatrix

@[expose] public section
namespace XuZhou
open Matrix
open scoped Matrix BigOperators InnerProductSpace

variable {ι : Type*} [Fintype ι] [DecidableEq ι]

theorem quadraticEnergy_dotProduct (M : Matrix ι ι ℝ) (x : EuclideanSpace ℝ ι) :
    quadraticEnergy M x = x.ofLp ⬝ᵥ (M *ᵥ x.ofLp) := by
  simp [quadraticEnergy,EuclideanSpace.inner_eq_star_dotProduct,Matrix.toEuclideanLin,
    Matrix.toLpLin_apply]
  exact dotProduct_comm _ _

theorem quadraticEnergy_diagonal (d : ι→ℝ) (x : EuclideanSpace ℝ ι) :
    quadraticEnergy (Matrix.diagonal d) x = ∑ i,d i*(x i)^2 := by
  rw [quadraticEnergy_dotProduct,dotProduct]
  simp_rw [Matrix.mulVec_diagonal]
  apply Finset.sum_congr rfl
  intro i _
  ring

theorem quadraticEnergy_sub (A B : Matrix ι ι ℝ) (x : EuclideanSpace ℝ ι) :
    quadraticEnergy (A-B) x = quadraticEnergy A x-quadraticEnergy B x := by
  simp only [quadraticEnergy,map_sub,LinearMap.sub_apply,inner_sub_right]

theorem quadraticEnergy_lapMatrix (G : SimpleGraph ι) [DecidableRel G.Adj]
    (x : EuclideanSpace ℝ ι) :
    quadraticEnergy (G.lapMatrix ℝ) x =
      (∑ i,∑ j,if G.Adj i j then (x i-x j)^2 else 0) / 2 := by
  rw [quadraticEnergy_dotProduct,← Matrix.toLinearMap₂'_apply']
  exact G.lapMatrix_toLinearMap₂' ℝ x.ofLp

theorem quadraticEnergy_lapMatrix_nonneg (G : SimpleGraph ι) [DecidableRel G.Adj]
    (x : EuclideanSpace ℝ ι) : 0 ≤ quadraticEnergy (G.lapMatrix ℝ) x := by
  rw [quadraticEnergy_lapMatrix]
  positivity

/-- Completing a graph along a layer partition can only increase its
Laplacian quadratic energy. -/
theorem quadraticEnergy_lapMatrix_mono (G H : SimpleGraph ι) [DecidableRel G.Adj]
    [DecidableRel H.Adj] (h : G ≤ H) (x : EuclideanSpace ℝ ι) :
    quadraticEnergy (G.lapMatrix ℝ) x ≤ quadraticEnergy (H.lapMatrix ℝ) x := by
  rw [quadraticEnergy_lapMatrix,quadraticEnergy_lapMatrix]
  apply div_le_div_of_nonneg_right _ (by norm_num)
  refine Finset.sum_le_sum (fun i _ => Finset.sum_le_sum (fun j _ => ?_))
  by_cases hij : G.Adj i j
  · simp [hij,h hij]
  · rw [ite_eq_right hij]
    split <;> positivity

end XuZhou
