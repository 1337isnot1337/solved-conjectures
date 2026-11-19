import Conjectures.ErdosGyarfasSharpGraph
import Mathlib.Combinatorics.SimpleGraph.Paths

/-!
# The literal 32-cycle in the 95-vertex sharp example

The entries below decode the cycle in `sharpness.py` using the numbering
`19 * base + sheet`. The repeated endpoint is included in the support.
Adjacency is checked against the sparse neighbor lists and transferred
to the graph defined by the actual seven voltage edges.
-/

namespace ErdosGyarfasSharp

open SimpleGraph

/-- The 33 support entries of the literal closed walk, including its endpoint. -/
def cycle32Support : List Vertex :=
  [(0, 0), (4, 0), (1, 0), (2, 1), (0, 1), (3, 1), (1, 12), (4, 12),
    (0, 12), (3, 12), (2, 12), (1, 11), (4, 11), (0, 11), (3, 11), (1, 3),
    (4, 3), (0, 3), (3, 3), (2, 3), (1, 2), (3, 10), (2, 10), (0, 10),
    (4, 10), (1, 10), (3, 18), (2, 18), (0, 18), (4, 18), (1, 18), (2, 0), (0, 0)]

theorem cycle32Support_ne_nil : cycle32Support ≠ [] := by decide

/-- Every consecutive pair is an edge of the literal voltage graph. -/
theorem cycle32Support_chain : cycle32Support.IsChain sharpGraph.Adj := by
  have h : cycle32Support.IsChain (fun u v : Vertex => v ∈ neighbors u) := by decide
  exact List.IsChain.imp (fun u v huv => (mem_neighbors_iff u v).mp huv) h

/-- The concrete closed walk in the actual simple graph. -/
def sharpCycle32 : sharpGraph.Walk (0, 0) (0, 0) :=
  Walk.ofSupport (G := sharpGraph) cycle32Support cycle32Support_ne_nil cycle32Support_chain

theorem sharpCycle32_support : sharpCycle32.support = cycle32Support :=
  Walk.support_ofSupport (G := sharpGraph) cycle32Support_ne_nil cycle32Support_chain

theorem sharpCycle32_length : sharpCycle32.length = 32 := by
  calc
    sharpCycle32.length = cycle32Support.length - 1 :=
      Walk.length_ofSupport (G := sharpGraph) cycle32Support_ne_nil cycle32Support_chain
    _ = 32 := by decide

/-- This walk is a simple cycle, not merely a closed walk. -/
theorem sharpCycle32_isCycle : sharpCycle32.IsCycle := by
  have hnonempty : ¬ sharpCycle32.Nil :=
    Walk.not_nil_iff_lt_length.mpr
      (by simpa only [sharpCycle32_length] using (by decide : 0 < (32 : ℕ)))
  apply Walk.isCycle_iff_isPath_tail_and_le_length.mpr
  constructor
  · apply Walk.IsPath.mk'
    rw [Walk.support_tail_of_not_nil sharpCycle32 hnonempty, sharpCycle32_support]
    decide
  · simpa only [sharpCycle32_length] using (by decide : 3 ≤ (32 : ℕ))

/-- The sharp 95-vertex voltage graph contains an actual simple 32-cycle. -/
theorem sharpGraph_has_cycle32 :
    ∃ (v : Vertex) (p : sharpGraph.Walk v v), p.IsCycle ∧ p.length = 32 :=
  ⟨(0, 0), sharpCycle32, sharpCycle32_isCycle, sharpCycle32_length⟩

end ErdosGyarfasSharp
