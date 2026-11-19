module

public import Conjectures.FranklFCEmbedding
public import Conjectures.FranklFCClosure
public import Conjectures.FranklVaughanClassification
public import Conjectures.FranklVaughanTriangle
public import Conjectures.FranklVaughanStar
public import Conjectures.FranklVaughanPath
public import Conjectures.FranklVaughanPathEdge
public import Conjectures.FranklVaughanMatching

@[expose] public section

/-! Vaughan's three-triple abundance theorem from the five exact finite
certificates, the proved classification, and injective finite-ground
relabelling. The ambient union-closed family is unrestricted. -/

namespace Frankl.Vaughan

open scoped BigOperators

def canonicalGround (kind : Kind) : Finset ℕ := Finset.range (groundSize kind)

def canonicalBase : Kind → Finset (Finset ℕ)
  | .triangle => FC.VaughanTriangle.base
  | .star => FC.VaughanStar.base
  | .path => FC.VaughanPath.base
  | .pathEdge => FC.VaughanPathEdge.base
  | .matching => FC.VaughanMatching.base

def canonicalWeights : Kind → ℕ → ℕ
  | .triangle => FC.VaughanTriangle.weights
  | .star => FC.VaughanStar.weights
  | .path => FC.VaughanPath.weights
  | .pathEdge => FC.VaughanPathEdge.weights
  | .matching => FC.VaughanMatching.weights

theorem canonicalBase_mem (kind : Kind) :
    ∀ U ∈ canonicalBase kind, U ∈ generatedUnions (triples kind) ∧ U ≠ ∅ := by
  cases kind <;> decide +kernel

theorem canonicalBase_supported (kind : Kind) :
    ∀ U ∈ canonicalBase kind, U ⊆ canonicalGround kind := by
  cases kind <;> decide +kernel

theorem canonicalWeights_positive (kind : Kind) :
    ∃ x ∈ canonicalGround kind, 0 < canonicalWeights kind x := by
  cases kind <;> refine ⟨0, ?_, ?_⟩ <;> decide +kernel

theorem canonical_support (kind : Kind) :
    generatedUnion (triples kind) = canonicalGround kind := by
  cases kind <;> decide +kernel

theorem canonical_extension_share_nonnegative (kind : Kind)
    {family : Finset (Finset ℕ)}
    (hc : ShareSearch.ClosedFor (fun S T => S ∪ T) (canonicalBase kind) family)
    (hd : family ⊆ (canonicalGround kind).powerset) :
    0 ≤ ∑ S ∈ family, FC.share (canonicalGround kind) (canonicalWeights kind) S := by
  cases kind with
  | triangle => exact FC.VaughanTriangle.extension_share_nonnegative hc hd
  | star => exact FC.VaughanStar.extension_share_nonnegative hc hd
  | path => exact FC.VaughanPath.extension_share_nonnegative hc hd
  | pathEdge => exact FC.VaughanPathEdge.extension_share_nonnegative hc hd
  | matching => exact FC.VaughanMatching.extension_share_nonnegative hc hd

variable {α : Type*} [DecidableEq α]

theorem canonical_embedded_base_subset (kind : Kind) (f : ℕ → α)
    {family : Finset (Finset α)} (hu : UnionClosed family)
    (hb : (triples kind).image (Finset.image f) ⊆ family) :
    (canonicalBase kind).image (Finset.image f) ⊆ family := by
  intro S hS
  obtain ⟨U, hU, rfl⟩ := Finset.mem_image.mp hS
  obtain ⟨hUg, hUne⟩ := canonicalBase_mem kind U hU
  exact embedded_nonempty_generated_mem f hu hb hUg hUne

theorem canonical_support_image (kind : Kind) (f : ℕ → α)
    {A B C : Finset α}
    (heq : (triples kind).image (Finset.image f) = {A, B, C}) :
    (canonicalGround kind).image f = A ∪ B ∪ C := by
  rw [← canonical_support kind, image_generatedUnion, heq]
  simp [generatedUnion, Finset.union_assoc]

/-- Three distinct three-element members sharing a point force an abundant
point in their union, in every finite union-closed ambient family. -/
theorem three_triples_abundant {family : Finset (Finset α)} {A B C : Finset α}
    {p : α} (hu : UnionClosed family)
    (hAF : A ∈ family) (hBF : B ∈ family) (hCF : C ∈ family)
    (hA : A.card = 3) (hB : B.card = 3) (hC : C.card = 3)
    (hneAB : A ≠ B) (hneAC : A ≠ C) (hneBC : B ≠ C)
    (hpA : p ∈ A) (hpB : p ∈ B) (hpC : p ∈ C) :
    ∃ x ∈ A ∪ B ∪ C, Abundant family x := by
  obtain ⟨kind, f, hf, heq⟩ := three_triples_classification A B C p
    hA hB hC hneAB hneAC hneBC hpA hpB hpC
  have htriples : (triples kind).image (Finset.image f) ⊆ family := by
    rw [heq]
    simp only [Finset.insert_subset_iff, Finset.singleton_subset_iff]
    exact ⟨hAF, hBF, hCF⟩
  have hbase := canonical_embedded_base_subset kind f hu htriples
  obtain ⟨i, hi, _, hab⟩ := FC.abundant_of_embedded_extension_shares hf
    (canonicalBase_supported kind) (canonicalWeights_positive kind)
    (fun F hd hc => canonical_extension_share_nonnegative kind hc hd) hu hbase
  refine ⟨f i, ?_, hab⟩
  rw [← canonical_support_image kind f heq]
  exact Finset.mem_image_of_mem f hi

/-- The same shortcut for any finite collection of generators. -/
theorem three_generator_triples_abundant {G : Finset (Finset α)} {A B C : Finset α}
    {p : α} (hAG : A ∈ G) (hBG : B ∈ G) (hCG : C ∈ G)
    (hA : A.card = 3) (hB : B.card = 3) (hC : C.card = 3)
    (hneAB : A ≠ B) (hneAC : A ≠ C) (hneBC : B ≠ C)
    (hpA : p ∈ A) (hpB : p ∈ B) (hpC : p ∈ C) :
    ∃ x ∈ A ∪ B ∪ C, Abundant (generatedUnions G) x :=
  three_triples_abundant (generatedUnions_union_closed G)
    (generator_mem_generatedUnions hAG) (generator_mem_generatedUnions hBG)
    (generator_mem_generatedUnions hCG) hA hB hC hneAB hneAC hneBC hpA hpB hpC

end Frankl.Vaughan
