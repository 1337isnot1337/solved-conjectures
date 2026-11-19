module

public import Mathlib.Data.Fintype.Pi
public import Mathlib.Data.Fintype.Prod
public import Mathlib.Data.Fintype.Card
public import Mathlib.Data.Fintype.BigOperators
public import Mathlib.Logic.Equiv.Prod

@[expose] public section

/-! Exact counting for the local Boolean selections in the large-generator
argument. One omitted central generator and `k` independent covering pairs
have `3^k` choices out of `2 * 4^k`. Additional coordinates are counted exactly.
-/

namespace FranklBits

abbrev HitPair := {p : Bool × Bool // p ≠ (false, false)}

theorem card_hitPair : Fintype.card HitPair = 3 := by decide

abbrev LocalSelection (k : ℕ) := Bool × (Fin k → Bool × Bool)

def IsBad {k : ℕ} (s : LocalSelection k) : Prop :=
  s.1 = false ∧ ∀ j, s.2 j ≠ (false, false)

instance {k : ℕ} (s : LocalSelection k) : Decidable (IsBad s) :=
  inferInstanceAs (Decidable (s.1 = false ∧ ∀ j, s.2 j ≠ (false, false)))

/-- Restricting to a bad local selection leaves precisely one nonempty
two-bit choice per point of the central generator. -/
def badEquiv (k : ℕ) : {s : LocalSelection k // IsBad s} ≃ (Fin k → HitPair) where
  toFun s j := ⟨s.1.2 j, s.2.2 j⟩
  invFun f := ⟨(false, fun j => (f j).1), rfl, fun j => (f j).2⟩
  left_inv s := by
    apply Subtype.ext
    exact Prod.ext s.2.1.symm rfl
  right_inv f := rfl

theorem card_bad (k : ℕ) : Fintype.card {s : LocalSelection k // IsBad s} = 3 ^ k := by
  rw [Fintype.card_congr (badEquiv k)]
  simp

theorem card_localSelection (k : ℕ) : Fintype.card (LocalSelection k) = 2 * 4 ^ k := by
  simp [LocalSelection]

theorem card_bad_with_rest (k : ℕ) (R : Type*) [Fintype R] [DecidableEq R] :
    Fintype.card {s : LocalSelection k × (R → Bool) // IsBad s.1} =
      3 ^ k * 2 ^ Fintype.card R := by
  rw [Fintype.card_congr Equiv.prodSubtypeFstEquivSubtypeProd]
  simp [card_bad]

theorem card_total_with_rest (k : ℕ) (R : Type*) [Fintype R] [DecidableEq R] :
    Fintype.card (LocalSelection k × (R → Bool)) =
      (2 * 4 ^ k) * 2 ^ Fintype.card R := by
  simp

/-- Any explicit reindexing of the original independent bits transports the
count. This permits arbitrary generator labels and arbitrary unused bits. -/
theorem card_bad_transport (k : ℕ) (Ω R : Type*) [Fintype Ω] [Fintype R] [DecidableEq R]
    (e : Ω ≃ LocalSelection k × (R → Bool)) :
    Fintype.card {s : Ω // IsBad (e s).1} = 3 ^ k * 2 ^ Fintype.card R := by
  rw [Fintype.card_congr (Equiv.subtypeEquivOfSubtype
    (p := fun s : LocalSelection k × (R → Bool) => IsBad s.1) e)]
  exact card_bad_with_rest k R

theorem card_total_transport (k : ℕ) (Ω R : Type*) [Fintype Ω] [Fintype R] [DecidableEq R]
    (e : Ω ≃ LocalSelection k × (R → Bool)) :
    Fintype.card Ω = (2 * 4 ^ k) * 2 ^ Fintype.card R := by
  rw [Fintype.card_congr e]
  exact card_total_with_rest k R

def AllThreeFalse (s : Fin 3 → Bool) : Prop := ∀ j, s j = false

instance (s : Fin 3 → Bool) : Decidable (AllThreeFalse s) :=
  inferInstanceAs (Decidable (∀ j, s j = false))

theorem card_allThreeFalse : Fintype.card {s : Fin 3 → Bool // AllThreeFalse s} = 1 := by
  decide

/-- Point absence before conditioning fixes three independent bits to zero. -/
theorem card_absent_with_rest (R : Type*) [Fintype R] [DecidableEq R] :
    Fintype.card {s : (Fin 3 → Bool) × (R → Bool) // AllThreeFalse s.1} =
      2 ^ Fintype.card R := by
  rw [Fintype.card_congr Equiv.prodSubtypeFstEquivSubtypeProd]
  simp [card_allThreeFalse]

theorem card_query_total (R : Type*) [Fintype R] [DecidableEq R] :
    Fintype.card ((Fin 3 → Bool) × (R → Bool)) = 8 * 2 ^ Fintype.card R := by
  simp

end FranklBits
