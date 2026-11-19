module

public import Mathlib.Combinatorics.SimpleGraph.Clique
public import Mathlib.Data.Fintype.Card
public import Mathlib.SetTheory.Cardinal.Finite

@[expose] public section

/-!
# Distinct generated unions and maximal independent sets

This file proves the incidence-graph correspondence used in the high-girth
generator result. The correspondence is between distinct unions, not between
the possibly many generator selections with a given union. It includes the
empty union and applies to indexed collections with repeated generators.
-/

namespace FranklIncidence

variable {α ι V : Type*}

/-- A set obtained as the union of an arbitrary selection of generators. -/
def IsGeneratedUnion (gen : ι → Set α) (U : Set α) : Prop :=
  ∃ J : Set ι, ∀ x, x ∈ U ↔ ∃ i ∈ J, x ∈ gen i

/-- The bipartite membership graph, with point vertices on the left. -/
def incidenceGraph (gen : ι → Set α) : SimpleGraph (α ⊕ ι) where
  Adj
    | .inl x, .inr i => x ∈ gen i
    | .inr i, .inl x => x ∈ gen i
    | _, _ => False
  symm := ⟨by rintro (x | i) (y | j) <;> simp⟩
  loopless := ⟨by rintro (x | i) <;> simp⟩

@[simp] theorem incidenceGraph_adj_left_right (gen : ι → Set α) (x : α) (i : ι) :
    (incidenceGraph gen).Adj (.inl x) (.inr i) ↔ x ∈ gen i := Iff.rfl

@[simp] theorem incidenceGraph_adj_right_left (gen : ι → Set α) (i : ι) (x : α) :
    (incidenceGraph gen).Adj (.inr i) (.inl x) ↔ x ∈ gen i := Iff.rfl

@[simp] theorem incidenceGraph_not_adj_left (gen : ι → Set α) (x y : α) :
    ¬(incidenceGraph gen).Adj (.inl x) (.inl y) := id

@[simp] theorem incidenceGraph_not_adj_right (gen : ι → Set α) (i j : ι) :
    ¬(incidenceGraph gen).Adj (.inr i) (.inr j) := id

/-- A maximal independent set is precisely an independent dominating set. -/
theorem maximal_independent_iff (G : SimpleGraph V) (S : Set V) :
    Maximal G.IsIndepSet S ↔
      G.IsIndepSet S ∧ ∀ v ∉ S, ∃ w ∈ S, G.Adj v w := by
  classical
  constructor
  · intro h
    refine ⟨h.1, ?_⟩
    intro v hv
    by_contra! hn
    have hi : G.IsIndepSet (insert v S) := by
      intro a ha b hb hab
      rcases ha with rfl | ha <;> rcases hb with rfl | hb
      · exact (hab rfl).elim
      · exact hn b hb
      · exact fun hAdj => hn a ha hAdj.symm
      · exact h.1 ha hb hab
    have hs := h.2 hi (Set.subset_insert v S)
    exact hv (hs (Set.mem_insert v S))
  · rintro ⟨hi, hd⟩
    refine ⟨hi, ?_⟩
    intro T hT hST v hv
    by_contra hvs
    obtain ⟨w, hw, hvw⟩ := hd v hvs
    exact hT hv (hST hw) hvw.ne hvw

/-- A generated union is exactly a set covered by the generators it contains. -/
theorem isGeneratedUnion_iff (gen : ι → Set α) (U : Set α) :
    IsGeneratedUnion gen U ↔ ∀ x ∈ U, ∃ i, gen i ⊆ U ∧ x ∈ gen i := by
  constructor
  · rintro ⟨J, hJ⟩ x hx
    obtain ⟨i, hi, hxi⟩ := (hJ x).mp hx
    exact ⟨i, fun y hy => (hJ y).mpr ⟨i, hi, hy⟩, hxi⟩
  · intro h
    refine ⟨{i | gen i ⊆ U}, ?_⟩
    intro x
    constructor
    · exact h x
    · rintro ⟨i, hi, hxi⟩
      exact hi hxi

