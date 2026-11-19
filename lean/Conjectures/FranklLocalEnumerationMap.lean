module

public import Conjectures.FranklLocalEnumeration

/-! Transport distinct unions under arbitrary maps. Injective maps also
transport local weight certificates without changing their counts. -/
@[expose] public section

namespace FranklLocal

open scoped BigOperators

variable {α β : Type*} [DecidableEq α] [DecidableEq β]

def imageFamily (f : α → β) (G : Finset (Finset α)) : Finset (Finset β) :=
  G.image (fun g => g.image f)

theorem unionOf_imageFamily (f : α → β) (G : Finset (Finset α)) :
    unionOf (imageFamily f G)=(unionOf G).image f := by
  ext y
  constructor
  · intro hy
    obtain ⟨h,hh,hyh⟩ := mem_unionOf.mp hy
    obtain ⟨g,hg,rfl⟩ := Finset.mem_image.mp hh
    obtain ⟨x,hxg,rfl⟩ := Finset.mem_image.mp hyh
    exact Finset.mem_image.mpr ⟨x,mem_unionOf.mpr ⟨g,hg,hxg⟩,rfl⟩
  · intro hy
    obtain ⟨x,hx,rfl⟩ := Finset.mem_image.mp hy
    obtain ⟨g,hg,hxg⟩ := mem_unionOf.mp hx
    exact mem_unionOf.mpr ⟨g.image f,Finset.mem_image.mpr ⟨g,hg,rfl⟩,
      Finset.mem_image_of_mem f hxg⟩

/-- This identity allows collisions in the point map. Both sides still
count distinct resulting unions, not generating representations. -/
theorem family_imageFamily (f : α → β) (G : Finset (Finset α)) :
    family (imageFamily f G)=imageFamily f (family G) := by
  ext U
  constructor
  · intro hU
    obtain ⟨H,hHG,hHU⟩ := mem_family.mp hU
    obtain ⟨K,hKG,hKI⟩ := Finset.subset_image_iff.mp hHG
    apply Finset.mem_image.mpr
    refine ⟨unionOf K,unionOf_mem_family hKG,?_⟩
    rw [← unionOf_imageFamily f K]
    change unionOf (K.image (fun g => g.image f))=U
    rw [hKI,hHU]
  · intro hU
    obtain ⟨L,hL,rfl⟩ := Finset.mem_image.mp hU
    obtain ⟨K,hKG,rfl⟩ := mem_family.mp hL
    exact mem_family.mpr
      ⟨imageFamily f K,Finset.image_subset_image hKG,unionOf_imageFamily f K⟩

theorem localGenerators_image (f : α → β) (hf : Function.Injective f)
    (G : Finset (Finset α)) (W : Finset α) :
    localGenerators (imageFamily f G) (W.image f)=imageFamily f (localGenerators G W) := by
  simp only [localGenerators,imageFamily,Finset.filter_image,Finset.disjoint_image hf]

theorem boundary_image (f : α → β) (hf : Function.Injective f)
    (G : Finset (Finset α)) (W : Finset α) :
    boundary (imageFamily f G) (W.image f)=(boundary G W).image f := by
  unfold boundary
  rw [localGenerators_image f hf,unionOf_imageFamily]
  exact (Finset.image_sdiff _ _ hf).symm

theorem exterior_image (f : α → β) (hf : Function.Injective f) (W L : Finset α) :
    exterior (W.image f) (L.image f)=(exterior W L).image f :=
  (Finset.image_sdiff L W hf).symm

theorem interior_image (f : α → β) (hf : Function.Injective f) (W L : Finset α) :
    interior (W.image f) (L.image f)=(interior W L).image f :=
  (Finset.image_inter L W hf).symm

