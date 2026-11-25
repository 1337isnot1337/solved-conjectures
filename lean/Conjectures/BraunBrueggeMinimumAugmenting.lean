import Mathlib.Combinatorics.SimpleGraph.Basic
import Mathlib.Data.List.Chain
import Mathlib.GroupTheory.Perm.List
import Mathlib.Data.Fintype.EquivFin
import Mathlib.Tactic

/-! A path between two different uncovered vertices augments an actual
indexed matching. Permuting the right endpoints along the path keeps all
new endpoints disjoint. -/

open Set

namespace BraunBruegge

variable {V M J : Type*}

structure IndexedMatching (G : SimpleGraph V) (M : Type*) where
  endpoints : M ⊕ M ↪ V
  edge : ∀ i : M, G.Adj (endpoints (.inl i)) (endpoints (.inr i))

namespace IndexedMatching

variable {G : SimpleGraph V}

def low (m : IndexedMatching G M) (i : M) : V := m.endpoints (.inl i)

def high (m : IndexedMatching G M) (i : M) : V := m.endpoints (.inr i)

def Unmatched (m : IndexedMatching G M) (u : V) : Prop := u ∉ Set.range m.endpoints

def Arc (m : IndexedMatching G M) (i j : M) : Prop := G.Adj (m.high i) (m.low j)

def IsMaximum [Fintype M] (_m : IndexedMatching G M) : Prop :=
  ∀ (k : ℕ), IndexedMatching G (Fin k) → k ≤ Fintype.card M

def reindex (m : IndexedMatching G M) (e : J ≃ M) : IndexedMatching G J :=
  ⟨(e.sumCongr e).toEmbedding.trans m.endpoints, fun i => m.edge (e i)⟩

theorem low_ne_high (m : IndexedMatching G M) (i j : M) : m.low i ≠ m.high j := by
  intro h
  exact Sum.inl_ne_inr (m.endpoints.injective h)

theorem unmatched_ne_low (m : IndexedMatching G M) {u : V} (hu : m.Unmatched u) (i : M) : u ≠ m.low i :=
  fun h => hu ⟨.inl i, h.symm⟩

theorem unmatched_ne_high (m : IndexedMatching G M) {u : V} (hu : m.Unmatched u) (i : M) : u ≠ m.high i :=
  fun h => hu ⟨.inr i, h.symm⟩

end IndexedMatching

theorem list_simple_path_of_reachable {α : Type*} {r : α → α → Prop} {i j : α}
    (h : Relation.ReflTransGen r i j) :
    ∃ l : List α, l.head? = some i ∧ l.getLast? = some j ∧ l.IsChain r ∧ l.Nodup := by
  classical
  induction h with
  | refl => exact ⟨[i], by simp⟩
  | @tail u v _ he ih =>
    obtain ⟨l, hl, hr, hc, hn⟩ := ih
    by_cases hv : v ∈ l
    · obtain ⟨a, b, rfl, _⟩ := List.eq_append_cons_of_mem hv
      have hp : a ++ [v] <+: a ++ v :: b := ⟨b, by simp [List.append_assoc]⟩
      refine ⟨a ++ [v], ?_, by simp, hc.prefix hp, hp.sublist.nodup hn⟩
      cases a <;> simpa using hl
    · refine ⟨l ++ [v], by simp [hl], by simp, ?_, ?_⟩
      · apply hc.append (by simp)
        intro a ha b hb
        rw [hr] at ha
        simp at ha hb
        subst a
        subst b
        exact he
      · refine List.nodup_append.mpr ⟨hn, by simp, ?_⟩
        intro a ha b hb e
        simp only [List.mem_singleton] at hb
        rw [hb] at e
        exact hv (e ▸ ha)

private def optionEndpoint (f : M → V) (u : V) : Option M → V := fun x => x.elim u f

private theorem optionEndpoint_injective {f : M → V} {u : V} (hf : Function.Injective f)
    (hu : ∀ i, u ≠ f i) : Function.Injective (optionEndpoint f u) := by
  rintro (_ | i) (_ | j) h
  · rfl
  · exact (hu j h).elim
  · exact (hu i h.symm).elim
  · exact congrArg some (hf h)

private theorem augmenting_endpoints_injective {G : SimpleGraph V} (m : IndexedMatching G M)
    {u v : V} (hu : m.Unmatched u) (hv : m.Unmatched v) (hne : u ≠ v) (c : Equiv.Perm (Option M)) :
    Function.Injective (Sum.elim (optionEndpoint m.high u) (optionEndpoint m.low v ∘ c)) := by
  have hhigh : Function.Injective m.high := fun i j h => Sum.inr.inj (m.endpoints.injective h)
  have hlow : Function.Injective m.low := fun i j h => Sum.inl.inj (m.endpoints.injective h)
  have distinct (i j : Option M) : optionEndpoint m.high u i ≠ optionEndpoint m.low v j := by
    cases i with
    | none => cases j with
      | none => exact hne
      | some j => exact m.unmatched_ne_low hu j
    | some i => cases j with
      | none => exact (m.unmatched_ne_high hv i).symm
      | some j => exact (m.low_ne_high j i).symm
  rintro (i | i) (j | j) e
  · exact congrArg Sum.inl (optionEndpoint_injective hhigh (m.unmatched_ne_high hu) e)
  · exact (distinct i (c j) e).elim
  · exact (distinct j (c i) e.symm).elim
  · exact congrArg Sum.inr (c.injective (optionEndpoint_injective hlow (m.unmatched_ne_low hv) e))

