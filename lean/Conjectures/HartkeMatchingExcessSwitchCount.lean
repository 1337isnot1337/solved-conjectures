import Conjectures.HartkeMatchingExcessSwitches
import Mathlib.Data.Fintype.BigOperators
import Mathlib.Data.Fintype.Sum

/-!
# Hartke–Stolee–West–Yancey's matching-excess conjecture

Every alternating four-cycle gives another actual perfect matching.
An output matching has at most four ordered-pair preimages, a uniform
bound independent of the number of vertices.
-/

namespace HartkeMatchingExcess

open SimpleGraph Finset

variable {V : Type*} {G : SimpleGraph V}

abbrev BothPairs (M : PerfectMatching G) :=
  {p : V × V // G.Adj p.1 p.2 ∧
    G.Adj (mate M p.1) (mate M p.2) ∧ p.2 ≠ mate M p.1}

noncomputable def pairSwitch (M : PerfectMatching G) (p : BothPairs M) : PerfectMatching G :=
  switchMatching M p.val.1 p.val.2 p.property.1 p.property.2.1 p.property.2.2

theorem pairSwitch_ne (M : PerfectMatching G) (p : BothPairs M) : pairSwitch M p ≠ M :=
  switchMatching_ne M p.val.1 p.val.2 p.property.1 p.property.2.1 p.property.2.2

theorem pairSwitch_adj (M : PerfectMatching G) (p : BothPairs M) :
    (pairSwitch M p).val.Adj p.val.1 p.val.2 := by
  rw [matching_adj_iff_mate]
  exact (mate_switchMatching M _ _ _ _ _ _).trans (switchedMate_left M _ _)

noncomputable def switchPairs (M : PerfectMatching G) (x y : V) : Finset (V × V) := by
  classical
  exact [(x,y), (y,x), (mate M x, mate M y), (mate M y, mate M x)].toFinset

theorem switchPairs_card (M : PerfectMatching G) (x y : V) :
    (switchPairs M x y).card ≤ 4 := by
  classical
  exact List.toFinset_card_le _

theorem pairSwitch_equal_mem (M : PerfectMatching G) (p q : BothPairs M)
    (h : pairSwitch M p = pairSwitch M q) : q.val ∈ switchPairs M p.val.1 p.val.2 := by
  classical
  have hq := pairSwitch_adj M q
  rw [← h] at hq
  have hn : ¬M.val.Adj q.val.1 q.val.2 := by
    intro hM
    exact q.property.2.2 (mate_eq_of_adj M hM).symm
  have he := switchMatching_new_adj M p.val.1 p.val.2 p.property.1
    p.property.2.1 p.property.2.2 q.val.1 q.val.2 hq hn
  simpa [switchPairs, Prod.ext_iff] using he

theorem pairSwitch_fiber_card [Fintype V] (M N : PerfectMatching G) :
    Nat.card {p : BothPairs M // pairSwitch M p = N} ≤ 4 := by
  classical
  let F := {p : BothPairs M // pairSwitch M p = N}
  by_cases hF : Nonempty F
  · let p : F := Classical.choice hF
    let S := switchPairs M p.val.val.1 p.val.val.2
    let f : F → S := fun q =>
      ⟨q.val.val, pairSwitch_equal_mem M p.val q.val (p.property.trans q.property.symm)⟩
    have hf : Function.Injective f := by
      intro q r he
      apply Subtype.ext
      apply Subtype.ext
      exact congrArg (fun z : S => z.val) he
    have hc := Nat.card_le_card_of_injective f hf
    exact hc.trans (by simpa only [Nat.card_coe_set_eq, Finset.coe_sort_coe,
      Nat.card_eq_fintype_card, Fintype.card_coe] using switchPairs_card M p.val.val.1 p.val.val.2)
  · have : IsEmpty F := not_nonempty_iff.mp hF
    exact le_trans (by simp [F]) (Nat.zero_le 4)

theorem card_le_mul_of_fibers {α β : Type*} [Finite α] [Finite β]
    (f : α → β) (k : ℕ) (h : ∀ y, Nat.card {x // f x = y} ≤ k) :
    Nat.card α ≤ k * Nat.card β := by
  classical
  let : Fintype α := Fintype.ofFinite α
  let : Fintype β := Fintype.ofFinite β
  calc
    Nat.card α = ∑ y : β, Nat.card {x // f x = y} := by
      have he := Nat.card_congr (Equiv.sigmaFiberEquiv f)
      rw [Nat.card_sigma] at he
      exact he.symm
    _ ≤ ∑ _y : β, k := sum_le_sum (fun y _ => h y)
    _ = k * Nat.card β := by simp [Nat.card_eq_fintype_card, Nat.mul_comm]

theorem bothPairs_card_le [Fintype V] (M : PerfectMatching G) :
    Nat.card (BothPairs M) ≤ 4 * (perfectMatchingCount G - 1) := by
  classical
  let O := {N : PerfectMatching G // N ≠ M}
  let f : BothPairs M → O := fun p => ⟨pairSwitch M p, pairSwitch_ne M p⟩
  have hc : Nat.card (BothPairs M) ≤ 4 * Nat.card O := by
    apply card_le_mul_of_fibers f 4
    intro N
    have he : {p : BothPairs M // f p = N} ≃
        {p : BothPairs M // pairSwitch M p = N.val} :=
      Equiv.subtypeEquivRight (fun p => Subtype.ext_iff)
    rw [Nat.card_congr he]
    exact pairSwitch_fiber_card M N.val
  have ho : Nat.card O = perfectMatchingCount G - 1 := by
    let : Fintype (PerfectMatching G) := Fintype.ofFinite _
    change Nat.card {N : PerfectMatching G // ¬N = M} = _
    rw [Nat.card_eq_fintype_card, Fintype.card_subtype_compl, Fintype.card_subtype_eq]
    simp only [perfectMatchingCount, Nat.card_eq_fintype_card]
  rwa [ho] at hc

end HartkeMatchingExcess
