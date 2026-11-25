module

public import Mathlib.Combinatorics.SimpleGraph.Diam
public import Mathlib.Data.Finset.Card
public import Mathlib.Tactic

@[expose] public section
namespace XuZhou
open Finset

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- The graph obtained by adding every edge inside a layer and between
consecutive layers. -/
def layerCliqueGraph {d : ℕ} (layer : V→Fin d) : SimpleGraph V where
  Adj i j := i≠j ∧ (layer i).val ≤ (layer j).val+1 ∧ (layer j).val ≤ (layer i).val+1
  symm.symm := by
    rintro i j ⟨hn,h1,h2⟩
    exact ⟨hn.symm,h2,h1⟩
  loopless.irrefl := by
    intro i h
    exact h.1 rfl

instance {d : ℕ} (layer : V→Fin d) : DecidableRel (layerCliqueGraph layer).Adj :=
  fun _ _ => inferInstanceAs (Decidable (_ ∧ _ ∧ _))

omit [Fintype V] [DecidableEq V] in
theorem distance_levels_on_walk (G : SimpleGraph V) (root : V) {x y : V}
    (w : G.Walk x y) (k : ℕ) (hx : G.dist root x ≤ k) (hy : k ≤ G.dist root y) :
    ∃ z, G.dist root z = k := by
  induction w with
  | nil => exact ⟨_,le_antisymm hx hy⟩
  | @cons u v w adj walk ih =>
    by_cases hv : G.dist root v ≤ k
    · exact ih hv hy
    · have hd := adj.diff_dist_adj (u:=root)
      rcases hd with h | h | h
      · omega
      · exact ⟨u,by omega⟩
      · omega

omit [DecidableEq V] in
theorem exists_diameter_layering (G : SimpleGraph V) (hG : G.Connected) :
    ∃ layer : V→Fin (G.diam+1), Function.Surjective layer ∧ G ≤ layerCliqueGraph layer := by
  have : Nonempty V := hG.nonempty
  have hfinite : G.ediam ≠ ⊤ := G.connected_iff_ediam_ne_top.mp hG
  obtain ⟨u,v,huv⟩ := G.exists_dist_eq_diam
  let layer (x : V) : Fin (G.diam+1) := ⟨G.dist u x,Nat.lt_succ_of_le (G.dist_le_diam hfinite)⟩
  refine ⟨layer,?_,?_⟩
  · intro k
    obtain ⟨p,hp⟩ := hG.exists_walk_length_eq_dist u v
    have hk : k.val ≤ G.dist u v := by rw [huv]; exact Nat.le_of_lt_succ k.isLt
    obtain ⟨x,hx⟩ := distance_levels_on_walk G u p k.val (by simp) hk
    exact ⟨x,Fin.ext hx⟩
  · intro x y hxy
    refine ⟨hxy.ne,?_,?_⟩
    · have hh := hxy.diff_dist_adj (u:=u)
      rcases hh with h | h | h <;> (dsimp only [layer]; omega)
    · have hh := hxy.diff_dist_adj (u:=u)
      rcases hh with h | h | h <;> (dsimp only [layer]; omega)

/-- Keep exactly one representative per layer, then retain any prescribed
admissible number of further vertices. The restricted layers remain surjective. -/
theorem exists_retained_layers {d c : ℕ} (layer : V→Fin d) (hl : Function.Surjective layer)
    (hc : d+c ≤ Fintype.card V) :
    ∃ s : Finset V, s.card=d+c ∧ Function.Surjective (fun v : ↥s => layer v.val) := by
  classical
  let rep : Fin d→ V := Function.surjInv hl
  have hr : Function.RightInverse rep layer := Function.rightInverse_surjInv hl
  have hi : Function.Injective rep := hr.injective
  let s := (Finset.univ : Finset (Fin d)).map ⟨rep,hi⟩
  have hs : s.card=d := by simp [s]
  let rest := Finset.univ \ s
  have hrest : rest.card=Fintype.card V-d := by simp [rest,Finset.card_sdiff,hs]
  obtain ⟨t,ht,hct⟩ := Finset.exists_subset_card_eq (s:=rest) (n:=c) (by rw [hrest]; omega)
  have hst : Disjoint s t := by
    apply Finset.disjoint_left.mpr
    intro x hx htx
    exact (Finset.mem_sdiff.mp (ht htx)).2 hx
  refine ⟨s∪t,by rw [Finset.card_union_of_disjoint hst,hs,hct],?_⟩
  intro j
  have hh : rep j ∈ s := Finset.mem_map.mpr ⟨j,Finset.mem_univ _,rfl⟩
  exact ⟨⟨rep j,Finset.mem_union_left _ hh⟩,hr j⟩

end XuZhou
