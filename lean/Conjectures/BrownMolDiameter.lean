import Conjectures.BrownMolTree
import Mathlib.Combinatorics.SimpleGraph.Diam

namespace BrownTree

open SimpleGraph

private theorem edist_center_le_two (r : ℕ) (v : Vertex r) :
    (graph r).edist v center ≤ 2 := by
  cases v with
  | none => simp [center]
  | some v =>
    rcases v with ⟨i, j⟩
    cases j with
    | none =>
      let p : (graph r).Walk (hub i) center := .cons (by simp [graph, adj, hub, center]) .nil
      have h := SimpleGraph.edist_le p
      have h1 : (graph r).edist (hub i) center ≤ 1 := by simpa [p, Walk.length] using h
      exact h1.trans (by norm_num)
    | some j =>
      let p : (graph r).Walk (leaf i j) center := .cons (v := hub i) (by simp [graph, adj, leaf, hub])
        (.cons (by simp [graph, adj, hub, center]) .nil)
      have h := SimpleGraph.edist_le p
      simpa [p, leaf, Walk.length] using h

theorem graph_diameter_four (r : ℕ) (hr : 2 ≤ r) : (graph r).diam = 4 := by
  have hupper : (graph r).ediam ≤ 4 := by
    apply SimpleGraph.ediam_le_of_edist_le
    intro u v
    calc
      (graph r).edist u v ≤ (graph r).edist u center + (graph r).edist center v :=
        SimpleGraph.edist_triangle
      _ ≤ 2 + 2 := add_le_add (edist_center_le_two r u) (by
        rw [SimpleGraph.edist_comm]; exact edist_center_le_two r v)
      _ = 4 := by norm_num
  let i : Fin r := ⟨0, by omega⟩
  let j : Fin r := ⟨1, by omega⟩
  have hij : i ≠ j := by simp [i, j, Fin.ext_iff]
  let p : (graph r).Walk (leaf i 0) (leaf j 0) :=
    .cons (v := hub i) (by simp [graph, adj, leaf, hub])
      (.cons (v := center) (by simp [graph, adj, hub, center])
        (.cons (v := hub j) (by simp [graph, adj, hub, center])
          (.cons (by simp [graph, adj, leaf, hub]) .nil)))
  have hp : p.IsPath := by
    simp [Walk.isPath_def, p, Walk.support, leaf, hub, center, hij]
  obtain ⟨q, hq, hdist⟩ := (graph_isTree r).connected.exists_path_of_dist (leaf i 0) (leaf j 0)
  have hpq : p = q := ((graph_isTree r).existsUnique_path _ _).unique hp hq
  have hdist4 : (graph r).dist (leaf i 0) (leaf j 0) = 4 := by
    rw [← hdist, ← hpq]
    rfl
  have hne : (graph r).ediam ≠ ⊤ := ne_top_of_le_ne_top (by norm_num : (4 : ℕ∞) ≠ ⊤) hupper
  have hlower := SimpleGraph.dist_le_diam (G := graph r) hne (u := leaf i 0) (v := leaf j 0)
  have hupper' : (graph r).diam ≤ 4 := by
    unfold SimpleGraph.diam
    exact_mod_cast ENat.toNat_le_toNat hupper (by norm_num : (4 : ℕ∞) ≠ ⊤)
  omega

end BrownTree
