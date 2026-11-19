import Conjectures.LiBasic

/-!
# Kernel-reducible component-size checker for edge cuts of `Li.T`

Everything here is plain structural recursion on `Nat` and `List` (no `Array`,
no `BEq`, no `Finset`), so `decide` reduces it in the kernel.

`rootedEdges` lists the 30 edges of `Li.T` in child order, `(u, v) =
(parOf v, v)` for `v = 1, …, 30`; edge index `idx` has child `idx + 1`.
Bit `idx` of a cut mask is set exactly when edge `idx` is removed.

`sizes mask` computes the multiset of connected-component sizes of the
spanning subgraph of `Li.T` that keeps the edges whose bit is clear, as a
decreasing `List Nat`.  The implementation is a union-find over vertex-set
bitmasks: a component is a pair `(vertex set, size)`, and a kept edge unions
the two components containing its endpoints.  This is deliberately written in
the smallest possible fragment of Lean so that the 6,842 witness rows of the
edge-cut certificate can be checked by ordinary kernel `decide`.

The packed frontier DP that was the initial draft of this file did not pass its
own sanity checks (`sizes 0 = [31]`); it has been replaced by this checker.
-/

open SimpleGraph
open Li

set_option maxRecDepth 100000

namespace LiFinal

/-! ## Edge table in child order -/

/-- The 30 edges of `Li.T` as `(parent, child)` pairs, in `parOf` order. -/
def rootedEdges : List (Fin 31 × Fin 31) :=
  [(0,1)] ++
  [(0,2),(2,3)] ++
  [(0,4),(4,5),(5,6),(6,7),(7,8),(8,9),(9,10),(10,11),(11,12),(12,13),(13,14)] ++
  [(8,15)] ++
  [(0,16),(16,17),(17,18),(18,19),(19,20),(20,21),(21,22),(22,23),(23,24),
   (24,25),(25,26),(26,27),(27,28),(28,29),(29,30)]

/-- Edges of `Li.T` in the `LiBasic` order (for the table comparison). -/
def pathEdges' : List (Nat × Nat) :=
  [(0,1)] ++
  [(0,2),(2,3)] ++
  [(0,4),(4,5),(5,6),(6,7),(7,8),(8,9),(9,10),(10,11),(11,12),(12,13),(13,14)] ++
  [(8,15)] ++
  [(0,16),(16,17),(17,18),(18,19),(19,20),(20,21),(21,22),(22,23),(23,24),
   (24,25),(25,26),(26,27),(27,28),(28,29),(29,30)]

/-- The rooted table is the `LiBasic` table. -/
theorem rootedEdges_map_eq : rootedEdges.map (fun e => (e.1.val, e.2.val)) = pathEdges' := rfl

/-- Every rooted edge is oriented from `parOf`. -/
theorem rootedEdges_parOf (e : Fin 31 × Fin 31) (he : e ∈ rootedEdges) : e.1 = parOf e.2 := by
  revert e
  decide

