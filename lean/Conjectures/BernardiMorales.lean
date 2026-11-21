import Conjectures.BernardiMoralesTree
import Conjectures.BernardiMoralesProbability

/-!
# Bernardi–Morales delta process

Exact finite count formulations of both published conjectures, in the usual
cyclic order. The parameter `n` gives `n+2` vertices and `r` gives `r+1` colors.
The root is the last vertex. Subsets are Boolean membership functions, and
`tupleMembership` counts each vertex's memberships.

The tree theorem allows every fixed color map, including nonsurjective maps.
The stronger event theorem uses every fixed surjection. Its matrix entries
are the source interval and marked interval events, including full subsets.
-/

namespace BernardiMorales

open scoped Classical
open Finset Matrix

/-- Conjecture 27, in the stronger fixed-map form: the number of proper
subset tuples whose literal delta graph is a tree equals the number of
proper tuples with one fewer color and the same vertex memberships. -/
theorem bernardi_morales_delta (n r : ℕ)
    (f : {i : Fin (n+2) // i ≠ Fin.last (n+1)} → Fin (r+1))
    (p : Fin (n+2) →₀ ℕ) :
    ((Finset.univ : Finset (Fin (r+1) → Fin (n+2) → Bool)).filter
      (fun s => isDeltaTreeTuple (standardCyclicOrder n) (Fin.last (n+1)) f s ∧
        tupleMembership s = p)).card =
    ((Finset.univ : Finset (Fin r → Fin (n+2) → Bool)).filter
      (fun s => isProperTuple s ∧ tupleMembership s = p)).card :=
  delta_tree_membership_count (standardCyclicOrder n) (Fin.last (n+1)) f p

/-- Conjecture 28: the sum of the source event determinants over arbitrary
subset tuples of prescribed memberships is the number of proper tuples
whose first subset contains the marked set and avoids the root. -/
theorem bernardi_morales_event (n r : ℕ)
    (f : {i : Fin (n+2) // i ≠ Fin.last (n+1)} → Fin (r+1))
    (hf : Function.Surjective f) (D : Finset (Fin (n+2))) (hD : Fin.last (n+1) ∉ D)
    (p : Fin (n+2) →₀ ℕ) :
    (∑ s ∈ (Finset.univ : Finset (Fin (r+1) → Fin (n+2) → Bool)).filter
      (fun s => tupleMembership s = p),
      (sourceEventMatrix (standardCyclicOrder n) (Fin.last (n+1)) f D s :
        Matrix (Fin (n+2)) (Fin (n+2)) ℚ).det) =
    (((Finset.univ : Finset (Fin (r+1) → Fin (n+2) → Bool)).filter
      (fun s => isTargetTuple (Fin.last (n+1)) D s ∧ tupleMembership s = p)).card : ℚ) :=
  source_event_membership_count (standardCyclicOrder n) (Fin.last (n+1)) f hf D hD p

end BernardiMorales
