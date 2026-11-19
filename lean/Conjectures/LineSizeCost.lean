import Mathlib.Data.Finset.Card
import Mathlib.Data.Finset.Union
import Mathlib.Algebra.BigOperators.Group.Finset.Basic
import Mathlib.Algebra.BigOperators.Group.Finset.Piecewise
import Mathlib.Algebra.Order.BigOperators.Group.Finset
import Lean.Elab.Tactic.Omega

/-! The point-cost lower bound for finite line incidences. The only incidence
input is that two different carriers meet in at most one marked point. -/
namespace LineSize
open Finset

def carrierUnion {α : Type*} [DecidableEq α] (L : ℕ → Finset α) (n : ℕ) : Finset α :=
  (range n).biUnion L

def pointCost (d : ℕ → ℕ) (n : ℕ) : ℕ :=
  ∑ i ∈ range n, (d i - i)

theorem new_carrier_overlap_le {α : Type*} [DecidableEq α]
    (L : ℕ → Finset α) (n : ℕ)
    (h : ∀ i < n, (L n ∩ L i).card ≤ 1) :
    (L n ∩ carrierUnion L n).card ≤ n := by
  unfold carrierUnion
  rw [inter_biUnion]
  calc
    ((range n).biUnion fun i => L n ∩ L i).card
        ≤ ∑ i ∈ range n, (L n ∩ L i).card := card_biUnion_le
    _ ≤ ∑ _i ∈ range n, 1 := sum_le_sum fun i hi => h i (mem_range.mp hi)
    _ = n := by simp

theorem pointCost_le_union {α : Type*} [DecidableEq α]
    (L : ℕ → Finset α) (n : ℕ)
    (h : ∀ i j, i < j → j < n → (L j ∩ L i).card ≤ 1) :
    pointCost (fun i => (L i).card) n ≤ (carrierUnion L n).card := by
  induction n with
  | zero => simp [pointCost, carrierUnion]
  | succ n ih =>
    have hprev := ih (fun i j hij hj => h i j hij (by omega))
    have hover := new_carrier_overlap_le L n (fun i hi => h i n hi (by omega))
    have hcard := card_union_add_card_inter (L n) (carrierUnion L n)
    have hinter : (L n ∩ carrierUnion L n).card ≤ (L n).card :=
      card_le_card inter_subset_left
    have hunion : carrierUnion L (n+1) = L n ∪ carrierUnion L n := by
      simp [carrierUnion, range_add_one, biUnion_insert]
    have hcost : pointCost (fun i => (L i).card) (n+1) =
        pointCost (fun i => (L i).card) n + ((L n).card-n) := by
      simp [pointCost, sum_range_succ]
    rw [hunion,hcost]
    omega

theorem pointCost_le_card {α : Type*} [DecidableEq α]
    (P : Finset α) (L : ℕ → Finset α) (n : ℕ)
    (hsub : ∀ i < n, L i ⊆ P)
    (hinter : ∀ i j, i < j → j < n → (L j ∩ L i).card ≤ 1) :
    pointCost (fun i => (L i).card) n ≤ P.card := by
  apply (pointCost_le_union L n hinter).trans
  apply card_le_card
  intro x hx
  obtain ⟨i,hi,hxi⟩ := mem_biUnion.mp hx
  exact hsub i (mem_range.mp hi) hxi

end LineSize
