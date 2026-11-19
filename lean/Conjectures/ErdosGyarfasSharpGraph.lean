import Mathlib.Algebra.Field.ZMod
import Mathlib.Combinatorics.SimpleGraph.Connectivity.Connected
import Mathlib.Data.Fin.VecNotation
import Mathlib.Tactic.FinCases
import Mathlib.Tactic.NormNum

/-!
# The literal cyclic cover on 95 vertices

The seven oriented voltage edges are those of `sharpness.py`. An edge
adds its displayed voltage to the sheet coordinate; the reverse edge
subtracts it. The neighbor lists and their equality decisions remain
computational for the ordinary kernel-checked search certificates.
-/

namespace ErdosGyarfasSharp

abbrev Vertex := Fin 5 × ZMod 19

def voltageEdges : List ((Fin 5 × Fin 5) × ZMod 19) :=
  [((0, 4), 0), ((4, 1), 0), ((0, 2), 0), ((0, 3), 0),
    ((1, 2), 1), ((1, 3), 8), ((2, 3), 0)]

def SharpAdj (u v : Vertex) : Prop :=
  ((u.1, v.1), v.2 - u.2) ∈ voltageEdges ∨
    ((v.1, u.1), u.2 - v.2) ∈ voltageEdges

instance : DecidableRel SharpAdj := fun _ _ =>
  inferInstanceAs (Decidable (_ ∨ _))

/-- The graph is defined by the literal seven voltage edges. -/
def sharpGraph : SimpleGraph Vertex where
  Adj := SharpAdj
  symm := ⟨fun _ _ h => h.symm⟩
  loopless := ⟨by decide⟩

instance : DecidableRel sharpGraph.Adj := fun u v =>
  inferInstanceAs (Decidable (SharpAdj u v))

/-- The complete sparse neighbor lists used by the finite search. -/
def neighbors (v : Vertex) : List Vertex :=
  ![[(4, v.2), (2, v.2), (3, v.2)],
    [(4, v.2), (2, v.2 + 1), (3, v.2 + 8)],
    [(0, v.2), (1, v.2 - 1), (3, v.2)],
    [(0, v.2), (1, v.2 - 8), (2, v.2)],
    [(0, v.2), (1, v.2)]] v.1

private theorem mem_neighbors_zero (x : ZMod 19) (v : Vertex) :
    v ∈ neighbors (0, x) ↔ sharpGraph.Adj (0, x) v := by
  rcases v with ⟨j, y⟩
  fin_cases j <;> simp [neighbors, sharpGraph, SharpAdj, voltageEdges, sub_eq_zero]

private theorem mem_neighbors_one (x : ZMod 19) (v : Vertex) :
    v ∈ neighbors (1, x) ↔ sharpGraph.Adj (1, x) v := by
  rcases v with ⟨j, y⟩
  fin_cases j <;>
    simp [neighbors, sharpGraph, SharpAdj, voltageEdges,
      sub_eq_iff_eq_add, add_comm, eq_comm]

private theorem mem_neighbors_two (x : ZMod 19) (v : Vertex) :
    v ∈ neighbors (2, x) ↔ sharpGraph.Adj (2, x) v := by
  rcases v with ⟨j, y⟩
  fin_cases j <;>
    simp [neighbors, sharpGraph, SharpAdj, voltageEdges,
      sub_eq_iff_eq_add, eq_sub_iff_add_eq, add_comm, eq_comm]

private theorem mem_neighbors_three (x : ZMod 19) (v : Vertex) :
    v ∈ neighbors (3, x) ↔ sharpGraph.Adj (3, x) v := by
  rcases v with ⟨j, y⟩
  fin_cases j <;>
    simp [neighbors, sharpGraph, SharpAdj, voltageEdges,
      sub_eq_iff_eq_add, eq_sub_iff_add_eq, add_comm, eq_comm]

private theorem mem_neighbors_four (x : ZMod 19) (v : Vertex) :
    v ∈ neighbors (4, x) ↔ sharpGraph.Adj (4, x) v := by
  rcases v with ⟨j, y⟩
  fin_cases j <;> simp [neighbors, sharpGraph, SharpAdj, voltageEdges, sub_eq_zero, eq_comm]