private theorem cycle_nodup {α : Type*} {l : List α} (hn : l.Nodup) : (none :: l.map some).Nodup :=
  List.nodup_cons.mpr ⟨by simp, hn.map (fun _ _ e => Option.some.inj e)⟩

private theorem cycle_head {α : Type*} [DecidableEq α] {l : List α} {i : α}
    (hl : l.head? = some i) (hn : l.Nodup) :
    (none :: l.map some).formPerm none = some i := by
  obtain ⟨t, rfl⟩ := List.head?_eq_some_iff.mp hl
  exact List.formPerm_apply_head _ _ _ (cycle_nodup hn)

private theorem augmenting_arc {G : SimpleGraph V} [DecidableEq M] (m : IndexedMatching G M)
    {i j : M} {l : List M} (hl : l.head? = some i) (hr : l.getLast? = some j)
    (hchain : l.IsChain m.Arc) (hn : l.Nodup) {u v : V}
    (hstart : G.Adj u (m.low i)) (hfinish : G.Adj (m.high j) v) :
    ∀ k : Option M, G.Adj (optionEndpoint m.high u k)
      (optionEndpoint m.low v ((none :: l.map some).formPerm k)) := by
  intro k
  cases k with
  | none =>
    rw [cycle_head hl hn]
    exact hstart
  | some x =>
    by_cases hx : x ∈ l
    · obtain ⟨n, hlt, rfl⟩ := List.mem_iff_getElem.mp hx
      let t := none :: l.map some
      have ht : t.Nodup := cycle_nodup hn
      have htn : n + 1 < t.length := by simpa [t] using hlt
      have htidx : t[n + 1] = some l[n] := by simp [t]
      have hcycle := List.formPerm_apply_getElem t ht (n + 1) htn
      rw [htidx] at hcycle
      change G.Adj (m.high l[n]) (optionEndpoint m.low v (t.formPerm (some l[n])))
      rw [hcycle]
      by_cases hnext : n + 1 < l.length
      · have hmod : (n + 1 + 1) % t.length = n + 1 + 1 := Nat.mod_eq_of_lt (by simpa [t] using hnext)
        have hidx : t[(n + 1 + 1) % t.length]'(Nat.mod_lt _ (by omega)) = some l[n + 1] := by
          simp only [hmod]
          simp [t]
        rw [hidx]
        exact (List.isChain_iff_getElem.mp hchain) n hnext
      · have hen : n + 1 = l.length := by omega
        have hmod : (n + 1 + 1) % t.length = 0 := by simp [t, hen]
        have hidx : t[(n + 1 + 1) % t.length]'(Nat.mod_lt _ (by omega)) = none := by
          simp only [hmod]
          rfl
        rw [hidx]
        have hlne : l ≠ [] := by intro e; simp [e] at hl
        have hj : l[n] = j := by
          rw [List.getLast?_eq_some_getLast hlne, List.getLast_eq_getElem] at hr
          have he : l.length - 1 = n := by omega
          simpa only [he, Option.some.injEq] using hr
        rw [hj]
        exact hfinish
    · have hnot : some x ∉ none :: l.map some := by simpa using hx
      rw [List.formPerm_apply_of_notMem hnot]
      exact (m.edge x).symm

theorem no_alternating_path_between_unmatched {G : SimpleGraph V} [Fintype M]
    (m : IndexedMatching G M) (hm : m.IsMaximum) {u v : V} (hu : m.Unmatched u) (hv : m.Unmatched v)
    (hne : u ≠ v) {i j : M} (hi : G.Adj u (m.low i)) (hj : G.Adj (m.high j) v) :
    ¬Relation.ReflTransGen m.Arc i j := by
  classical
  intro h
  obtain ⟨l, hl, hr, hc, hn⟩ := list_simple_path_of_reachable h
  let c := (none :: l.map some).formPerm
  let e : Option M ⊕ Option M ↪ V := ⟨Sum.elim (optionEndpoint m.high u) (optionEndpoint m.low v ∘ c),
    augmenting_endpoints_injective m hu hv hne c⟩
  let m' : IndexedMatching G (Option M) := ⟨e, augmenting_arc m hl hr hc hn hi hj⟩
  have hcard := hm _ (m'.reindex (Fintype.equivFin (Option M)).symm)
  simp at hcard

theorem unmatched_independent {G : SimpleGraph V} [Fintype M] (m : IndexedMatching G M)
    (hm : m.IsMaximum) {u v : V} (hu : m.Unmatched u) (hv : m.Unmatched v) : ¬G.Adj u v := by
  classical
  intro he
  let e : Option M ⊕ Option M ↪ V := ⟨Sum.elim (optionEndpoint m.high u)
    (optionEndpoint m.low v ∘ (1 : Equiv.Perm (Option M))),
    augmenting_endpoints_injective m hu hv he.ne 1⟩
  let m' : IndexedMatching G (Option M) := ⟨e, fun i => by
    cases i with
    | none => exact he
    | some i => exact (m.edge i).symm⟩
  have hcard := hm _ (m'.reindex (Fintype.equivFin (Option M)).symm)
  simp at hcard

end BraunBruegge
