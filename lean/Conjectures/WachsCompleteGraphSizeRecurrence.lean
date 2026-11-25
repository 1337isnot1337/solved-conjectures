module
public import Conjectures.WachsCompleteGraphCanonicalCut
public import Conjectures.WachsCompleteGraphSeededRecurrence

@[expose] public section
namespace WachsCompleteGraph
namespace WeightedCompletePartition

noncomputable local instance (r m : ℕ) : Fintype (WeightCompositions r m) :=
  Fintype.ofEquiv (Sym (Fin r) m) (Sym.equivNatSumOfFintype (Fin r) m)

/-- Total of the actual Möbius values of the canonical one-block
partitions on m vertices, one for every allowed weight vector. -/
noncomputable def canonicalBlockTotal (r m : ℕ) : ℤ :=
  if hm : 0 < m then
    ∑ w : WeightCompositions r (m-1), (topWithWeights hm w.val w.property).moebius
  else 0

theorem fibreBlockSum_eq_size {r n : ℕ} (π : CompletePartition n)
    (seed : BlockCompositions r π) (B : π.parts) :
    fibreBlockSum π seed B = canonicalBlockTotal r B.val.card := by
  classical
  have hB : 0 < B.val.card := Finset.card_pos.mpr (π.nonempty_of_mem_parts B.property)
  rw [canonicalBlockTotal,dite_eq_left hB]
  unfold fibreBlockSum
  apply Finset.sum_congr rfl
  intro w _
  let Q := fromBlockCompositions π (Function.update seed B w)
  rw [show (topCut Q ⟨B.val,B.property⟩).moebius = (canonicalBlockTop Q ⟨B.val,B.property⟩).moebius
      from topCut_moebius_eq_canonical Q ⟨B.val,B.property⟩]
  apply congrArg moebius
  have h : (fun i => (Q.weights B.val i).val) = w.val := by
    funext i
    dsimp only [Q]
    rw [fromBlockCompositions_apply]
    exact congrArg (fun x : WeightCompositions r (B.val.card-1) => x.val i)
      (Function.update_self B w seed)
  unfold canonicalBlockTop
  congr

/-- The one-block weighted Möbius totals satisfy the literal finite
size-only recurrence used to derive the compositional inverse. -/
theorem canonical_total_recurrence (r n : ℕ) (hn : 1 < n) :
    (∑ π : CompletePartition n,
      ((r+1+(π.parts.card-1)-1).choose (π.parts.card-1):ℤ) *
        ∏ B : π.parts, canonicalBlockTotal (r+1) B.val.card) = 0 := by
  simpa only [fibreBlockSum_eq_size] using one_block_weighted_recurrence r n hn

theorem characteristic_by_block_sizes (r n : ℕ) :
    characteristic (r+1) n =
      ∑ π : CompletePartition n,Polynomial.monomial (n-π.parts.card)
        (∏ B : π.parts, canonicalBlockTotal (r+1) B.val.card) := by
  simpa only [fibreBlockSum_eq_size] using characteristic_factorized_partitions r n

end WeightedCompletePartition
end WachsCompleteGraph
