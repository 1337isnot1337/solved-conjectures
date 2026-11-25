import Mathlib.Combinatorics.SimpleGraph.Matching
import Mathlib.Data.Fintype.EquivFin

/-!
# Hartke–Stolee–West–Yancey's matching-excess conjecture

The actual simple-graph/permutation bridge for the split-clique construction
in Section 1 of the existing entry's proof. Perfect matchings use Mathlib's
`SimpleGraph.Subgraph.IsPerfectMatching`, including its spanning requirement.
The right vertex class is independent and has the same cardinality as the
left class; this forces every perfect matching to consist of cross edges,
despite the clique on the left. No path-count formula is assumed here.
-/

namespace HartkeMatchingExcess

open SimpleGraph

/-- Actual spanning perfect matchings, rather than an executable proxy count. -/
abbrev PerfectMatching {V : Type*} (G : SimpleGraph V) :=
  {M : G.Subgraph // M.IsPerfectMatching}

/-- The number of perfect matchings in a finite simple graph. -/
noncomputable def perfectMatchingCount {V : Type*} (G : SimpleGraph V) : ℕ :=
  Nat.card (PerfectMatching G)

/-- Equal left/right classes, a clique on the left, and cross edges given by `D`. -/
def splitGraph {α : Type*} (D : α → α → Prop) : SimpleGraph (α ⊕ α) where
  Adj x y := match x, y with
    | .inl i, .inl j => i ≠ j
    | .inl i, .inr j => D i j
    | .inr i, .inl j => D j i
    | .inr _, .inr _ => False
  symm := ⟨by
    intro x y h
    cases x <;> cases y <;> simp_all [Ne.symm]⟩
  loopless := ⟨by intro x; cases x <;> simp⟩

/-- Directed cycle covers, with a permutation mapping each target to its source. -/
abbrev CycleCover {α : Type*} (D : α → α → Prop) :=
  {σ : Equiv.Perm α // ∀ j, D (σ j) j}

def splitMatching {α : Type*} {D : α → α → Prop} (σ : CycleCover D) :
    (splitGraph D).Subgraph where
  verts := Set.univ
  Adj x y := match x, y with
    | .inl i, .inr j => σ.1 j = i
    | .inr i, .inl j => σ.1 i = j
    | _, _ => False
  adj_sub := by
    intro x y h
    cases x with
    | inl i =>
      cases y with
      | inl j => exact False.elim h
      | inr j =>
        change D i j
        change σ.1 j = i at h
        simpa only [← h] using σ.2 j
    | inr i =>
      cases y with
      | inl j =>
        change D j i
        change σ.1 i = j at h
        simpa only [← h] using σ.2 i
      | inr j => exact False.elim h
  edge_vert := by intro x y h; exact Set.mem_univ x
  symm := ⟨by intro x y h; cases x <;> cases y <;> exact h⟩

theorem splitMatching_perfect {α : Type*} {D : α → α → Prop} (σ : CycleCover D) :
    (splitMatching σ).IsPerfectMatching := by
  rw [SimpleGraph.Subgraph.isPerfectMatching_iff]
  intro x
  cases x with
  | inl i =>
    refine ⟨Sum.inr (σ.1.symm i), σ.1.apply_symm_apply i, ?_⟩
    intro y hy
    cases y with
    | inl j => exact False.elim hy
    | inr j =>
      have hj : j = σ.1.symm i := σ.1.injective (hy.trans (σ.1.apply_symm_apply i).symm)
      exact congrArg Sum.inr hj
  | inr i =>
    refine ⟨Sum.inl (σ.1 i), rfl, ?_⟩
    intro y hy
    cases y with
    | inl j =>
      change σ.1 i = j at hy
      exact congrArg Sum.inl hy.symm
    | inr j => exact False.elim hy

def cycleCoverToMatching {α : Type*} {D : α → α → Prop} (σ : CycleCover D) :
    PerfectMatching (splitGraph D) := ⟨splitMatching σ, splitMatching_perfect σ⟩

theorem cycleCoverToMatching_injective {α : Type*} {D : α → α → Prop} :
    Function.Injective (cycleCoverToMatching (D := D)) := by
  intro σ τ h
  apply Subtype.ext
  apply Equiv.ext
  intro j
  have hm : splitMatching σ = splitMatching τ := congrArg Subtype.val h
  have hadj : (splitMatching σ).Adj (Sum.inl (σ.1 j)) (Sum.inr j) := rfl
  rw [hm] at hadj
  change τ.1 j = σ.1 j at hadj
  exact hadj.symm

theorem cycleCoverToMatching_surjective {α : Type*} [Finite α] {D : α → α → Prop} :
    Function.Surjective (cycleCoverToMatching (D := D)) := by
  classical
  rintro ⟨M, hM⟩
  have hex : ∀ j : α, ∃ i : α, M.Adj (Sum.inl i) (Sum.inr j) := by
    intro j
    obtain ⟨x, hx, _⟩ := SimpleGraph.Subgraph.isPerfectMatching_iff.mp hM (Sum.inr j)
    cases x with
    | inl i => exact ⟨i, hx.symm⟩
    | inr i => exact False.elim (M.adj_sub hx)
  choose f hf using hex
  have hinj : Function.Injective f := by
    intro i j hij
    have hj : M.Adj (Sum.inl (f i)) (Sum.inr j) := by simpa only [hij] using hf j
    exact Sum.inr.inj (hM.1.eq_of_adj_left (hf i) hj)
  have hsurj : Function.Surjective f := Finite.surjective_of_injective hinj
  let σ : Equiv.Perm α := Equiv.ofBijective f ⟨hinj, hsurj⟩
  have hD : ∀ j, D (σ j) j := fun j => M.adj_sub (hf j)
  have hcross : ∀ i j, M.Adj (Sum.inl i) (Sum.inr j) ↔ f j = i := by
    intro i j
    constructor
    · intro hij
      exact Sum.inl.inj (hM.1.eq_of_adj_right (hf j) hij)
    · intro hij
      simpa only [hij] using hf j
  have hleft : ∀ i j, ¬M.Adj (Sum.inl i) (Sum.inl j) := by
    intro i j hij
    obtain ⟨k, hk⟩ := hsurj i
    have hcross' : M.Adj (Sum.inl i) (Sum.inr k) := by simpa only [hk] using hf k
    have hbad : (Sum.inl j : α ⊕ α) = Sum.inr k := hM.1.eq_of_adj_left hij hcross'
    cases hbad
  refine ⟨⟨σ, hD⟩, ?_⟩
  apply Subtype.ext
  apply SimpleGraph.Subgraph.ext
  · exact hM.2.verts_eq_univ.symm
  · funext x y
    apply propext
    cases x with
    | inl i =>
      cases y with
      | inl j => exact iff_false_intro (hleft i j) |>.symm
      | inr j => exact (hcross i j).symm
    | inr i =>
      cases y with
      | inl j =>
        change f i = j ↔ M.Adj (Sum.inr i) (Sum.inl j)
        rw [M.adj_comm]
        exact (hcross j i).symm
      | inr j =>
        exact ⟨False.elim, fun h => M.adj_sub h⟩

/-- An explicit equivalence proves that the directed model counts genuine matchings. -/
noncomputable def cycleCoverMatchingEquiv {α : Type*} [Finite α] (D : α → α → Prop) :
    CycleCover D ≃ PerfectMatching (splitGraph D) :=
  Equiv.ofBijective cycleCoverToMatching
    ⟨cycleCoverToMatching_injective, cycleCoverToMatching_surjective⟩

theorem perfectMatchingCount_splitGraph {α : Type*} [Finite α] (D : α → α → Prop) :
    perfectMatchingCount (splitGraph D) = Nat.card (CycleCover D) := by
  exact Nat.card_congr (cycleCoverMatchingEquiv D).symm

end HartkeMatchingExcess
