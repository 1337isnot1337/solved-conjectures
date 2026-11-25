module
public import Conjectures.WachsCompleteGraphWeightRelabel

@[expose] public section
namespace WachsCompleteGraph
namespace WeightedCompletePartition

variable {r m n : ℕ} (e : Fin m ↪ Fin n)

theorem liftLocal_surjective : Function.Surjective (liftLocal (r:=r) e) := by
  classical
  intro Q
  obtain ⟨π,hπ⟩ := mapLabelPartition_surjective e (Finset.univ : Finset (Fin m)) Q.partition
  have hq (b) (hb : b ∈ π.parts) : b.map e ∈ Q.partition.parts := by
    rw [← hπ]
    exact mapLabelPartition_mem.mpr hb
  let P : WeightedCompletePartition r m :=
    { partition := π
      weights b i := if hb : b ∈ π.parts then
        ⟨(Q.weights (b.map e) i).val, by
          have hs := Finset.single_le_sum (f:=fun j => (Q.weights (b.map e) j).val)
            (fun _ _ => Nat.zero_le _) (Finset.mem_univ i)
          rw [Q.valid (b.map e) (hq b hb),Finset.card_map] at hs
          have hm : b.card ≤ m := by simpa using Finset.card_le_univ b
          omega⟩
        else 0
      valid b hb := by
        simp only [dite_eq_left hb]
        rw [← Finset.card_map (s:=b) e]
        exact Q.valid (b.map e) (hq b hb)
      offBlocks b hb i := dite_eq_right hb }
  refine ⟨P,?_⟩
  apply LocalWeight.ext hπ
  funext b i
  by_cases hb : b ∈ Q.partition.parts
  · have hn : b ∈ (mapLabelPartition e π).parts := by rw [hπ]; exact hb
    obtain ⟨c,hc,rfl⟩ := Finset.mem_map.mp hn
    apply Fin.ext
    change ((liftLocal e P).weights (c.map e) i).val = (Q.weights (c.map e) i).val
    rw [liftLocal_apply e P hc]
    change (if h : c ∈ π.parts then _ else (0 : Fin (m+1))).val = _
    simp [hc]
  · have hn : b ∉ (liftLocal e P).partition.parts := by change b ∉ (mapLabelPartition e π).parts; rw [hπ]; exact hb
    rw [(liftLocal e P).offBlocks b hn,Q.offBlocks b hb]

/-- Weighted partitions on the live support of an embedding are
equivalent to those on the canonical vertex set. -/
noncomputable def liftLocalEquiv (r : ℕ) :
    WeightedCompletePartition r m ≃ LocalWeight r n ((Finset.univ : Finset (Fin m)).map e) :=
  Equiv.ofBijective (liftLocal e) ⟨fun P R h =>
    le_antisymm ((liftLocal_refines_iff e P R).mp (h.symm ▸ (liftLocal_refines_iff e P P).mpr le_rfl))
      ((liftLocal_refines_iff e R P).mp (h ▸ (liftLocal_refines_iff e P P).mpr le_rfl)),
    liftLocal_surjective e⟩

end WeightedCompletePartition
end WachsCompleteGraph
