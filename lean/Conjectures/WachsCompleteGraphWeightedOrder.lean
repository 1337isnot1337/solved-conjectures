module

public import Conjectures.WachsCompleteGraphWeightedPartition

@[expose] public section
namespace WachsCompleteGraph
namespace WeightedCompletePartition

theorem parent_block_unique {r n : ℕ} {P Q : WeightedCompletePartition r n}
    {b c d : Finset (Fin n)} (hb : b∈P.partition.parts) (hc : c∈Q.partition.parts)
    (hd : d∈Q.partition.parts) (hbc : b⊆c) (hbd : b⊆d) : c=d :=
  Q.partition.disjoint.elim hc hd (fun h =>
    P.partition.ne_bot hb (disjoint_self.1 (h.mono hbc hbd)))

/-- Weight transport across a chain of unweighted refinements, with no
loss or duplication of any lower block. -/
theorem blockWeight_via_middle {r n : ℕ} {P Q R : WeightedCompletePartition r n}
    (hPQ : P.partition≤Q.partition) (hQR : Q.partition≤R.partition)
    {D : Finset (Fin n)} (hD : D∈R.partition.parts) (i : Fin r) :
    P.blockWeight D i =
      ∑ c ∈ Q.partition.parts, if c⊆D then P.blockWeight c i else 0 := by
  classical
  unfold blockWeight
  have hs (c : Finset (Fin n)) :
      (if c⊆D then (∑ b ∈ P.partition.parts, if b⊆c then (P.weights b i).val else 0) else 0) =
      ∑ b ∈ P.partition.parts, if b⊆c ∧ c⊆D then (P.weights b i).val else 0 := by
    by_cases hc : c⊆D <;> simp [hc]
  simp_rw [hs]
  rw [Finset.sum_comm]
  apply Finset.sum_congr rfl
  intro b hb
  obtain ⟨c,hc,hbc⟩ := hPQ hb
  have he : b⊆D ↔ c⊆D := by
    refine ⟨fun hbd => ?_,fun hcd => hbc.trans hcd⟩
    obtain ⟨E,hE,hcE⟩ := hQR hc
    have hDE : D=E := parent_block_unique hb hD hE hbd (hbc.trans hcE)
    exact hDE ▸ hcE
  rw [Finset.sum_eq_single c]
  · simp [hbc,he]
  · intro b' hb' hne
    have hn : ¬b⊆b' := by
      intro hbb'
      exact hne (parent_block_unique hb hb' hc hbb' hbc)
    simp [hn]
  · exact fun h => (h hc).elim

theorem refines_trans {r n : ℕ} {P Q R : WeightedCompletePartition r n}
    (hPQ : Refines P Q) (hQR : Refines Q R) : Refines P R := by
  refine ⟨hPQ.1.trans hQR.1,?_⟩
  intro D hD i
  calc
    _ = ∑ c ∈ Q.partition.parts, if c⊆D then P.blockWeight c i else 0 :=
      blockWeight_via_middle hPQ.1 hQR.1 hD i
    _ ≤ ∑ c ∈ Q.partition.parts, if c⊆D then (Q.weights c i).val else 0 := by
      apply Finset.sum_le_sum
      intro c hc
      split_ifs
      · exact hPQ.2 _ hc _
      · rfl
    _ = Q.blockWeight D i := rfl
    _ ≤ _ := hQR.2 _ hD _

instance (r n : ℕ) : PartialOrder (WeightedCompletePartition r n) where
  le P Q := Refines P Q
  le_refl := refines_refl
  le_trans _ _ _ := refines_trans
  le_antisymm _ _ hPQ hQP := equal_weights_of_refines_same_blocks hPQ (hPQ.1.antisymm hQP.1)

end WeightedCompletePartition
end WachsCompleteGraph
