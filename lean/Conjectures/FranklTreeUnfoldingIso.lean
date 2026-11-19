module

public import Conjectures.FranklTreeUnfolding

/-! Adjacency is preserved by the finite-depth unfolding endpoint map.
Together with the endpoint bijection this is an isomorphism of the actual
induced graph ball with the recursively attached branch graph. -/
@[expose] public section

namespace FranklTreeUnfolding

open SimpleGraph FranklTreeBall FranklTreeGluing

variable {V : Type*} {G : SimpleGraph V}

theorem adjacent_root_child_iff (hg : NoShortCycle G 16) (n : ℕ)
    (hlen : n + 1 ≤ 7) (parent root : V) (child : Children G parent root)
    (x : Vertex G n root child.1) :
    G.Adj root (endpoint G n root child.1 x) ↔ x = rootVertex G n root child.1 := by
  constructor
  · intro hadj
    have hp := walk_isPath hg (n + 1) hlen parent root (some ⟨child, x⟩)
    have hw := short_paths_unique hg hp (Walk.IsPath.of_adj hadj) (by
      have hl := walk_length_le G (n + 1) parent root (some ⟨child, x⟩)
      change (walk G (n + 1) parent root (some ⟨child, x⟩)).length + 1 < 16
      omega)
    have hf : child.1 = endpoint G n root child.1 x := by
      simpa only [walk, endpoint, SimpleGraph.Adj.toWalk, Walk.snd_cons] using congrArg Walk.snd hw
    apply endpoint_injective hg n (by omega) root child.1
    exact hf.symm.trans (endpoint_rootVertex G n root child.1).symm
  · intro hx
    rw [hx, endpoint_rootVertex]
    exact child.2.1

theorem adjacent_children_same (hg : NoShortCycle G 16) (n : ℕ)
    (hlen : n + 1 ≤ 7) (parent root : V)
    (child other : Children G parent root)
    (x : Vertex G n root child.1) (y : Vertex G n root other.1)
    (hadj : G.Adj (endpoint G n root child.1 x) (endpoint G n root other.1 y)) :
    child = other := by
  let p := walk G (n + 1) parent root (some ⟨child, x⟩)
  let q := walk G (n + 1) parent root (some ⟨other, y⟩)
  rcases short_paths_edge hg p q
    (walk_isPath hg (n + 1) hlen parent root (some ⟨child, x⟩))
    (walk_isPath hg (n + 1) hlen parent root (some ⟨other, y⟩))
    ((walk_length_le G (n + 1) parent root (some ⟨child, x⟩)).trans hlen)
    ((walk_length_le G (n + 1) parent root (some ⟨other, y⟩)).trans hlen)
    hadj with he | he
  · apply Subtype.ext
    simpa only [p, q, walk, endpoint, Walk.concat_cons, Walk.snd_cons] using congrArg Walk.snd he
  · apply Subtype.ext
    have h : other.1 = child.1 := by
      simpa only [p, q, walk, endpoint, Walk.concat_cons, Walk.snd_cons] using congrArg Walk.snd he
    exact h.symm

theorem graph_adj_iff_endpoints (hg : NoShortCycle G 16) :
    ∀ (n : ℕ) (hlen : n ≤ 7) (parent root : V) (x y : Vertex G n parent root),
      (graph G n parent root).Adj x y ↔
        G.Adj (endpoint G n parent root x) (endpoint G n parent root y) := by
  intro n
  induction n with
  | zero =>
      intro _ parent root x y
      change False ↔ G.Adj root root
      exact ⟨False.elim, fun h => h.ne rfl⟩
  | succ n ih =>
      intro hlen parent root x y
      cases x with
      | none =>
          cases y with
          | none =>
              change False ↔ G.Adj root root
              exact ⟨False.elim, fun h => h.ne rfl⟩
          | some y =>
              rcases y with ⟨child, y⟩
              change y = rootVertex G n root child.1 ↔
                G.Adj root (endpoint G n root child.1 y)
              exact (adjacent_root_child_iff hg n hlen parent root child y).symm
      | some x =>
          rcases x with ⟨child, x⟩
          cases y with
          | none =>
              change x = rootVertex G n root child.1 ↔
                G.Adj (endpoint G n root child.1 x) root
              constructor
              · intro h
                exact ((adjacent_root_child_iff hg n hlen parent root child x).mpr h).symm
              · intro h
                exact (adjacent_root_child_iff hg n hlen parent root child x).mp h.symm
          | some y =>
              rcases y with ⟨other, y⟩
              constructor
              · rintro ⟨i, a, b, rfl, rfl, h⟩
                exact (ih (by omega) root i.1 a b).mp h
              · intro h
                have hc := adjacent_children_same hg n hlen parent root child other x y h
                cases hc
                exact ⟨child, x, y, rfl, rfl, (ih (by omega) root child.1 x y).mpr h⟩

