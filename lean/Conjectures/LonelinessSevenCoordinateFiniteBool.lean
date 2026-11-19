import Conjectures.LonelinessSevenCoordinateFiniteDefs
import Mathlib.Data.List.FinRange

/-! Boolean evaluation of the literal finite predicates. The soundness
lemmas below keep the computational loop separate from nested decidable
universal propositions. Every numerical equality is still kernel checked. -/

namespace Loneliness.SevenCoordinateCritical.Finite

def allIndices {n : ℕ} (f : Fin n → Bool) : Bool := (List.finRange n).all f

def anyIndex {n : ℕ} (f : Fin n → Bool) : Bool := (List.finRange n).any f

@[simp] theorem allIndices_eq_true {n : ℕ} (f : Fin n → Bool) :
    allIndices f = true ↔ ∀ i, f i = true := by
  simp [allIndices, List.all_eq_true]

@[simp] theorem anyIndex_eq_true {n : ℕ} (f : Fin n → Bool) :
    anyIndex f = true ↔ ∃ i, f i = true := by
  simp [anyIndex, List.any_eq_true]

def candidateCheck (w : Vector) : Bool :=
  decide (0 < w 0) && decide (absoluteSupport w = sixSet)

@[simp] theorem candidateCheck_eq_true (w : Vector) :
    candidateCheck w = true ↔ Candidate w := by
  simp [candidateCheck, Candidate]

def repeatShapeCheck (w : Vector) : Bool :=
  decide (0 < leastAbs w) &&
    (allIndices (fun i : Fin 7 => decide (leastAbs w ∣ (w i).natAbs)) &&
      decide (dividedSupport w = sixSet))

@[simp] theorem repeatShapeCheck_eq_true (w : Vector) :
    repeatShapeCheck w = true ↔ RepeatShape w := by
  simp [repeatShapeCheck, RepeatShape]

def oneRepeatCheck (w z : Vector) (i j : Fin 7) (positive : Bool) : Bool :=
  decide (¬ (w i = sign positive * w j ∧ z i = sign positive * z j)) &&
    (anyIndex (fun a : Fin 7 => decide (repeatVector w z i j positive a = 0)) ||
      repeatShapeCheck (repeatVector w z i j positive))

@[simp] theorem oneRepeatCheck_eq_true (w z : Vector) (i j : Fin 7) (positive : Bool) :
    oneRepeatCheck w z i j positive = true ↔
      ¬ (w i = sign positive * w j ∧ z i = sign positive * z j) ∧
        ((∃ a, repeatVector w z i j positive a = 0) ∨
          RepeatShape (repeatVector w z i j positive)) := by
  simp only [oneRepeatCheck, Bool.and_eq_true, Bool.or_eq_true,
    decide_eq_true_eq, anyIndex_eq_true, repeatShapeCheck_eq_true]

def repeatTestsCheck (w z : Vector) : Bool :=
  allIndices (fun i : Fin 7 => allIndices (fun j : Fin 7 =>
    if j < i then [false, true].all (oneRepeatCheck w z i j) else true))

theorem repeatTestsCheck_eq_true (w z : Vector) :
    repeatTestsCheck w z = true ↔ RepeatTests w z := by
  constructor
  · intro h i j hji positive
    have hi := (allIndices_eq_true _).mp h i
    have hij := (allIndices_eq_true _).mp hi j
    rw [ite_eq_left hji] at hij
    have hp := List.all_eq_true.mp hij positive (by cases positive <;> simp)
    exact (oneRepeatCheck_eq_true w z i j positive).mp hp
  · intro h
    apply (allIndices_eq_true _).mpr
    intro i
    apply (allIndices_eq_true _).mpr
    intro j
    by_cases hji : j < i
    · rw [ite_eq_left hji]
      apply List.all_eq_true.mpr
      intro positive _
      exact (oneRepeatCheck_eq_true w z i j positive).mpr (h i j hji positive)
    · rw [ite_eq_right hji]

def productCheck (w z : Vector) : Bool :=
  anyIndex (fun i : Fin 7 =>
    decide ((collinearCoordinates w z i).card = 6) &&
      decide ((collinearCoordinates w z i).image (fun j => (w j).natAbs) = sixSet))

@[simp] theorem productCheck_eq_true (w z : Vector) :
    productCheck w z = true ↔ ProductForm w z := by
  simp [productCheck, ProductForm]

def caseCheck (k : Fin 6) (left right : Bool) (a b c : Fin 12) : Bool :=
  let z := reduced k left right a b c
  if candidateCheck z then
    if repeatTestsCheck (canonical k) z then productCheck (canonical k) z else true
  else true

theorem caseCheck_sound (k : Fin 6) (left right : Bool) (a b c : Fin 12)
    (h : caseCheck k left right a b c = true) : CaseValid k left right a b c := by
  intro hc hr
  have hc' := (candidateCheck_eq_true _).mpr hc
  have hr' := (repeatTestsCheck_eq_true _ _).mpr hr
  apply (productCheck_eq_true _ _).mp
  simpa only [caseCheck, hc', hr', Bool.true_eq, ite_true] using h

def blockCheck (k : Fin 6) (left right : Bool) (a : Fin 12) : Bool :=
  allIndices (fun b : Fin 12 => allIndices (fun c : Fin 12 => caseCheck k left right a b c))

theorem blockCheck_sound (k : Fin 6) (left right : Bool) (a : Fin 12)
    (h : blockCheck k left right a = true) : ∀ b c : Fin 12, CaseValid k left right a b c := by
  intro b c
  exact caseCheck_sound k left right a b c
    ((allIndices_eq_true _).mp ((allIndices_eq_true _).mp h b) c)

end Loneliness.SevenCoordinateCritical.Finite
