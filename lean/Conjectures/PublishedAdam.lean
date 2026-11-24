import Mathlib.Combinatorics.SimpleGraph.Circulant
import Mathlib.Data.ZMod.Basic
import Mathlib.Data.Fintype.Basic

/-!
# Ádám's conjecture

Elspas and Turner, J. Combin. Theory 9 (1970), 297–307, §2, p. 299,
DOI 10.1016/S0021-9800(70)80068-0.
-/

namespace PublishedAdam

/-- A loop-free symmetric connection set in the cyclic group. -/
abbrev Valid {n : ℕ} (S : Finset (ZMod n)) : Prop :=
  0 ∉ S ∧ ∀ x : ZMod n, x ∈ S ↔ -x ∈ S

abbrev graph {n : ℕ} (S : Finset (ZMod n)) : SimpleGraph (ZMod n) :=
  SimpleGraph.circulantGraph (S : Set (ZMod n))

/-- Multiplication by a unit carries one connection set to the other. -/
def Related {n : ℕ} (S T : Finset (ZMod n)) : Prop :=
  ∃ u : (ZMod n)ˣ, T = S.image (fun x => (u : ZMod n) * x)

/-- The unrestricted undirected circulant graph isomorphism conjecture. -/
def AdamsConjecture : Prop :=
  ∀ n : ℕ, 0 < n → ∀ S T : Finset (ZMod n), Valid S → Valid T →
    (Nonempty (SimpleGraph.Iso (graph S) (graph T)) ↔ Related S T)

abbrev S : Finset (ZMod 16) := {1, 2, 7, 9, 14, 15}
abbrev T : Finset (ZMod 16) := {2, 3, 5, 11, 13, 14}

abbrev forward (x : ZMod 16) : ZMod 16 :=
  if x.val % 2 = 0 then x else x + 4

abbrev backward (x : ZMod 16) : ZMod 16 :=
  if x.val % 2 = 0 then x else x - 4

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem validS : Valid S := by decide
theorem validT : Valid T := by decide

private theorem leftInv : ∀ x : ZMod 16, backward (forward x) = x := by
  decide

private theorem rightInv : ∀ x : ZMod 16, forward (backward x) = x := by
  decide

def perm : ZMod 16 ≃ ZMod 16 where
  toFun := forward
  invFun := backward
  left_inv := leftInv
  right_inv := rightInv

theorem preservesAdj : ∀ a b : ZMod 16,
    (graph T).Adj (forward a) (forward b) ↔ (graph S).Adj a b := by
  change ∀ a b : ZMod 16,
    (forward a ≠ forward b ∧ (forward a - forward b ∈ T ∨
      forward b - forward a ∈ T)) ↔
    (a ≠ b ∧ (a - b ∈ S ∨ b - a ∈ S))
  decide

theorem isomorphic : Nonempty (SimpleGraph.Iso (graph S) (graph T)) := by
  exact ⟨{ toEquiv := perm, map_rel_iff' := by
            intro a b
            exact preservesAdj a b }⟩

/-- Stronger than needed: no multiplier, including nonunits, works. -/
theorem noMultiplier : ∀ u : ZMod 16, T ≠ S.image (fun x => u * x) := by
  decide

theorem notRelated : ¬ Related S T := by
  rintro ⟨u, hu⟩
  exact noMultiplier (u : ZMod 16) hu

theorem adams_conjecture_false : ¬ AdamsConjecture := by
  intro h
  exact notRelated ((h 16 (by decide) S T validS validT).mp isomorphic)

end PublishedAdam
