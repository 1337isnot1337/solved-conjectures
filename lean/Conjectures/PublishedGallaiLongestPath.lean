import Mathlib.Combinatorics.SimpleGraph.Connectivity.Connected
import Mathlib.Data.Fintype.Card
import Mathlib.Data.Fin.VecNotation
import Mathlib.Tactic.FinCases

/-!
# Gallai's longest-path conjecture

The complete disproof by the twelve-vertex graph of T. Zamfirescu,
On longest paths and circuits in graphs, Math. Scand. 38 (1976),
Theorem 8, pp. 228--229, Figure 11, DOI 10.7146/math.scand.a-11630.
The graph was independently obtained by H. Walther and H. J. Voss.
Walther's earlier 1969 example first disproved Gallai's 1966 conjecture.

The endpoint uses Mathlib's SimpleGraph.Connected, Walk, Walk.IsPath,
and Walk.support. A list-based depth-first bound is proved correct for
every simple path, then evaluated by the kernel on the published graph.
No claim of a new mathematical disproof or formalization priority is made.
-/

namespace Published.GallaiLongestPath

section Search

variable {V : Type*} [DecidableEq V]

private theorem foldMax_base (score : V → ℕ) (xs : List V) (b : ℕ) :
    b ≤ xs.foldr (fun x acc => max (score x) acc) b := by
  induction xs with
  | nil => exact le_rfl
  | cons x xs ih => exact ih.trans (le_max_right _ _)

private theorem foldMax_mem (score : V → ℕ) {xs : List V} {x : V}
    (hx : x ∈ xs) (b : ℕ) :
    score x ≤ xs.foldr (fun x acc => max (score x) acc) b := by
  induction xs with
  | nil => simp at hx
  | cons y ys ih =>
    rcases List.mem_cons.mp hx with rfl | hx
    · exact le_max_left _ _
    · exact (ih hx).trans (le_max_right _ _)

/-- Maximum number of vertices on an extension within the fuel bound.
The seen list contains the current vertex and every earlier vertex. -/
def searchBound (next : V → List V) : ℕ → List V → V → ℕ
  | 0, _, _ => 1
  | n + 1, seen, v =>
      (next v).foldr (fun w acc =>
        max (if w ∈ seen then 0 else 1 + searchBound next n (w :: seen) w) acc) 1

/-- Every duplicate-free vertex path is bounded by the search. -/
theorem length_le_searchBound (next : V → List V) (n : ℕ)
    (seen : List V) (v : V) (tail : List V)
    (hchain : (v :: tail).IsChain (fun a b => b ∈ next a))
    (hnodup : (v :: tail).Nodup)
    (havoid : ∀ w ∈ tail, w ∉ seen)
    (hfuel : tail.length ≤ n) :
    (v :: tail).length ≤ searchBound next n seen v := by
  induction n generalizing seen v tail with
  | zero =>
      have ht : tail = [] := List.length_eq_zero.mp (by omega)
      subst tail
      exact le_rfl
  | succ n ih =>
      cases tail with
      | nil =>
          exact foldMax_base _ _ _
      | cons w ws =>
          obtain ⟨hvw, hc⟩ := List.isChain_cons_cons.mp hchain
          have hn : (w :: ws).Nodup := (List.nodup_cons.mp hnodup).2
          have ha : ∀ x ∈ ws, x ∉ w :: seen := by
            intro x hx hbad
            rcases List.mem_cons.mp hbad with rfl | hseen
            · exact (List.nodup_cons.mp hn).1 hx
            · exact havoid x (List.mem_cons_of_mem _ hx) hseen
          have hf : ws.length ≤ n := by simpa using hfuel
          have hb := ih (w :: seen) w ws hc hn ha hf
          have hw : w ∉ seen := havoid w (by simp)
          have hstep := foldMax_mem
            (fun w => if w ∈ seen then 0 else 1 + searchBound next n (w :: seen) w)
            hvw 1
          simp only [if_neg hw] at hstep
          calc
            (v :: w :: ws).length = 1 + (w :: ws).length := by simp [Nat.add_comm]
            _ ≤ 1 + searchBound next n (w :: seen) w := Nat.add_le_add_left hb 1
            _ ≤ searchBound next (n + 1) seen v := hstep

end Search

/-- Labels for Figure 11: 0 is the top leaf, 1 the top branch vertex;
2,3 the next row; 4,5 the middle row; 6,7,8,9 the bottom row;
10,11 the bottom leaves. Edge crossings are not vertices. -/
def neighbors : Fin 12 → List (Fin 12) :=
  ![[1], [0,2,3], [1,4,8], [1,5,7], [2,5,6], [3,4,9],
    [4,7,10], [3,6,8], [2,7,9], [5,8,11], [6], [9]]

def graph : SimpleGraph (Fin 12) where
  Adj v w := w ∈ neighbors v
  symm := by decide
  loopless := by decide

instance : DecidableRel graph.Adj :=
  fun v w => inferInstanceAs (Decidable (w ∈ neighbors v))

