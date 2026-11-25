module

public import Conjectures.XuZhouDistanceLayers

@[expose] public section
namespace XuZhou

variable {V : Type*} [Fintype V] [DecidableEq V] {n : ℕ}

omit [Fintype V] [DecidableEq V] in
theorem layer_walk_index_le {layer : V→Fin n} {u v : V}
    (p : (layerCliqueGraph layer).Walk u v) :
    (layer v).val ≤ (layer u).val+p.length := by
  induction p with
  | nil => simp
  | @cons u v w h p ih =>
    have hw : (layer v).val ≤ (layer u).val+1 := h.2.2
    simp only [SimpleGraph.Walk.length_cons]
    omega

omit [Fintype V] [DecidableEq V] in
theorem layer_increasing_walk (layer : V→Fin n) (h : Function.Surjective layer)
    {u v : V} (hij : (layer u).val < (layer v).val) :
    ∃ p : (layerCliqueGraph layer).Walk u v,
      p.length=(layer v).val-(layer u).val := by
  have H (k : ℕ) : ∀ (u v : V), (layer u).val < (layer v).val →
      (layer v).val-(layer u).val=k →
      ∃ p : (layerCliqueGraph layer).Walk u v,p.length=k := by
    induction k using Nat.strong_induction_on with
    | h k ih =>
      intro u v huv hk
      by_cases hh : k=1
      · have hn : u≠v := fun he => by subst v; omega
        have hAdj : (layerCliqueGraph layer).Adj u v := ⟨hn,by omega,by omega⟩
        exact ⟨SimpleGraph.Walk.cons hAdj SimpleGraph.Walk.nil,by simp [hh]⟩
      · let j : Fin n := ⟨(layer u).val+1,by have := (layer v).isLt; omega⟩
        obtain ⟨w,hw⟩ := h j
        have he : (layer w).val=(layer u).val+1 := congrArg Fin.val hw
        have hwn : u≠w := fun hh => by subst w; omega
        have haw : (layerCliqueGraph layer).Adj u w := ⟨hwn,by omega,by omega⟩
        have hwv : (layer w).val < (layer v).val := by omega
        have hrec : (layer v).val-(layer w).val < k := by omega
        obtain ⟨p,hp⟩ := ih _ hrec w v hwv rfl
        exact ⟨SimpleGraph.Walk.cons haw p,by
          rw [SimpleGraph.Walk.length_cons,hp]
          omega⟩
  exact H _ u v hij rfl

omit [Fintype V] [DecidableEq V] in
theorem layer_walk_length_le {layer : V→Fin n} (h : Function.Surjective layer)
    (hn : 2 ≤ n) (u v : V) : ∃ p : (layerCliqueGraph layer).Walk u v,p.length ≤ n-1 := by
  by_cases huv : u=v
  · subst v
    exact ⟨SimpleGraph.Walk.nil,by simp⟩
  · rcases lt_trichotomy (layer u).val (layer v).val with hlt | he | hgt
    · obtain ⟨p,hp⟩ := layer_increasing_walk layer h hlt
      have hv := (layer v).isLt
      exact ⟨p,by omega⟩
    · have ha : (layerCliqueGraph layer).Adj u v := ⟨huv,by omega,by omega⟩
      exact ⟨SimpleGraph.Walk.cons ha SimpleGraph.Walk.nil,by
        simp only [SimpleGraph.Walk.length_cons,SimpleGraph.Walk.length_nil]; omega⟩
    · obtain ⟨p,hp⟩ := layer_increasing_walk layer h hgt
      have hu := (layer u).isLt
      exact ⟨p.reverse,by rw [SimpleGraph.Walk.length_reverse]; omega⟩

omit [Fintype V] [DecidableEq V] in
theorem layerCliqueGraph_connected {layer : V→Fin n} (h : Function.Surjective layer)
    (hn : 2≤n) : (layerCliqueGraph layer).Connected := by
  have hnV : Nonempty V := by
    obtain ⟨v,_⟩ := h ⟨0,by omega⟩
    exact ⟨v⟩
  apply (layerCliqueGraph layer).connected_iff.mpr
  exact ⟨fun u v => by
    obtain ⟨p,_⟩ := layer_walk_length_le h hn u v
    exact ⟨p⟩,hnV⟩

omit [DecidableEq V] in
theorem layerCliqueGraph_diameter {layer : V→Fin n} (h : Function.Surjective layer)
    (hn : 2≤n) : (layerCliqueGraph layer).diam=n-1 := by
  let G := layerCliqueGraph layer
  have hc : G.Connected := layerCliqueGraph_connected h hn
  have hv : Nonempty V := hc.nonempty
  have hu : G.ediam≠⊤ := G.connected_iff_ediam_ne_top.mp hc
  change G.diam=n-1
  apply le_antisymm
  · obtain ⟨u,v,he⟩ := G.exists_dist_eq_diam
    obtain ⟨p,hp⟩ := layer_walk_length_le h hn u v
    have hh := G.dist_le p
    omega
  · obtain ⟨u,hu0⟩ := h ⟨0,by omega⟩
    obtain ⟨v,hv0⟩ := h ⟨n-1,by omega⟩
    obtain ⟨p,hp⟩ := hc.exists_walk_length_eq_dist u v
    have H := layer_walk_index_le p
    have he : G.dist u v ≤ G.diam := G.dist_le_diam hu
    have h0 : (layer u).val=0 := congrArg Fin.val hu0
    have h1 : (layer v).val=n-1 := congrArg Fin.val hv0
    omega

end XuZhou
