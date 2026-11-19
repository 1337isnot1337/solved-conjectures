module

public import Conjectures.FranklLocalEnumerationMap

/-! Local weight certificates can be transported by maps that are injective
only on the finite support of the generators and the chosen window. -/
@[expose] public section

namespace FranklLocal

open scoped BigOperators

variable {α β : Type*} [DecidableEq α] [DecidableEq β]

/-- Pull back a certificate through an injective map. The finite family of
compatible patterns is transported exactly, so its sum has no multiplicities. -/
theorem WeightCertificate.of_image {G : Finset (Finset α)} {W : Finset α}
    {f : α → β} {v : β → ℝ}
    (hc : WeightCertificate (imageFamily f G) (W.image f) v)
    (hf : Function.Injective f) (w : α → ℝ)
    (hv : ∀ x ∈ W, v (f x) = w x) : WeightCertificate G W w := by
  intro E M hME hEB
  have h := hc (E.image f) (M.image f) (Finset.image_subset_image hME) (by
    rw [boundary_image f hf]
    exact Finset.image_subset_image hEB)
  rw [compatible_image f hf] at h
  unfold imageFamily at h
  rw [Finset.sum_image (Finset.image_injective hf).injOn] at h
  simpa only [imbalance_image f hf W _ w v hv] using h

namespace FiniteSupport

/-- Restrict a set to the subtype of a specified finite support. -/
def restrictSet (A U : Finset α) : Finset {x : α // x ∈ A} :=
  U.subtype (fun x => x ∈ A)

/-- Restrict every generator to the same finite subtype. -/
def restrictFamily (A : Finset α) (G : Finset (Finset α)) :
    Finset (Finset {x : α // x ∈ A}) := G.image (restrictSet A)

theorem image_restrictSet {A U : Finset α} (hU : U ⊆ A) :
    (restrictSet A U).image Subtype.val = U := by
  ext x
  constructor
  · intro hx
    obtain ⟨y, hy, rfl⟩ := Finset.mem_image.mp hx
    exact Finset.mem_subtype.mp hy
  · intro hx
    exact Finset.mem_image.mpr
      ⟨⟨x, hU hx⟩, Finset.mem_subtype.mpr hx, rfl⟩

theorem image_restrictSet_map {A U : Finset α} (hU : U ⊆ A) (f : α → β) :
    (restrictSet A U).image (fun x => f x.val) = U.image f := by
  change (restrictSet A U).image (f ∘ Subtype.val) = U.image f
  rw [← Finset.image_image, image_restrictSet hU]

theorem image_restrictFamily {A : Finset α} {G : Finset (Finset α)}
    (hG : ∀ g ∈ G, g ⊆ A) :
    imageFamily Subtype.val (restrictFamily A G) = G := by
  unfold imageFamily restrictFamily
  rw [Finset.image_image]
  calc
    G.image ((fun g => g.image Subtype.val) ∘ restrictSet A) = G.image id := by
      apply Finset.image_congr
      intro g hg
      exact image_restrictSet (hG g hg)
    _ = G := Finset.image_id

theorem image_restrictFamily_map {A : Finset α} {G : Finset (Finset α)}
    (hG : ∀ g ∈ G, g ⊆ A) (f : α → β) :
    imageFamily (fun x => f x.val) (restrictFamily A G) = imageFamily f G := by
  unfold imageFamily restrictFamily
  rw [Finset.image_image]
  apply Finset.image_congr
  intro g hg
  exact image_restrictSet_map (hG g hg) f

end FiniteSupport

/-- A certificate supported in A is also a certificate on the finite subtype A. -/
theorem WeightCertificate.restrict {G : Finset (Finset α)} {W A : Finset α}
    {w : α → ℝ} (hc : WeightCertificate G W w)
    (hG : ∀ g ∈ G, g ⊆ A) (hW : W ⊆ A) :
    WeightCertificate (FiniteSupport.restrictFamily A G)
      (FiniteSupport.restrictSet A W) (fun x => w x.val) := by
  have h : WeightCertificate
      (imageFamily Subtype.val (FiniteSupport.restrictFamily A G))
      ((FiniteSupport.restrictSet A W).image Subtype.val) w := by
    simpa only [FiniteSupport.image_restrictFamily hG,
      FiniteSupport.image_restrictSet hW] using hc
  exact h.of_image Subtype.val_injective (fun x => w x.val) (fun _ _ => rfl)

/-- The point map only needs to be injective on a finite set containing every
generator and the window. This applies to maps from naturals into a finite type. -/
theorem WeightCertificate.image_on {G : Finset (Finset α)} {W : Finset α}
    {w : α → ℝ} (hc : WeightCertificate G W w) (A : Finset α)
    (hG : ∀ g ∈ G, g ⊆ A) (hW : W ⊆ A)
    (f : α → β) (hf : Set.InjOn f A) (v : β → ℝ)
    (hv : ∀ x ∈ W, v (f x) = w x) :
    WeightCertificate (imageFamily f G) (W.image f) v := by
  have hi : Function.Injective (fun x : {x : α // x ∈ A} => f x.val) := by
    intro x y hxy
    exact Subtype.ext (hf x.property y.property hxy)
  have h := (hc.restrict hG hW).image (fun x => f x.val) hi v (by
    intro x hx
    exact hv x.val (Finset.mem_subtype.mp hx))
  simpa only [FiniteSupport.image_restrictFamily_map hG f,
    FiniteSupport.image_restrictSet_map hW f] using h

/-- Abundance follows after a finite-support embedding and compatible extension
of the nonnegative, nonzero weights. -/
theorem image_on_certificate_abundance {G : Finset (Finset α)} {W : Finset α}
    {w : α → ℝ} (hc : WeightCertificate G W w)
    (hw : ∀ x ∈ W, 0 ≤ w x) (hpos : ∃ x ∈ W, 0 < w x)
    (A : Finset α) (hG : ∀ g ∈ G, g ⊆ A) (hW : W ⊆ A)
    (f : α → β) (hf : Set.InjOn f A) (v : β → ℝ)
    (hv : ∀ x ∈ W, v (f x) = w x) :
    ∃ y ∈ W.image f, Abundant (family (imageFamily f G)) y := by
  apply abundant_of_total_imbalance (w := v)
  · intro y hy
    obtain ⟨x, hx, rfl⟩ := Finset.mem_image.mp hy
    rw [hv x hx]
    exact hw x hx
  · obtain ⟨x, hx, hpos⟩ := hpos
    exact ⟨f x, Finset.mem_image_of_mem f hx, by simpa only [hv x hx] using hpos⟩
  · exact weightCertificate_total (hc.image_on A hG hW f hf v hv)

end FranklLocal
