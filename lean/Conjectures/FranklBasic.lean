module

public import Mathlib.Data.Finset.Union
public import Mathlib.Data.Finset.Powerset
public import Mathlib.Data.Finset.Card

@[expose] public section

/-! Distinct generated unions and their actual point frequencies. -/

namespace Frankl

variable {α : Type*} [DecidableEq α]

/-- The union of a selected collection of generators. -/
def generatedUnion (H : Finset (Finset α)) : Finset α := H.biUnion id

/-- Each distinct union is counted once, including the empty union. -/
def generatedUnions (G : Finset (Finset α)) : Finset (Finset α) :=
  G.powerset.image (fun H => H.biUnion id)

/-- The number of members containing a point. -/
def frequency (F : Finset (Finset α)) (x : α) : ℕ :=
  (F.filter (fun U => x ∈ U)).card

/-- A point occurs in at least half of the members. -/
def Abundant (F : Finset (Finset α)) (x : α) : Prop :=
  F.card ≤ 2 * frequency F x

def UnionClosed (F : Finset (Finset α)) : Prop :=
  ∀ A ∈ F, ∀ B ∈ F, A ∪ B ∈ F

/-- A union's canonical selection contains all generators lying inside it. -/
def canonicalGenerators (G : Finset (Finset α)) (U : Finset α) :
    Finset (Finset α) :=
  G.filter (fun A => A ⊆ U)

@[simp] theorem mem_generatedUnion {H : Finset (Finset α)} {x : α} :
    x ∈ generatedUnion H ↔ ∃ A ∈ H, x ∈ A := by
  simp [generatedUnion]

@[simp] theorem generatedUnion_empty : generatedUnion (∅ : Finset (Finset α)) = ∅ := by
  simp [generatedUnion]

@[simp] theorem generatedUnion_singleton (A : Finset α) : generatedUnion {A} = A := by
  simp [generatedUnion]

theorem generatedUnion_union (H K : Finset (Finset α)) :
    generatedUnion (H ∪ K) = generatedUnion H ∪ generatedUnion K := by
  exact Finset.union_biUnion

theorem generatedUnion_mono {H K : Finset (Finset α)} (h : H ⊆ K) :
    generatedUnion H ⊆ generatedUnion K :=
  Finset.biUnion_subset_biUnion_of_subset_left id h

theorem mem_generatedUnions {G : Finset (Finset α)} {U : Finset α} :
    U ∈ generatedUnions G ↔ ∃ H ⊆ G, H.biUnion id = U := by
  simp only [generatedUnions, Finset.mem_image, Finset.mem_powerset]

theorem generatedUnion_mem_generatedUnions {G H : Finset (Finset α)} (h : H ⊆ G) :
    generatedUnion H ∈ generatedUnions G :=
  mem_generatedUnions.mpr ⟨H, h, rfl⟩

@[simp] theorem empty_mem_generatedUnions (G : Finset (Finset α)) :
    ∅ ∈ generatedUnions G :=
  mem_generatedUnions.mpr ⟨∅, Finset.empty_subset _, by simp⟩

theorem generator_mem_generatedUnions {G : Finset (Finset α)} {A : Finset α}
    (hA : A ∈ G) : A ∈ generatedUnions G :=
  mem_generatedUnions.mpr ⟨{A}, Finset.singleton_subset_iff.mpr hA, by simp⟩

theorem generatedUnions_mono {G H : Finset (Finset α)} (h : G ⊆ H) :
    generatedUnions G ⊆ generatedUnions H := by
  intro U hU
  obtain ⟨K, hK, rfl⟩ := mem_generatedUnions.mp hU
  exact mem_generatedUnions.mpr ⟨K, hK.trans h, rfl⟩

theorem generatedUnions_union_closed (G : Finset (Finset α)) :
    UnionClosed (generatedUnions G) := by
  intro A hA B hB
  obtain ⟨H, hH, rfl⟩ := mem_generatedUnions.mp hA
  obtain ⟨K, hK, rfl⟩ := mem_generatedUnions.mp hB
  exact mem_generatedUnions.mpr
    ⟨H ∪ K, Finset.union_subset hH hK, Finset.union_biUnion⟩

@[simp] theorem mem_canonicalGenerators {G : Finset (Finset α)} {U A : Finset α} :
    A ∈ canonicalGenerators G U ↔ A ∈ G ∧ A ⊆ U := by
  simp [canonicalGenerators]

theorem canonicalGenerators_subset (G : Finset (Finset α)) (U : Finset α) :
    canonicalGenerators G U ⊆ G := Finset.filter_subset _ _

theorem generatedUnion_canonicalGenerators {G : Finset (Finset α)} {U : Finset α}
    (hU : U ∈ generatedUnions G) : generatedUnion (canonicalGenerators G U) = U := by
  apply Finset.Subset.antisymm
  · intro x hx
    obtain ⟨A, hA, hx⟩ := mem_generatedUnion.mp hx
    exact (mem_canonicalGenerators.mp hA).2 hx
  · obtain ⟨H, hH, rfl⟩ := mem_generatedUnions.mp hU
    intro x hx
    obtain ⟨A, hA, hx⟩ := Finset.mem_biUnion.mp hx
    apply mem_generatedUnion.mpr
    exact ⟨A, mem_canonicalGenerators.mpr
      ⟨hH hA, Finset.subset_biUnion_of_mem id hA⟩, hx⟩

theorem mem_generatedUnions_iff_canonical {G : Finset (Finset α)} {U : Finset α} :
    U ∈ generatedUnions G ↔ generatedUnion (canonicalGenerators G U) = U := by
  constructor
  · exact generatedUnion_canonicalGenerators
  · intro h
    exact mem_generatedUnions.mpr ⟨canonicalGenerators G U,
      canonicalGenerators_subset G U, h⟩

theorem canonicalGenerators_injOn (G : Finset (Finset α)) :
    Set.InjOn (canonicalGenerators G) (generatedUnions G : Set (Finset α)) := by
  intro U hU V hV h
  calc
    U = generatedUnion (canonicalGenerators G U) :=
      (generatedUnion_canonicalGenerators hU).symm
    _ = generatedUnion (canonicalGenerators G V) := congrArg generatedUnion h
    _ = V := generatedUnion_canonicalGenerators hV

theorem frequency_le_card (F : Finset (Finset α)) (x : α) : frequency F x ≤ F.card :=
  Finset.card_filter_le _ _

theorem frequency_add_missing (F : Finset (Finset α)) (x : α) :
    frequency F x + (F.filter (fun U => x ∉ U)).card = F.card :=
  Finset.card_filter_add_card_filter_not (fun U => x ∈ U)

end Frankl
