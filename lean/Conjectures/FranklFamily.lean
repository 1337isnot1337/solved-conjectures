module

public import Mathlib.Data.Finset.Powerset
public import Mathlib.Data.Finset.Union
public import Mathlib.Algebra.BigOperators.Group.Finset.Basic
public import Mathlib.Tactic.Tauto

/-! Distinct unions of a finite generating family. The image construction
counts each resulting set once, independently of its representations. -/
@[expose] public section

namespace FranklLocal

variable {α : Type*} [DecidableEq α]

def unionOf (H : Finset (Finset α)) : Finset α := H.biUnion id

@[simp] theorem mem_unionOf {H : Finset (Finset α)} {x : α} :
    x ∈ unionOf H ↔ ∃ g ∈ H, x ∈ g := by
  simp [unionOf]

def family (G : Finset (Finset α)) : Finset (Finset α) := G.powerset.image unionOf

theorem mem_family {G : Finset (Finset α)} {U : Finset α} :
    U ∈ family G ↔ ∃ H ⊆ G, unionOf H = U := by
  simp [family, Finset.mem_powerset]

theorem unionOf_mem_family {G H : Finset (Finset α)} (h : H ⊆ G) :
    unionOf H ∈ family G := mem_family.mpr ⟨H,h,rfl⟩

theorem mem_family_iff_covered {G : Finset (Finset α)} {U : Finset α} :
    U ∈ family G ↔ ∀ x ∈ U, ∃ g ∈ G, g ⊆ U ∧ x ∈ g := by
  constructor
  · rintro h x hx
    obtain ⟨H,hHG,rfl⟩ := mem_family.mp h
    obtain ⟨g,hg,hxg⟩ := mem_unionOf.mp hx
    exact ⟨g,hHG hg,fun y hy => mem_unionOf.mpr ⟨g,hg,hy⟩,hxg⟩
  · intro h
    refine mem_family.mpr ⟨G.filter (fun g => g ⊆ U),Finset.filter_subset _ _,?_⟩
    ext x
    constructor
    · intro hx
      obtain ⟨g,hg,hxg⟩ := mem_unionOf.mp hx
      exact (Finset.mem_filter.mp hg).2 hxg
    · intro hx
      obtain ⟨g,hg,hgU,hxg⟩ := h x hx
      exact mem_unionOf.mpr ⟨g,Finset.mem_filter.mpr ⟨hg,hgU⟩,hxg⟩

@[simp] theorem empty_mem_family (G : Finset (Finset α)) : ∅ ∈ family G := by
  apply mem_family_iff_covered.mpr
  simp

theorem generator_mem_family {G : Finset (Finset α)} {g : Finset α}
    (hg : g ∈ G) : g ∈ family G := by
  exact mem_family_iff_covered.mpr (fun x hx => ⟨g,hg,Finset.Subset.refl _,hx⟩)

theorem union_mem_family {G : Finset (Finset α)} {U V : Finset α}
    (hU : U ∈ family G) (hV : V ∈ family G) : U ∪ V ∈ family G := by
  apply mem_family_iff_covered.mpr
  intro x hx
  rcases Finset.mem_union.mp hx with hx | hx
  · obtain ⟨g,hg,hgU,hxg⟩ := mem_family_iff_covered.mp hU x hx
    exact ⟨g,hg,fun y hy => Finset.mem_union_left _ (hgU hy),hxg⟩
  · obtain ⟨g,hg,hgV,hxg⟩ := mem_family_iff_covered.mp hV x hx
    exact ⟨g,hg,fun y hy => Finset.mem_union_right _ (hgV hy),hxg⟩

theorem family_mono {G H : Finset (Finset α)} (h : G ⊆ H) :
    family G ⊆ family H := by
  intro U hU
  obtain ⟨K,hKG,hKU⟩ := mem_family.mp hU
  exact mem_family.mpr ⟨K,Finset.Subset.trans hKG h,hKU⟩

def interior (W U : Finset α) : Finset α := U ∩ W

def exterior (W U : Finset α) : Finset α := U \ W

theorem interior_union_exterior (W U : Finset α) :
    interior W U ∪ exterior W U = U := by
  ext x
  simp only [interior,exterior,Finset.mem_union,Finset.mem_inter,Finset.mem_sdiff]
  tauto

theorem eq_of_traces_eq {W U V : Finset α}
    (hi : interior W U=interior W V) (he : exterior W U=exterior W V) : U=V := by
  rw [← interior_union_exterior W U,hi,he,interior_union_exterior]

end FranklLocal