/-- Connectivity is witnessed by explicit edges of a spanning tree. -/
theorem graph_connected : graph.Connected := by
  have h01 : graph.Reachable 0 1 := (show graph.Adj 0 1 from by decide).reachable
  have h02 : graph.Reachable 0 2 := h01.trans (show graph.Adj 1 2 from by decide).reachable
  have h03 : graph.Reachable 0 3 := h01.trans (show graph.Adj 1 3 from by decide).reachable
  have h04 : graph.Reachable 0 4 := h02.trans (show graph.Adj 2 4 from by decide).reachable
  have h05 : graph.Reachable 0 5 := h03.trans (show graph.Adj 3 5 from by decide).reachable
  have h06 : graph.Reachable 0 6 := h04.trans (show graph.Adj 4 6 from by decide).reachable
  have h07 : graph.Reachable 0 7 := h03.trans (show graph.Adj 3 7 from by decide).reachable
  have h08 : graph.Reachable 0 8 := h02.trans (show graph.Adj 2 8 from by decide).reachable
  have h09 : graph.Reachable 0 9 := h05.trans (show graph.Adj 5 9 from by decide).reachable
  have h010 : graph.Reachable 0 10 := h06.trans (show graph.Adj 6 10 from by decide).reachable
  have h011 : graph.Reachable 0 11 := h09.trans (show graph.Adj 9 11 from by decide).reachable
  rw [SimpleGraph.connected_iff_exists_forall_reachable]
  refine ⟨0, ?_⟩
  intro v
  fin_cases v <;> first | exact .refl | assumption

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem search_certificate : ∀ v : Fin 12, searchBound neighbors 11 [v] v ≤ 10 := by
  decide

/-- The upper bound holds for all simple vertex lists. -/
theorem list_path_bound {p : List (Fin 12)}
    (hn : p.Nodup) (hc : p.IsChain graph.Adj) : p.length ≤ 10 := by
  cases p with
  | nil => simp
  | cons v tail =>
      have hcard : (v :: tail).length ≤ 12 := by simpa using hn.length_le_card
      have hfuel : tail.length ≤ 11 := by simpa using hcard
      have ha : ∀ w ∈ tail, w ∉ [v] := by
        intro w hw hv
        have he : w = v := by simpa using hv
        subst w
        exact (List.nodup_cons.mp hn).1 hw
      exact (length_le_searchBound neighbors 11 [v] v tail hc hn ha hfuel).trans
        (search_certificate v)

/-- Mathlib counts edges, so the maximum is nine edges. -/
theorem path_length_le {u v : Fin 12} (p : graph.Walk u v) (hp : p.IsPath) :
    p.length ≤ 9 := by
  have h := list_path_bound hp.support_nodup p.isChain_adj_support
  rw [p.length_support] at h
  omega

/-- An explicit maximum-length path omitting each possible vertex. -/
def avoidingPath : Fin 12 → List (Fin 12) :=
  ![[2,1,3,5,4,6,7,8,9,11],
    [10,6,4,2,8,7,3,5,9,11],
    [0,1,3,5,4,6,7,8,9,11],
    [0,1,2,4,5,9,8,7,6,10],
    [0,1,2,8,9,5,3,7,6,10],
    [0,1,3,7,6,4,2,8,9,11],
    [0,1,2,4,5,3,7,8,9,11],
    [0,1,3,5,9,8,2,4,6,10],
    [0,1,2,4,6,7,3,5,9,11],
    [0,1,2,8,7,3,5,4,6,10],
    [0,1,2,4,5,3,7,8,9,11],
    [0,1,2,4,5,9,8,7,6,10]]

theorem avoidingPath_certificate : ∀ v : Fin 12,
    avoidingPath v ≠ [] ∧ (avoidingPath v).Nodup ∧
    (avoidingPath v).IsChain graph.Adj ∧
    (avoidingPath v).length = 10 ∧ v ∉ avoidingPath v := by
  decide

/-- Longest among every simple path, including paths with other endpoints. -/
def IsLongest {V : Type*} {G : SimpleGraph V} {u v : V} (p : G.Walk u v) : Prop :=
  p.IsPath ∧ ∀ (a b : V) (q : G.Walk a b), q.IsPath → q.length ≤ p.length

theorem longest_path_avoiding (v : Fin 12) :
    ∃ (a b : Fin 12) (p : graph.Walk a b), IsLongest p ∧ v ∉ p.support := by
  obtain ⟨hne, hn, hc, hlen, hmiss⟩ := avoidingPath_certificate v
  let p := SimpleGraph.Walk.ofSupport (avoidingPath v) hne hc
  have hs : p.support = avoidingPath v := SimpleGraph.Walk.support_ofSupport _ _
  have hl : p.length = 9 := by simp [p, hlen]
  refine ⟨_, _, p, ⟨SimpleGraph.Walk.IsPath.mk' (hs.symm ▸ hn), ?_⟩, ?_⟩
  · intro a b q hq
    rw [hl]
    exact path_length_le q hq
  · simpa [hs] using hmiss

/-- Gallai's original universal longest-path intersection conjecture. -/
def Conjecture : Prop :=
  ∀ (V : Type) [Fintype V] (G : SimpleGraph V), G.Connected →
    ∃ x : V, ∀ (a b : V) (p : G.Walk a b), IsLongest p → x ∈ p.support

/-- The complete negation, using actual Mathlib paths. -/
theorem not_conjecture : ¬ Conjecture := by
  intro h
  obtain ⟨v, hv⟩ := h (Fin 12) graph graph_connected
  obtain ⟨a, b, p, hp, hmiss⟩ := longest_path_avoiding v
  exact hmiss (hv a b p hp)

end Published.GallaiLongestPath
