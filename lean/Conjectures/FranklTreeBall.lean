module

public import Mathlib.Combinatorics.SimpleGraph.Girth
public import Mathlib.Data.Finset.Max

@[expose] public section

/-!
# Girth sixteen makes the radius-seven ball a tree

The ball is expressed by paths of length at most seven. This avoids the junk
value of finite graph distance between disconnected vertices. An extra edge
would give two distinct paths of combined length at most fifteen.
-/

namespace FranklTreeBall

open SimpleGraph

variable {V : Type*} {G : SimpleGraph V}

def NoShortCycle (G : SimpleGraph V) (n : ℕ) : Prop :=
  ∀ (u : V) (c : G.Walk u u), c.IsCycle → n ≤ c.length

theorem short_paths_unique (hg : NoShortCycle G 16) {u v : V}
    {p q : G.Walk u v} (hp : p.IsPath) (hq : q.IsPath)
    (hlen : p.length + q.length < 16) : p = q := by
  by_contra hne
  obtain ⟨w, _, _, c, hc, hclen⟩ := hp.exists_isCycle_length_le_add_of_ne hq hne
  have hmin := hg w c hc
  omega

/-- An edge between two vertices reached by short root paths extends exactly
one of the paths by its final edge. -/
theorem short_paths_edge (hg : NoShortCycle G 16) {root u v : V}
    (p : G.Walk root u) (q : G.Walk root v) (hp : p.IsPath) (hq : q.IsPath)
    (hplen : p.length ≤ 7) (hqlen : q.length ≤ 7) (hadj : G.Adj u v) :
    p.concat hadj = q ∨ q.concat hadj.symm = p := by
  classical
  by_cases hv : v ∈ p.support
  · have htake : p.takeUntil v hv = q :=
      short_paths_unique hg (hp.takeUntil hv) hq (by
        have ht := p.length_takeUntil_le_length hv
        omega)
    have hdrop : p.dropUntil v hv = .cons hadj.symm .nil :=
      short_paths_unique hg (hp.dropUntil hv) (Walk.IsPath.of_adj hadj.symm) (by
        have ht := p.length_dropUntil_le_length hv
        simp only [Walk.length_cons, Walk.length_nil]
        omega)
    right
    have h := p.take_spec hv
    rw [htake, hdrop] at h
    exact h
  · left
    exact short_paths_unique hg (hp.concat hv hadj) hq (by
      simp only [Walk.length_concat]
      omega)

theorem lower_neighbor_is_penultimate (hg : NoShortCycle G 16) {root u v : V}
    (p : G.Walk root u) (q : G.Walk root v) (hp : p.IsPath) (hq : q.IsPath)
    (hplen : p.length ≤ 7) (hqlen : q.length ≤ 7) (hadj : G.Adj u v)
    (horder : q.length ≤ p.length) : v = p.penultimate := by
  rcases short_paths_edge hg p q hp hq hplen hqlen hadj with h | h
  · have hlength := congrArg Walk.length h
    simp only [Walk.length_concat] at hlength
    omega
  · have hvertex := congrArg Walk.penultimate h
    simpa only [Walk.penultimate_concat] using hvertex

