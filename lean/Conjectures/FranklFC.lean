module

public import Conjectures.FranklLocalCertificateWeights
public import Conjectures.FranklShareSearch
public import Mathlib.Tactic.NormNum
public import Mathlib.Tactic.Tauto

@[expose] public section

/-!
# Finite closed-extension certificates imply actual abundance

This is the weighted finite-extension argument used in the FC-family
literature.  The reduction is proved here for literal finite families.
Reference: Marić, Živković and Vučković, "Formalizing Frankl's Conjecture:
FC-families", arXiv:1207.3604, Sections 2 and 3.
-/

namespace Frankl.FC

open Finset LocalCertificate
open scoped BigOperators

variable {α : Type*} [DecidableEq α]

def share (W : Finset α) (w : α → ℕ) (S : Finset α) : ℤ :=
  2 * (patternWeight W w S : ℤ) - (totalWeight W w : ℤ)

theorem nonnegative_share_iff (family : Finset (Finset α)) (W : Finset α)
    (w : α → ℕ) :
    (0 ≤ ∑ S ∈ family, share W w S) ↔ Balanced family W w := by
  unfold share Balanced
  rw [Finset.sum_sub_distrib, ← Finset.mul_sum, Finset.sum_const, nsmul_eq_mul]
  rw [sub_nonneg]
  norm_cast

theorem insideTraces_subset_powerset (family : Finset (Finset α)) (W X : Finset α) :
    insideTraces family W X ⊆ W.powerset := by
  intro S hS
  obtain ⟨U, _, rfl⟩ := Finset.mem_image.mp hS
  exact Finset.mem_powerset.mpr Finset.inter_subset_right

theorem insideTraces_closedFor {family base : Finset (Finset α)} {W X : Finset α}
    (hu : UnionClosed family) (hb : base ⊆ family)
    (hw : ∀ A ∈ base, A ⊆ W) :
    ShareSearch.ClosedFor (fun A B => A ∪ B) base (insideTraces family W X) := by
  constructor
  · intro A hA B hB
    obtain ⟨U, hU, rfl⟩ := Finset.mem_image.mp hA
    obtain ⟨V, hV, rfl⟩ := Finset.mem_image.mp hB
    obtain ⟨hUf, hUx⟩ := Finset.mem_filter.mp hU
    obtain ⟨hVf, hVx⟩ := Finset.mem_filter.mp hV
    apply Finset.mem_image.mpr
    refine ⟨U ∪ V, Finset.mem_filter.mpr ⟨hu U hUf V hVf, ?_⟩, ?_⟩
    · ext x
      have h1 := Finset.ext_iff.mp hUx x
      have h2 := Finset.ext_iff.mp hVx x
      simp only [Finset.mem_sdiff, Finset.mem_union] at h1 h2 ⊢
      tauto
    · exact Finset.union_inter_distrib_right U V W
  · intro A hA B hB
    obtain ⟨U, hU, rfl⟩ := Finset.mem_image.mp hA
    obtain ⟨hUf, hUx⟩ := Finset.mem_filter.mp hU
    apply Finset.mem_image.mpr
    refine ⟨U ∪ B, Finset.mem_filter.mpr ⟨hu U hUf B (hb hB), ?_⟩, ?_⟩
    · ext x
      have hx := Finset.ext_iff.mp hUx x
      have hsub : x ∈ B → x ∈ W := fun h => hw B hB h
      simp only [Finset.mem_sdiff, Finset.mem_union] at hx ⊢
      tauto
    · rw [Finset.union_inter_distrib_right, Finset.inter_eq_left.mpr (hw B hB)]

/-- The finite test applies to every exterior fiber of an arbitrary ambient
union-closed family.  The ground type and the exterior size are unrestricted. -/
theorem abundant_of_extension_shares {family base : Finset (Finset α)}
    {W : Finset α} {w : α → ℕ} (hu : UnionClosed family)
    (hb : base ⊆ family) (hW : ∀ A ∈ base, A ⊆ W)
    (hw : ∃ x ∈ W, 0 < w x)
    (htest : ∀ F : Finset (Finset α), F ⊆ W.powerset →
      ShareSearch.ClosedFor (fun A B => A ∪ B) base F →
      0 ≤ ∑ S ∈ F, share W w S) :
    ∃ x ∈ W, 0 < w x ∧ Abundant family x := by
  apply abundant_of_balanced family W w hw
  apply balanced_of_inside_traces
  intro X _
  apply (nonnegative_share_iff _ _ _).mp
  exact htest _ (insideTraces_subset_powerset _ _ _)
    (insideTraces_closedFor hu hb hW)

/-- An accepted finite search certificate is sufficient for abundance. -/
theorem abundant_of_certificate {family base : Finset (Finset α)}
    {W : Finset α} {w : α → ℕ} (hu : UnionClosed family)
    (hb : base ⊆ family) (hW : ∀ A ∈ base, A ⊆ W)
    (hw : ∃ x ∈ W, 0 < w x)
    (cert : ShareSearch.Certificate (Finset α))
    (hcheck : ShareSearch.check (fun A B => A ∪ B) base W.powerset
      (share W w) ∅ ∅ cert = true) :
    ∃ x ∈ W, 0 < w x ∧ Abundant family x := by
  apply abundant_of_extension_shares hu hb hW hw
  intro F hd hc
  exact ShareSearch.certificate_nonnegative cert hcheck hc hd

end Frankl.FC
