import Conjectures.CircularIndexCirculant
import Mathlib.Combinatorics.SimpleGraph.DegreeSum
import Mathlib.Tactic.Abel
import Mathlib.Tactic.Ring

/-!
# Regularity of the circulant family

Translations are literal graph automorphisms.  Their degrees are equal;
the edge-set equivalence and the handshaking identity determine the degree.
-/

namespace CircularIndex

noncomputable instance graphDecidableAdj (g : ℕ) : DecidableRel (graph g).Adj :=
  fun _ _ => Classical.propDecidable _

theorem translate_adj_iff (g : ℕ) (x y t : ZMod (order g)) :
    (graph g).Adj (x + t) (y + t) ↔ (graph g).Adj x y := by
  constructor
  · rintro ⟨hne, s, hs, h | h⟩
    · refine ⟨fun hxy => hne (congrArg (fun z => z + t) hxy), s, hs, Or.inl ?_⟩
      apply add_right_cancel (b := t)
      calc
        y + t = (x + t) + (s : ZMod (order g)) := h
        _ = (x + (s : ZMod (order g))) + t := by abel
    · refine ⟨fun hxy => hne (congrArg (fun z => z + t) hxy), s, hs, Or.inr ?_⟩
      apply add_right_cancel (b := t)
      calc
        x + t = (y + t) + (s : ZMod (order g)) := h
        _ = (y + (s : ZMod (order g))) + t := by abel
  · rintro ⟨hne, s, hs, h | h⟩
    · refine ⟨fun hxy => hne (add_right_cancel hxy), s, hs, Or.inl ?_⟩
      rw [h]
      abel
    · refine ⟨fun hxy => hne (add_right_cancel hxy), s, hs, Or.inr ?_⟩
      rw [h]
      abel

def translationIso (g : ℕ) (t : ZMod (order g)) : graph g ≃g graph g where
  toFun x := x + t
  invFun x := x - t
  left_inv x := by change x + t - t = x; exact add_sub_cancel_right x t
  right_inv x := by change x - t + t = x; exact sub_add_cancel x t
  map_rel_iff' := by intro x y; exact translate_adj_iff g x y t

theorem degree_eq_degree_zero (g : ℕ) (x : ZMod (order g)) :
    (graph g).degree x = (graph g).degree 0 := by
  have h := Nat.card_congr ((translationIso g x).mapNeighborSet (0 : ZMod (order g)))
  change Nat.card ((graph g).neighborSet 0) = Nat.card ((graph g).neighborSet (0 + x)) at h
  simp only [zero_add] at h
  simpa only [Nat.card_eq_fintype_card, SimpleGraph.card_neighborSet_eq_degree] using h.symm

theorem circulant_regular (g : ℕ) (hg : 2 ≤ g) : (graph g).IsRegularOfDegree (4 * g) := by
  classical
  have he : (graph g).edgeFinset.card = 2 * g * order g := by
    rw [SimpleGraph.edgeFinset_card, ← Nat.card_eq_fintype_card]
    exact card_edges g hg
  have hsum := (graph g).sum_degrees_eq_twice_card_edges
  have hc : ∑ x : ZMod (order g), (graph g).degree x = order g * (graph g).degree 0 := by
    simp_rw [degree_eq_degree_zero g]
    simp [ZMod.card]
  rw [hc, he] at hsum
  have heq : order g * (graph g).degree 0 = order g * (4 * g) := by
    rw [hsum]
    ring
  have hd : (graph g).degree 0 = 4 * g :=
    Nat.eq_of_mul_eq_mul_left (by simp [order] : 0 < order g) heq
  intro x
  rw [degree_eq_degree_zero g x, hd]

theorem circulant_degree (g : ℕ) (hg : 2 ≤ g) (x : ZMod (order g)) :
    (graph g).degree x = 4 * g := circulant_regular g hg x

end CircularIndex
