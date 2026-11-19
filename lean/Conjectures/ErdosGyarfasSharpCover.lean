import Conjectures.ErdosGyarfasSharpGraph
import Mathlib.Algebra.Torsor.Defs
import Mathlib.Combinatorics.SimpleGraph.Maps
import Mathlib.GroupTheory.SpecificGroups.Cyclic

/-!
# The intrinsic cyclic covering structure of the sharp graph

The projection to the subdivided tetrahedron is a graph homomorphism and
induces a bijection on every actual neighbor set. Each fiber is a torsor for
`ZMod 19`, and its action is the restriction of the graph isomorphisms
`sheetTranslation`. These properties identify the literal graph as a regular
cyclic cover with nineteen sheets without importing a general cover theorem.
-/

namespace ErdosGyarfasSharp

/-- The oriented edges of the tetrahedron with its `0--1` edge subdivided. -/
def baseEdges : List (Fin 5 × Fin 5) :=
  [(0, 4), (4, 1), (0, 2), (0, 3), (1, 2), (1, 3), (2, 3)]

/-- The exact five-vertex base graph from the manuscript. -/
def baseGraph : SimpleGraph (Fin 5) where
  Adj i j := (i, j) ∈ baseEdges ∨ (j, i) ∈ baseEdges
  symm := ⟨fun _ _ h => h.symm⟩
  loopless := ⟨by decide⟩

instance sharpBaseGraphDecidableAdj : DecidableRel baseGraph.Adj := fun _ _ =>
  inferInstanceAs (Decidable (_ ∨ _))

/-- The normalized signed voltage of each oriented base edge. -/
def baseVoltage (i j : Fin 5) : ZMod 19 :=
  if (i, j) = (1, 2) then 1
  else if (i, j) = (2, 1) then -1
  else if (i, j) = (1, 3) then 8
  else if (i, j) = (3, 1) then -8
  else 0

private theorem voltageEdges_iff : ∀ (i j : Fin 5) (a : ZMod 19),
    ((i, j), a) ∈ voltageEdges ↔ (i, j) ∈ baseEdges ∧ a = baseVoltage i j := by
  decide

private theorem baseVoltage_reverse : ∀ i j : Fin 5,
    baseVoltage j i = -baseVoltage i j := by
  decide

