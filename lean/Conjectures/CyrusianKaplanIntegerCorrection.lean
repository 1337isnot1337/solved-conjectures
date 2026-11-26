module
public import Conjectures.CyrusianKaplanBaselineIntegerLattice
public import Conjectures.CyrusianKaplanTupleScale

@[expose] public section
namespace CyrusianKaplan
open Set

def TrueIntegerPoints (g r : ℕ) :=
  {z : (Fin r→ℤ) × (Fin r→ℤ) // integerTupleCast r z∈admissibleTupleRegion r (g:ℝ)}

private noncomputable def integer_image_subtype_equiv {r : ℕ} (U : Set (TupleSpace r)) :
    {z : (Fin r→ℤ) × (Fin r→ℤ) // integerTupleCast r z ∈ U} ≃
      {x : TupleSpace r // x∈U ∧ x∈Set.range (integerTupleCast r)} := by
  let f (z : {z : (Fin r→ℤ) × (Fin r→ℤ) // integerTupleCast r z∈U}) :
      {x : TupleSpace r // x∈U ∧ x∈Set.range (integerTupleCast r)} :=
    ⟨integerTupleCast r z.val,z.property,Set.mem_range_self _⟩
  apply Equiv.ofBijective f
  constructor
  · intro x y h
    exact Subtype.ext (integerTupleCast_injective r (congrArg Subtype.val h))
  · intro x
    obtain ⟨z,hz⟩ := x.property.2
    exact ⟨⟨z,hz.symm ▸ x.property.1⟩,Subtype.ext hz⟩

theorem card_trueIntegerPoints (g r : ℕ) :
    Nat.card (TrueIntegerPoints g r) = Nat.card (ExactOrdinarizationClass g r) :=
  (Nat.card_congr (integer_image_subtype_equiv (admissibleTupleRegion r (g:ℝ)))).trans
    (exact_ordinarization_count_integer_lattice g r).symm

instance trueIntegerPoints_finite (g r : ℕ) : Finite (TrueIntegerPoints g r) := by
  let e := (integer_image_subtype_equiv (admissibleTupleRegion r (g:ℝ))).symm
  have : Finite (tupleLatticePoints g r) := Finite.of_equiv _ (ordinarizationTupleLatticeEquiv g r)
  have e₁ : tupleLatticePoints g r ≃ {x : TupleSpace r // x∈admissibleTupleRegion r (g:ℝ) ∧
      x∈Set.range (integerTupleCast r)} := by
    apply Equiv.subtypeEquivRight
    intro x
    constructor
    · intro h
      exact ⟨h.1,(integer_lattice_iff_natural_in_admissible_region h.1).mpr h.2⟩
    · intro h
      exact ⟨h.1,(integer_lattice_iff_natural_in_admissible_region h.1).mp h.2⟩
  exact Finite.of_equiv _ (e₁.trans e)

def integerCorrectionRegion (g r : ℕ) (positive : Bool) : Set ((Fin r→ℤ) × (Fin r→ℤ)) :=
  if positive then {z | integerTupleCast r z∈admissibleTupleRegion r (g:ℝ) ∧
                         integerTupleCast r z∉baselineTupleRegion r (g:ℝ)}
  else {z | integerTupleCast r z∈baselineTupleRegion r (g:ℝ) ∧
              integerTupleCast r z∉admissibleTupleRegion r (g:ℝ)}

abbrev IntegerCorrectionPoints (g r : ℕ) (positive : Bool) := ↥(integerCorrectionRegion g r positive)

private noncomputable def exclusive_and_common_equiv {α : Type*} (P Q : α→Prop) :
    {x // P x} ≃ ({x // P x ∧ Q x} ⊕ {x // P x ∧ ¬Q x}) := by
  classical
  refine
    { toFun := fun x => if H : Q x.val then .inl ⟨x.val,x.property,H⟩ else .inr ⟨x.val,x.property,H⟩,
      invFun := fun y => y.elim (fun x => ⟨x.val,x.property.1⟩) (fun x => ⟨x.val,x.property.1⟩),
      left_inv := ?_,
      right_inv := ?_ }
  · intro x
    by_cases h : Q x.val <;> simp [h]
  · intro y
    cases y with
    | inl a => simp [a.property.2]
    | inr b => simp [b.property.2]

/-- The overlap cancels exactly in the actual count minus the
closed-boundary binomial baseline. Only the two one-sided
integer-lattice corrections remain, with signs +1 and −1. -/
theorem exact_signed_integerCorrection (g r : ℕ) (hr : 1≤r) :
    (Nat.card (ExactOrdinarizationClass g r):ℚ) - ((baselinePairs g r).card:ℚ) =
      (Nat.card (IntegerCorrectionPoints g r true):ℚ) -
        (Nat.card (IntegerCorrectionPoints g r false):ℚ) := by
  let P : ((Fin r→ℤ) × (Fin r→ℤ)) → Prop :=
    fun z => integerTupleCast r z∈admissibleTupleRegion r (g:ℝ)
  let Q : ((Fin r→ℤ) × (Fin r→ℤ)) → Prop :=
    fun z => integerTupleCast r z∈baselineTupleRegion r (g:ℝ)
  have hB : Finite (BaselineIntegerPoints g r) := Finite.of_equiv _ (baselineIntegerPairsEquiv g r hr).symm
  have pF {R : ((Fin r→ℤ) × (Fin r→ℤ)) → Prop} :
      Finite {x // P x ∧ R x} := by
    let f : {x // P x ∧ R x} → TrueIntegerPoints g r := fun x => ⟨x.val,x.property.1⟩
    exact Finite.of_injective f
      (fun _ _ h => Subtype.ext (congrArg (fun q : TrueIntegerPoints g r => q.val) h))
  have qF {R : ((Fin r→ℤ) × (Fin r→ℤ)) → Prop} :
      Finite {x // Q x ∧ R x} := by
    let f : {x // Q x ∧ R x} → BaselineIntegerPoints g r := fun x => ⟨x.val,x.property.1⟩
    exact @Finite.of_injective _ _ hB f
      (fun _ _ h => Subtype.ext (congrArg (fun q : BaselineIntegerPoints g r => q.val) h))
  let := pF (R:=Q)
  let := pF (R:=fun x => ¬Q x)
  let := qF (R:=P)
  let := qF (R:=fun x => ¬P x)
  have hP := Nat.card_congr (exclusive_and_common_equiv P Q)
  have hQ := Nat.card_congr (exclusive_and_common_equiv Q P)
  rw [Nat.card_sum] at hP hQ
  have hC : Nat.card {x // P x ∧ Q x} = Nat.card {x // Q x ∧ P x} :=
    Nat.card_congr (Equiv.subtypeEquivRight (fun _ => and_comm))
  change Nat.card (TrueIntegerPoints g r) = _ at hP
  change Nat.card (BaselineIntegerPoints g r) = _ at hQ
  rw [hC,card_trueIntegerPoints] at hP
  rw [card_baselineIntegerPoints g r hr] at hQ
  rw [hP,hQ]
  push_cast
  change _ = (Nat.card {x // P x ∧ ¬Q x}:ℚ)-(Nat.card {x // Q x ∧ ¬P x}:ℚ)
  ring

end CyrusianKaplan