theorem compatible_image (f : α → β) (hf : Function.Injective f)
    (G : Finset (Finset α)) (W E M : Finset α) :
    compatible (imageFamily f G) (W.image f) (E.image f) (M.image f)=
      imageFamily f (compatible G W E M) := by
  ext S
  constructor
  · intro hS
    obtain ⟨L,hL,hML,hLE,hLS⟩ := mem_compatible.mp hS
    rw [localGenerators_image f hf,family_imageFamily] at hL
    obtain ⟨L0,hL0,rfl⟩ := Finset.mem_image.mp hL
    rw [exterior_image f hf] at hML hLE
    apply Finset.mem_image.mpr
    refine ⟨interior W L0,mem_compatible.mpr ⟨L0,hL0,
      (Finset.image_subset_image_iff hf).mp hML,
      (Finset.image_subset_image_iff hf).mp hLE,rfl⟩,?_⟩
    exact (interior_image f hf W L0).symm.trans hLS
  · intro hS
    obtain ⟨S0,hS0,rfl⟩ := Finset.mem_image.mp hS
    obtain ⟨L0,hL0,hML,hLE,hLS⟩ := mem_compatible.mp hS0
    apply mem_compatible.mpr
    refine ⟨L0.image f,?_,?_,?_,?_⟩
    · rw [localGenerators_image f hf,family_imageFamily]
      exact Finset.mem_image.mpr ⟨L0,hL0,rfl⟩
    · rw [exterior_image f hf]
      exact Finset.image_subset_image hML
    · rw [exterior_image f hf]
      exact Finset.image_subset_image hLE
    · rw [interior_image f hf,hLS]

theorem imbalance_image (f : α → β) (hf : Function.Injective f)
    (W S : Finset α) (w : α → ℝ) (v : β → ℝ)
    (hv : ∀ x ∈ W, v (f x)=w x) :
    imbalance (W.image f) v (S.image f)=imbalance W w S := by
  unfold imbalance
  rw [Finset.sum_image hf.injOn]
  apply Finset.sum_congr rfl
  intro x hx
  have hmem : f x ∈ S.image f ↔ x ∈ S := by
    constructor
    · intro h
      obtain ⟨y,hy,hyx⟩ := Finset.mem_image.mp h
      exact hf hyx ▸ hy
    · exact Finset.mem_image_of_mem f
  simp only [hmem,hv x hx]

theorem WeightCertificate.image {G : Finset (Finset α)} {W : Finset α}
    {w : α → ℝ} (hc : WeightCertificate G W w)
    (f : α → β) (hf : Function.Injective f) (v : β → ℝ)
    (hv : ∀ x ∈ W, v (f x)=w x) :
    WeightCertificate (imageFamily f G) (W.image f) v := by
  intro E M hME hEB
  rw [boundary_image f hf] at hEB
  obtain ⟨E0,hE0,rfl⟩ := Finset.subset_image_iff.mp hEB
  obtain ⟨M0,hM0,rfl⟩ := Finset.subset_image_iff.mp hME
  rw [compatible_image f hf]
  unfold imageFamily
  rw [Finset.sum_image (Finset.image_injective hf).injOn]
  have h := hc E0 M0 hM0 hE0
  simpa only [imbalance_image f hf W _ w v hv] using h

/-- A local certificate can be reused inside any larger ground set through
an injective point embedding and an extension of its weights. -/
theorem image_certificate_abundance {G : Finset (Finset α)} {W : Finset α}
    {w : α → ℝ} (hc : WeightCertificate G W w)
    (hw : ∀ x ∈ W, 0 ≤ w x) (hpos : ∃ x ∈ W, 0 < w x)
    (f : α → β) (hf : Function.Injective f) (v : β → ℝ)
    (hv : ∀ x ∈ W, v (f x)=w x) :
    ∃ y ∈ W.image f, Abundant (family (imageFamily f G)) y := by
  apply abundant_of_total_imbalance (w:=v)
  · intro y hy
    obtain ⟨x,hx,rfl⟩ := Finset.mem_image.mp hy
    rw [hv x hx]
    exact hw x hx
  · obtain ⟨x,hx,hxpos⟩ := hpos
    exact ⟨f x,Finset.mem_image_of_mem f hx,by simpa only [hv x hx] using hxpos⟩
  · exact weightCertificate_total (hc.image f hf v hv)

end FranklLocal