/-- In every cycle a vertex of maximal height has two distinct lower-or-equal
neighbors. Unique lower neighbors therefore prohibit cycles. -/
theorem isAcyclic_of_unique_lower_neighbor (height : V → ℕ)
    (hunique : ∀ {u v w : V}, G.Adj u v → G.Adj u w →
      height v ≤ height u → height w ≤ height u → v = w) : G.IsAcyclic := by
  classical
  intro u c hc
  obtain ⟨v, hv, hmax⟩ := c.support.toFinset.exists_max_image height
    ⟨u, List.mem_toFinset.mpr c.start_mem_support⟩
  have hv' : v ∈ c.support := List.mem_toFinset.mp hv
  let q := c.rotate v hv'
  have hq : q.IsCycle := hc.rotate hv'
  have hs : q.snd ∈ c.support :=
    (c.mem_support_rotate_iff v hv').mp (q.getVert_mem_support 1)
  have hp : q.penultimate ∈ c.support :=
    (c.mem_support_rotate_iff v hv').mp (q.getVert_mem_support (q.length - 1))
  have hsame := hunique (q.adj_snd hq.not_nil) (q.adj_penultimate hq.not_nil).symm
    (hmax q.snd (List.mem_toFinset.mpr hs))
    (hmax q.penultimate (List.mem_toFinset.mpr hp))
  exact hq.snd_ne_penultimate hsame

/-- Closed graph-distance ball, specified without a reachability convention. -/
def pathBall (G : SimpleGraph V) (root : V) (radius : ℕ) : Set V :=
  {v | ∃ p : G.Walk root v, p.IsPath ∧ p.length ≤ radius}

theorem root_mem_pathBall (G : SimpleGraph V) (root : V) (radius : ℕ) :
    root ∈ pathBall G root radius := ⟨.nil, Walk.IsPath.nil, Nat.zero_le _⟩

theorem pathBall_connected (G : SimpleGraph V) (root : V) (radius : ℕ) :
    (G.induce (pathBall G root radius)).Connected := by
  classical
  rw [connected_iff_exists_forall_reachable]
  refine ⟨⟨root, root_mem_pathBall G root radius⟩, ?_⟩
  intro v
  obtain ⟨p, hp, hlen⟩ := v.2
  have hs : ∀ x ∈ p.support, x ∈ pathBall G root radius := by
    intro x hx
    exact ⟨p.takeUntil x hx, hp.takeUntil hx, (p.length_takeUntil_le_length hx).trans hlen⟩
  exact (p.induce (pathBall G root radius) hs).reachable

noncomputable def ballPath (G : SimpleGraph V) (root : V)
    (v : pathBall G root 7) : G.Walk root v.1 := Classical.choose v.2

theorem ballPath_isPath (G : SimpleGraph V) (root : V) (v : pathBall G root 7) :
    (ballPath G root v).IsPath := (Classical.choose_spec v.2).1

theorem ballPath_length (G : SimpleGraph V) (root : V) (v : pathBall G root 7) :
    (ballPath G root v).length ≤ 7 := (Classical.choose_spec v.2).2

theorem radius_seven_isAcyclic (hg : NoShortCycle G 16) (root : V) :
    (G.induce (pathBall G root 7)).IsAcyclic := by
  apply isAcyclic_of_unique_lower_neighbor (fun v => (ballPath G root v).length)
  intro u v w huv huw hv hw
  apply Subtype.ext
  have hv' := lower_neighbor_is_penultimate hg (ballPath G root u) (ballPath G root v)
    (ballPath_isPath G root u) (ballPath_isPath G root v)
    (ballPath_length G root u) (ballPath_length G root v) huv hv
  have hw' := lower_neighbor_is_penultimate hg (ballPath G root u) (ballPath G root w)
    (ballPath_isPath G root u) (ballPath_isPath G root w)
    (ballPath_length G root u) (ballPath_length G root w) huw hw
  exact hv'.trans hw'.symm

theorem radius_seven_isTree (hg : NoShortCycle G 16) (root : V) :
    (G.induce (pathBall G root 7)).IsTree where
  connected := pathBall_connected G root 7
  isAcyclic := radius_seven_isAcyclic hg root

theorem radius_seven_isTree_of_egirth (hg : (16 : ℕ∞) ≤ G.egirth) (root : V) :
    (G.induce (pathBall G root 7)).IsTree := by
  apply radius_seven_isTree
  intro u c hc
  exact ENat.natCast_le_natCast.mp (hg.trans hc.egirth_le_length)

theorem radius_seven_isTree_of_girth (hg : 16 ≤ G.girth) (root : V) :
    (G.induce (pathBall G root 7)).IsTree :=
  radius_seven_isTree (fun _ _ hc => hg.trans hc.girth_le_length) root

end FranklTreeBall
