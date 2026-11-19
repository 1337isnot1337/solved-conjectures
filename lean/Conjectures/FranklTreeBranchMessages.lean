module

public import Conjectures.FranklTreeUnfoldingIso
public import Conjectures.FranklTreeConfigurationMessages

/-! Actual branch messages of a biregular graph's unfolding.

Interior vertices are free to be selected or omitted and have no exterior
domination. Boundary permissions are arbitrary. The exact configuration
recurrence puts every branch message in the iterated message sets checked by
the finite cone certificates. -/
@[expose] public section

namespace FranklTreeCone

theorem iterateMessageSets_step (k : ℕ) (points generators : Set Message) (n : ℕ) :
    iterateMessageSets k points generators (n + 1) =
      (childMessageSet 2 (iterateMessageSets k points generators n).2,
        childMessageSet (k - 1) (iterateMessageSets k points generators n).1) := by
  induction n generalizing points generators with
  | zero => rfl
  | succ n ih =>
      exact ih (childMessageSet 2 generators) (childMessageSet (k - 1) points)

end FranklTreeCone

namespace FranklTreeConfigurations

open SimpleGraph FranklTreeGluing FranklTreeCone

variable {ι : Type*} {W : ι → Type*}

theorem outsideSet_branchSet (S : Set (Option (Sigma W))) (h : none ∉ S) :
    outsideSet (branchSet S) = S := by
  ext v
  cases v with
  | none => exact ⟨False.elim, h⟩
  | some v => rfl

theorem rootFreeSet_branchSet (S : Set (Option (Sigma W))) (h : none ∈ S) :
    rootFreeSet (branchSet S) = S := by
  ext v
  cases v with
  | none => exact ⟨fun _ => h, fun _ => trivial⟩
  | some v => rfl

theorem attached_mem_childMessageSet [Finite ι] [∀ i, Finite (W i)]
    (G : ∀ i, SimpleGraph (W i)) (top : ∀ i, W i)
    (outside canSelect canOmit : Set (Option (Sigma W))) (degree : ℕ) (S : Set Message)
    (hcard : Nat.card ι = degree)
    (hroot : none ∉ outside ∧ none ∈ canSelect ∧ none ∈ canOmit)
    (hchildren : ∀ i,
      realMessage (G i) (top i) (branchSet outside i) (branchSet canSelect i)
        (branchSet canOmit i) ∈ S) :
    realMessage (attachedGraph G top) none outside canSelect canOmit ∈
      childMessageSet degree S := by
  classical
  let _ : Fintype ι := Fintype.ofFinite ι
  let e : Fin degree ≃ ι :=
    (Fintype.equivFinOfCardEq (by simpa only [Nat.card_eq_fintype_card] using hcard)).symm
  let messages := List.ofFn (fun j : Fin degree =>
    realMessage (G (e j)) (top (e j)) (branchSet outside (e j))
      (branchSet canSelect (e j)) (branchSet canOmit (e j)))
  refine ⟨messages, ?_, ?_, ?_⟩
  · simp only [messages, List.length_ofFn]
  · intro message hm
    obtain ⟨j, rfl⟩ := List.mem_ofFn.mp hm
    exact hchildren (e j)
  · symm
    calc
      _ = realMessage (attachedGraph G top) none
          (outsideSet (branchSet outside)) (rootFreeSet (branchSet canSelect))
          (rootFreeSet (branchSet canOmit)) := by
            rw [outsideSet_branchSet outside hroot.1,
              rootFreeSet_branchSet canSelect hroot.2.1,
              rootFreeSet_branchSet canOmit hroot.2.2]
      _ = childrenMessage messages :=
        realMessage_attached_of_equiv G top (branchSet outside)
          (branchSet canSelect) (branchSet canOmit) e

end FranklTreeConfigurations

namespace FranklTreeUnfolding

open SimpleGraph FranklTreeGluing FranklTreeConfigurations FranklTreeCone

variable {V : Type*}

structure Biregular (G : SimpleGraph V) (points : Set V) (k : ℕ) : Prop where
  opposite : ∀ {u v}, G.Adj u v → (u ∈ points ↔ v ∉ points)
  point_card : ∀ v ∈ points, Nat.card (G.neighborSet v) = 3
  generator_card : ∀ v, v ∉ points → Nat.card (G.neighborSet v) = k

def FreeInterior (G : SimpleGraph V) (n : ℕ) (parent root : V)
    (outside canSelect canOmit : Set (Vertex G n parent root)) : Prop :=
  ∀ x, (walk G n parent root x).length < n →
    x ∉ outside ∧ x ∈ canSelect ∧ x ∈ canOmit

