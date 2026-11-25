module
public import Conjectures.WachsCompleteGraphBlockMoebius
public import Conjectures.WachsCompleteGraphTopCut
public import Conjectures.WachsCompleteGraphTopScope

@[expose] public section
namespace WachsCompleteGraph
namespace WeightedCompletePartition

noncomputable local instance (r m : ℕ) : Fintype (WeightCompositions r m) :=
  Fintype.ofEquiv (Sym (Fin r) m) (Sym.equivNatSumOfFintype (Fin r) m)

variable {r n : ℕ} (π : CompletePartition n)

/-- The sum over weights of an isolated block, using any seed on the rest. -/
noncomputable def fibreBlockSum (seed : BlockCompositions r π) (B : π.parts) : ℤ :=
  open Classical in
  ∑ w : WeightCompositions r (B.val.card-1),
    let Q := fromBlockCompositions π (Function.update seed B w)
    (topCut Q ⟨B.val,B.property⟩).moebius

/-- The cardinality equivalence on each ordinary fibre lifts to a product
identity for the actual recursively computed Möbius values. -/
theorem ordinaryMoebiusFibre_eq_product (seed : BlockCompositions r π) :
    ordinaryMoebiusFibre r π = ∏ B : π.parts, fibreBlockSum π seed B := by
  classical
  unfold ordinaryMoebiusFibre
  rw [Finset.sum_subtype (p:=fun P : WeightedCompletePartition r n => P.partition = π) _ (fun P => by simp)]
  have hμ (f : BlockCompositions r π) :
      (fromBlockCompositions π f).moebius =
        ∏ B : π.parts,
          let Q := fromBlockCompositions π (Function.update seed B (f B))
          (topCut Q ⟨B.val,B.property⟩).moebius := by
    let P := fromBlockCompositions π f
    rw [moebius_eq_block_product P ⟨P,le_rfl⟩]
    unfold blockMoebiusProduct
    apply Finset.prod_congr rfl
    intro B _
    change (topCut P B).moebius = _
    apply congrArg moebius
    apply topCut_congr P (R:=fromBlockCompositions π (Function.update seed B (f B))) B ⟨B.val,B.property⟩ rfl
    intro i
    apply Fin.ext
    rw [fromBlockCompositions_apply f B i,
      fromBlockCompositions_apply (Function.update seed B (f B)) B i]
    exact congrArg (fun w : WeightCompositions r (B.val.card-1) => w.val i)
      (Function.update_self B (f B) seed).symm
  let w (B : π.parts) (x : WeightCompositions r (B.val.card-1)) : ℤ :=
    let Q := fromBlockCompositions π (Function.update seed B x)
    (topCut Q ⟨B.val,B.property⟩).moebius
  calc
    (∑ Q : OrdinaryFibre r π, Q.val.moebius) =
        ∑ f : BlockCompositions r π, ∏ B, w B (f B) := by
      apply Fintype.sum_equiv (ordinaryFibre_equiv π)
      intro Q
      have h := hμ (ordinaryFibre_equiv π Q)
      have he : fromBlockCompositions π (ordinaryFibre_equiv π Q) = Q.val :=
        congrArg Subtype.val ((ordinaryFibre_equiv π).symm_apply_apply Q)
      rw [he] at h
      exact h
    _ = ∏ B : π.parts, fibreBlockSum π seed B := by
      exact (Fintype.prod_sum w).symm

end WeightedCompletePartition
end WachsCompleteGraph