/-- Select absent points and every generator contained in the union. -/
def canonicalIndependentSet (gen : ι → Set α) (U : Set α) : Set (α ⊕ ι)
  | .inl x => x ∉ U
  | .inr i => gen i ⊆ U

@[simp] theorem point_mem_canonical (gen : ι → Set α) (U : Set α) (x : α) :
    .inl x ∈ canonicalIndependentSet gen U ↔ x ∉ U := Iff.rfl

@[simp] theorem generator_mem_canonical (gen : ι → Set α) (U : Set α) (i : ι) :
    .inr i ∈ canonicalIndependentSet gen U ↔ gen i ⊆ U := Iff.rfl

theorem canonical_independent (gen : ι → Set α) (U : Set α) :
    (incidenceGraph gen).IsIndepSet (canonicalIndependentSet gen U) := by
  rintro (x | i) hx (y | j) hy hne
  · exact id
  · exact fun h => hx (hy h)
  · exact fun h => hy (hx h)
  · exact id

/-- No domination assumption is concealed in the map from generated unions. -/
theorem canonical_maximal (gen : ι → Set α) (U : Set α)
    (hU : IsGeneratedUnion gen U) :
    Maximal (incidenceGraph gen).IsIndepSet (canonicalIndependentSet gen U) := by
  classical
  rw [maximal_independent_iff]
  refine ⟨canonical_independent gen U, ?_⟩
  rintro (x | i) h
  · have hx : x ∈ U := by simpa using h
    obtain ⟨i, hi, hxi⟩ := (isGeneratedUnion_iff gen U).mp hU x hx
    exact ⟨.inr i, hi, hxi⟩
  · have hi : ¬gen i ⊆ U := h
    obtain ⟨x, hxi, hx⟩ := Set.not_subset.mp hi
    exact ⟨.inl x, hx, hxi⟩

/-- Recover a union from the point vertices absent from an independent set. -/
def unionOfIndependentSet (S : Set (α ⊕ ι)) : Set α :=
  {x | .inl x ∉ S}

@[simp] theorem mem_unionOfIndependentSet (S : Set (α ⊕ ι)) (x : α) :
    x ∈ unionOfIndependentSet S ↔ .inl x ∉ S := Iff.rfl

theorem independent_generator_subset (gen : ι → Set α) (S : Set (α ⊕ ι))
    (hS : (incidenceGraph gen).IsIndepSet S) {i : ι} (hi : .inr i ∈ S) :
    gen i ⊆ unionOfIndependentSet S := by
  intro x hx hxs
  exact hS hxs hi (by simp) hx

theorem unionOfIndependentSet_generated (gen : ι → Set α) (S : Set (α ⊕ ι))
    (hS : Maximal (incidenceGraph gen).IsIndepSet S) :
    IsGeneratedUnion gen (unionOfIndependentSet S) := by
  rw [isGeneratedUnion_iff]
  intro x hx
  obtain ⟨v, hv, hxv⟩ := (maximal_independent_iff _ _).mp hS |>.2 (.inl x) hx
  cases v with
  | inl y => exact hxv.elim
  | inr i => exact ⟨i, independent_generator_subset gen S hS.1 hv, hxv⟩

@[simp] theorem unionOfIndependentSet_canonical (gen : ι → Set α) (U : Set α) :
    unionOfIndependentSet (canonicalIndependentSet gen U) = U := by
  classical
  ext x
  simp

theorem canonical_unionOfIndependentSet (gen : ι → Set α) (S : Set (α ⊕ ι))
    (hS : Maximal (incidenceGraph gen).IsIndepSet S) :
    canonicalIndependentSet gen (unionOfIndependentSet S) = S := by
  classical
  ext v
  cases v with
  | inl x => simp
  | inr i =>
      change gen i ⊆ unionOfIndependentSet S ↔ .inr i ∈ S
      constructor
      · intro hi
        by_contra hni
        obtain ⟨v, hv, hiv⟩ := (maximal_independent_iff _ _).mp hS |>.2 (.inr i) hni
        cases v with
        | inl x => exact hi hiv hv
        | inr j => exact hiv.elim
      · exact independent_generator_subset gen S hS.1

