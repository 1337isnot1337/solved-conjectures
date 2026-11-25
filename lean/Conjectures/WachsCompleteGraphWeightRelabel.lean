module
public import Conjectures.WachsCompleteGraphLabelEquiv

@[expose] public section
namespace WachsCompleteGraph
namespace WeightedCompletePartition

variable {r m n : ℕ} (e : Fin m ↪ Fin n)

include e in
theorem embedding_dimension : m ≤ n := by
  simpa using Fintype.card_le_of_injective e e.injective

noncomputable def liftWeight (P : WeightedCompletePartition r m) (b : Finset (Fin n)) (i : Fin r) :
    Fin (n+1) :=
  if b ∈ (mapLabelPartition e P.partition).parts then
    ⟨(P.weights (b.preimage e e.injective.injOn) i).val,
      Nat.lt_of_lt_of_le (P.weights _ i).isLt (Nat.succ_le_succ (embedding_dimension e))⟩
  else 0

theorem liftWeight_apply (P : WeightedCompletePartition r m) {c : Finset (Fin m)}
    (hc : c ∈ P.partition.parts) (i : Fin r) :
    (liftWeight e P (c.map e) i).val = (P.weights c i).val := by
  have h := mapLabelPartition_mem (e:=e).mpr hc
  unfold liftWeight
  rw [ite_eq_left h]
  change (P.weights ((c.map e).preimage e e.injective.injOn) i).val = (P.weights c i).val
  rw [Finset.preimage_map]

/-- Canonical relabeling of weights into a fixed live support; the
weights of blocks outside the partition remain zero. -/
noncomputable def liftLocal (P : WeightedCompletePartition r m) :
    LocalWeight r n ((Finset.univ : Finset (Fin m)).map e) where
  partition := mapLabelPartition e P.partition
  weights := liftWeight e P
  valid b hb := by
    obtain ⟨c,hc,rfl⟩ := Finset.mem_map.mp hb
    change (∑ i, (liftWeight e P (c.map e) i).val) = (c.map e).card - 1
    simp_rw [liftWeight_apply e P hc,Finset.card_map]
    exact P.valid c hc
  offBlocks b hb i := ite_eq_right hb

theorem liftLocal_apply (P : WeightedCompletePartition r m) {c : Finset (Fin m)}
    (hc : c ∈ P.partition.parts) (i : Fin r) :
    ((liftLocal e P).weights (c.map e) i).val = (P.weights c i).val :=
  liftWeight_apply e P hc i

theorem liftLocal_blockWeight (P : WeightedCompletePartition r m) (c : Finset (Fin m)) (i : Fin r) :
    (liftLocal e P).blockWeight (c.map e) i = P.blockWeight c i := by
  classical
  unfold LocalWeight.blockWeight blockWeight
  change (∑ b ∈ P.partition.parts.map (labelEmbedding e), _) = _
  rw [Finset.sum_map]
  apply Finset.sum_congr rfl
  intro b hb
  change (if b.map e ⊆ c.map e then ((liftLocal e P).weights (b.map e) i).val else 0) =
    if b ⊆ c then (P.weights b i).val else 0
  rw [liftLocal_apply e P hb]
  simp only [Finset.map_subset_map]

theorem liftLocal_refines_iff (P R : WeightedCompletePartition r m) :
    (liftLocal e P).Refines (liftLocal e R) ↔ P ≤ R := by
  constructor
  · intro h
    refine ⟨(mapLabelPartition_le_iff e).mp h.1,?_⟩
    intro c hc i
    have hh := h.2 (c.map e) (mapLabelPartition_mem.mpr hc) i
    rwa [liftLocal_blockWeight e P c i,liftLocal_apply e R hc i] at hh
  · intro h
    refine ⟨(mapLabelPartition_le_iff e).mpr h.1,?_⟩
    intro b hb i
    obtain ⟨c,hc,rfl⟩ := Finset.mem_map.mp hb
    change (liftLocal e P).blockWeight (c.map e) i ≤ ((liftLocal e R).weights (c.map e) i).val
    rw [liftLocal_blockWeight e P c i,liftLocal_apply e R hc i]
    exact h.2 c hc i

end WeightedCompletePartition
end WachsCompleteGraph
