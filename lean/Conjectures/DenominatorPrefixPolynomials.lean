import Conjectures.DenominatorHead
import Mathlib.Algebra.Polynomial.Basic
import Mathlib.Data.Rat.Cast.Defs

/-! Finite prefix recursions for the reverse-solitaire forest. Fuel is the
head length, and every child has length exactly one less. The public equations
therefore have no fuel or termination hypothesis. -/
namespace DenominatorForest
open Polynomial

def headOffset (a : List ℕ) (j : ℕ) : ℤ := (a.getD j 0 : ℤ)-j-1

noncomputable def deadAt : ℕ → List ℕ → ℤ → ℚ[X]
  | 0, _, _ => 1
  | n+1, a, s => 1+X*∑ j ∈ headChoices a s, deadAt n (headStep a j) (headOffset a j)

noncomputable def deadPoly (a : List ℕ) (s : ℤ) : ℚ[X] := deadAt a.length a s

theorem deadPoly_eq (a : List ℕ) (s : ℤ) :
    deadPoly a s=1+X*∑ j ∈ headChoices a s, deadPoly (headStep a j) (headOffset a j) := by
  cases a with
  | nil => simp [deadPoly,deadAt,headChoices]
  | cons b a =>
    unfold deadPoly
    simp only [List.length_cons,deadAt,headStep_length,Nat.add_sub_cancel]

@[simp] theorem deadPoly_nil (s : ℤ) : deadPoly [] s=1 := rfl

noncomputable def freePoly (a : List ℕ) : ℚ[X] := deadPoly a (-(a.length : ℤ))

theorem freePoly_eq (a : List ℕ) :
    freePoly a=1+X*∑ j ∈ freeChoices a, deadPoly (headStep a j) (headOffset a j) := by
  rw [freePoly,deadPoly_eq,headChoices_free]

@[simp] theorem freePoly_nil : freePoly []=1 := rfl

noncomputable abbrev prefixFirst := deadPoly

theorem prefixFirst_eq (a : List ℕ) (s : ℤ) :
    prefixFirst a s=1+X*∑ j ∈ headChoices a s, prefixFirst (headStep a j) (headOffset a j) :=
  deadPoly_eq a s

noncomputable def tailTerm (a : List ℕ) (s : ℤ) : ℚ[X] :=
  if (a.length : ℤ)+s ≤ 0 then X*freePoly a else 0

noncomputable def prefixAt : ℕ → List ℕ → ℤ → ℚ[X]
  | 0, a, s => tailTerm a s
  | n+1, a, s => tailTerm a s+X*∑ j ∈ headChoices a s,
      prefixAt n (headStep a j) (headOffset a j)

noncomputable def prefixSecond (a : List ℕ) (s : ℤ) : ℚ[X] := prefixAt a.length a s

theorem prefixSecond_eq (a : List ℕ) (s : ℤ) :
    prefixSecond a s=(if (a.length : ℤ)+s ≤ 0 then X*freePoly a else 0)+
      X*∑ j ∈ headChoices a s, prefixSecond (headStep a j) (headOffset a j) := by
  cases a with
  | nil => simp [prefixSecond,prefixAt,headChoices,tailTerm]
  | cons b a =>
    unfold prefixSecond
    simp only [List.length_cons,prefixAt,headStep_length,Nat.add_sub_cancel,tailTerm]

@[simp] theorem prefixSecond_nil (s : ℤ) :
    prefixSecond [] s=if s ≤ 0 then X else 0 := by
  simp [prefixSecond,prefixAt,tailTerm]

end DenominatorForest