/-- The incidence correspondence is an actual bijection on distinct unions. -/
def generatedUnionEquivMaximalIndependentSet (gen : ι → Set α) :
    {U : Set α // IsGeneratedUnion gen U} ≃
      {S : Set (α ⊕ ι) // Maximal (incidenceGraph gen).IsIndepSet S} where
  toFun U := ⟨canonicalIndependentSet gen U.1, canonical_maximal gen U.1 U.2⟩
  invFun S := ⟨unionOfIndependentSet S.1, unionOfIndependentSet_generated gen S.1 S.2⟩
  left_inv U := Subtype.ext (unionOfIndependentSet_canonical gen U.1)
  right_inv S := Subtype.ext (canonical_unionOfIndependentSet gen S.1 S.2)

/-- The point-absence event is preserved exactly by the bijection. -/
theorem absent_iff_occupied (gen : ι → Set α)
    (U : {U : Set α // IsGeneratedUnion gen U}) (x : α) :
    x ∉ U.1 ↔ .inl x ∈ (generatedUnionEquivMaximalIndependentSet gen U).1 := Iff.rfl

/-- Restrict the correspondence to the absence event for one point. -/
def absentUnionEquivOccupiedIndependentSet (gen : ι → Set α) (x : α) :
    {U : {U : Set α // IsGeneratedUnion gen U} // x ∉ U.1} ≃
      {S : {S : Set (α ⊕ ι) // Maximal (incidenceGraph gen).IsIndepSet S} //
        .inl x ∈ S.1} :=
  (generatedUnionEquivMaximalIndependentSet gen).subtypeEquiv
    (fun U => absent_iff_occupied gen U x)

theorem generatedUnion_card_eq (gen : ι → Set α) :
    Nat.card {U : Set α // IsGeneratedUnion gen U} =
      Nat.card {S : Set (α ⊕ ι) // Maximal (incidenceGraph gen).IsIndepSet S} :=
  Nat.card_congr (generatedUnionEquivMaximalIndependentSet gen)

theorem absentUnion_card_eq (gen : ι → Set α) (x : α) :
    Nat.card {U : {U : Set α // IsGeneratedUnion gen U} // x ∉ U.1} =
      Nat.card {S : {S : Set (α ⊕ ι) // Maximal (incidenceGraph gen).IsIndepSet S} //
        .inl x ∈ S.1} :=
  Nat.card_congr (absentUnionEquivOccupiedIndependentSet gen x)

/-- For a finite generator index, the set-based semantics is finite `biUnion`. -/
theorem isGeneratedUnion_finset_iff [Fintype ι] [DecidableEq α]
    (gen : ι → Finset α) (U : Finset α) :
    IsGeneratedUnion (fun i => (gen i : Set α)) (U : Set α) ↔
      ∃ J : Finset ι, J.biUnion gen = U := by
  classical
  constructor
  · intro hU
    refine ⟨Finset.univ.filter (fun i => gen i ⊆ U), ?_⟩
    ext x
    simp only [Finset.mem_biUnion, Finset.mem_filter, Finset.mem_univ, true_and]
    constructor
    · rintro ⟨i, hi, hx⟩
      exact hi hx
    · intro hx
      obtain ⟨i, hi, hxi⟩ :=
        (isGeneratedUnion_iff (fun i => (gen i : Set α)) (U : Set α)).mp hU x hx
      exact ⟨i, hi, hxi⟩
  · rintro ⟨J, rfl⟩
    refine ⟨(J : Set ι), ?_⟩
    intro x
    simp

end FranklIncidence
