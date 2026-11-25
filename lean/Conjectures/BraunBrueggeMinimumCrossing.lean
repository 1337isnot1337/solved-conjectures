import Conjectures.BraunBrueggeMinimumAlmostPerfectFaces

/-! Strong connectivity of the matching arcs keeps the crossing graph of the
matched vertices connected after any one endpoint is deleted. -/

open Set

namespace BraunBruegge

variable {V M : Type*} {G : SimpleGraph V}

def crossingGraph (G : SimpleGraph V) (b : V → Bool) : SimpleGraph V where
  Adj u v := G.Adj u v ∧ b u ≠ b v
  symm := ⟨fun _ _ h => ⟨h.1.symm, h.2.symm⟩⟩
  loopless := ⟨fun _ h => h.2 rfl⟩

noncomputable def binaryValue (b : Bool) : ℝ := if b then 1 else 0

noncomputable def binaryPotential (root : V) (b : V → Bool) : V → ℝ :=
  fun v => binaryValue (b v) - binaryValue (b root)

theorem binaryPotential_diff (root : V) (b : V → Bool) (u v : V) :
    binaryPotential root b u - binaryPotential root b v = binaryValue (b u) - binaryValue (b v) := by
  unfold binaryPotential
  ring

theorem tightGraph_binaryPotential (G : SimpleGraph V) (root : V) (b : V → Bool) :
    tightGraph G (binaryPotential root b) = crossingGraph G b := by
  ext u v
  change (_ ∧ |_| = 1) ↔ _ ∧ b u ≠ b v
  rw [binaryPotential_diff]
  cases b u <;> cases b v <;> simp [binaryValue]

theorem binaryPotential_vertex [Fintype V] (root : V) (b : V → Bool)
    (h : (crossingGraph G b).Connected) : binaryPotential root b ∈ (polar G root).extremePoints ℝ := by
  apply mem_extreme_polar_iff.mpr
  refine ⟨⟨by simp [binaryPotential], ?_⟩, by rwa [tightGraph_binaryPotential]⟩
  intro u v _
  rw [binaryPotential_diff]
  cases hu : b u <;> cases hv : b v <;> norm_num [binaryValue, hu, hv]

theorem binaryPotential_injective_of_nonconstant {root : V} {a b : V → Bool}
    (ha : ∃ u v, a u ≠ a v) (h : binaryPotential root a = binaryPotential root b) : a = b := by
  obtain ⟨u, v, hn⟩ := ha
  have hd (x y : V) : binaryValue (a x) - binaryValue (a y) = binaryValue (b x) - binaryValue (b y) := by
    rw [← binaryPotential_diff root a, ← binaryPotential_diff root b, h]
  have he := hd u v
  have ha₀ : a u = b u := by
    revert he hn
    cases a u <;> cases a v <;> cases b u <;> cases b v <;> norm_num [binaryValue]
  funext x
  have hx := hd x u
  rw [ha₀, sub_left_inj] at hx
  revert hx
  cases a x <;> cases b x <;> norm_num [binaryValue]

namespace IndexedMatching

variable (m : IndexedMatching G M)

def endpointIndex : M ⊕ M → M := Sum.elim id id

def endpointSide : M ⊕ M → Bool := Sum.elim (fun _ => false) (fun _ => true)

def oppositeEndpoint : M ⊕ M → M ⊕ M := Sum.elim Sum.inr Sum.inl

@[simp] theorem oppositeEndpoint_index (t : M ⊕ M) : endpointIndex (oppositeEndpoint t) = endpointIndex t := by
  cases t <;> rfl

@[simp] theorem oppositeEndpoint_ne (t : M ⊕ M) : oppositeEndpoint t ≠ t := by
  cases t <;> simp [oppositeEndpoint]

def AgreesOutside (b : V → Bool) (s : M ⊕ M) : Prop :=
  ∀ t : M ⊕ M, t ≠ s → b (m.endpoints t) = endpointSide t

private theorem reaches_low_after_high_deleted {H : SimpleGraph V} {i j : M}
    (h : Relation.ReflTransGen m.Arc j i)
    (hp : ∀ k, k ≠ i → H.Adj (m.low k) (m.high k))
    (he : ∀ k l, k ≠ i → m.Arc k l → H.Adj (m.high k) (m.low l)) :
    H.Reachable (m.low j) (m.low i) := by
  induction h using Relation.ReflTransGen.head_induction_on with
  | refl => exact SimpleGraph.Reachable.refl _
  | @head j k e _ ih =>
    by_cases hj : j = i
    · subst j
      exact SimpleGraph.Reachable.refl _
    · exact (hp j hj).reachable.trans ((he j k hj e).reachable.trans ih)

private theorem reaches_high_after_low_deleted {H : SimpleGraph V} {i j : M}
    (h : Relation.ReflTransGen m.Arc i j)
    (hp : ∀ k, k ≠ i → H.Adj (m.low k) (m.high k))
    (he : ∀ k l, l ≠ i → m.Arc k l → H.Adj (m.high k) (m.low l)) :
    H.Reachable (m.high i) (m.high j) := by
  induction h with
  | refl => exact SimpleGraph.Reachable.refl _
  | @tail k l _ e ih =>
    by_cases hl : l = i
    · subst l
      exact SimpleGraph.Reachable.refl _
    · exact ih.trans ((he k l hl e).reachable.trans (hp l hl).reachable)

theorem reaches_opposite_of_agreesOutside (hs : m.Strong) {s : M ⊕ M} {b : V → Bool}
    (hb : m.AgreesOutside b s) (t : M ⊕ M) (ht : t ≠ s) :
    (crossingGraph G b).Reachable (m.endpoints t) (m.endpoints (oppositeEndpoint s)) := by
  cases s with
  | inl i =>
    have hh (k : M) : b (m.high k) = true := hb (.inr k) (by simp)
    have hl (k : M) (hk : k ≠ i) : b (m.low k) = false := hb (.inl k) (by simpa)
    have hp (k : M) (hk : k ≠ i) : (crossingGraph G b).Adj (m.low k) (m.high k) :=
      ⟨m.edge k, by rw [hl k hk, hh]; decide⟩
    have he (k l : M) (hl' : l ≠ i) (e : m.Arc k l) :
        (crossingGraph G b).Adj (m.high k) (m.low l) := ⟨e, by rw [hh, hl l hl']; decide⟩
    have h (j : M) := (m.reaches_high_after_low_deleted (hs i j) hp he).symm
    cases t with
    | inl j => exact (hp j (by simpa using ht)).reachable.trans (h j)
    | inr j => exact h j
  | inr i =>
    have hl (k : M) : b (m.low k) = false := hb (.inl k) (by simp)
    have hh (k : M) (hk : k ≠ i) : b (m.high k) = true := hb (.inr k) (by simpa)
    have hp (k : M) (hk : k ≠ i) : (crossingGraph G b).Adj (m.low k) (m.high k) :=
      ⟨m.edge k, by rw [hl, hh k hk]; decide⟩
    have he (k l : M) (hk : k ≠ i) (e : m.Arc k l) :
        (crossingGraph G b).Adj (m.high k) (m.low l) := ⟨e, by rw [hh k hk, hl]; decide⟩
    have h (j : M) := m.reaches_low_after_high_deleted (hs j i) hp he
    cases t with
    | inl j => exact h j
    | inr j => exact (hp j (by simpa using ht)).symm.reachable.trans (h j)

end IndexedMatching
end BraunBruegge
