import Mathlib.Algebra.Group.End
import Mathlib.Logic.Equiv.Sum
import Mathlib.Order.Basic

namespace CurgusMascioniMatchingCut

variable {I K R : Type*} [Preorder R]

abbrev Fiber (c : I → K) (k : K) := {i // c i = k}

/-- A matching is feasible at the specified maximum pair cost. -/
def Feasible (cost : I → I → R) (r : R) : Prop :=
  ∃ e : Equiv.Perm I, ∀ i, cost i (e i) ≤ r

def FiberFeasible (c : I → K) (cost : I → I → R) (r : R) : Prop :=
  ∀ k : K, ∃ e : Equiv.Perm (Fiber c k), ∀ i : Fiber c k, cost i.val (e i).val ≤ r

theorem compatible_iff (c : I → K) (cost : I → I → R) (r : R) :
    (∃ e : Equiv.Perm I, ∀ i, c (e i) = c i ∧ cost i (e i) ≤ r) ↔
      FiberFeasible c cost r := by
  constructor
  · rintro ⟨e,h⟩ k
    let e' : Equiv.Perm (Fiber c k) := e.subtypePerm fun i => by rw [(h i).1]
    refine ⟨e',?_⟩
    intro i
    exact (h i.1).2
  · intro h
    choose e he using h
    let σ := (Equiv.sigmaFiberEquiv c).permCongr (Equiv.sigmaCongrRight e)
    refine ⟨σ,?_⟩
    intro i
    change c (e (c i) ⟨i,rfl⟩).val = c i ∧ cost i (e (c i) ⟨i,rfl⟩).val ≤ r
    exact ⟨(e (c i) ⟨i,rfl⟩).2,he (c i) ⟨i,rfl⟩⟩

/-- If every cross-fiber pair costs more than a budget, the global matching
problem at that budget factors exactly into the individual fibers. -/
theorem feasible_iff_separated (c : I → K) (cost : I → I → R) (r : R)
    (hsep : ∀ i j, c i ≠ c j → r < cost i j) :
    Feasible cost r ↔ FiberFeasible c cost r := by
  rw [← compatible_iff]
  constructor
  · rintro ⟨e,h⟩
    refine ⟨e,fun i => ⟨?_,h i⟩⟩
    by_contra hne
    exact (not_lt_of_ge (h i)) (hsep i (e i) (Ne.symm hne))
  · rintro ⟨e,h⟩
    exact ⟨e,fun i => (h i).2⟩

end CurgusMascioniMatchingCut
