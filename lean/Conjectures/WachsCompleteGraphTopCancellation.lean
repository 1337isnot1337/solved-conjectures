module
public import Conjectures.WachsCompleteGraphTopExtensions

@[expose] public section
namespace WachsCompleteGraph
namespace WeightedCompletePartition

private theorem discard_bottom_of_top {r n : ℕ} (hN : 1<n)
    (Q : WeightedCompletePartition r n) (hQ : Q.partition=⊤) : Q≠⊥ := by
  intro h
  have he : (⊥ : CompletePartition n)=⊤ := calc
    _ = (⊥ : WeightedCompletePartition r n).partition := rfl
    _ = Q.partition := (congrArg partition h).symm
    _ = _ := hQ
  have hc := congrArg (fun P : CompletePartition n => P.parts.card) he
  rw [Finpartition.card_bot,top_partition_parts (by omega)] at hc
  simp at hc
  omega

noncomputable def topExtensionFinset {r n : ℕ} (P : WeightedCompletePartition r n) :
    Finset (WeightedCompletePartition r n) := by
  classical
  exact Finset.univ.filter (fun Q => P≤Q ∧ Q.partition=⊤)

theorem topExtensionFinset_card {r n : ℕ} (P : WeightedCompletePartition r n) :
    P.topExtensionFinset.card=Nat.card (TopExtensions P) := by
  classical
  let e : ↥P.topExtensionFinset ≃ TopExtensions P :=
    { toFun := fun Q => ⟨Q.val,by simpa [topExtensionFinset] using Q.property⟩
      invFun := fun Q => ⟨Q.val,by simpa [topExtensionFinset] using Q.property⟩
      left_inv := fun _ => rfl
      right_inv := fun _ => rfl }
  rw [←Nat.card_congr e,Nat.card_eq_fintype_card,Fintype.card_coe]

/-- Sum the actual Möbius cancellation equations at every one-block
top element, then count how many such elements extend each lower object. -/
theorem topWeight_cancellation (r n : ℕ) (hN : 1<n) :
    (∑ P : WeightedCompletePartition r n,
      ((r+(P.partition.parts.card-1)-1).choose (P.partition.parts.card-1):ℤ)*P.moebius)=0 := by
  classical
  let f (Q P : WeightedCompletePartition r n) : ℤ :=
    if Q.partition=⊤ then (if P≤Q then P.moebius else 0) else 0
  have hrows (Q : WeightedCompletePartition r n) : (∑ P,f Q P)=0 := by
    by_cases hQ : Q.partition=⊤
    · simp only [f,ite_eq_left hQ]
      rw [←Finset.sum_filter]
      change (∑ P ∈ Q.lowerClosed,P.moebius)=0
      rw [moebius_cumulative,ite_eq_right (discard_bottom_of_top hN Q hQ)]
    · simp [f,hQ]
  have hsum : (∑ Q : WeightedCompletePartition r n,∑ P,f Q P)=0 := by
    simp [hrows]
  rw [Finset.sum_comm] at hsum
  have hcols (P : WeightedCompletePartition r n) :
      (∑ Q,f Q P)=((r+(P.partition.parts.card-1)-1).choose (P.partition.parts.card-1):ℤ)*P.moebius := by
    have he (Q : WeightedCompletePartition r n) :
        f Q P=if P≤Q ∧ Q.partition=⊤ then P.moebius else 0 := by
      by_cases h : Q.partition=⊤ <;> simp [f,h]
    simp_rw [he]
    rw [←Finset.sum_filter]
    change (∑ Q ∈ P.topExtensionFinset,P.moebius)=_
    rw [Finset.sum_const,nsmul_eq_mul,topExtensionFinset_card,topExtensions_card P (by omega)]
    have hp : P.partition.parts.card≤n := by simpa using P.partition.card_parts_le_card
    have hr : n-1-P.rank=P.partition.parts.card-1 := by unfold rank; omega
    rw [hr]
  simpa only [hcols] using hsum

end WeightedCompletePartition
end WachsCompleteGraph
