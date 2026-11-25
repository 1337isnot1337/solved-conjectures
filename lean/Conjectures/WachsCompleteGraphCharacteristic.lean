module

public import Conjectures.WachsCompleteGraphWeightedOrder
public import Mathlib.Order.WellFoundedSet

@[expose] public section
namespace WachsCompleteGraph
namespace WeightedCompletePartition

instance (r n : ℕ) : OrderBot (WeightedCompletePartition r n) where
  bot :=
    { partition := ⊥
      weights := fun _ _ => 0
      valid := by
        intro b hb
        obtain ⟨v,_,rfl⟩ := Finpartition.mem_bot_iff.mp hb
        simp
      offBlocks := fun _ _ _ => rfl }
  bot_le P := by
    refine ⟨bot_le,?_⟩
    intro B _ i
    change (∑ b ∈ (⊥ : CompletePartition n).parts, if b⊆B then ((0:Fin (n+1)).val) else 0) ≤ _
    simp

theorem rank_eq_sum_block_weights {r n : ℕ} (P : WeightedCompletePartition r n) :
    P.rank = ∑ b ∈ P.partition.parts, ∑ i : Fin r,(P.weights b i).val := by
  have hsum :
      (∑ b ∈ P.partition.parts,(b.card-1)) + P.partition.parts.card=n := by
    calc
      _ = ∑ b ∈ P.partition.parts,((b.card-1)+1) := by simp [Finset.sum_add_distrib]
      _ = ∑ b ∈ P.partition.parts,b.card := by
        apply Finset.sum_congr rfl
        intro b hb
        have hn : b.Nonempty := Finset.nonempty_iff_ne_empty.mpr (P.partition.ne_bot hb)
        have hpos : 0<b.card := Finset.card_pos.mpr hn
        omega
      _ = _ := by simpa using P.partition.sum_card_parts
  have hg : (∑ b ∈ P.partition.parts, ∑ i : Fin r,(P.weights b i).val) =
      ∑ b ∈ P.partition.parts,(b.card-1) :=
    Finset.sum_congr rfl (fun b hb => P.valid b hb)
  rw [hg]
  unfold rank
  omega

theorem complete_order_wellFounded (r n : ℕ) :
    WellFounded ((· < ·) : WeightedCompletePartition r n → WeightedCompletePartition r n → Prop) :=
  Set.wellFoundedOn_univ.mp (Set.finite_univ.wellFoundedOn)

noncomputable def lowerStrict {r n : ℕ} (P : WeightedCompletePartition r n) :
    Finset (WeightedCompletePartition r n) := by
  classical
  exact Finset.univ.filter (·<P)

theorem mem_lowerStrict {r n : ℕ} {P Q : WeightedCompletePartition r n} :
    Q∈P.lowerStrict ↔ Q<P := by
  classical
  simp [lowerStrict]

noncomputable def moebiusStep {r n : ℕ} (P : WeightedCompletePartition r n)
    (prev : ∀ Q, Q<P→ℤ) : ℤ := by
  classical
  exact if P=⊥ then 1 else -(∑ Q ∈ P.lowerStrict.attach, prev Q.val (mem_lowerStrict.mp Q.property))

/-- The actual Möbius value from the discrete weighted bottom. -/
noncomputable def moebius {r n : ℕ} (P : WeightedCompletePartition r n) : ℤ :=
  (complete_order_wellFounded r n).fix moebiusStep P

theorem moebius_recurrence {r n : ℕ} (P : WeightedCompletePartition r n) :
    P.moebius=(if P=⊥ then 1 else -(∑ Q ∈ P.lowerStrict,Q.moebius)) := by
  classical
  conv_lhs => rw [moebius,WellFounded.fix_eq]
  unfold moebiusStep
  by_cases h : P=⊥
  · simp [h]
  · rw [ite_eq_right h,ite_eq_right h]
    exact congrArg Neg.neg (Finset.sum_attach P.lowerStrict (fun Q => Q.moebius))

theorem moebius_bot (r n : ℕ) : (⊥ : WeightedCompletePartition r n).moebius=1 := by
  rw [moebius_recurrence]
  simp

/-- The literal equal-variable characteristic polynomial of the weighted
complete-graph bond poset, in the source rank-generating convention. -/
noncomputable def characteristic (r n : ℕ) : Polynomial ℤ :=
  ∑ P : WeightedCompletePartition r n, Polynomial.monomial P.rank P.moebius

theorem characteristic_coeff (r n k : ℕ) :
    (characteristic r n).coeff k =
      ∑ P : WeightedCompletePartition r n, if P.rank=k then P.moebius else 0 := by
  rw [characteristic,Polynomial.finsetSum_coeff]
  simp only [Polynomial.coeff_monomial]

end WeightedCompletePartition
end WachsCompleteGraph
