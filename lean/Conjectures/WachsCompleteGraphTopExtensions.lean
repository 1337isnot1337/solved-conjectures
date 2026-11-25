module
public import Conjectures.WachsCompleteGraphWeightCompletions

@[expose] public section
namespace WachsCompleteGraph
namespace WeightedCompletePartition

theorem top_partition_parts {n : ℕ} (hn : 0<n) :
    (⊤ : CompletePartition n).parts={Finset.univ} := by
  have hs := Finpartition.parts_top_subset (Finset.univ : Finset (Fin n))
  have hx : (⟨0,hn⟩ : Fin n)∈(Finset.univ : Finset (Fin n)) := Finset.mem_univ _
  obtain ⟨b,hb,_⟩ := (⊤ : CompletePartition n).exists_mem hx
  have he : b=Finset.univ := Finset.mem_singleton.mp (hs hb)
  rw [he] at hb
  exact Finset.Subset.antisymm hs (by simpa using hb)

theorem total_blockWeight_univ {r n : ℕ} (P : WeightedCompletePartition r n) :
    (∑ i : Fin r,P.blockWeight Finset.univ i)=P.rank := by
  unfold blockWeight
  simp only [Finset.subset_univ,ite_true]
  rw [Finset.sum_comm]
  exact (rank_eq_sum_block_weights P).symm

theorem rank_le_pred {r n : ℕ} (P : WeightedCompletePartition r n) (hn : 0<n) :
    P.rank≤n-1 := by
  have hx : (⟨0,hn⟩ : Fin n)∈(Finset.univ : Finset (Fin n)) := Finset.mem_univ _
  obtain ⟨b,hb,_⟩ := P.partition.exists_mem hx
  have hp := Finset.card_pos.mpr ⟨b,hb⟩
  unfold rank
  omega

abbrev TopExtensions {r n : ℕ} (P : WeightedCompletePartition r n) :=
  {Q : WeightedCompletePartition r n // P≤Q ∧ Q.partition=⊤}

def topWithWeights {r n : ℕ} (hn : 0<n) (w : Fin r→ℕ) (hw : (∑ i,w i)=n-1) :
    WeightedCompletePartition r n where
  partition := ⊤
  weights b i := if b=Finset.univ then ⟨w i,by
    have h := Finset.single_le_sum (f:=w) (fun _ _ => Nat.zero_le _) (Finset.mem_univ i)
    omega⟩ else 0
  valid := by
    intro b hb
    rw [top_partition_parts hn,Finset.mem_singleton] at hb
    subst b
    simpa using hw
  offBlocks := by
    intro b hb i
    rw [top_partition_parts hn,Finset.mem_singleton] at hb
    exact ite_eq_right hb

theorem topWithWeights_univ {r n : ℕ} (hn : 0<n) (w : Fin r→ℕ)
    (hw : (∑ i,w i)=n-1) (i : Fin r) : ((topWithWeights hn w hw).weights Finset.univ i).val=w i := by
  simp [topWithWeights]

noncomputable def topExtensions_equiv {r n : ℕ} (P : WeightedCompletePartition r n) (hn : 0<n) :
    TopExtensions P ≃ WeightCompletions (P.blockWeight Finset.univ) (n-1) where
  toFun Q := ⟨fun i => (Q.val.weights Finset.univ i).val, by
    have hU : Finset.univ∈Q.val.partition.parts := by
      rw [Q.property.2,top_partition_parts hn]
      simp
    have hQ : Refines P Q.val := Q.property.1
    exact ⟨fun i => hQ.2 _ hU i, by simpa using Q.val.valid _ hU⟩⟩
  invFun w := ⟨topWithWeights hn w.val w.property.2, by
    change Refines P (topWithWeights hn w.val w.property.2) ∧ _
    refine ⟨⟨le_top,?_⟩,rfl⟩
    intro b hb i
    change b∈(⊤ : CompletePartition n).parts at hb
    rw [top_partition_parts hn,Finset.mem_singleton] at hb
    subst b
    rw [topWithWeights_univ]
    exact w.property.1 i⟩
  left_inv Q := by
    apply Subtype.ext
    apply WeightedCompletePartition.ext Q.property.2.symm
    funext b i
    by_cases h : b=Finset.univ
    · subst b
      apply Fin.ext
      simp [topWithWeights]
    · have hb : b∉Q.val.partition.parts := by
        rw [Q.property.2,top_partition_parts hn,Finset.mem_singleton]
        exact h
      rw [Q.val.offBlocks b hb]
      change (if b=Finset.univ then _ else 0)=0
      exact ite_eq_right h
  right_inv w := by
    apply Subtype.ext
    funext i
    simp [topWithWeights]

theorem topExtensions_card {r n : ℕ} (P : WeightedCompletePartition r n) (hn : 0<n) :
    Nat.card (TopExtensions P)=
      (r+(n-1-P.rank)-1).choose (n-1-P.rank) := by
  rw [Nat.card_congr (topExtensions_equiv P hn),weight_completions_card]
  · rw [total_blockWeight_univ]
  · rw [total_blockWeight_univ]
    exact rank_le_pred P hn

end WeightedCompletePartition
end WachsCompleteGraph
