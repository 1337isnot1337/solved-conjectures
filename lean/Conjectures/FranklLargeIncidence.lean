module

public import Mathlib.Algebra.BigOperators.Group.Finset.Basic
public import Mathlib.Data.Fintype.Card

/-! The exact dependency neighborhoods for three-regular linear generating
families. A generator of size `k` has exactly `2*k` distinct neighbors. -/

@[expose] public section

namespace Frankl.Large

open Finset

variable {α ι : Type*} [DecidableEq α] [Fintype ι]

/-- Generator indices containing a point. -/
def incident (G : ι → Finset α) (a : α) : Finset ι :=
  univ.filter fun e => a ∈ G e

@[simp] theorem mem_incident (G : ι → Finset α) (a : α) (e : ι) :
    e ∈ incident G a ↔ a ∈ G e := by simp [incident]

variable [DecidableEq ι]

/-- The other generators containing a given point of `e`. -/
def otherIncident (G : ι → Finset α) (e : ι) (a : α) : Finset ι :=
  (incident G a).erase e

@[simp] theorem mem_otherIncident (G : ι → Finset α) (e : ι) (a : α) (f : ι) :
    f ∈ otherIncident G e a ↔ f ≠ e ∧ a ∈ G f := by
  simp [otherIncident]

/-- Distinct generators meeting `e`. -/
def neighbors (G : ι → Finset α) (e : ι) : Finset ι :=
  univ.filter fun f => f ≠ e ∧ (G e ∩ G f).Nonempty

@[simp] theorem mem_neighbors (G : ι → Finset α) (e f : ι) :
    f ∈ neighbors G e ↔ f ≠ e ∧ (G e ∩ G f).Nonempty := by
  simp [neighbors]

@[simp] theorem self_not_mem_neighbors (G : ι → Finset α) (e : ι) :
    e ∉ neighbors G e := by simp

theorem neighbors_symm (G : ι → Finset α) (e f : ι) :
    f ∈ neighbors G e ↔ e ∈ neighbors G f := by
  simp only [mem_neighbors, ne_comm, inter_comm]

theorem neighbors_eq_biUnion (G : ι → Finset α) (e : ι) :
    neighbors G e = (G e).biUnion (otherIncident G e) := by
  ext f
  simp only [mem_neighbors, mem_biUnion, mem_otherIncident, nonempty_def, mem_inter]
  constructor
  · rintro ⟨hfe, a, hae, haf⟩
    exact ⟨a, hae, hfe, haf⟩
  · rintro ⟨a, hae, hfe, haf⟩
    exact ⟨hfe, a, hae, haf⟩

theorem card_otherIncident (G : ι → Finset α)
    (hregular : ∀ a, (incident G a).card = 3) {e : ι} {a : α} (ha : a ∈ G e) :
    (otherIncident G e a).card = 2 := by
  rw [otherIncident, card_erase_of_mem (mem_incident G a e |>.mpr ha), hregular]

theorem otherIncident_pairwiseDisjoint (G : ι → Finset α)
    (hlinear : ∀ e f, e ≠ f → (G e ∩ G f).card ≤ 1) (e : ι) :
    (G e : Set α).PairwiseDisjoint (otherIncident G e) := by
  intro a ha b hb hab
  apply disjoint_left.mpr
  intro f hfa hfb
  obtain ⟨hfe, haf⟩ := (mem_otherIncident G e a f).mp hfa
  obtain ⟨_, hbf⟩ := (mem_otherIncident G e b f).mp hfb
  exact hab (card_le_one.mp (hlinear e f hfe.symm) a (mem_inter.mpr ⟨ha, haf⟩)
    b (mem_inter.mpr ⟨hb, hbf⟩))

/-- Every point of `e` contributes its own two distinct neighboring
generators; linearity prevents repetitions between different points. -/
theorem card_neighbors (G : ι → Finset α) (k : ℕ)
    (hsize : ∀ e, (G e).card = k)
    (hregular : ∀ a, (incident G a).card = 3)
    (hlinear : ∀ e f, e ≠ f → (G e ∩ G f).card ≤ 1) (e : ι) :
    (neighbors G e).card = 2 * k := by
  rw [neighbors_eq_biUnion, card_biUnion (otherIncident_pairwiseDisjoint G hlinear e)]
  calc
    ∑ a ∈ G e, (otherIncident G e a).card = ∑ _a ∈ G e, 2 :=
      sum_congr rfl (fun a ha => card_otherIncident G hregular ha)
    _ = 2 * k := by simp [hsize, Nat.mul_comm]

/-- The omitted-generator event reads exactly these possible bits. -/
def eventSupport (G : ι → Finset α) (e : ι) : Finset ι :=
  insert e (neighbors G e)

@[simp] theorem mem_eventSupport (G : ι → Finset α) (e f : ι) :
    f ∈ eventSupport G e ↔ f = e ∨ f ∈ neighbors G e := by
  simp [eventSupport]

