module

public import Conjectures.XuZhouTridiagonal

@[expose] public section
namespace XuZhou
open Matrix Finset
open scoped Matrix BigOperators InnerProductSpace

variable {n : ℕ}

noncomputable def chainResidual (a : Fin n→ℕ) (i : Fin n) : ℝ :=
  chainDiag a i + ((unmarkedPath a).degree i:ℝ)

theorem chainResidual_nonpositive {a : Fin n→ℕ} (ha : ∀ i,0 < a i)
    {i : Fin n} (hi : i ∉ marked a) : chainResidual a i ≤ 0 := by
  have hd := unmarkedPath_degree_le a hi
  have hn : a i≠2 := fun h => hi (marked_of_two h)
  by_cases h1 : a i=1
  · have hl : (leftSize a i:ℝ) + leftCount a i ≤ 2 := by
      exact_mod_cast leftSize_add_count_le_two hi
    have hr : (rightSize a i:ℝ) + rightCount a i ≤ 2 := by
      exact_mod_cast rightSize_add_count_le_two hi
    have hdeg : ((unmarkedPath a).degree i:ℝ) ≤ leftCount a i+rightCount a i := by
      exact_mod_cast hd
    simp [chainResidual,chainDiag,h1]
    linarith
  · have hb : 3 ≤ a i := by have := ha i; omega
    rw [leftCount_eq_zero_of_large hb,rightCount_eq_zero_of_large hb] at hd
    have hdeg : (unmarkedPath a).degree i=0 := by omega
    have hsum : (leftSize a i:ℝ)+rightSize a i ≤ 3 := by
      exact_mod_cast large_unmarked_neighbor_sum_le_three hi hb
    simp [chainResidual,chainDiag,hdeg]
    exact div_nonpos_of_nonpos_of_nonneg (by linarith) (by positivity)

theorem chainResidual_negative_of_first {a : Fin n→ℕ} (ha : ∀ i,0 < a i)
    {i : Fin n} (hi : i ∉ marked a) (hf : i.val=0) : chainResidual a i < 0 := by
  have hleft : leftNeighbor i = none := by simp [leftNeighbor,hf]
  have lh : leftSize a i=0 := by simp [leftSize,hleft]
  have lc : leftCount a i=0 := by simp [leftCount,hleft,optionSet]
  have hd := unmarkedPath_degree_le a hi
  have hr : (rightSize a i:ℝ)+rightCount a i ≤ 2 := by
    exact_mod_cast rightSize_add_count_le_two hi
  have hn : a i≠2 := fun h => hi (marked_of_two h)
  by_cases h1 : a i=1
  · have hdeg : ((unmarkedPath a).degree i:ℝ) ≤ rightCount a i := by
      rw [lc,zero_add] at hd
      exact_mod_cast hd
    simp [chainResidual,chainDiag,h1,lh]
    linarith
  · have hb : 3 ≤ a i := by have := ha i; omega
    rw [leftCount_eq_zero_of_large hb,rightCount_eq_zero_of_large hb] at hd
    have hdeg : (unmarkedPath a).degree i=0 := by omega
    have hpos : (0:ℝ)< a i := Nat.cast_pos.mpr (ha i)
    simp [chainResidual,chainDiag,lh,hdeg]
    exact div_neg_of_neg_of_pos (by linarith [Nat.cast_nonneg (α:=ℝ) (rightCount a i)]) hpos

theorem quadraticEnergy_congr_on_support {ι : Type*} [Fintype ι] [DecidableEq ι]
    (A B : Matrix ι ι ℝ) (x : EuclideanSpace ℝ ι)
    (h : ∀ i j, x i≠0 → x j≠0 → A i j=B i j) :
    quadraticEnergy A x = quadraticEnergy B x := by
  rw [quadraticEnergy_dotProduct,quadraticEnergy_dotProduct]
  simp only [Matrix.mulVec,dotProduct]
  apply Finset.sum_congr rfl
  intro i _
  by_cases hi : x i=0
  · simp [hi]
  · congr 1
    apply Finset.sum_congr rfl
    intro j _
    by_cases hj : x j=0
    · simp [hj]
    · rw [h i j hi hj]

theorem chainTridiagonal_eq_laplacian_on_support {a : Fin n→ℕ}
    {i j : Fin n} (hi : i ∉ marked a) (hj : j ∉ marked a) :
    chainTridiagonal a i j =
      (Matrix.diagonal (chainResidual a) - (unmarkedPath a).lapMatrix ℝ) i j := by
  by_cases h : i=j
  · subst j
    simp [chainTridiagonal,chainResidual,SimpleGraph.lapMatrix,SimpleGraph.degMatrix]
  · by_cases hc : consecutive i j
    · simp [chainTridiagonal,SimpleGraph.lapMatrix,SimpleGraph.degMatrix,
        SimpleGraph.adjMatrix, h, hc, unmarkedPath,hi,hj]
    · simp [chainTridiagonal,SimpleGraph.lapMatrix,SimpleGraph.degMatrix,
        SimpleGraph.adjMatrix, h, hc, unmarkedPath,hi,hj]

theorem chainEnergy_on_unmarked {a : Fin n→ℕ} (x : EuclideanSpace ℝ (Fin n))
    (hx : ∀ i∈ marked a,x i=0) :
    quadraticEnergy (chainTridiagonal a) x =
      (∑ i,chainResidual a i*(x i)^2) -
        quadraticEnergy ((unmarkedPath a).lapMatrix ℝ) x := by
  rw [← quadraticEnergy_diagonal,← quadraticEnergy_sub]
  apply quadraticEnergy_congr_on_support
  intro i j hi hj
  exact chainTridiagonal_eq_laplacian_on_support (fun h => hi (hx i h)) (fun h => hj (hx j h))

theorem chainEnergy_nonpositive {a : Fin n→ℕ} (ha : ∀ i,0 < a i)
    (x : EuclideanSpace ℝ (Fin n)) (hx : ∀ i∈ marked a,x i=0) :
    quadraticEnergy (chainTridiagonal a) x ≤ 0 := by
  rw [chainEnergy_on_unmarked x hx]
  have hs : (∑ i,chainResidual a i*(x i)^2) ≤ 0 := by
    apply Finset.sum_nonpos
    intro i _
    by_cases hi : i∈marked a
    · simp [hx i hi]
    · exact mul_nonpos_of_nonpos_of_nonneg (chainResidual_nonpositive ha hi) (sq_nonneg _)
  linarith [quadraticEnergy_lapMatrix_nonneg (unmarkedPath a) x]

end XuZhou