theorem mem_neighbors_iff (u v : Vertex) :
    v ∈ neighbors u ↔ sharpGraph.Adj u v := by
  rcases u with ⟨i, x⟩
  fin_cases i
  · exact mem_neighbors_zero x v
  · exact mem_neighbors_one x v
  · exact mem_neighbors_two x v
  · exact mem_neighbors_three x v
  · exact mem_neighbors_four x v

theorem adj_iff_mem_neighbors (u v : Vertex) :
    sharpGraph.Adj u v ↔ v ∈ neighbors u := (mem_neighbors_iff u v).symm

/-- Translating every sheet by the same residue is an actual graph isomorphism. -/
def sheetTranslation (s : ZMod 19) : sharpGraph ≃g sharpGraph where
  toEquiv :=
    { toFun := fun v => (v.1, v.2 + s)
      invFun := fun v => (v.1, v.2 - s)
      left_inv := by intro v; ext <;> simp
      right_inv := by intro v; ext <;> simp }
  map_rel_iff' := by
    intro u v
    change SharpAdj (u.1, u.2 + s) (v.1, v.2 + s) ↔ SharpAdj u v
    simp only [SharpAdj, add_sub_add_right_eq_sub]

@[simp]
theorem sheetTranslation_apply (s : ZMod 19) (v : Vertex) :
    sheetTranslation s v = (v.1, v.2 + s) := rfl

theorem sheetTranslation_neg_apply (b : Fin 5) (z : ZMod 19) :
    sheetTranslation (-z) (b, z) = (b, 0) := by
  simp only [sheetTranslation_apply, add_neg_cancel]

theorem card_vertices : Fintype.card Vertex = 95 := by
  norm_num [Vertex]

theorem nat_card_vertices : Nat.card Vertex = 95 := by
  simpa only [Nat.card_eq_fintype_card] using card_vertices

theorem tree_edges (z : ZMod 19) :
    sharpGraph.Adj (0, z) (4, z) ∧ sharpGraph.Adj (4, z) (1, z) ∧
      sharpGraph.Adj (0, z) (2, z) ∧ sharpGraph.Adj (0, z) (3, z) := by
  simp only [adj_iff_mem_neighbors]
  simp [neighbors]

theorem tree_reachable (b : Fin 5) (z : ZMod 19) :
    sharpGraph.Reachable (0, z) (b, z) := by
  have ht := tree_edges z
  fin_cases b
  · exact SimpleGraph.Reachable.rfl
  · exact ht.1.reachable.trans ht.2.1.reachable
  · exact ht.2.2.1.reachable
  · exact ht.2.2.2.reachable
  · exact ht.1.reachable

/-- This actual four-edge path increments the sheet by one. -/
theorem sheet_increment_reachable (z : ZMod 19) :
    sharpGraph.Reachable (0, z) (0, z + 1) := by
  have ht := tree_edges z
  have h12 : sharpGraph.Adj (1, z) (2, z + 1) := by
    rw [adj_iff_mem_neighbors]
    simp [neighbors]
  have h20 : sharpGraph.Adj (2, z + 1) (0, z + 1) :=
    (tree_edges (z + 1)).2.2.1.symm
  exact ht.1.reachable.trans
    (ht.2.1.reachable.trans (h12.reachable.trans h20.reachable))

theorem zero_sheet_reachable (z : ZMod 19) :
    sharpGraph.Reachable (0, 0) (0, z) := by
  have hnat (n : ℕ) : sharpGraph.Reachable (0, 0) (0, (n : ZMod 19)) := by
    induction n with
    | zero =>
      simp only [Nat.cast_zero]
      exact SimpleGraph.Reachable.rfl
    | succ n ih =>
      simpa only [Nat.cast_succ] using ih.trans (sheet_increment_reachable (n : ZMod 19))
  simpa only [ZMod.natCast_zmod_val] using hnat z.val

/-- The 19-sheeted example is connected, with no finite reachability premise. -/
theorem sharpGraph_connected : sharpGraph.Connected := by
  apply (SimpleGraph.connected_iff_exists_forall_reachable sharpGraph).mpr
  refine ⟨(0, 0), ?_⟩
  rintro ⟨b, z⟩
  exact (zero_sheet_reachable z).trans (tree_reachable b z)

end ErdosGyarfasSharp
