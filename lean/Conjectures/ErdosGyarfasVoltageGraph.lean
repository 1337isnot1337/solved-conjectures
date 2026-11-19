import Conjectures.ErdosGyarfasSharpCover
import Mathlib.Data.Fin.VecNotation
import Mathlib.Tactic.Abel
import Mathlib.Tactic.FinCases

/-!
# Arbitrary voltages and changes of sheet coordinates

The seven labels follow the oriented base edges `04, 41, 02, 03, 12, 13, 23`.
The cover is the actual graph on pairs of a base vertex and a group element.
Changing the origin in each fiber gives an explicit graph isomorphism.
-/

namespace ErdosGyarfasVoltage

variable {A : Type*} [AddCommGroup A]

/-- Sources of the seven oriented base edges, in the manuscript's order. -/
def edgeSource : Fin 7 → Fin 5 := ![0, 4, 0, 0, 1, 1, 2]

/-- Targets of the seven oriented base edges, in the same order. -/
def edgeTarget : Fin 7 → Fin 5 := ![4, 1, 2, 3, 2, 3, 3]

/-- The signed voltage of a directed base edge. Values on nonedges are zero. -/
def edgeVoltage (labels : Fin 7 → A) : Fin 5 → Fin 5 → A :=
  ![![0, 0, labels 2, labels 3, labels 0],
    ![0, 0, labels 4, labels 5, -labels 1],
    ![-labels 2, -labels 4, 0, labels 6, 0],
    ![-labels 3, -labels 5, -labels 6, 0, 0],
    ![-labels 0, labels 1, 0, 0, 0]]

theorem edgeVoltage_reverse (labels : Fin 7 → A) (i j : Fin 5) :
    edgeVoltage labels j i = -edgeVoltage labels i j := by
  fin_cases i <;> fin_cases j <;> simp [edgeVoltage]

/-- The voltage cover of the exact subdivided tetrahedron. -/
def voltageCover (labels : Fin 7 → A) : SimpleGraph (Fin 5 × A) where
  Adj u v := ErdosGyarfasSharp.baseGraph.Adj u.1 v.1 ∧
    v.2 = u.2 + edgeVoltage labels u.1 v.1
  symm := ⟨by
    intro u v h
    refine ⟨h.1.symm, ?_⟩
    rw [edgeVoltage_reverse, h.2]
    abel⟩
  loopless := ⟨fun _ h => ErdosGyarfasSharp.baseGraph.irrefl h.1⟩

theorem voltageCover_adj (labels : Fin 7 → A) (u v : Fin 5 × A) :
    (voltageCover labels).Adj u v ↔
      ErdosGyarfasSharp.baseGraph.Adj u.1 v.1 ∧
        v.2 = u.2 + edgeVoltage labels u.1 v.1 := Iff.rfl

/-- A potential changes each edge label by its source value minus its target value. -/
def gaugeLabels (labels : Fin 7 → A) (potential : Fin 5 → A) : Fin 7 → A :=
  ![potential 0 + labels 0 - potential 4,
    potential 4 + labels 1 - potential 1,
    potential 0 + labels 2 - potential 2,
    potential 0 + labels 3 - potential 3,
    potential 1 + labels 4 - potential 2,
    potential 1 + labels 5 - potential 3,
    potential 2 + labels 6 - potential 3]

theorem gaugeLabels_apply (labels : Fin 7 → A) (potential : Fin 5 → A)
    (e : Fin 7) :
    gaugeLabels labels potential e =
      potential (edgeSource e) + labels e - potential (edgeTarget e) := by
  fin_cases e <;> rfl

/-- The gauge formula holds in either orientation of every actual base edge. -/
theorem edgeVoltage_gauge (labels : Fin 7 → A) (potential : Fin 5 → A)
    {i j : Fin 5} (h : ErdosGyarfasSharp.baseGraph.Adj i j) :
    edgeVoltage (gaugeLabels labels potential) i j =
      potential i + edgeVoltage labels i j - potential j := by
  fin_cases i <;> fin_cases j <;>
    simp [ErdosGyarfasSharp.baseGraph, ErdosGyarfasSharp.baseEdges] at h <;>
    simp [edgeVoltage, gaugeLabels] <;> abel

/-- Subtracting the chosen potential in each fiber is an actual graph isomorphism. -/
def gaugeIso (labels : Fin 7 → A) (potential : Fin 5 → A) :
    voltageCover labels ≃g voltageCover (gaugeLabels labels potential) where
  toEquiv :=
    { toFun := fun u => (u.1, u.2 - potential u.1)
      invFun := fun u => (u.1, u.2 + potential u.1)
      left_inv := by intro u; ext <;> simp
      right_inv := by intro u; ext <;> simp }
  map_rel_iff' := by
    intro u v
    change (ErdosGyarfasSharp.baseGraph.Adj u.1 v.1 ∧
      v.2 - potential v.1 = u.2 - potential u.1 +
        edgeVoltage (gaugeLabels labels potential) u.1 v.1) ↔
      (ErdosGyarfasSharp.baseGraph.Adj u.1 v.1 ∧
        v.2 = u.2 + edgeVoltage labels u.1 v.1)
    constructor
    · rintro ⟨hbase, hphase⟩
      refine ⟨hbase, ?_⟩
      rw [edgeVoltage_gauge labels potential hbase] at hphase
      calc
        v.2 = (v.2 - potential v.1) + potential v.1 := (sub_add_cancel _ _).symm
        _ = (u.2 - potential u.1 +
            (potential u.1 + edgeVoltage labels u.1 v.1 - potential v.1)) +
              potential v.1 := congrArg (fun x : A => x + potential v.1) hphase
        _ = u.2 + edgeVoltage labels u.1 v.1 := by abel
    · rintro ⟨hbase, hphase⟩
      refine ⟨hbase, ?_⟩
      rw [edgeVoltage_gauge labels potential hbase, hphase]
      abel

@[simp]
theorem gaugeIso_apply (labels : Fin 7 → A) (potential : Fin 5 → A)
    (u : Fin 5 × A) :
    gaugeIso labels potential u = (u.1, u.2 - potential u.1) := rfl

@[simp]
theorem gaugeIso_symm_apply (labels : Fin 7 → A) (potential : Fin 5 → A)
    (u : Fin 5 × A) :
    (gaugeIso labels potential).symm u = (u.1, u.2 + potential u.1) := rfl

end ErdosGyarfasVoltage
