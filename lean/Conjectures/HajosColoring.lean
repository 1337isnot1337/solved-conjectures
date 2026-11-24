import Mathlib.Combinatorics.SimpleGraph.Coloring.Vertex
import Mathlib.Combinatorics.SimpleGraph.Walk.Basic
import Mathlib.Algebra.BigOperators.Group.Finset.Basic
import Mathlib.Data.Fintype.Card
import Mathlib.Tactic

/-!
# Hajós's graph-coloring conjecture

Paul A. Catlin, *Hajós' Graph-Coloring Conjecture: Variations and
Counterexamples*, JCT B 26 (1979), 268–274, §2, Propositions 1 and 2.
The witness is the line graph of the tripled five-cycle.
This formalizes the universal refutation, not every stronger theorem in
the paper and not the unrelated cycle-decomposition conjecture.
-/

namespace PublishedHajos

open scoped BigOperators
open SimpleGraph

set_option maxHeartbeats 2000000
set_option maxRecDepth 10000

/-- Interior vertices of a simple path. -/
def Interior {V : Type*} {G : SimpleGraph V} {u v : V}
    (p : G.Walk u v) (x : V) : Prop :=
  x ∈ p.support ∧ x ≠ u ∧ x ≠ v

/-- The standard subdivision model, using both orientations of each
edge of the complete graph. Paths for distinct unordered edges have
disjoint interiors; all interiors avoid all branch vertices. -/
structure Subdivision {V : Type*} (G : SimpleGraph V) (k : ℕ) where
  f : Fin k → V
  inj : Function.Injective f
  P : ∀ i j : Fin k, i ≠ j → G.Walk (f i) (f j)
  simple : ∀ i j h, (P i j h).support.Nodup
  avoid : ∀ i j h x, Interior (P i j h) x → ∀ t, x ≠ f t
  disjoint : ∀ i j h p q h' x,
    s(i, j) ≠ s(p, q) →
    Interior (P i j h) x → Interior (P p q h') x → False

/-- A walk leaving a set must meet its external vertex boundary. -/
theorem walk_cross {V : Type*} {G : SimpleGraph V} (L C : V → Prop)
    (step : ∀ {u v}, G.Adj u v → L u → L v ∨ C v)
    {u v : V} (p : G.Walk u v) :
    L u → ¬ L v → ∃ w, w ∈ p.support ∧ C w := by
  induction p with
  | nil =>
    intro hu hv
    exact (hv hu).elim
  | @cons u w v h q ih =>
    intro hu hv
    rcases step h hu with hw | hw
    · obtain ⟨z, hz, hzc⟩ := ih hw hv
      exact ⟨z, by simp [Walk.support_cons, hz], hzc⟩
    · exact ⟨w, by simp [Walk.support_cons, q.start_mem_support], hw⟩

/-- Catlin's cut obstruction. There are k-1 disjoint routes between
two separated branch vertices: their own path, and one route through
each other branch vertex. Each route must consume a distinct cut vertex. -/
theorem separator_lower_bound {V : Type*} [Fintype V] [DecidableEq V]
    {G : SimpleGraph V} {k : ℕ} (m : Subdivision G k)
    (L : V → Prop) (C : Finset V)
    (step : ∀ {u v}, G.Adj u v → L u → L v ∨ v ∈ C)
    (x y : Fin k) (hx : L (m.f x)) (hy : ¬ L (m.f y))
    (hxc : m.f x ∉ C) (hyc : m.f y ∉ C) :
    k - 1 ≤ C.card := by
  classical
  let D : Finset (Fin k) := Finset.univ.erase x
  have hD (i : D) : (i : Fin k) ≠ x := (Finset.mem_erase.mp i.property).1
  let a (i : D) : Fin k := if L (m.f i) then i else x
  let b (i : D) : Fin k := if L (m.f i) then y else i
  have ha (i : D) : L (m.f (a i)) := by
    by_cases h : L (m.f i)
    · simpa [a, h] using h
    · simpa [a, h] using hx
  have hb (i : D) : ¬ L (m.f (b i)) := by
    by_cases h : L (m.f i)
    · simpa [b, h] using hy
    · simpa [b, h] using h
  have hab (i : D) : a i ≠ b i := by
    intro h
    exact hb i (h ▸ ha i)
  have edge_inj : Function.Injective (fun i : D => s(a i, b i)) := by
    intro i j hij
    rcases Sym2.eq_iff.mp hij with ⟨h1, h2⟩ | ⟨h1, h2⟩
    · by_cases hi : L (m.f i) <;> by_cases hj : L (m.f j)
      · apply Subtype.ext
        simpa [a, hi, hj] using h1
      · exfalso
        exact hD i (by simpa [a, hi, hj] using h1)
      · exfalso
        exact hD j (by simpa [a, hi, hj] using h1.symm)
      · apply Subtype.ext
        simpa [b, hi, hj] using h2
    · exact (hb j (h1 ▸ ha i)).elim
  have avail (i : D) : ∃ z : C,
      (z : V) = m.f i ∨ Interior (m.P (a i) (b i) (hab i)) z := by
    by_cases hc : m.f i ∈ C
    · exact ⟨⟨m.f i, hc⟩, Or.inl rfl⟩
    · obtain ⟨w, hw, hwc⟩ :=
        walk_cross L (fun v => v ∈ C) step (m.P (a i) (b i) (hab i)) (ha i) (hb i)
      have hac : m.f (a i) ∉ C := by
        by_cases h : L (m.f i)
        · simpa [a, h] using hc
        · simpa [a, h] using hxc
      have hbc : m.f (b i) ∉ C := by
        by_cases h : L (m.f i)
        · simpa [b, h] using hyc
        · simpa [b, h] using hc
      exact ⟨⟨w, hwc⟩, Or.inr ⟨hw, fun e => hac (e ▸ hwc), fun e => hbc (e ▸ hwc)⟩⟩
  let g (i : D) : C := Classical.choose (avail i)
  have hg (i : D) :
      (g i : V) = m.f i ∨ Interior (m.P (a i) (b i) (hab i)) (g i : V) :=
    Classical.choose_spec (avail i)
  have gi : Function.Injective g := by
    intro i j e
    have ev : (g i : V) = (g j : V) := congrArg Subtype.val e
    rcases hg i with hi | hi <;> rcases hg j with hj | hj
    · exact Subtype.ext (m.inj (hi.symm.trans (ev.trans hj)))
    · exact (m.avoid _ _ _ _ hj i (ev.symm.trans hi)).elim
    · exact (m.avoid _ _ _ _ hi j (ev.trans hj)).elim
    · by_contra h
      exact m.disjoint _ _ _ _ _ _ _ (fun hh => h (edge_inj hh)) hi (ev.symm ▸ hj)
  have card_le := Fintype.card_le_of_injective g gi
  simpa [D] using card_le

/-- Vertices are the three parallel edges in each of the five cyclic
edge groups of Catlin's multigraph. -/
abbrev V := Fin 5 × Fin 3

abbrev near (a b : Fin 5) : Prop :=
  a = b ∨ (a.val + 1) % 5 = b.val ∨ (b.val + 1) % 5 = a.val

def graph : SimpleGraph V where
  Adj u v := u ≠ v ∧ near u.1 v.1
  symm := ⟨fun _ _ h => ⟨h.1.symm, by
    rcases h.2 with h' | h' | h'
    · exact Or.inl h'.symm
    · exact Or.inr (Or.inr h')
    · exact Or.inr (Or.inl h')⟩⟩
  loopless := ⟨fun _ h => h.1 rfl⟩

theorem no_independent_triple :
    ∀ u v w : V, u ≠ v → u ≠ w → v ≠ w →
      ¬ near u.1 v.1 → ¬ near u.1 w.1 → ¬ near v.1 w.1 → False := by
  decide

theorem no_seven_coloring : ¬ graph.Colorable 7 := by
  classical
  rintro ⟨c⟩
  let fiber (j : Fin 7) : Finset V := Finset.univ.filter (fun v => c v = j)
  have fiber_le (j : Fin 7) : (fiber j).card ≤ 2 := by
    by_contra h
    have hc : 2 < (fiber j).card := Nat.lt_of_not_ge h
    obtain ⟨u, hu, v, hv, huv⟩ :=
      Finset.one_lt_card.mp (show 1 < (fiber j).card by omega)
    have hs : ¬ fiber j ⊆ {u, v} := by
      intro hh
      have h' := (Finset.card_le_card hh).trans (Finset.card_le_two (a := u) (b := v))
      omega
    push_neg at hs
    obtain ⟨w, hw, hwuv⟩ := hs
    have hwu : w ≠ u := fun e => hwuv (by simp [e])
    have hwv : w ≠ v := fun e => hwuv (by simp [e])
    have cu : c u = j := (Finset.mem_filter.mp hu).2
    have cv : c v = j := (Finset.mem_filter.mp hv).2
    have cw : c w = j := (Finset.mem_filter.mp hw).2
    have n1 : ¬ near u.1 v.1 := fun hn => c.valid (show graph.Adj u v from ⟨huv, hn⟩) (cu.trans cv.symm)
    have n2 : ¬ near u.1 w.1 := fun hn => c.valid (show graph.Adj u w from ⟨hwu.symm, hn⟩) (cu.trans cw.symm)
    have n3 : ¬ near v.1 w.1 := fun hn => c.valid (show graph.Adj v w from ⟨hwv.symm, hn⟩) (cv.trans cw.symm)
    exact no_independent_triple u v w huv hwu.symm hwv.symm n1 n2 n3
  have hsum : (∑ j : Fin 7, (fiber j).card) = 15 := by
    simpa [fiber] using
      (Finset.sum_card_fiberwise_eq_card_filter (Finset.univ : Finset V)
        (Finset.univ : Finset (Fin 7)) (fun v => c v))
  have hle : (∑ j : Fin 7, (fiber j).card) ≤ ∑ _j : Fin 7, (2 : ℕ) :=
    Finset.sum_le_sum (fun j _ => fiber_le j)
  rw [hsum] at hle
  norm_num at hle

/-- An actual 8-coloring, so the witness also matches the original
equality-of-chromatic-number wording. -/
def colors (v : V) : Fin 8 :=
  match v.1.val, v.2.val with
  | 0, 0 => 0 | 0, 1 => 1 | 0, _ => 2
  | 1, 0 => 3 | 1, 1 => 4 | 1, _ => 5
  | 2, 0 => 0 | 2, 1 => 1 | 2, _ => 6
  | 3, 0 => 2 | 3, 1 => 3 | 3, _ => 4
  | _, 0 => 5 | _, 1 => 6 | _, _ => 7

theorem color_valid : ∀ u v : V, u ≠ v ∧ near u.1 v.1 → colors u ≠ colors v := by
  decide

theorem chromatic_eq : graph.chromaticNumber = 8 := by
  have h : graph.Colorable 8 :=
    ⟨SimpleGraph.Coloring.mk colors (fun h => color_valid _ _ h)⟩
  exact (SimpleGraph.chromaticNumber_eq_iff_colorable_not_colorable (G := graph) (n := 7)).2
    ⟨h, no_seven_coloring⟩

def cut (a : Fin 5) : Finset V :=
  Finset.univ.filter (fun v => near a v.1 ∧ v.1 ≠ a)

def common (a b : Fin 5) : Finset V :=
  Finset.univ.filter (fun v => near a v.1 ∧ near b v.1)

def group (a : Fin 5) : Finset V :=
  Finset.univ.filter (fun v => v.1 = a)

theorem cut_card : ∀ a, (cut a).card = 6 := by decide

theorem common_card : ∀ a b, a ≠ b → near a b → (common a b).card = 6 := by decide

theorem group_card : ∀ a, (group a).card = 3 := by decide

/-- Any eight distinct vertices have a pair in non-neighboring groups. -/
theorem branches_far (f : Fin 8 → V) (hf : Function.Injective f) :
    ∃ i j, ¬ near (f i).1 (f j).1 := by
  classical
  by_contra h
  push_neg at h
  let a := (f 0).1
  by_cases hh : ∀ i, (f i).1 = a
  · let g (i : Fin 8) : group a := ⟨f i, by simp [group, hh i]⟩
    have hc := Fintype.card_le_of_injective g (fun _ _ e => hf (congrArg Subtype.val e))
    simp [group_card] at hc
  · push_neg at hh
    obtain ⟨j, hj⟩ := hh
    let b := (f j).1
    have hab : a ≠ b := Ne.symm hj
    have hnab : near a b := h 0 j
    let g (i : Fin 8) : common a b := ⟨f i, by
      simp only [common, Finset.mem_filter, Finset.mem_univ, true_and]
      exact ⟨h 0 i, h j i⟩⟩
    have hc := Fintype.card_le_of_injective g (fun _ _ e => hf (congrArg Subtype.val e))
    simp [common_card a b hab hnab] at hc

theorem no_subdivision : ¬ Nonempty (Subdivision graph 8) := by
  rintro ⟨m⟩
  obtain ⟨i, j, hfar⟩ := branches_far m.f m.inj
  let a := (m.f i).1
  let L : V → Prop := fun v => v.1 = a
  have hx : L (m.f i) := rfl
  have hy : ¬ L (m.f j) := fun h => hfar (Or.inl h.symm)
  have hi : m.f i ∉ cut a := by
    simp [cut, a]
  have hj : m.f j ∉ cut a := by
    intro h
    exact hfar (Finset.mem_filter.mp h).2.1
  have step : ∀ {u v}, graph.Adj u v → L u → L v ∨ v ∈ cut a := by
    intro u v e hu
    by_cases hv : L v
    · exact Or.inl hv
    · right
      apply Finset.mem_filter.mpr
      refine ⟨Finset.mem_univ _, ?_, hv⟩
      change u.1 = a at hu
      change u ≠ v ∧ near u.1 v.1 at e
      exact hu ▸ e.2
  have hc := separator_lower_bound m L (cut a) step i j hx hy hi hj
  rw [cut_card] at hc
  omega

/-- The full original universally quantified graph-coloring conjecture. -/
def conjecture : Prop :=
  ∀ (W : Type) [Fintype W] (G : SimpleGraph W) (k : ℕ),
    (k : ℕ∞) ≤ G.chromaticNumber → Nonempty (Subdivision G k)

theorem conjecture_false : ¬ conjecture := by
  intro h
  unfold conjecture at h
  exact no_subdivision (h V graph 8 (by rw [chromatic_eq]; norm_num))

#print axioms conjecture_false

end PublishedHajos