/-- The `i`-th edge has child `i + 1`: edge index and child index agree. -/
theorem rootedEdges_child (i : Nat) (h : i < 30) : (rootedEdges[i]'h).2.val = i + 1 := by
  revert i
  decide

/-- Every rooted edge is an edge of `Li.T`. -/
theorem rooted_adj (e : Fin 31 × Fin 31) (he : e ∈ rootedEdges) : Li.T.Adj e.1 e.2 := by
  revert e
  decide

/-- Every vertex other than the root is incident with a rooted edge. -/
theorem edge_incident (v : Fin 31) (hv : v ≠ 0) : ∃ e ∈ rootedEdges, v = e.1 ∨ v = e.2 := by
  revert v
  decide

/-! ## Components as vertex bitmasks -/

/-- The 30 edges of `Li.T` as `(parent, child)` pairs of natural numbers. -/
def edgeTable : List (Nat × Nat) :=
  [(0, 1),
   (0, 2), (2, 3),
   (0, 4), (4, 5), (5, 6), (6, 7), (7, 8), (8, 9), (9, 10), (10, 11), (11, 12), (12, 13), (13, 14),
   (8, 15),
   (0, 16), (16, 17), (17, 18), (18, 19), (19, 20), (20, 21), (21, 22), (22, 23), (23, 24),
   (24, 25), (25, 26), (26, 27), (27, 28), (28, 29), (29, 30)]

/-- `edgeTable` is the rooted table with natural-number vertices. -/
theorem edgeTable_eq : edgeTable = rootedEdges.map (fun e => (e.1.val, e.2.val)) := rfl

/-- The initial list of singleton components, one per vertex, as `(vertex set, size)`. -/
@[reducible] def compList : Nat → List (Nat × Nat)
  | 0 => []
  | n + 1 => (1 <<< n, 1) :: compList n

/-- Remove the first component whose vertex set contains the bit `b`.
Returns `((0, 0), comps)` if no component contains `b`. -/
@[reducible] def extract (b : Nat) : List (Nat × Nat) → (Nat × Nat) × List (Nat × Nat)
  | [] => ((0, 0), [])
  | (m, s) :: rest =>
      if (m &&& b) = b then ((m, s), rest)
      else
        let (r, rest') := extract b rest
        (r, (m, s) :: rest')

/-- Union the components of vertices `u` and `v`. -/
@[reducible] def addEdge (comps : List (Nat × Nat)) (u v : Nat) : List (Nat × Nat) :=
  let (cu, rest) := extract (1 <<< u) comps
  let (cv, rest') := extract (1 <<< v) rest
  (cu.1 ||| cv.1, cu.2 + cv.2) :: rest'

/-- Process edges `i, i + 1, …, i + fuel - 1`; a set bit means the edge is cut. -/
@[reducible] def processEdgesAux : Nat → Nat → Nat → List (Nat × Nat) → List (Nat × Nat)
  | 0, _, _, comps => comps
  | fuel + 1, i, mask, comps =>
      let comps :=
        if mask.testBit i then comps
        else
          let (u, v) := edgeTable.getD i (0, 0)
          addEdge comps u v
      processEdgesAux fuel (i + 1) mask comps

/-- Process all 30 edges in increasing index order. -/
@[reducible] def processEdges (mask : Nat) : List (Nat × Nat) :=
  processEdgesAux 30 0 mask (compList 31)

/-- Insert `x` into a decreasing list. -/
@[reducible] def insertDesc (x : Nat) : List Nat → List Nat
  | [] => [x]
  | y :: ys => if x ≥ y then x :: y :: ys else y :: insertDesc x ys

/-- Sort a list of natural numbers in decreasing order. -/
@[reducible] def sortDesc : List Nat → List Nat
  | [] => []
  | x :: xs => insertDesc x (sortDesc xs)

/-- The connected-component sizes of the spanning subgraph of `Li.T` obtained
by deleting the edges whose bits are set in `mask`, in decreasing order. -/
@[reducible] def sizes (mask : Nat) : List Nat :=
  sortDesc ((processEdges mask).map (fun p => p.2))

/-! ## Certificate rows -/

/-- A certificate row: a partition (decreasing, positive parts) and a cut mask. -/
abbrev Row := List Nat × Nat

/-- One row is correct when the checker's component sizes equal its partition. -/
@[reducible] def rowOk (r : Row) : Bool :=
  decide (sizes r.2 = r.1)

/-- All rows of a chunk are correct. -/
@[reducible] def chunkOk (rows : List Row) : Bool :=
  rows.all rowOk

theorem rowOk_eq_true {r : Row} : rowOk r = true ↔ sizes r.2 = r.1 := by
  simp [rowOk]

/-- A checked chunk yields a witness mask for every partition occurring in it. -/
theorem chunkOk_sound {rows : List Row} (h : chunkOk rows = true) :
    ∀ r ∈ rows, sizes r.2 = r.1 := by
  unfold chunkOk at h
  intro r hr
  exact rowOk_eq_true.mp ((List.all_eq_true.mp h) r hr)

/-- Sanity check: no cut edges means one component. -/
example : sizes 0 = [31] := by decide

/-- Sanity check: one pendant edge cut. -/
example : sizes 1 = [30, 1] := by decide

/-- Sanity check: cutting the edge `(0,2)` gives a component of size two. -/
example : sizes 2 = [29, 2] := by decide

/-- Sanity check: cutting the two edges incident with the leaf `1` and the leaf `2`. -/
example : sizes 5 = [29, 1, 1] := by decide

end LiFinal
