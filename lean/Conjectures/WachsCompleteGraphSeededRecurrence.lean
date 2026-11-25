module
public import Conjectures.WachsCompleteGraphFibreProduct

@[expose] public section
namespace WachsCompleteGraph
namespace WeightedCompletePartition

/-- A canonical valid allocation when at least one color is available. -/
def seedCompositions (r : ℕ) {n : ℕ} (π : CompletePartition n) : BlockCompositions (r+1) π :=
  fun b => ⟨fun i => if i = 0 then b.val.card-1 else 0,by simp⟩

/-- The finite Möbius recurrence with the exact independent block
factors substituted, without any hypothesis on the existence of a seed. -/
theorem one_block_weighted_recurrence (r n : ℕ) (hn : 1<n) :
    (∑ π : CompletePartition n,
      ((r+1+(π.parts.card-1)-1).choose (π.parts.card-1):ℤ) *
        ∏ B : π.parts, fibreBlockSum π (seedCompositions r π) B) = 0 := by
  simpa only [ordinaryMoebiusFibre_eq_product (seed:=seedCompositions r _)] using
    ordinary_fibre_cancellation (r+1) n hn

theorem characteristic_factorized_partitions (r n : ℕ) :
    characteristic (r+1) n =
      ∑ π : CompletePartition n,Polynomial.monomial (n-π.parts.card)
        (∏ B : π.parts, fibreBlockSum π (seedCompositions r π) B) := by
  rw [characteristic_grouped]
  apply Finset.sum_congr rfl
  intro π _
  rw [ordinaryMoebiusFibre_eq_product π (seedCompositions r π)]

end WeightedCompletePartition
end WachsCompleteGraph