theorem freeInterior_root {G : SimpleGraph V} {n : ℕ} {parent root : V}
    {outside canSelect canOmit : Set (Vertex G (n + 1) parent root)}
    (h : FreeInterior G (n + 1) parent root outside canSelect canOmit) :
    none ∉ outside ∧ none ∈ canSelect ∧ none ∈ canOmit :=
  h none (by change 0 < n + 1; omega)

theorem freeInterior_child {G : SimpleGraph V} {n : ℕ} {parent root : V}
    {outside canSelect canOmit : Set (Vertex G (n + 1) parent root)}
    (h : FreeInterior G (n + 1) parent root outside canSelect canOmit)
    (child : Children G parent root) :
    FreeInterior G n root child.1 (branchSet outside child)
      (branchSet canSelect child) (branchSet canOmit child) := by
  intro x hx
  exact h (some ⟨child, x⟩) (by
    change (walk G n root child.1 x).length + 1 < n + 1
    omega)

theorem point_children_card [Finite V] {G : SimpleGraph V} {points : Set V} {k : ℕ}
    (h : Biregular G points k) {parent root : V}
    (hadj : G.Adj parent root) (hpoint : root ∈ points) :
    Nat.card (Children G parent root) = 2 := by
  have hc := parent_children_card G parent root hadj.symm
  rw [h.point_card root hpoint] at hc
  omega

theorem generator_children_card [Finite V] {G : SimpleGraph V} {points : Set V} {k : ℕ}
    (h : Biregular G points k) {parent root : V}
    (hadj : G.Adj parent root) (hgenerator : root ∉ points) :
    Nat.card (Children G parent root) = k - 1 := by
  have hc := parent_children_card G parent root hadj.symm
  rw [h.generator_card root hgenerator] at hc
  omega

theorem branch_message_mem_iterate [Finite V]
    {G : SimpleGraph V} {points : Set V} {k : ℕ} (h : Biregular G points k) :
    ∀ (n : ℕ) (parent root : V), G.Adj parent root →
      ∀ (outside canSelect canOmit : Set (Vertex G n parent root)),
        FreeInterior G n parent root outside canSelect canOmit →
        (root ∈ points →
          realMessage (graph G n parent root) (rootVertex G n parent root)
            outside canSelect canOmit ∈
          (iterateMessageSets k (rayCone boundaryRays) (rayCone boundaryRays) n).1) ∧
        (root ∉ points →
          realMessage (graph G n parent root) (rootVertex G n parent root)
            outside canSelect canOmit ∈
          (iterateMessageSets k (rayCone boundaryRays) (rayCone boundaryRays) n).2) := by
  intro n
  induction n with
  | zero =>
      intro parent root _ outside canSelect canOmit _
      constructor <;> intro _
      · exact realMessage_mem_boundary_rayCone _ _ _ _ _
      · exact realMessage_mem_boundary_rayCone _ _ _ _ _
  | succ n ih =>
      intro parent root hadj outside canSelect canOmit hfree
      have hroot := freeInterior_root hfree
      constructor
      · intro hpoint
        rw [iterateMessageSets_step]
        change realMessage
          (attachedGraph
            (fun child : Children G parent root => graph G n root child.1)
            (fun child => rootVertex G n root child.1)) none outside canSelect canOmit ∈
          childMessageSet 2
            (iterateMessageSets k (rayCone boundaryRays) (rayCone boundaryRays) n).2
        apply attached_mem_childMessageSet
          (fun child : Children G parent root => graph G n root child.1)
          (fun child => rootVertex G n root child.1)
          outside canSelect canOmit 2 _ (point_children_card h hadj hpoint) hroot
        intro child
        exact (ih root child.1 child.2.1 (branchSet outside child)
          (branchSet canSelect child) (branchSet canOmit child) (freeInterior_child hfree child)).2
            ((h.opposite child.2.1).mp hpoint)
      · intro hgenerator
        rw [iterateMessageSets_step]
        change realMessage
          (attachedGraph
            (fun child : Children G parent root => graph G n root child.1)
            (fun child => rootVertex G n root child.1)) none outside canSelect canOmit ∈
          childMessageSet (k - 1)
            (iterateMessageSets k (rayCone boundaryRays) (rayCone boundaryRays) n).1
        apply attached_mem_childMessageSet
          (fun child : Children G parent root => graph G n root child.1)
          (fun child => rootVertex G n root child.1)
          outside canSelect canOmit (k - 1) _ (generator_children_card h hadj hgenerator) hroot
        intro child
        exact (ih root child.1 child.2.1 (branchSet outside child)
          (branchSet canSelect child) (branchSet canOmit child) (freeInterior_child hfree child)).1
            ((h.opposite child.2.1.symm).mpr hgenerator)

end FranklTreeUnfolding
