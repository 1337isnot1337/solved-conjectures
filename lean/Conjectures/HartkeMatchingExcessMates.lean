import Conjectures.HartkeMatchingExcessSplit
import Mathlib.GroupTheory.Perm.Basic

/-!
# Hartke–Stolee–West–Yancey's matching-excess conjecture

The mate involution of an actual spanning perfect matching, and the converse
construction. These interfaces support changes of vertex set, alternating
switches and the two-vertex extension used for the extremal constants.
-/

namespace HartkeMatchingExcess

open SimpleGraph

variable {V : Type*} {G : SimpleGraph V}

noncomputable def mate (M : PerfectMatching G) (v : V) : V :=
  ((Subgraph.isPerfectMatching_iff.mp M.property) v).choose

theorem mate_adj (M : PerfectMatching G) (v : V) : M.val.Adj v (mate M v) :=
  ((Subgraph.isPerfectMatching_iff.mp M.property) v).choose_spec.1

theorem mate_eq_of_adj (M : PerfectMatching G) {v w : V} (h : M.val.Adj v w) :
    mate M v = w :=
  M.property.1.eq_of_adj_left (mate_adj M v) h

theorem mate_involutive (M : PerfectMatching G) : Function.Involutive (mate M) := by
  intro v
  exact mate_eq_of_adj M (mate_adj M v).symm

theorem mate_ne (M : PerfectMatching G) (v : V) : mate M v ≠ v := by
  intro he
  have h := mate_adj M v
  rw [he] at h
  exact M.val.loopless.irrefl v h

theorem mate_graph_adj (M : PerfectMatching G) (v : V) : G.Adj v (mate M v) :=
  M.val.adj_sub (mate_adj M v)

theorem matching_adj_iff_mate (M : PerfectMatching G) (v w : V) :
    M.val.Adj v w ↔ mate M v = w := by
  constructor
  · exact mate_eq_of_adj M
  · intro h
    rw [← h]
    exact mate_adj M v

noncomputable def matePerm (M : PerfectMatching G) : Equiv.Perm V :=
  { toFun := mate M
    invFun := mate M
    left_inv := mate_involutive M
    right_inv := mate_involutive M }

theorem mate_injective (M : PerfectMatching G) : Function.Injective (mate M) :=
  (mate_involutive M).injective

theorem mate_eq_iff (M : PerfectMatching G) {v w : V} :
    mate M v = w ↔ v = mate M w := by
  constructor
  · intro h
    have he := congrArg (mate M) h
    rw [mate_involutive M v] at he
    exact he
  · intro h
    rw [h, mate_involutive]

def matchingOfInvolution (f : V → V) (hi : Function.Involutive f)
    (ha : ∀ v, G.Adj v (f v)) : G.Subgraph where
  verts := Set.univ
  Adj v w := f v = w
  adj_sub := by intro v w h; rw [← h]; exact ha v
  edge_vert := by intro v w _; exact Set.mem_univ v
  symm := ⟨by
    intro v w h
    rw [← h, hi]⟩

theorem matchingOfInvolution_perfect (f : V → V) (hi : Function.Involutive f)
    (ha : ∀ v, G.Adj v (f v)) : (matchingOfInvolution f hi ha).IsPerfectMatching := by
  rw [Subgraph.isPerfectMatching_iff]
  intro v
  exact ⟨f v, rfl, fun w h => Eq.symm h⟩

def perfectMatchingOfInvolution (f : V → V) (hi : Function.Involutive f)
    (ha : ∀ v, G.Adj v (f v)) : PerfectMatching G :=
  ⟨matchingOfInvolution f hi ha, matchingOfInvolution_perfect f hi ha⟩

theorem mate_perfectMatchingOfInvolution (f : V → V) (hi : Function.Involutive f)
    (ha : ∀ v, G.Adj v (f v)) (v : V) :
    mate (perfectMatchingOfInvolution f hi ha) v = f v :=
  mate_eq_of_adj _ rfl

theorem perfectMatching_ext {M N : PerfectMatching G}
    (h : ∀ v, mate M v = mate N v) : M = N := by
  apply Subtype.ext
  apply Subgraph.ext
  · ext v
    exact ⟨fun _ => N.property.2 v, fun _ => M.property.2 v⟩
  · funext v w
    apply propext
    rw [matching_adj_iff_mate, matching_adj_iff_mate, h]

end HartkeMatchingExcess
