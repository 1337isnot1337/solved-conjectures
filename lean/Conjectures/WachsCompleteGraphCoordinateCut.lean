module
public import Conjectures.WachsCompleteGraphBlockIntervals
public import Conjectures.WachsCompleteGraphMoebiusLaw

@[expose] public section
namespace WachsCompleteGraph
namespace WeightedCompletePartition

variable {r n : ℕ} (Q : WeightedCompletePartition r n)

abbrev GloballyBelow := {P : WeightedCompletePartition r n // P ≤ Q}

noncomputable def bottomTuple : ∀ B : Q.partition.parts, BelowComponent Q B :=
  belowComponents Q ⟨⊥,bot_le⟩

noncomputable def coordinateCut (B : Q.partition.parts) (x : BelowComponent Q B) :
    GloballyBelow Q := by
  classical
  exact (belowComponents Q).symm (Function.update (bottomTuple Q) B x)

theorem coordinateCut_same (B : Q.partition.parts) (x : BelowComponent Q B) :
    belowComponents Q (coordinateCut Q B x) B = x := by
  classical
  simp [coordinateCut]

theorem coordinateCut_other (B C : Q.partition.parts) (h : C ≠ B) (x : BelowComponent Q B) :
    belowComponents Q (coordinateCut Q B x) C = bottomTuple Q C := by
  classical
  simp [coordinateCut, Function.update_of_ne h]

theorem coordinateCut_injective (B : Q.partition.parts) : Function.Injective (coordinateCut Q B) := by
  intro x y h
  have he := congrArg (fun g => belowComponents Q g B) h
  simpa only [coordinateCut_same] using he

theorem coordinateCut_bottom (B : Q.partition.parts) :
    coordinateCut Q B (bottomTuple Q B) = ⟨⊥,bot_le⟩ := by
  apply (belowComponents Q).injective
  funext C
  by_cases h : C = B
  · subst C
    exact coordinateCut_same Q B _
  · exact coordinateCut_other Q B C h _

theorem coordinateCut_le_iff (B : Q.partition.parts) (x y : BelowComponent Q B) :
    (coordinateCut Q B x).val ≤ (coordinateCut Q B y).val ↔ x.val.Refines y.val := by
  rw [belowComponents_le_iff Q]
  constructor
  · intro h
    simpa only [coordinateCut_same] using h B
  · intro h C
    by_cases hc : C = B
    · subst C
      simpa only [coordinateCut_same] using h
    · rw [coordinateCut_other Q B C hc x,coordinateCut_other Q B C hc y]
      exact (belowComponents_le_iff Q (P:=⟨⊥,bot_le⟩) (R:=⟨⊥,bot_le⟩)).mp le_rfl C

noncomputable instance (B : Q.partition.parts) : Fintype (BelowComponent Q B) := by
  classical
  exact Fintype.ofInjective (coordinateCut Q B) (coordinateCut_injective Q B)

noncomputable instance (B : Q.partition.parts) : PartialOrder (BelowComponent Q B) where
  le x y := (coordinateCut Q B x).val ≤ (coordinateCut Q B y).val
  le_refl _ := le_rfl
  le_trans _ _ _ := le_trans
  le_antisymm x y hxy hyx := coordinateCut_injective Q B (Subtype.ext (le_antisymm hxy hyx))

noncomputable instance (B : Q.partition.parts) : OrderBot (BelowComponent Q B) where
  bot := bottomTuple Q B
  bot_le x := by
    change (coordinateCut Q B (bottomTuple Q B)).val ≤ _
    rw [coordinateCut_bottom Q B]
    exact bot_le

theorem belowComponents_order_iff {P R : GloballyBelow Q} :
    P.val ≤ R.val ↔ belowComponents Q P ≤ belowComponents Q R := by
  rw [belowComponents_le_iff Q]
  exact forall_congr' (fun B => (coordinateCut_le_iff Q B _ _).symm)

end WeightedCompletePartition
end WachsCompleteGraph
