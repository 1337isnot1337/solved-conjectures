module

public import Mathlib.Algebra.Order.BigOperators.Group.Finset
public import Mathlib.Data.Finset.Image
public import Mathlib.Data.Int.Order.Basic

@[expose] public section

/-!
# Checked search certificates for nonnegative family shares

A certificate splits on membership of one possible set.  The present branch
may add unions forced by union closure.  A leaf is accepted only when the
negative contribution of every remaining possible member cannot make the
total share negative, or when its membership requirements contradict each
other.  The search that proposes a certificate is not trusted.
-/

namespace Frankl.ShareSearch

open Finset

variable {α : Type*} [DecidableEq α]

/-- Closure requirements used by a finite family-share certificate. -/
def ClosedFor (join : α → α → α) (base family : Finset α) : Prop :=
  (∀ a ∈ family, ∀ b ∈ family, join a b ∈ family) ∧
  (∀ a ∈ family, ∀ b ∈ base, join a b ∈ family)

/-- Add members forced by the assertion that `a` belongs to the family. -/
def infer (join : α → α → α) (base forced : Finset α) (a : α) : Finset α :=
  insert a (forced ∪ forced.image (join a) ∪ base.image (join a))

theorem infer_subset {join : α → α → α} {base forced family : Finset α}
    {a : α} (hc : ClosedFor join base family) (hf : forced ⊆ family)
    (ha : a ∈ family) : infer join base forced a ⊆ family := by
  intro b hb
  simp only [infer, mem_insert, mem_union, mem_image] at hb
  rcases hb with rfl | ((hb | ⟨c, hc', rfl⟩) | ⟨c, hc', rfl⟩)
  · exact ha
  · exact hf hb
  · exact hc.1 a ha c (hf hc')
  · exact hc.2 a ha c hc'

/-- A lower bound which allows every still-possible negative-share member. -/
def lower (domain forced excluded : Finset α) (share : α → ℤ) : ℤ :=
  ∑ a ∈ domain, if a ∈ forced then share a
    else if a ∈ excluded then 0 else min (share a) 0

theorem lower_le_sum {domain forced excluded family : Finset α} {share : α → ℤ}
    (hd : family ⊆ domain) (hf : forced ⊆ family) (he : Disjoint family excluded) :
    lower domain forced excluded share ≤ ∑ a ∈ family, share a := by
  calc
    lower domain forced excluded share ≤
        ∑ a ∈ domain, if a ∈ family then share a else 0 := by
      apply sum_le_sum
      intro a _
      by_cases ha : a ∈ forced
      · simp only [ha, hf ha, ite_true, le_refl]
      · by_cases hu : a ∈ family
        · have he' : a ∉ excluded := fun h => (disjoint_left.mp he) hu h
          simp only [ha, hu, he', ite_false, ite_true]
          exact min_le_left _ _
        · by_cases hx : a ∈ excluded
          · simp only [ha, hu, hx, ite_false, ite_true, le_refl]
          · simp only [ha, hu, hx, ite_false]
            exact min_le_right _ _
    _ = ∑ a ∈ family, share a := by
      rw [← sum_filter]
      congr 1
      ext a
      simp only [mem_filter]
      exact ⟨fun h => h.2, fun h => ⟨hd h, h⟩⟩

/-- The only proposed data are branch points and the two child certificates. -/
inductive Certificate (α : Type*) where
  | leaf : Certificate α
  | split (a : α) (absent present : Certificate α) : Certificate α
  deriving Repr

/-- Executable verifier; no branch search, oracle, or native axiom is used. -/
def check (join : α → α → α) (base domain : Finset α) (share : α → ℤ)
    (forced excluded : Finset α) (cert : Certificate α) : Bool :=
    if ¬Disjoint forced excluded then true
    else if 0 ≤ lower domain forced excluded share then true
    else match cert with
      | .leaf => false
      | .split a absent present =>
        check join base domain share forced (insert a excluded) absent &&
        check join base domain share (infer join base forced a) excluded present
termination_by structural cert

/-- Every accepted certificate proves the claimed bound for every extension. -/
theorem check_sound {join : α → α → α} {base domain : Finset α} {share : α → ℤ}
    (cert : Certificate α) {forced excluded family : Finset α}
    (hc : ClosedFor join base family) (hd : family ⊆ domain)
    (hf : forced ⊆ family) (he : Disjoint family excluded)
    (hcheck : check join base domain share forced excluded cert = true) :
    0 ≤ ∑ a ∈ family, share a := by
  induction cert generalizing forced excluded with
  | leaf =>
      have hfe : Disjoint forced excluded := he.mono_left hf
      unfold check at hcheck
      simp only [hfe, not_true_eq_false, ↓reduceIte] at hcheck
      split_ifs at hcheck with h
      · exact h.trans (lower_le_sum hd hf he)
  | split a absent present ih0 ih1 =>
      have hfe : Disjoint forced excluded := he.mono_left hf
      unfold check at hcheck
      simp only [hfe, not_true_eq_false, ↓reduceIte] at hcheck
      split_ifs at hcheck with h
      · exact h.trans (lower_le_sum hd hf he)
      · have hh := Bool.and_eq_true_iff.mp hcheck
        by_cases ha : a ∈ family
        · exact ih1 (infer_subset hc hf ha) he hh.2
        · have he' : Disjoint family (insert a excluded) := by
            apply disjoint_left.mpr
            intro b hb hbx
            rcases mem_insert.mp hbx with hba | hbe
            · exact ha (hba ▸ hb)
            · exact disjoint_left.mp he hb hbe
          exact ih0 hf he' hh.1

/-- A certificate at the empty state checks all closed extensions in the domain. -/
theorem certificate_nonnegative {join : α → α → α} {base domain : Finset α}
    {share : α → ℤ} (cert : Certificate α)
    (hcheck : check join base domain share ∅ ∅ cert = true)
    {family : Finset α} (hc : ClosedFor join base family) (hd : family ⊆ domain) :
    0 ≤ ∑ a ∈ family, share a :=
  check_sound cert hc hd (empty_subset _) (by simp) hcheck

end Frankl.ShareSearch
