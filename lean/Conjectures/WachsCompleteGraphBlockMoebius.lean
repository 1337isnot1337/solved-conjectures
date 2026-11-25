module
public import Conjectures.WachsCompleteGraphCutCancellation

@[expose] public section
namespace WachsCompleteGraph
namespace WeightedCompletePartition

set_option maxHeartbeats 1000000

variable {r n : ℕ} (Q : WeightedCompletePartition r n)

noncomputable def blockMoebiusProduct (P : GloballyBelow Q) : ℤ :=
  ∏ B : Q.partition.parts, cutMoebius Q B (belowComponents Q P B)

open Classical in
theorem blockProduct_cumulative (P : GloballyBelow Q) :
    (∑ R : GloballyBelow Q with R.val ≤ P.val, blockMoebiusProduct Q R) =
      if P.val = ⊥ then 1 else 0 := by
  classical
  let a := belowComponents Q P
  let e := (belowComponents Q).subtypeEquiv (p:=fun R => R.val ≤ P.val)
    (q:=fun x => x ≤ a) (fun R => belowComponents_order_iff Q (P:=R) (R:=P))
  have h : (∑ R : GloballyBelow Q with R.val ≤ P.val, blockMoebiusProduct Q R) =
      ∑ x : (∀ B : Q.partition.parts, BelowComponent Q B) with x ≤ a,
        ∏ B, cutMoebius Q B (x B) := by
    rw [Finset.sum_subtype (p:=fun R : GloballyBelow Q => R.val ≤ P.val) _ (fun R => by simp),
      Finset.sum_subtype (p:=fun x : ∀ B : Q.partition.parts, BelowComponent Q B => x ≤ a)
        _ (fun x => by simp)]
    exact Fintype.sum_equiv e _ _ (fun _ => rfl)
  have hlaw (B : Q.partition.parts) (x : BelowComponent Q B) :
      (∑ y : BelowComponent Q B with y ≤ x,cutMoebius Q B y) =
        @ite ℤ (x = ⊥) (Classical.propDecidable _) 1 0 := by
    by_cases hb : x = ⊥ <;> simpa only [hb,ite_true,ite_false] using cutMoebius_cumulative Q B x
  rw [h]
  have hm := cumulative_product_moebius (cutMoebius Q) hlaw a
  have hsum :
      (∑ x : (∀ B : Q.partition.parts, BelowComponent Q B) with x ≤ a,
        ∏ B, cutMoebius Q B (x B)) = if a = ⊥ then 1 else 0 := by
    convert hm using 1
    · apply Finset.sum_congr
      · ext x
        simp only [Finset.mem_filter, Finset.mem_univ, true_and]
      · intro x hx
        rfl
    · split <;> simp_all
  rw [hsum]
  have hbot : a = ⊥ ↔ P.val = ⊥ := belowComponents_globally_bot Q P
  by_cases hp : P.val = ⊥
  · rw [ite_eq_left hp,ite_eq_left (hbot.mpr hp)]
  · rw [ite_eq_right hp,ite_eq_right (fun h => hp (hbot.mp h))]

/-- The actual weighted Möbius value factors over the independent
lower intervals of the fixed partition's blocks. -/
theorem moebius_eq_block_product (P : GloballyBelow Q) :
    P.val.moebius = blockMoebiusProduct Q P := by
  classical
  let f (R : WeightedCompletePartition r n) : ℤ :=
    if h : R ≤ Q then blockMoebiusProduct Q ⟨R,h⟩ else 0
  have hc (R : WeightedCompletePartition r n) (hR : R ≤ Q) :
      (∑ S ∈ R.lowerClosed, f S) = if R = ⊥ then 1 else 0 := by
    have h : (∑ S ∈ R.lowerClosed, f S) =
        ∑ S : GloballyBelow Q with S.val ≤ R, blockMoebiusProduct Q S := by
      rw [Finset.sum_subtype (p:=fun S : WeightedCompletePartition r n => S ≤ R)
        _ (fun S => by simp [lowerClosed]),
        Finset.sum_subtype (p:=fun S : GloballyBelow Q => S.val ≤ R) _ (fun S => by simp)]
      let e : {S : WeightedCompletePartition r n // S ≤ R} ≃ {S : GloballyBelow Q // S.val ≤ R} :=
        { toFun := fun S => ⟨⟨S.val,S.property.trans hR⟩,S.property⟩
          invFun := fun S => ⟨S.val.val,S.property⟩
          left_inv := fun _ => rfl
          right_inv := fun _ => rfl }
      apply Fintype.sum_equiv e
      intro S
      exact dite_eq_left (S.property.trans hR)
    rw [h]
    exact blockProduct_cumulative Q ⟨R,hR⟩
  have he (R : WeightedCompletePartition r n) : R ≤ Q → f R = R.moebius := by
    induction R using (complete_order_wellFounded r n).induction with
    | h R ih =>
      intro hR
      have h₁ := hc R hR
      have h₂ := moebius_cumulative R
      rw [lowerClosed_insert,Finset.sum_insert (by simp [mem_lowerStrict])] at h₁ h₂
      have hs : (∑ S ∈ R.lowerStrict, f S) = ∑ S ∈ R.lowerStrict,S.moebius :=
        Finset.sum_congr rfl (fun S hS =>
          ih S (mem_lowerStrict.mp hS) ((mem_lowerStrict.mp hS).le.trans hR))
      rw [hs] at h₁
      exact add_right_cancel (h₁.trans h₂.symm)
  have hp := he P.val P.property
  change (if h : P.val ≤ Q then blockMoebiusProduct Q ⟨P.val,h⟩ else 0) = P.val.moebius at hp
  rw [dite_eq_left P.property] at hp
  exact hp.symm

end WeightedCompletePartition
end WachsCompleteGraph
