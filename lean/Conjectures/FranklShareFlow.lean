module

public import Conjectures.FranklShareSearch
public import Mathlib.Algebra.BigOperators.Group.Finset.Piecewise
public import Lean.Elab.Tactic.Omega

@[expose] public section

/-!
# Share transfers and compact closed-extension certificates

If a family is closed under adjoining `b`, membership of `a` implies membership
of `a ∪ b`. Moving a nonnegative amount of share from the latter pattern to
the former can only decrease the family's total share. A leaf records such
transfers and then applies the proved independent-member lower bound.
No maximum-flow theorem or external solver is a premise of this verifier.
-/

namespace Frankl.ShareFlow

open Finset ShareSearch

variable {α : Type*} [DecidableEq α]

structure Transfer (α : Type*) where
  source : α
  generator : α
  amount : ℕ
  deriving Repr

def transfer (join : α → α → α) (entry : Transfer α) (share : α → ℤ)
    (a : α) : ℤ :=
  share a + (if a = entry.source then (entry.amount : ℤ) else 0) -
    (if a = join entry.source entry.generator then (entry.amount : ℤ) else 0)

theorem sum_transfer_le (join : α → α → α) (entry : Transfer α)
    (share : α → ℤ) (family : Finset α)
    (hc : entry.source ∈ family → join entry.source entry.generator ∈ family) :
    (∑ a ∈ family, transfer join entry share a) ≤ ∑ a ∈ family, share a := by
  simp only [transfer, sum_sub_distrib, sum_add_distrib, sum_ite_eq']
  by_cases hs : entry.source ∈ family
  · simp only [hs, hc hs, ite_true, add_sub_cancel_right, le_refl]
  · by_cases ht : join entry.source entry.generator ∈ family
    · simp only [hs, ht, ite_false, ite_true, add_zero]
      exact sub_le_self _ (Int.natCast_nonneg _)
    · simp only [hs, ht, ite_false, add_zero, sub_zero, le_refl]

def adjust (join : α → α → α) : List (Transfer α) → (α → ℤ) → (α → ℤ)
  | [], share => share
  | entry :: rest, share => adjust join rest (transfer join entry share)

theorem sum_adjust_le (join : α → α → α) (plan : List (Transfer α))
    (share : α → ℤ) (family : Finset α)
    (hc : ∀ entry ∈ plan,
      entry.source ∈ family → join entry.source entry.generator ∈ family) :
    (∑ a ∈ family, adjust join plan share a) ≤ ∑ a ∈ family, share a := by
  induction plan generalizing share with
  | nil => exact le_refl _
  | cons entry rest ih =>
      exact (ih _ (fun e he => hc e (List.mem_cons_of_mem _ he))).trans
        (sum_transfer_le join entry share family (hc entry (List.mem_cons_self ..)))

def planValid (base forced : Finset α) (plan : List (Transfer α)) : Bool :=
  plan.all (fun entry => decide (entry.generator ∈ base ∨ entry.generator ∈ forced))

theorem planValid_spec {base forced : Finset α} {plan : List (Transfer α)}
    (h : planValid base forced plan = true) :
    ∀ entry ∈ plan, entry.generator ∈ base ∨ entry.generator ∈ forced := by
  simpa only [planValid, List.all_eq_true, decide_eq_true_eq] using h

theorem plan_nonnegative {join : α → α → α} {base domain forced excluded family : Finset α}
    {share : α → ℤ} (plan : List (Transfer α))
    (hc : ClosedFor join base family) (hd : family ⊆ domain)
    (hf : forced ⊆ family) (he : Disjoint family excluded)
    (hv : planValid base forced plan = true)
    (hl : 0 ≤ lower domain forced excluded (adjust join plan share)) :
    0 ≤ ∑ a ∈ family, share a := by
  apply (hl.trans (lower_le_sum hd hf he)).trans
  apply sum_adjust_le
  intro entry hm hs
  rcases planValid_spec hv entry hm with hg | hg
  · exact hc.2 _ hs _ hg
  · exact hc.1 _ hs _ (hf hg)

inductive Certificate (α : Type*) where
  | leaf (plan : List (Transfer α)) : Certificate α
  | split (a : α) (absent present : Certificate α) : Certificate α
  deriving Repr

def check (join : α → α → α) (base domain : Finset α) (share : α → ℤ)
    (forced excluded : Finset α) (cert : Certificate α) : Bool :=
  if ¬Disjoint forced excluded then true else
    match cert with
    | .leaf plan => planValid base forced plan &&
        decide (0 ≤ lower domain forced excluded (adjust join plan share))
    | .split a absent present =>
        check join base domain share forced (insert a excluded) absent &&
        check join base domain share (infer join base forced a) excluded present
termination_by structural cert

theorem check_split {join : α → α → α} {base domain : Finset α}
    {share : α → ℤ} {forced excluded : Finset α} {a : α}
    {absent present : Certificate α}
    (habsent : check join base domain share forced (insert a excluded) absent = true)
    (hpresent : check join base domain share (infer join base forced a) excluded present = true) :
    check join base domain share forced excluded (.split a absent present) = true := by
  unfold check
  split
  · rfl
  · change (check join base domain share forced (insert a excluded) absent &&
      check join base domain share (infer join base forced a) excluded present) = true
    rw [habsent, hpresent]
    rfl

theorem check_sound {join : α → α → α} {base domain : Finset α} {share : α → ℤ}
    (cert : Certificate α) {forced excluded family : Finset α}
    (hc : ClosedFor join base family) (hd : family ⊆ domain)
    (hf : forced ⊆ family) (he : Disjoint family excluded)
    (hcheck : check join base domain share forced excluded cert = true) :
    0 ≤ ∑ a ∈ family, share a := by
  induction cert generalizing forced excluded with
  | leaf plan =>
      have hfe : Disjoint forced excluded := he.mono_left hf
      unfold check at hcheck
      simp only [hfe, not_true_eq_false, ↓reduceIte, Bool.and_eq_true_iff,
        decide_eq_true_eq] at hcheck
      exact plan_nonnegative plan hc hd hf he hcheck.1 hcheck.2
  | split a absent present ih0 ih1 =>
      have hfe : Disjoint forced excluded := he.mono_left hf
      unfold check at hcheck
      simp only [hfe, not_true_eq_false, ↓reduceIte, Bool.and_eq_true_iff] at hcheck
      by_cases ha : a ∈ family
      · exact ih1 (infer_subset hc hf ha) he hcheck.2
      · have he' : Disjoint family (insert a excluded) := by
          apply disjoint_left.mpr
          intro b hb hbx
          rcases mem_insert.mp hbx with hba | hbe
          · exact ha (hba ▸ hb)
          · exact disjoint_left.mp he hb hbe
        exact ih0 hf he' hcheck.1

theorem certificate_nonnegative {join : α → α → α} {base domain : Finset α}
    {share : α → ℤ} (cert : Certificate α)
    (hcheck : check join base domain share ∅ ∅ cert = true)
    {family : Finset α} (hc : ClosedFor join base family) (hd : family ⊆ domain) :
    0 ≤ ∑ a ∈ family, share a :=
  check_sound cert hc hd (empty_subset _) (by simp) hcheck

end Frankl.ShareFlow