theorem incident_subset_eventSupport (G : ι → Finset α) {a : α} {e : ι}
    (hae : a ∈ G e) : incident G a ⊆ eventSupport G e := by
  intro f hf
  by_cases hfe : f = e
  · exact mem_eventSupport G e f |>.mpr (Or.inl hfe)
  · apply (mem_eventSupport G e f).mpr
    right
    exact (mem_neighbors G e f).mpr
      ⟨hfe, a, mem_inter.mpr ⟨hae, (mem_incident G a f).mp hf⟩⟩

theorem card_eventSupport (G : ι → Finset α) (k : ℕ)
    (hsize : ∀ e, (G e).card = k)
    (hregular : ∀ a, (incident G a).card = 3)
    (hlinear : ∀ e f, e ≠ f → (G e ∩ G f).card ≤ 1) (e : ι) :
    (eventSupport G e).card = 2 * k + 1 := by
  rw [eventSupport, card_insert_of_notMem (self_not_mem_neighbors G e),
    card_neighbors G k hsize hregular hlinear e]

/-- Events whose support reads one of the bits incident to a point. -/
def pointReaders (G : ι → Finset α) (a : α) : Finset ι :=
  (incident G a).biUnion (eventSupport G)

theorem mem_pointReaders (G : ι → Finset α) (a : α) (f : ι) :
    f ∈ pointReaders G a ↔ (eventSupport G f ∩ incident G a).Nonempty := by
  simp only [pointReaders, mem_biUnion, nonempty_def, mem_inter, mem_eventSupport]
  constructor
  · rintro ⟨e, he, hfe | hfe⟩
    · subst f
      exact ⟨e, Or.inl rfl, he⟩
    · exact ⟨e, Or.inr ((neighbors_symm G e f).mp hfe), he⟩
  · rintro ⟨e, hef | hef, he⟩
    · subst e
      exact ⟨f, he, Or.inl rfl⟩
    · exact ⟨e, he, Or.inr ((neighbors_symm G f e).mp hef)⟩

/-- The point-absence query needs at most `3D` conditioning events, where
`D=2k`. The three bits incident to the point are counted only once. -/
theorem card_pointReaders_le (G : ι → Finset α) (k : ℕ) (hk : 1 ≤ k)
    (hsize : ∀ e, (G e).card = k)
    (hregular : ∀ a, (incident G a).card = 3)
    (hlinear : ∀ e f, e ≠ f → (G e ∩ G f).card ≤ 1) (a : α) :
    (pointReaders G a).card ≤ 3 * (2 * k) := by
  let I := incident G a
  let extra := I.biUnion fun e => eventSupport G e \ I
  have hsubset : pointReaders G a ⊆ I ∪ extra := by
    intro f hf
    obtain ⟨e, he, hfe⟩ := mem_biUnion.mp hf
    by_cases hfi : f ∈ I
    · exact mem_union_left _ hfi
    · exact mem_union_right _ (mem_biUnion.mpr ⟨e, he, mem_sdiff.mpr ⟨hfe, hfi⟩⟩)
  have hcard (e : ι) (he : e ∈ I) :
      (eventSupport G e \ I).card = 2 * k - 2 := by
    have hI : I ⊆ eventSupport G e :=
      incident_subset_eventSupport G ((mem_incident G a e).mp he)
    rw [card_sdiff_of_subset hI, card_eventSupport G k hsize hregular hlinear e,
      show I.card = 3 from hregular a]
    exact Nat.add_sub_add_right (2 * k) 1 2
  have hextra : extra.card ≤ ∑ e ∈ I, (eventSupport G e \ I).card := card_biUnion_le
  have hsum : ∑ e ∈ I, (eventSupport G e \ I).card = 3 * (2 * k - 2) := by
    calc
      ∑ e ∈ I, (eventSupport G e \ I).card = ∑ _e ∈ I, (2 * k - 2) :=
        sum_congr rfl hcard
      _ = 3 * (2 * k - 2) := by simp [show I.card = 3 from hregular a]
  have htwo : 2 ≤ 2 * k := by simpa using Nat.mul_le_mul_left 2 hk
  calc
    (pointReaders G a).card ≤ I.card + extra.card :=
      (card_le_card hsubset).trans (card_union_le I extra)
    _ ≤ 3 + ∑ e ∈ I, (eventSupport G e \ I).card := by
      rw [show I.card = 3 from hregular a]
      exact Nat.add_le_add_left hextra 3
    _ = 3 + 3 * (2 * k - 2) := by rw [hsum]
    _ ≤ 6 + 3 * (2 * k - 2) := Nat.add_le_add_right (by decide) _
    _ = 3 * (2 + (2 * k - 2)) := by rw [Nat.mul_add]
    _ = 3 * (2 * k) := by rw [Nat.add_comm 2, Nat.sub_add_cancel htwo]

end Frankl.Large
