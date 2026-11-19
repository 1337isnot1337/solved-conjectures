module

public import Conjectures.FranklTreeBranchMessages

/-! A root occupation inequality applied to actual configuration counts.

This module proves the exact ratio bridge and the three-child root message
membership. Its numerical bound is an explicit input; the finite checked
small-degree certificates provide that input in the final graph theorem. -/
@[expose] public section

namespace FranklTreeCone

theorem childrenMessage_three_zero (x y z : Message) :
    childrenMessage [x, y, z] 0 = rootOccupiedCount x y z := by
  simp [childrenMessage, returnMap, rootOccupiedCount, mul_assoc]

theorem childrenMessage_three_one (x y z : Message) :
    childrenMessage [x, y, z] 1 = rootUnoccupiedCount x y z := by
  simp [childrenMessage, returnMap, rootUnoccupiedCount, mul_assoc]

theorem list_of_length_three (l : List Message) (h : l.length = 3) :
    ∃ x y z, l = [x, y, z] := by
  cases l with
  | nil => simp at h
  | cons x xs =>
      cases xs with
      | nil => simp at h
      | cons y ys =>
          cases ys with
          | nil => simp at h
          | cons z zs =>
              have hz : zs.length = 0 := by
                simp only [List.length_cons] at h
                omega
              have he := List.length_eq_zero_iff.mp hz
              subst zs
              exact ⟨x, y, z, rfl⟩

end FranklTreeCone

namespace FranklTreeConfigurations

open SimpleGraph FranklTreeGluing FranklTreeCone

variable {W : Type*} [Finite W]

theorem configuration_ratio_of_three (G : SimpleGraph W) (root : W)
    (outside canSelect canOmit : Set W) (x y z : Message)
    (h : realMessage G root outside canSelect canOmit = childrenMessage [x, y, z]) :
    (Nat.card (Occupied G root outside canSelect canOmit) : ℝ) /
      (Nat.card (Finished G root outside canSelect canOmit) : ℝ) =
    rootOccupiedCount x y z / (rootOccupiedCount x y z + rootUnoccupiedCount x y z) := by
  have ho : (Nat.card (Occupied G root outside canSelect canOmit) : ℝ) =
      rootOccupiedCount x y z := by
    simpa only [realMessage_zero, childrenMessage_three_zero] using
      congrArg (fun m : Message => m 0) h
  have ht := finished_card_real G root outside canSelect canOmit
  rw [h, childrenMessage_three_zero, childrenMessage_three_one] at ht
  rw [ho, ht]

theorem configuration_bound_of_childMessageSet (G : SimpleGraph W) (root : W)
    (outside canSelect canOmit : Set W) (S : Set Message) (bound : ℝ)
    (hm : realMessage G root outside canSelect canOmit ∈ childMessageSet 3 S)
    (hpos : 0 < Nat.card (Finished G root outside canSelect canOmit))
    (hbound : ∀ x ∈ S, ∀ y ∈ S, ∀ z ∈ S,
      0 < rootOccupiedCount x y z + rootUnoccupiedCount x y z →
      rootOccupiedCount x y z / (rootOccupiedCount x y z + rootUnoccupiedCount x y z) ≤ bound) :
    (Nat.card (Occupied G root outside canSelect canOmit) : ℝ) /
      (Nat.card (Finished G root outside canSelect canOmit) : ℝ) ≤ bound := by
  obtain ⟨l, hlen, hmem, heq⟩ := hm
  obtain ⟨x, y, z, rfl⟩ := list_of_length_three l hlen
  rw [configuration_ratio_of_three G root outside canSelect canOmit x y z heq.symm]
  apply hbound x (hmem x (by simp)) y (hmem y (by simp)) z (hmem z (by simp))
  have ht := finished_card_real G root outside canSelect canOmit
  rw [← heq, childrenMessage_three_zero, childrenMessage_three_one] at ht
  rw [← ht]
  exact Nat.cast_pos.mpr hpos

end FranklTreeConfigurations

namespace FranklTreeUnfolding

open SimpleGraph FranklTreeGluing FranklTreeConfigurations FranklTreeCone

variable {V : Type*} [Finite V] {G : SimpleGraph V} {points : Set V} {k : ℕ}

theorem unfolding_root_message_mem (h : Biregular G points k)
    (root : V) (hpoint : root ∈ points)
    (outside canSelect canOmit : Set (Vertex G 7 root root))
    (hfree : FreeInterior G 7 root root outside canSelect canOmit) :
    realMessage (graph G 7 root root) (rootVertex G 7 root root)
      outside canSelect canOmit ∈
    childMessageSet 3 (iterateMessageSets k (rayCone boundaryRays) (rayCone boundaryRays) 6).2 := by
  have hc : Nat.card (Children G root root) = 3 :=
    (root_children_card G root).trans (h.point_card root hpoint)
  change realMessage
    (attachedGraph (fun child : Children G root root => graph G 6 root child.1)
      (fun child => rootVertex G 6 root child.1)) none outside canSelect canOmit ∈ _
  apply attached_mem_childMessageSet
    (fun child : Children G root root => graph G 6 root child.1)
    (fun child => rootVertex G 6 root child.1)
    outside canSelect canOmit 3 _ hc (freeInterior_root hfree)
  intro child
  exact (branch_message_mem_iterate h 6 root child.1 child.2.1
    (branchSet outside child) (branchSet canSelect child) (branchSet canOmit child)
    (freeInterior_child hfree child)).2 ((h.opposite child.2.1).mp hpoint)

theorem unfolding_occupation_bound (h : Biregular G points k)
    (root : V) (hpoint : root ∈ points)
    (outside canSelect canOmit : Set (Vertex G 7 root root))
    (hfree : FreeInterior G 7 root root outside canSelect canOmit)
    (hpos : 0 < Nat.card (Finished (graph G 7 root root) (rootVertex G 7 root root)
      outside canSelect canOmit)) (bound : ℝ)
    (hbound : ∀ x ∈ (iterateMessageSets k (rayCone boundaryRays) (rayCone boundaryRays) 6).2,
      ∀ y ∈ (iterateMessageSets k (rayCone boundaryRays) (rayCone boundaryRays) 6).2,
      ∀ z ∈ (iterateMessageSets k (rayCone boundaryRays) (rayCone boundaryRays) 6).2,
      0 < rootOccupiedCount x y z + rootUnoccupiedCount x y z →
      rootOccupiedCount x y z / (rootOccupiedCount x y z + rootUnoccupiedCount x y z) ≤ bound) :
    (Nat.card (Occupied (graph G 7 root root) (rootVertex G 7 root root)
      outside canSelect canOmit) : ℝ) /
    (Nat.card (Finished (graph G 7 root root) (rootVertex G 7 root root)
      outside canSelect canOmit) : ℝ) ≤ bound :=
  configuration_bound_of_childMessageSet _ _ _ _ _ _ bound
    (unfolding_root_message_mem h root hpoint outside canSelect canOmit hfree) hpos hbound

end FranklTreeUnfolding
