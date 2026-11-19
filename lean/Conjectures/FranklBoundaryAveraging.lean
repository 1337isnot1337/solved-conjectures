module

public import Conjectures.FranklBoundaryFibers
public import Mathlib.Data.Fintype.Sigma
public import Mathlib.Algebra.BigOperators.Ring.Finset
public import Mathlib.Algebra.Order.BigOperators.Group.Finset
public import Mathlib.Basic.Real.Basic

/-! Exact averaging over finite fibers.

The fibers are a disjoint partition of the configuration type. Multiplying
each fiber inequality by its own cardinality and summing therefore gives the
same bound for the full uniform family. No equality of fiber sizes is used. -/
@[expose] public section

namespace FranklBoundary

variable {A I : Type*}

abbrev Fiber (f : A → I) (i : I) := {a : A // f a = i}

abbrev EventFiber (f : A → I) (event : A → Prop) (i : I) :=
  {a : A // f a = i ∧ event a}

def sigmaFiberEquiv (f : A → I) : (Σ i, Fiber f i) ≃ A where
  toFun a := a.2.1
  invFun a := ⟨f a, a, rfl⟩
  left_inv a := by
    rcases a with ⟨i, a, h⟩
    cases h
    rfl
  right_inv _ := rfl

def sigmaEventFiberEquiv (f : A → I) (event : A → Prop) :
    (Σ i, EventFiber f event i) ≃ {a : A // event a} where
  toFun a := ⟨a.2.1, a.2.2.2⟩
  invFun a := ⟨f a.1, a.1, rfl, a.2⟩
  left_inv a := by
    rcases a with ⟨i, a, hi, he⟩
    cases hi
    rfl
  right_inv _ := rfl

def eventFiberSubtypeEquiv (f : A → I) (event : A → Prop) (i : I) :
    EventFiber f event i ≃ {a : Fiber f i // event a.1} where
  toFun a := ⟨⟨a.1, a.2.1⟩, a.2.2⟩
  invFun a := ⟨a.1.1, a.1.2, a.2⟩
  left_inv _ := rfl
  right_inv _ := rfl

theorem card_eq_sum_fibers [Finite A] [Fintype I] (f : A → I) :
    Nat.card A = ∑ i, Nat.card (Fiber f i) := by
  rw [← Nat.card_congr (sigmaFiberEquiv f)]
  exact Nat.card_sigma

theorem event_card_eq_sum_fibers [Finite A] [Fintype I] (f : A → I) (event : A → Prop) :
    Nat.card {a : A // event a} = ∑ i, Nat.card (EventFiber f event i) := by
  rw [← Nat.card_congr (sigmaEventFiberEquiv f event)]
  exact Nat.card_sigma

theorem cardinal_bound_of_fibers [Finite A] [Fintype I]
    (f : A → I) (event : A → Prop) (num den : ℕ)
    (h : ∀ i, den * Nat.card (EventFiber f event i) ≤ num * Nat.card (Fiber f i)) :
    den * Nat.card {a : A // event a} ≤ num * Nat.card A := by
  rw [event_card_eq_sum_fibers f event, card_eq_sum_fibers f]
  simp only [Finset.mul_sum]
  exact Finset.sum_le_sum (fun i _ => h i)

theorem real_cardinal_bound_of_fibers [Finite A] [Fintype I]
    (f : A → I) (event : A → Prop) (num den : ℝ)
    (h : ∀ i, den * (Nat.card (EventFiber f event i) : ℝ) ≤
      num * (Nat.card (Fiber f i) : ℝ)) :
    den * (Nat.card {a : A // event a} : ℝ) ≤ num * (Nat.card A : ℝ) := by
  rw [event_card_eq_sum_fibers f event, card_eq_sum_fibers f]
  simp only [Nat.cast_sum, Finset.mul_sum]
  exact Finset.sum_le_sum (fun i _ => h i)

variable {V : Type*}

abbrev MaximalIndependent (G : SimpleGraph V) := {S : Set V // Maximal G.IsIndepSet S}

def boundaryData (G : SimpleGraph V) (inside boundary : Set V)
    (S : MaximalIndependent G) : Set V × Set V :=
  (S.1 \ inside, S.1 ∩ boundary)

def fixedDataFiberEquiv (G : SimpleGraph V) (inside boundary : Set V)
    (reference : MaximalIndependent G) :
    Fiber (boundaryData G inside boundary) (boundaryData G inside boundary reference) ≃
      GlobalFiber G inside boundary reference.1 where
  toFun S := ⟨S.1.1, S.1.2, congrArg Prod.fst S.2, congrArg Prod.snd S.2⟩
  invFun S := ⟨⟨S.1, S.2.1⟩, Prod.ext S.2.2.1 S.2.2.2⟩
  left_inv _ := rfl
  right_inv _ := rfl

def occupiedFixedDataFiberEquiv (G : SimpleGraph V) (inside boundary : Set V)
    (reference : MaximalIndependent G) (v : V) :
    EventFiber (boundaryData G inside boundary) (fun S => v ∈ S.1)
      (boundaryData G inside boundary reference) ≃
    {S : GlobalFiber G inside boundary reference.1 // v ∈ S.1} :=
  (eventFiberSubtypeEquiv (boundaryData G inside boundary) (fun S => v ∈ S.1)
    (boundaryData G inside boundary reference)).trans
      ((fixedDataFiberEquiv G inside boundary reference).subtypeEquiv (fun _ => Iff.rfl))

theorem maximal_independent_bound_of_fibers [Finite V]
    (G : SimpleGraph V) (inside boundary : Set V) (v : V) (num den : ℕ)
    (h : ∀ reference : MaximalIndependent G,
      den * Nat.card {S : GlobalFiber G inside boundary reference.1 // v ∈ S.1} ≤
        num * Nat.card (GlobalFiber G inside boundary reference.1)) :
    den * Nat.card {S : MaximalIndependent G // v ∈ S.1} ≤
      num * Nat.card (MaximalIndependent G) := by
  classical
  let _ : Fintype (Set V × Set V) := Fintype.ofFinite _
  apply cardinal_bound_of_fibers (boundaryData G inside boundary) (fun S => v ∈ S.1) num den
  intro data
  by_cases hex : Nonempty (Fiber (boundaryData G inside boundary) data)
  · obtain ⟨⟨reference, heq⟩⟩ := hex
    rw [← heq, Nat.card_congr (fixedDataFiberEquiv G inside boundary reference),
      Nat.card_congr (occupiedFixedDataFiberEquiv G inside boundary reference v)]
    exact h reference
  · let _ : IsEmpty (Fiber (boundaryData G inside boundary) data) :=
      ⟨fun S => hex ⟨S⟩⟩
    let _ : IsEmpty (EventFiber (boundaryData G inside boundary) (fun S => v ∈ S.1) data) :=
      ⟨fun S => hex ⟨⟨S.1, S.2.1⟩⟩⟩
    simp

theorem maximal_independent_real_bound_of_fibers [Finite V]
    (G : SimpleGraph V) (inside boundary : Set V) (v : V) (num den : ℝ)
    (h : ∀ reference : MaximalIndependent G,
      den * (Nat.card {S : GlobalFiber G inside boundary reference.1 // v ∈ S.1} : ℝ) ≤
        num * (Nat.card (GlobalFiber G inside boundary reference.1) : ℝ)) :
    den * (Nat.card {S : MaximalIndependent G // v ∈ S.1} : ℝ) ≤
      num * (Nat.card (MaximalIndependent G) : ℝ) := by
  classical
  let _ : Fintype (Set V × Set V) := Fintype.ofFinite _
  apply real_cardinal_bound_of_fibers (boundaryData G inside boundary) (fun S => v ∈ S.1) num den
  intro data
  by_cases hex : Nonempty (Fiber (boundaryData G inside boundary) data)
  · obtain ⟨⟨reference, heq⟩⟩ := hex
    rw [← heq, Nat.card_congr (fixedDataFiberEquiv G inside boundary reference),
      Nat.card_congr (occupiedFixedDataFiberEquiv G inside boundary reference v)]
    exact h reference
  · let _ : IsEmpty (Fiber (boundaryData G inside boundary) data) :=
      ⟨fun S => hex ⟨S⟩⟩
    let _ : IsEmpty (EventFiber (boundaryData G inside boundary) (fun S => v ∈ S.1) data) :=
      ⟨fun S => hex ⟨⟨S.1, S.2.1⟩⟩⟩
    simp

end FranklBoundary
