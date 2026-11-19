module

public import Conjectures.FranklShareFlow

@[expose] public section

/-! A pointwise evaluator for the existing share-transfer verifier.

The original evaluator carries a function through each transfer. The evaluator
below carries only the current integer value at a fixed point. Its equality
with the original evaluator is proved, and the leaf bridge returns the
original certificate-checking proposition.
-/

namespace Frankl.ShareFlow

open ShareSearch

variable {α : Type*} [DecidableEq α]

def adjustPointwise (join : α → α → α) (plan : List (Transfer α))
    (share : α → ℤ) (a : α) : ℤ :=
  plan.foldl (fun value entry =>
    value + (if a = entry.source then (entry.amount : ℤ) else 0) -
      (if a = join entry.source entry.generator then (entry.amount : ℤ) else 0))
    (share a)

theorem adjustPointwise_apply (join : α → α → α) (plan : List (Transfer α))
    (share : α → ℤ) (a : α) :
    adjustPointwise join plan share a = adjust join plan share a := by
  induction plan generalizing share with
  | nil => rfl
  | cons entry rest ih =>
      change adjustPointwise join rest (transfer join entry share) a =
        adjust join rest (transfer join entry share) a
      exact ih (transfer join entry share)

theorem adjustPointwise_eq_adjust (join : α → α → α) (plan : List (Transfer α))
    (share : α → ℤ) : adjustPointwise join plan share = adjust join plan share := by
  funext a
  exact adjustPointwise_apply join plan share a

def checkLeafPointwise (join : α → α → α) (base domain : Finset α)
    (share : α → ℤ) (forced excluded : Finset α) (plan : List (Transfer α)) : Bool :=
  if ¬Disjoint forced excluded then true else
    planValid base forced plan &&
      decide (0 ≤ lower domain forced excluded (adjustPointwise join plan share))

theorem checkLeafPointwise_eq_check (join : α → α → α) (base domain : Finset α)
    (share : α → ℤ) (forced excluded : Finset α) (plan : List (Transfer α)) :
    checkLeafPointwise join base domain share forced excluded plan =
      check join base domain share forced excluded (.leaf plan) := by
  unfold checkLeafPointwise check
  rw [adjustPointwise_eq_adjust]

theorem check_leaf_of_pointwise {join : α → α → α} {base domain : Finset α}
    {share : α → ℤ} {forced excluded : Finset α} {plan : List (Transfer α)}
    (h : checkLeafPointwise join base domain share forced excluded plan = true) :
    check join base domain share forced excluded (.leaf plan) = true := by
  rwa [checkLeafPointwise_eq_check] at h

end Frankl.ShareFlow
