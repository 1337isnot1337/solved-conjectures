import Mathlib.Combinatorics.SimpleGraph.Basic
import Mathlib.Algebra.Polynomial.Eval.Defs
import Mathlib.Tactic

/-! The ordered graph, its acyclic orientations, and the distinct positive
earlier-indegree statistic from Alexandersson's conjecture. -/

namespace GraphicalDist

open Polynomial

abbrev Arcs (n : ℕ) := Finset (Fin n × Fin n)

def Directed {n : ℕ} (o : Arcs n) (v w : Fin n) : Prop := (v,w) ∈ o

def Acyclic {n : ℕ} (o : Arcs n) : Prop := ∀ v, ¬Relation.TransGen (Directed o) v v

theorem acyclic_iff_rank {n : ℕ} (o : Arcs n) :
    Acyclic o ↔ ∃ rank : Fin n → ℕ, ∀ a b, Directed o a b → rank a < rank b := by
  classical
  constructor
  · intro ac
    let pred (v : Fin n) := Finset.univ.filter (fun w => Relation.TransGen (Directed o) w v)
    refine ⟨fun v => (pred v).card, ?_⟩
    intro a b edge
    apply Finset.card_lt_card
    apply Finset.ssubset_iff_subset_ne.mpr
    constructor
    · intro w hw
      exact Finset.mem_filter.mpr ⟨Finset.mem_univ _, (Finset.mem_filter.mp hw).2.tail edge⟩
    · intro eq
      have existing : a ∈ pred b := Finset.mem_filter.mpr ⟨Finset.mem_univ _, .single edge⟩
      rw [← eq] at existing
      exact ac a (Finset.mem_filter.mp existing).2
  · rintro ⟨rank,inc⟩ a cycle
    have walk {v w} (h : Relation.TransGen (Directed o) v w) : rank v < rank w := by
      induction h with
      | single edge => exact inc _ _ edge
      | tail _ edge ih => exact ih.trans (inc _ _ edge)
    exact (lt_irrefl _) (walk cycle)

def IsOrientation {n : ℕ} (G : SimpleGraph (Fin n)) (o : Arcs n) : Prop :=
  (∀ v w, G.Adj v w ↔ Directed o v w ∨ Directed o w v) ∧ Acyclic o

noncomputable def orientations {n : ℕ} (G : SimpleGraph (Fin n)) : Finset (Arcs n) := by
  classical exact Finset.univ.filter (IsOrientation G)

theorem mem_orientations {n : ℕ} (G : SimpleGraph (Fin n)) (o : Arcs n) :
    o ∈ orientations G ↔ IsOrientation G o := by classical simp [orientations]

def earlierIndegree {n : ℕ} (o : Arcs n) (v : Fin n) : ℕ :=
  (Finset.univ.filter (fun w => w < v ∧ (w,v) ∈ o)).card

def support {n : ℕ} (o : Arcs n) : Finset ℕ := (Finset.univ.image (earlierIndegree o)).erase 0

noncomputable def dist {n : ℕ} (G : SimpleGraph (Fin n)) : ℝ[X] :=
  ∑ o ∈ orientations G, X^(support o).card

theorem dist_at_one {n : ℕ} (G : SimpleGraph (Fin n)) :
    (dist G).eval 1 = (orientations G).card := by
  classical simp [dist, eval_finsetSum, eval_pow]

/-- Earlier neighbors in the specified vertex order. The two hubs are 42 and
43. The clique contains 0 and vertices 44 through 52. -/
def earlierNeighbors (v : ℕ) : Finset ℕ :=
  if v = 0 then ∅ else if v < 42 then {0}
  else if v = 42 then {0,1} ∪ Finset.Ico 2 22
  else if v = 43 then {0,1} ∪ Finset.Ico 22 42
  else insert 0 (Finset.Ico 44 (min v 53))

theorem earlierNeighbors_lt {w v : ℕ} (mem : w ∈ earlierNeighbors v) : w < v := by
  unfold earlierNeighbors at mem
  split_ifs at mem <;> simp_all <;> omega

def witnessEdges : Finset (ℕ × ℕ) :=
  (Finset.range 71).biUnion (fun v => (earlierNeighbors v).image (fun w => (w,v)))

theorem mem_witnessEdges (w v : ℕ) : (w,v) ∈ witnessEdges ↔ v < 71 ∧ w ∈ earlierNeighbors v := by
  simp [witnessEdges]

set_option maxRecDepth 5000 in
theorem witness_edges_ordered (w v : ℕ) (mem : (w,v) ∈ witnessEdges) : w < v ∧ v < 71 := by
  obtain ⟨small,h⟩ := (mem_witnessEdges w v).mp mem
  exact ⟨earlierNeighbors_lt h,small⟩

set_option maxRecDepth 5000 in
theorem witness_edge_count : witnessEdges.card = 310 := by
  unfold witnessEdges
  rw [Finset.card_biUnion]
  · have inj (v : ℕ) : Function.Injective (fun w : ℕ => (w,v)) := fun _ _ h => congrArg Prod.fst h
    simp only [Finset.card_image_of_injective _ (inj _)]
    decide
  · intro a _ b _ diff
    apply Finset.disjoint_left.mpr
    intro e ha hb
    obtain ⟨i,_,rfl⟩ := Finset.mem_image.mp ha
    obtain ⟨j,_,same⟩ := Finset.mem_image.mp hb
    exact diff (congrArg Prod.snd same).symm

def witnessGraph : SimpleGraph (Fin 71) :=
  SimpleGraph.fromRel (fun a b => (a.val,b.val) ∈ witnessEdges)

theorem witness_adjacency (v w : Fin 71) :
    witnessGraph.Adj v w ↔ v ≠ w ∧ ((v.val,w.val) ∈ witnessEdges ∨ (w.val,v.val) ∈ witnessEdges) := Iff.rfl

end GraphicalDist
