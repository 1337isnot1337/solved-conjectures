module
public import Conjectures.WachsCompleteGraphCoordinateCut
public import Conjectures.WachsCompleteGraphProductCancellation

@[expose] public section
namespace WachsCompleteGraph
namespace WeightedCompletePartition

variable {r n : ℕ} (Q : WeightedCompletePartition r n)

theorem belowComponents_globally_bot (P : GloballyBelow Q) :
    belowComponents Q P = (⊥ : ∀ B : Q.partition.parts, BelowComponent Q B) ↔ P.val = ⊥ := by
  constructor
  · intro h
    have e : P = ⟨⊥,bot_le⟩ := (belowComponents Q).injective h
    exact congrArg Subtype.val e
  · intro h
    have e : P = ⟨⊥,bot_le⟩ := Subtype.ext h
    subst P
    rfl

theorem belowCut_other (B : Q.partition.parts) {x : BelowComponent Q B}
    (P : GloballyBelow Q) (h : P.val ≤ (coordinateCut Q B x).val)
    (C : Q.partition.parts) (hC : C ≠ B) :
    belowComponents Q P C = bottomTuple Q C := by
  have hc := (belowComponents_order_iff Q).mp h C
  rw [coordinateCut_other Q B C hC] at hc
  exact le_antisymm hc (bot_le : (⊥ : BelowComponent Q C) ≤ _)

theorem cut_recovers_below (B : Q.partition.parts) {x : BelowComponent Q B}
    (P : GloballyBelow Q) (h : P.val ≤ (coordinateCut Q B x).val) :
    coordinateCut Q B (belowComponents Q P B) = P := by
  apply (belowComponents Q).injective
  funext C
  by_cases hC : C = B
  · subst C
    exact coordinateCut_same Q B _
  · rw [coordinateCut_other Q B C hC,belowCut_other Q B P h C hC]

/-- Restricting to one coordinate with all others at bottom is an exact
bijection on the whole lower interval of that weighted cut. -/
noncomputable def cutLowerEquiv (B : Q.partition.parts) (x : BelowComponent Q B) :
    {y : BelowComponent Q B // y ≤ x} ≃
      {P : WeightedCompletePartition r n // P ≤ (coordinateCut Q B x).val} where
  toFun y := ⟨(coordinateCut Q B y.val).val,y.property⟩
  invFun P := by
    let hP : GloballyBelow Q := ⟨P.val,P.property.trans (coordinateCut Q B x).property⟩
    refine ⟨belowComponents Q hP B,?_⟩
    have hc := (belowComponents_order_iff Q (P:=hP) (R:=coordinateCut Q B x)).mp P.property B
    rwa [coordinateCut_same] at hc
  left_inv y := by
    apply Subtype.ext
    exact coordinateCut_same Q B y.val
  right_inv P := by
    apply Subtype.ext
    exact congrArg (fun z : GloballyBelow Q => z.val) (cut_recovers_below Q B
      ⟨P.val,P.property.trans (coordinateCut Q B x).property⟩ P.property)

noncomputable def cutMoebius (B : Q.partition.parts) (x : BelowComponent Q B) : ℤ :=
  (coordinateCut Q B x).val.moebius

open Classical in
theorem cutMoebius_cumulative (B : Q.partition.parts) (x : BelowComponent Q B) :
    (∑ y : BelowComponent Q B with y ≤ x,cutMoebius Q B y) = if x = ⊥ then 1 else 0 := by
  classical
  let e := cutLowerEquiv Q B x
  have h : (∑ y : BelowComponent Q B with y ≤ x,cutMoebius Q B y) =
      ∑ P ∈ (coordinateCut Q B x).val.lowerClosed, P.moebius := by
    rw [Finset.sum_subtype (p:=fun y : BelowComponent Q B => y ≤ x) _ (fun y => by simp),
      Finset.sum_subtype (p:=fun P : WeightedCompletePartition r n => P ≤ (coordinateCut Q B x).val)
        _ (fun P => by simp [lowerClosed])]
    apply Fintype.sum_equiv e
    intro y
    rfl
  rw [h,moebius_cumulative]
  have he : (coordinateCut Q B x).val = ⊥ ↔ x = ⊥ := by
    constructor
    · intro h
      apply coordinateCut_injective Q B
      rw [show (⊥ : BelowComponent Q B) = bottomTuple Q B from rfl,coordinateCut_bottom]
      exact Subtype.ext h
    · intro h
      subst x
      exact congrArg Subtype.val (coordinateCut_bottom Q B)
  by_cases hx : x = ⊥
  · rw [ite_eq_left (he.mpr hx),ite_eq_left hx]
  · have hn : (coordinateCut Q B x).val ≠ ⊥ := fun h => hx (he.mp h)
    simp [hx,hn]

end WeightedCompletePartition
end WachsCompleteGraph
