module

public import Conjectures.FranklFCVaughan
public import Conjectures.FranklLocalWeights

@[expose] public section

/-! The finite FC theorem uses the same family of distinct generated unions
and the same abundance predicate as the local-certificate development.
These definitional bridges expose Vaughan's shortcut through that interface.
-/

namespace Frankl.FC.Family

variable {α : Type*} [DecidableEq α]

theorem generatedUnions_eq_family (G : Finset (Finset α)) :
    Frankl.generatedUnions G = FranklLocal.family G := rfl

theorem frequency_eq_frequency (F : Finset (Finset α)) (x : α) :
    Frankl.frequency F x = FranklLocal.frequency F x := rfl

theorem abundant_iff_abundant (F : Finset (Finset α)) (x : α) :
    Frankl.Abundant F x ↔ FranklLocal.Abundant F x := Iff.rfl

theorem generated_abundant_iff (G : Finset (Finset α)) (x : α) :
    Frankl.Abundant (Frankl.generatedUnions G) x ↔
      FranklLocal.Abundant (FranklLocal.family G) x := Iff.rfl

/-- Vaughan's shortcut in the local-certificate family interface, with a
witness inside the union of the three displayed generators. -/
theorem three_generator_triples_abundant {G : Finset (Finset α)} {A B C : Finset α}
    {p : α} (hAG : A ∈ G) (hBG : B ∈ G) (hCG : C ∈ G)
    (hA : A.card = 3) (hB : B.card = 3) (hC : C.card = 3)
    (hneAB : A ≠ B) (hneAC : A ≠ C) (hneBC : B ≠ C)
    (hpA : p ∈ A) (hpB : p ∈ B) (hpC : p ∈ C) :
    ∃ x ∈ A ∪ B ∪ C, FranklLocal.Abundant (FranklLocal.family G) x := by
  change ∃ x ∈ A ∪ B ∪ C, Frankl.Abundant (Frankl.generatedUnions G) x
  exact Frankl.Vaughan.three_generator_triples_abundant hAG hBG hCG hA hB hC
    hneAB hneAC hneBC hpA hpB hpC

end Frankl.FC.Family
