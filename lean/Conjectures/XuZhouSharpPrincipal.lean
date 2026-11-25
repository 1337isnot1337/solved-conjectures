module

public import Conjectures.XuZhouSharpBlocks
public import Conjectures.XuZhouCliqueDegrees

@[expose] public section
namespace XuZhou
open Matrix Finset
open scoped Matrix BigOperators

instance (t : ℕ) : DecidableRel (sharpGraph t).Adj := by
  unfold sharpGraph
  infer_instance

theorem sharpBlock_degree {t : ℕ} (i : Fin t) (c : Fin 4) :
    (sharpGraph t).degree (sharpBlockVertex (i,c))=3 := by
  let l : SharpIndex t := ⟨4*i.val+blockOffset c-1,by
    have hi := i.isLt
    have hc := blockOffset_bounds c
    omega⟩
  let r : SharpIndex t := ⟨4*i.val+blockOffset c+1,by
    have hi := i.isLt
    have hc := blockOffset_bounds c
    omega⟩
  have hl : leftNeighbor (blockIndex i c)=some l := by
    apply leftNeighbor_of_succ
    have hc := blockOffset_bounds c
    change 4*i.val+blockOffset c-1+1=4*i.val+blockOffset c
    omega
  have hr : rightNeighbor (blockIndex i c)=some r := by
    apply rightNeighbor_of_succ
    rfl
  change (layerCliqueGraph (sharpLayer t)).degree (sharpBlockVertex (i,c))=3
  rw [layerCliqueGraph_degree]
  change layerSize (sharpLayer t) (blockIndex i c)+
      leftSize (layerSize (sharpLayer t)) (blockIndex i c)+
      rightSize (layerSize (sharpLayer t)) (blockIndex i c)-1=3
  simp only [leftSize,rightSize,hl,hr,Option.map_some,Option.getD_some,sharpLayer_size]
  have hL : l.val%4=(blockOffset c-1)%4 := by
    have hc := blockOffset_bounds c
    change (4*i.val+blockOffset c-1)%4=(blockOffset c-1)%4
    omega
  have hR : r.val%4=(blockOffset c+1)%4 := by
    change (4*i.val+blockOffset c+1)%4=(blockOffset c+1)%4
    omega
  simp only [sharpSize,doubled,hL,hR,blockIndex_mod]
  fin_cases c <;> decide

def localDiamond (c d : Fin 4) : Prop :=
  c≠d ∧ blockOffset c ≤ blockOffset d+1 ∧ blockOffset d ≤ blockOffset c+1

instance (c d : Fin 4) : Decidable (localDiamond c d) := by unfold localDiamond; infer_instance

def diamondMatrix : Matrix (Fin 4) (Fin 4) ℝ := fun c d =>
  if c=d then 3 else if localDiamond c d then -1 else 0

theorem sharpBlock_principal_entries {t : ℕ} (i j : Fin t) (c d : Fin 4) :
    ((sharpGraph t).lapMatrix ℝ).submatrix (sharpBlockEmbedding t) (sharpBlockEmbedding t)
      (i,c) (j,d) = if i=j then diamondMatrix c d else 0 := by
  change (sharpGraph t).lapMatrix ℝ (sharpBlockVertex (i,c)) (sharpBlockVertex (j,d))=_
  by_cases hij : i=j
  · subst j
    by_cases hcd : c=d
    · subst d
      simp [SimpleGraph.lapMatrix,SimpleGraph.degMatrix,SimpleGraph.adjMatrix,
        sharpBlock_degree,diamondMatrix]
    · have hn : sharpBlockVertex (i,c)≠sharpBlockVertex (i,d) :=
        fun h => hcd (congrArg Prod.snd (sharpBlockVertex_injective t h))
      have hh : (sharpGraph t).Adj (sharpBlockVertex (i,c)) (sharpBlockVertex (i,d)) ↔
          localDiamond c d := sharpBlock_same_adj_iff i c d
      by_cases hdia : localDiamond c d <;>
        simp [SimpleGraph.lapMatrix,SimpleGraph.degMatrix,SimpleGraph.adjMatrix,hn,hcd,diamondMatrix,hh,hdia]
  · have hn : sharpBlockVertex (i,c)≠sharpBlockVertex (j,d) :=
      fun h => hij (congrArg Prod.fst (sharpBlockVertex_injective t h))
    have hb := sharpBlock_no_cross_adj hij c d
    simp [SimpleGraph.lapMatrix,SimpleGraph.degMatrix,SimpleGraph.adjMatrix,hn,hij,hb]

end XuZhou