noncomputable def ballIso (hg : NoShortCycle G 16) (n : ℕ)
    (hlen : n ≤ 7) (root : V) :
    graph G n root root ≃g G.induce (pathBall G root n) where
  toEquiv := ballEquiv hg n hlen root
  map_rel_iff' := by
    intro x y
    change G.Adj (endpoint G n root root x) (endpoint G n root root y) ↔
      (graph G n root root).Adj x y
    exact (graph_adj_iff_endpoints hg n hlen root root x y).symm

theorem ballIso_root (hg : NoShortCycle G 16) (n : ℕ)
    (hlen : n ≤ 7) (root : V) :
    ballIso hg n hlen root (rootVertex G n root root) =
      ⟨root, root_mem_pathBall G root n⟩ := by
  apply Subtype.ext
  exact endpoint_rootVertex G n root root

def rootChildrenEquivNeighbors (G : SimpleGraph V) (root : V) :
    Children G root root ≃ G.neighborSet root where
  toFun v := ⟨v.1, v.2.1⟩
  invFun v := ⟨v.1, v.2, v.2.ne.symm⟩
  left_inv _ := rfl
  right_inv _ := rfl

noncomputable def parentChildrenEquivNeighbors (G : SimpleGraph V)
    (parent root : V) (hadj : G.Adj root parent) :
    Option (Children G parent root) ≃ G.neighborSet root := by
  classical
  refine {
    toFun := fun v => match v with
      | none => ⟨parent, hadj⟩
      | some v => ⟨v.1, v.2.1⟩
    invFun := fun v => if h : v.1 = parent then none else some ⟨v.1, v.2, h⟩
    left_inv := ?_
    right_inv := ?_
  }
  · intro v
    cases v with
    | none =>
        dsimp
        split
        · rfl
        · rename_i h
          exact False.elim (h rfl)
    | some v =>
        dsimp
        split
        · rename_i h
          exact False.elim (v.2.2 h)
        · rfl
  · intro v
    dsimp
    split
    · rename_i h
      apply Subtype.ext
      exact h.symm
    · rfl

theorem root_children_card (G : SimpleGraph V) (root : V) :
    Nat.card (Children G root root) = Nat.card (G.neighborSet root) :=
  Nat.card_congr (rootChildrenEquivNeighbors G root)

theorem parent_children_card [Finite V] (G : SimpleGraph V)
    (parent root : V) (hadj : G.Adj root parent) :
    Nat.card (Children G parent root) + 1 = Nat.card (G.neighborSet root) := by
  classical
  letI : Fintype (Children G parent root) := Fintype.ofFinite _
  letI : Fintype (G.neighborSet root) := Fintype.ofFinite _
  have h := Nat.card_congr (parentChildrenEquivNeighbors G parent root hadj)
  simpa only [Nat.card_eq_fintype_card, Fintype.card_option] using h


theorem endpoint_mem_pathBall_iff (hg : NoShortCycle G 16)
    (n : ℕ) (hn : n ≤ 7) (parent root : V) (x : Vertex G n parent root)
    (radius : ℕ) (hr : radius ≤ 7) :
    endpoint G n parent root x ∈ pathBall G root radius ↔
      (walk G n parent root x).length ≤ radius := by
  constructor
  · rintro ⟨p, hp, hpLength⟩
    have heq := short_paths_unique hg hp (walk_isPath hg n hn parent root x) (by
      have hwalk := walk_length_le G n parent root x
      omega)
    have hlen := congrArg Walk.length heq
    omega
  · intro hlen
    exact ⟨walk G n parent root x, walk_isPath hg n hn parent root x, hlen⟩

theorem boundary_layer_iff (hg : NoShortCycle G 16) (root : V)
    (x : Vertex G 7 root root) :
    endpoint G 7 root root x ∈ pathBall G root 7 \ pathBall G root 6 ↔
      (walk G 7 root root x).length = 7 := by
  have h7 := walk_length_le G 7 root root x
  constructor
  · intro hx
    have hnot : ¬(walk G 7 root root x).length ≤ 6 := fun h =>
      hx.2 ((endpoint_mem_pathBall_iff hg 7 (by omega) root root x 6 (by omega)).mpr h)
    omega
  · intro h
    refine ⟨⟨walk G 7 root root x, walk_isPath hg 7 (by omega) root root x, h7⟩, ?_⟩
    intro h6
    have hle := (endpoint_mem_pathBall_iff hg 7 (by omega) root root x 6 (by omega)).mp h6
    omega

end FranklTreeUnfolding
