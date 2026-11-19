module

public import Conjectures.FranklFamily
public import Conjectures.FranklLargeSelection

/-! Canonical index selections are in bijection with the actual distinct
unions. Repeated and empty generators are allowed. -/
@[expose] public section

namespace Frankl.Large

variable {α ι : Type*} [DecidableEq α] [Fintype ι]

def canonicalFor (G : ι → Finset α) (U : Finset α) : Finset ι :=
  Finset.univ.filter (fun e => G e ⊆ U)

@[simp] theorem mem_canonicalFor (G : ι → Finset α) (U : Finset α) (e : ι) :
    e ∈ canonicalFor G U ↔ G e ⊆ U := by simp [canonicalFor]

variable [DecidableEq ι]

def canonicalSelections (G : ι → Finset α) : Finset (Finset ι) :=
  Finset.univ.filter (fun s => ∀ e, e ∈ s ↔ G e ⊆ generated G s)

@[simp] theorem mem_canonicalSelections (G : ι → Finset α) (s : Finset ι) :
    s ∈ canonicalSelections G ↔ canonical G s := by
  simp [canonicalSelections,canonical]

omit [Fintype ι] [DecidableEq ι] in
theorem unionOf_image (G : ι → Finset α) (s : Finset ι) :
    FranklLocal.unionOf (s.image G)=generated G s := by
  ext a
  simp [FranklLocal.unionOf,generated]

omit [DecidableEq ι] in
theorem generated_mem_family (G : ι → Finset α) (s : Finset ι) :
    generated G s ∈ FranklLocal.family (Finset.univ.image G) := by
  apply FranklLocal.mem_family.mpr
  refine ⟨s.image G,?_,unionOf_image G s⟩
  intro g hg
  obtain ⟨e,_,rfl⟩ := Finset.mem_image.mp hg
  exact Finset.mem_image_of_mem G (Finset.mem_univ e)

omit [DecidableEq ι] in
theorem generated_canonicalFor {G : ι → Finset α} {U : Finset α}
    (hU : U ∈ FranklLocal.family (Finset.univ.image G)) :
    generated G (canonicalFor G U)=U := by
  ext a
  constructor
  · intro ha
    obtain ⟨e,he,hae⟩ := (mem_generated G (canonicalFor G U) a).mp ha
    exact (mem_canonicalFor G U e).mp he hae
  · intro ha
    obtain ⟨g,hg,hgU,hag⟩ := FranklLocal.mem_family_iff_covered.mp hU a ha
    obtain ⟨e,_,rfl⟩ := Finset.mem_image.mp hg
    exact (mem_generated G (canonicalFor G U) a).mpr
      ⟨e,(mem_canonicalFor G U e).mpr hgU,hag⟩

omit [DecidableEq ι] in
theorem canonical_canonicalFor {G : ι → Finset α} {U : Finset α}
    (hU : U ∈ FranklLocal.family (Finset.univ.image G)) :
    canonical G (canonicalFor G U) := by
  intro e
  rw [generated_canonicalFor hU]
  exact mem_canonicalFor G U e

omit [DecidableEq ι] in
theorem canonicalFor_generated {G : ι → Finset α} {s : Finset ι}
    (hs : canonical G s) : canonicalFor G (generated G s)=s := by
  ext e
  exact (mem_canonicalFor G (generated G s) e).trans (hs e).symm

omit [Fintype ι] [DecidableEq ι] in
theorem generated_injective_on_canonical {G : ι → Finset α} {s t : Finset ι}
    (hs : canonical G s) (ht : canonical G t)
    (h : generated G s=generated G t) : s=t := by
  ext e
  exact (hs e).trans (by rw [h]; exact (ht e).symm)

omit [DecidableEq ι] in
theorem indexed_family (G : ι → Finset α) :
    FranklLocal.family (Finset.univ.image G)=
      (Finset.univ:Finset (Finset ι)).image (generated G) := by
  ext U
  constructor
  · intro hU
    exact Finset.mem_image.mpr
      ⟨canonicalFor G U,Finset.mem_univ _,generated_canonicalFor hU⟩
  · intro hU
    obtain ⟨s,_,rfl⟩ := Finset.mem_image.mp hU
    exact generated_mem_family G s

theorem canonical_image_family (G : ι → Finset α) :
    (canonicalSelections G).image (generated G)=
      FranklLocal.family (Finset.univ.image G) := by
  ext U
  constructor
  · intro hU
    obtain ⟨s,_,rfl⟩ := Finset.mem_image.mp hU
    exact generated_mem_family G s
  · intro hU
    exact Finset.mem_image.mpr ⟨canonicalFor G U,
      (mem_canonicalSelections G _).mpr (canonical_canonicalFor hU),
      generated_canonicalFor hU⟩

theorem canonicalSelections_nonempty (G : ι → Finset α) :
    (canonicalSelections G).Nonempty :=
  ⟨canonicalFor G ∅,(mem_canonicalSelections G _).mpr
    (canonical_canonicalFor (FranklLocal.empty_mem_family _))⟩

theorem canonical_card_eq_distinct_unions (G : ι → Finset α) :
    (canonicalSelections G).card=(FranklLocal.family (Finset.univ.image G)).card := by
  rw [← canonical_image_family G]
  symm
  apply Finset.card_image_of_injOn
  intro s hs t ht h
  exact generated_injective_on_canonical
    ((mem_canonicalSelections G s).mp hs) ((mem_canonicalSelections G t).mp ht) h

/-- The bijection also preserves every condition on the resulting union,
including the event that a specified point is absent. -/
theorem canonical_filtered_card (G : ι → Finset α) (P : Finset α → Prop)
    [DecidablePred P] :
    ((canonicalSelections G).filter (fun s => P (generated G s))).card=
      ((FranklLocal.family (Finset.univ.image G)).filter P).card := by
  have himage :
      ((canonicalSelections G).filter (fun s => P (generated G s))).image (generated G)=
        (FranklLocal.family (Finset.univ.image G)).filter P := by
    ext U
    constructor
    · intro hU
      obtain ⟨s,hs,rfl⟩ := Finset.mem_image.mp hU
      exact Finset.mem_filter.mpr ⟨generated_mem_family G s,(Finset.mem_filter.mp hs).2⟩
    · intro hU
      obtain ⟨hUF,hUP⟩ := Finset.mem_filter.mp hU
      refine Finset.mem_image.mpr ⟨canonicalFor G U,?_,generated_canonicalFor hUF⟩
      apply Finset.mem_filter.mpr
      exact ⟨(mem_canonicalSelections G _).mpr (canonical_canonicalFor hUF),
        by simpa only [generated_canonicalFor hUF] using hUP⟩
  rw [← himage]
  symm
  apply Finset.card_image_of_injOn
  intro s hs t ht h
  exact generated_injective_on_canonical
    ((mem_canonicalSelections G s).mp (Finset.mem_filter.mp hs).1)
    ((mem_canonicalSelections G t).mp (Finset.mem_filter.mp ht).1) h

theorem canonicalSelections_eq_avoiding_bad (G : ι → Finset α) :
    canonicalSelections G=Finset.univ.filter (fun s => ∀ e, ¬ Bad G e s) := by
  ext s
  simp [canonical_iff_no_bad]

end Frankl.Large
