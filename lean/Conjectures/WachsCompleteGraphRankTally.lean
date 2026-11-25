module
public import Conjectures.WachsCompleteGraphExponentialFormula
public import Conjectures.WachsCompleteGraphSizeRecurrence

@[expose] public section
namespace WachsCompleteGraph

variable {K : Type*} [CommSemiring K]

theorem partition_card_le (n : ℕ) (π : CompletePartition n) : π.parts.card ≤ n := by
  have h := Finpartition.card_mono (bot_le : (⊥ : CompletePartition n) ≤ π)
  simpa [Finpartition.card_bot] using h

theorem sum_block_ranks {n : ℕ} (π : CompletePartition n) :
    (∑ b ∈ π.parts, (b.card-1)) = n-π.parts.card := by
  have h : (∑ b ∈ π.parts,(b.card-1))+π.parts.card = n := calc
    _ = ∑ b ∈ π.parts, ((b.card-1)+1) := by simp [Finset.sum_add_distrib]
    _ = ∑ b ∈ π.parts,b.card := by
      apply Finset.sum_congr rfl
      intro b hb
      exact Nat.sub_add_cancel (Finset.card_pos.mpr (π.nonempty_of_mem_parts hb))
    _ = n := by simpa using π.sum_card_parts
  omega

/-- Specializing the weights by a parameter keeps the precise rank exponent. -/
theorem canonical_tally_specialize (w : ℕ → K) (t : K) (n k : ℕ) :
    canonicalPartitionWeightSum (fun m => w m*t^(m-1)) n k =
      t^(n-k) * canonicalPartitionWeightSum w n k := by
  classical
  unfold canonicalPartitionWeightSum partitionWeightSum
  rw [Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro π hπ
  rw [Finset.prod_mul_distrib,Finset.prod_pow_eq_pow_sum,sum_block_ranks,
    (Finset.mem_filter.mp hπ).2,mul_comm]

/-- Groups a sum over all actual partitions by the number of parts. -/
theorem partition_sum_blockCount (w a : ℕ → K) (n : ℕ) :
    (∑ k ∈ Finset.range (n+1), a k * canonicalPartitionWeightSum w n k) =
      ∑ π : CompletePartition n, a π.parts.card * ∏ b ∈ π.parts, w b.card := by
  classical
  unfold canonicalPartitionWeightSum partitionWeightSum
  simp_rw [Finset.mul_sum]
  rw [← Finset.sum_fiberwise_of_maps_to
    (g:=fun π : CompletePartition n => π.parts.card)
    (s:=Finset.univ) (t:=Finset.range (n+1))
    (fun π _ => Finset.mem_range.mpr (Nat.lt_succ_of_le (partition_card_le n π)))]
  apply Finset.sum_congr rfl
  intro k _
  apply Finset.sum_congr rfl
  intro π hπ
  rw [(Finset.mem_filter.mp hπ).2]

end WachsCompleteGraph
