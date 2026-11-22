module

public import Conjectures.AgnosticVC.SelectorBound
public import Mathlib.Logic.Equiv.Fintype

/-! The permutation-averaged selector bound on each fixed labeled pool, with
no measurable-space assumptions on the features or hypotheses. -/

@[expose] public section

open SteinkeZakynthinou SteinkeZakynthinou.Learner
open scoped BigOperators

namespace AgnosticVC

/-- Average a statistic over permutations of the positions in a fixed pool. -/
noncomputable def shuffleMean {I Z : Type*} [Fintype I] [DecidableEq I]
    (f : (I → Z) → ℝ) (z : I → Z) : ℝ :=
  (∑ π : Equiv.Perm I, f (z ∘ π)) / Fintype.card (Equiv.Perm I)

private theorem shuffle_mono {I Z : Type*} [Fintype I] [DecidableEq I]
    {f g : (I → Z) → ℝ} (h : ∀ z, f z ≤ g z) (z : I → Z) :
    shuffleMean f z ≤ shuffleMean g z :=
  div_le_div_of_nonneg_right (Finset.sum_le_sum (fun π _ => h (z ∘ π))) (by positivity)

private theorem shuffle_const {I Z : Type*} [Fintype I] [DecidableEq I] (z : I → Z) (c : ℝ) :
    shuffleMean (fun _ => c) z = c := by
  unfold shuffleMean
  simp only [Finset.sum_const, Finset.card_univ, nsmul_eq_mul]
  exact mul_div_cancel_left₀ _ (Nat.cast_ne_zero.mpr Fintype.card_ne_zero)

private theorem shuffle_sum {I Z A : Type*} [Fintype I] [DecidableEq I] [Fintype A]
    (f : A → (I → Z) → ℝ) (z : I → Z) :
    shuffleMean (fun t => ∑ a, f a t) z = ∑ a, shuffleMean (f a) z := by
  unfold shuffleMean
  rw [← Finset.sum_div, Finset.sum_comm]

private theorem shuffle_selector {I Z : Type*} [Fintype I] [DecidableEq I] {n : ℕ}
    (f : Selector n → (I → Z) → ℝ) (z : I → Z) :
    shuffleMean (fun t => selectorMean (fun s => f s t)) z =
      selectorMean (fun s => shuffleMean (f s) z) := by
  unfold selectorMean shuffleMean
  simp only [← Finset.sum_div, Finset.sum_comm (s := (Finset.univ : Finset (Equiv.Perm I)))
    (t := (Finset.univ : Finset (Selector n)))]
  ring

private theorem shuffle_pair {I Z : Type*} [Fintype I] [DecidableEq I]
    (f g : (I → Z) → ℝ) (z : I → Z) :
    shuffleMean (fun t => 2*(f t + g t)) z = 2*(shuffleMean f z + shuffleMean g z) := by
  unfold shuffleMean
  rw [← Finset.mul_sum, Finset.sum_add_distrib]
  ring

/-- Two injections choose the same law of ordered subtuples after shuffling
a deterministic pool, even if some observations have equal values. -/
theorem shuffle_subtuple_independent {I K Z : Type*} [Fintype I] [DecidableEq I] [Finite K]
    (f : (K → Z) → ℝ) (z : I → Z) (e e' : K → I) (he : Function.Injective e)
    (he' : Function.Injective e') :
    shuffleMean (fun t => f (t ∘ e)) z = shuffleMean (fun t => f (t ∘ e')) z := by
  obtain ⟨σ,hσ⟩ := Equiv.Perm.exists_extending_pair e e' he he'
  unfold shuffleMean
  congr 1
  have hh := Equiv.sum_comp (Equiv.mulRight σ) (fun π : Equiv.Perm I => f ((z ∘ π) ∘ e))
  calc
    _ = ∑ π : Equiv.Perm I, f ((z ∘ (π * σ)) ∘ e) := hh.symm
    _ = _ := by
      apply Finset.sum_congr rfl
      intro π _
      apply congrArg f
      funext j
      change z (π (σ (e j))) = z (π (e' j))
      rw [hσ]

theorem shuffleMean_le_of_blockCharges {n d : ℕ} {X H : Type*} [Nonempty H] [TraceOrder H]
    (hd : 0 < d) (hn : d ≤ n) (predict : H → X → Bool) {B : ℝ}
    (hcost : ∀ T : Fin (n+1) → X × Bool, ∑ i, blockDeletionCharge (schedule n d) predict T i ≤ B)
    (z : Pool n X) : shuffleMean (poolInformation hd hn predict) z ≤ 4 * B := by
  let e := unionIndex (⟨0,hd.trans_le hn⟩ : Fin n) (fun _ => false)
  have he : Function.Injective e := unionIndex_injective _ _
  let c (j : Fin (n+1)) (T : Fin (n+1) → X × Bool) := blockDeletionCharge (schedule n d) predict T j
  let a (j : Fin (n+1)) := shuffleMean (fun t => c j (t ∘ e)) z
  have ha (j : Fin (n+1)) : 0 ≤ a j := div_nonneg (Finset.sum_nonneg
    (fun π _ => blockDeletionCharge_nonneg ..)) (by positivity)
  have hb : ∑ j, a j ≤ B := by
    dsimp only [a]
    rw [← shuffle_sum, ← shuffle_const z B]
    exact shuffle_mono (fun t => hcost (t ∘ e)) z
  have same (i : Fin n) (s : Selector n) (j : Fin (n+1)) :
      shuffleMean (fun t => c j (t ∘ unionIndex i s)) z = a j :=
    shuffle_subtuple_independent _ z _ e (unionIndex_injective i s) he
  calc
    _ ≤ shuffleMean (fun t : Pool n X => ∑ i : Fin n, selectorMean (fun s =>
        2 * (c i.castSucc (t ∘ unionIndex i s) + c i.succ (t ∘ unionIndex i s)))) z :=
      shuffle_mono (poolInformation_le_blockCharges hd hn predict) z
    _ = ∑ i : Fin n, 2 * (a i.castSucc + a i.succ) := by
      rw [shuffle_sum]
      apply Finset.sum_congr rfl
      intro i _
      rw [shuffle_selector]
      conv_lhs =>
        arg 1
        intro s
        rw [shuffle_pair (fun t => c i.castSucc (t ∘ unionIndex i s))
          (fun t => c i.succ (t ∘ unionIndex i s)), same, same]
      exact selectorMean_const _
    _ ≤ 4 * B := by rw [← Finset.mul_sum]; linarith [sum_adjacent_deletions_le a ha]

end AgnosticVC