/-- Adjacency in the actual sharp graph is exactly the signed-voltage lifting
rule over the displayed base graph. -/
theorem sharpGraph_adj_iff_base (u v : Vertex) :
    sharpGraph.Adj u v ↔
      baseGraph.Adj u.1 v.1 ∧ v.2 = u.2 + baseVoltage u.1 v.1 := by
  change (((u.1, v.1), v.2 - u.2) ∈ voltageEdges ∨
      ((v.1, u.1), u.2 - v.2) ∈ voltageEdges) ↔
    ((u.1, v.1) ∈ baseEdges ∨ (v.1, u.1) ∈ baseEdges) ∧
      v.2 = u.2 + baseVoltage u.1 v.1
  simp only [voltageEdges_iff]
  rw [baseVoltage_reverse u.1 v.1]
  have hreverse : u.2 - v.2 = -baseVoltage u.1 v.1 ↔
      v.2 - u.2 = baseVoltage u.1 v.1 := by
    constructor
    · intro h
      simpa only [neg_sub, neg_neg] using congrArg Neg.neg h
    · intro h
      simpa only [neg_sub] using congrArg Neg.neg h
  rw [hreverse]
  simp only [← or_and_right, sub_eq_iff_eq_add']

/-- The actual map which forgets the sheet coordinate. -/
def baseProjection : sharpGraph →g baseGraph where
  toFun := Prod.fst
  map_rel' := by
    intro u v h
    exact ((sharpGraph_adj_iff_base u v).mp h).1

@[simp]
theorem baseProjection_apply (u : Vertex) : baseProjection u = u.1 := rfl

/-- On neighbors, the projection has the explicit voltage lift as its inverse. -/
def baseNeighborEquiv (u : Vertex) :
    sharpGraph.neighborSet u ≃ baseGraph.neighborSet (baseProjection u) where
  toFun := baseProjection.mapNeighborSet u
  invFun b :=
    ⟨(b.val, u.2 + baseVoltage u.1 b.val),
      (sharpGraph_adj_iff_base _ _).mpr ⟨b.property, rfl⟩⟩
  left_inv v := by
    apply Subtype.ext
    apply Prod.ext
    · rfl
    · exact ((sharpGraph_adj_iff_base u v.val).mp v.property).2.symm
  right_inv b := by
    apply Subtype.ext
    rfl

/-- The projection is a covering map in the intrinsic graph sense: it is
bijective on every neighbor set. -/
theorem baseProjection_neighbor_bijective (u : Vertex) :
    Function.Bijective (baseProjection.mapNeighborSet u) :=
  (baseNeighborEquiv u).bijective

/-- The actual fiber of the base projection. -/
abbrev projectionFiber (b : Fin 5) := {u : Vertex // baseProjection u = b}

/-- The sheet coordinate parametrizes each projection fiber. -/
def projectionFiberEquiv (b : Fin 5) : projectionFiber b ≃ ZMod 19 where
  toFun u := u.val.2
  invFun z := ⟨(b, z), rfl⟩
  left_inv u := by
    apply Subtype.ext
    exact Prod.ext u.property.symm rfl
  right_inv _ := rfl

/-- Every projection fiber has exactly nineteen vertices. -/
theorem projectionFiber_card (b : Fin 5) : Nat.card (projectionFiber b) = 19 :=
  (Nat.card_congr (projectionFiberEquiv b)).trans (Nat.card_zmod 19)

/-- The usual free and transitive sheet action, on the actual projection fiber. -/
instance projectionFiberAddTorsor (b : Fin 5) :
    AddTorsor (ZMod 19) (projectionFiber b) where
  vadd s u := ⟨(u.val.1, s + u.val.2), u.property⟩
  zero_vadd u := by
    apply Subtype.ext
    apply Prod.ext
    · rfl
    · exact zero_add _
  add_vadd s t u := by
    apply Subtype.ext
    apply Prod.ext
    · rfl
    · exact add_assoc s t u.val.2
  vsub u v := u.val.2 - v.val.2
  nonempty := ⟨⟨(b, 0), rfl⟩⟩
  vsub_vadd' u v := by
    apply Subtype.ext
    apply Prod.ext
    · exact v.property.trans u.property.symm
    · exact sub_add_cancel _ _
  vadd_vsub' s u := add_sub_cancel_right s u.val.2

/-- The torsor action is the restriction of an actual graph isomorphism. -/
theorem projectionFiber_vadd_coe (b : Fin 5) (s : ZMod 19)
    (u : projectionFiber b) :
    ((s +ᵥ u : projectionFiber b) : Vertex) = sheetTranslation s (u : Vertex) := by
  apply Prod.ext
  · rfl
  · exact add_comm s u.val.2

/-- On each fiber, exactly one sheet translation sends one given vertex to
another. Thus these graph automorphisms act freely and transitively. -/
theorem projectionFiber_unique_sheetTranslation (b : Fin 5)
    (u v : projectionFiber b) :
    ∃! s : ZMod 19, sheetTranslation s (u : Vertex) = (v : Vertex) := by
  refine ⟨v -ᵥ u, ?_, ?_⟩
  · change sheetTranslation (v -ᵥ u) (u : Vertex) = (v : Vertex)
    rw [← projectionFiber_vadd_coe b (v -ᵥ u) u, vsub_vadd]
  · intro s hs
    have h : s +ᵥ u = v := by
      apply Subtype.ext
      simpa only [projectionFiber_vadd_coe] using hs
    have hsub := congrArg (fun w : projectionFiber b => w -ᵥ u) h
    simpa only [vadd_vsub] using hsub

/-- Intrinsic covering and cyclic regularity properties of the literal graph.
The action in these fields is the standard torsor instance above. -/
structure SharpCyclic19Cover : Prop where
  locally_bijective : ∀ u : Vertex,
    Function.Bijective (baseProjection.mapNeighborSet u)
  cyclic : IsAddCyclic (ZMod 19)
  deck_card : Nat.card (ZMod 19) = 19
  fiber_card : ∀ b : Fin 5, Nat.card (projectionFiber b) = 19
  action_is_translation : ∀ (b : Fin 5) (s : ZMod 19) (u : projectionFiber b),
    ((s +ᵥ u : projectionFiber b) : Vertex) = sheetTranslation s (u : Vertex)
  unique_translation : ∀ (b : Fin 5) (u v : projectionFiber b),
    ∃! s : ZMod 19, sheetTranslation s (u : Vertex) = (v : Vertex)

/-- The sharp graph is a regular cyclic nineteen-sheeted cover of the exact
subdivided tetrahedron. -/
theorem sharpGraph_cyclic19_cover : SharpCyclic19Cover :=
  ⟨baseProjection_neighbor_bijective, inferInstance, Nat.card_zmod 19,
    projectionFiber_card, projectionFiber_vadd_coe, projectionFiber_unique_sheetTranslation⟩

end ErdosGyarfasSharp
