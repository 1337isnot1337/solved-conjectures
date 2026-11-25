module
public import Conjectures.WachsCompleteGraphTopCancellation

@[expose] public section
namespace WachsCompleteGraph
namespace WeightedCompletePartition

noncomputable def ordinaryMoebiusFibre (r : ℕ) {n : ℕ} (π : CompletePartition n) : ℤ :=
  ∑ Q : WeightedCompletePartition r n with Q.partition=π,Q.moebius

/-- The characteristic polynomial is the sum over actual ordinary
partitions of their aggregated weighted Möbius values. -/
theorem characteristic_grouped (r n : ℕ) :
    characteristic r n =
      ∑ π : CompletePartition n,Polynomial.monomial (n-π.parts.card) (ordinaryMoebiusFibre r π) := by
  classical
  unfold characteristic ordinaryMoebiusFibre
  simp_rw [map_sum]
  have h (π : CompletePartition n) :
      (∑ Q : WeightedCompletePartition r n with Q.partition=π,
        Polynomial.monomial (n-π.parts.card) Q.moebius) =
      ∑ Q : WeightedCompletePartition r n with Q.partition=π,
        Polynomial.monomial Q.rank Q.moebius := by
    apply Finset.sum_congr rfl
    intro Q hQ
    rw [rank,(Finset.mem_filter.mp hQ).2]
  simp_rw [h]
  symm
  exact Finset.sum_fiberwise Finset.univ partition
    (fun Q : WeightedCompletePartition r n => Polynomial.monomial Q.rank Q.moebius)

/-- Literal recurrence from summing over all maximal weighted completions,
grouped by the unweighted partitions in the paper's Theorem 5.7. -/
theorem ordinary_fibre_cancellation (r n : ℕ) (hn : 1<n) :
    (∑ π : CompletePartition n,
      ((r+(π.parts.card-1)-1).choose (π.parts.card-1):ℤ)*ordinaryMoebiusFibre r π)=0 := by
  classical
  unfold ordinaryMoebiusFibre
  simp_rw [Finset.mul_sum]
  have h (π : CompletePartition n) :
      (∑ Q : WeightedCompletePartition r n with Q.partition=π,
        ((r+(π.parts.card-1)-1).choose (π.parts.card-1):ℤ)*Q.moebius) =
      ∑ Q : WeightedCompletePartition r n with Q.partition=π,
        ((r+(Q.partition.parts.card-1)-1).choose (Q.partition.parts.card-1):ℤ)*Q.moebius := by
    apply Finset.sum_congr rfl
    intro Q hQ
    rw [(Finset.mem_filter.mp hQ).2]
  simp_rw [h]
  rw [Finset.sum_fiberwise Finset.univ partition]
  exact topWeight_cancellation r n hn

end WeightedCompletePartition
end WachsCompleteGraph
