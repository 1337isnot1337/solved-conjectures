import Conjectures.KauersKoutschanCount
import Conjectures.KauersKoutschanState
import Conjectures.KauersKoutschanPermutationCount

/-! The original order-eight operator annihilates the exact finite-sum model. -/

open scoped BigOperators

namespace KauersKoutschan

open KauersKoutschanCertificate

private theorem combine_foldl {α : Type} (h : ℕ) (xs : List α)
    (f : Fin 6 → Poly → α → Poly) (g : ℚ → α → ℚ)
    (step : ∀ p a, a ∈ xs → combine h (fun i => f i (p i) a) = g (combine h p) a)
    (p : Fin 6 → Poly) :
    combine h (fun i => xs.foldl (f i) (p i)) = xs.foldl g (combine h p) := by
  induction xs generalizing p with
  | nil => rfl
  | cons a xs ih =>
    simp only [List.foldl_cons]
    rw [ih (fun p a ha => step p a (List.mem_cons_of_mem _ ha)),
      step p a List.mem_cons_self]

private theorem foldl_range_add (f : ℕ → ℚ) (n : ℕ) (z : ℚ) :
    (List.range n).foldl (fun a j => a + f j) z =
      z + ∑ j ∈ Finset.range n, f j := by
  induction n with
  | zero => simp
  | succ n ih =>
    rw [List.range_succ, List.foldl_append, List.foldl_cons, List.foldl_nil, ih,
      Finset.sum_range_succ, add_assoc]

private theorem foldl_range_sub (f : ℕ → ℚ) (n : ℕ) (z : ℚ) :
    (List.range n).foldl (fun a j => a - f j) z =
      z - ∑ j ∈ Finset.range n, f j := by
  simp only [sub_eq_add_neg, foldl_range_add, Finset.sum_neg_distrib]

private theorem combine_mask (h s cutoff : ℕ) (S : Fin 6 → State)
    (stateE : ∀ j ≤ s, combine h (fun i => (S i).E[j]!) = moment (h + j))
    (stateT : combine h (fun i => (S i).T[s]!) = dividedSum (2 * h + s)) :
    combine h (fun i =>
      (List.range ((s + 1) / 2 - cutoff)).foldl (fun p r =>
        let k := cutoff + r
        sub p (scale (signed s / ((s - 2 * k : ℕ) : ℚ))
          (sub (S i).E[s - k]! (S i).E[k]!))) (S i).T[s]!) =
      dividedSum (2 * h + s) -
        ∑ r ∈ Finset.range ((s + 1) / 2 - cutoff),
          sign s * (moment (h + s - (cutoff + r)) - moment (h + (cutoff + r))) /
            ((s - 2 * (cutoff + r) : ℕ) : ℚ) := by
  let f (r : ℕ) := sign s * (moment (h + s - (cutoff + r)) - moment (h + (cutoff + r))) /
    ((s - 2 * (cutoff + r) : ℕ) : ℚ)
  have hstep (p : Fin 6 → Poly) (r : ℕ) (hr : r ∈ List.range ((s + 1) / 2 - cutoff)) :
      combine h (fun i =>
        let k := cutoff + r
        sub (p i) (scale (signed s / ((s - 2 * k : ℕ) : ℚ))
          (sub (S i).E[s - k]! (S i).E[k]!))) = combine h p - f r := by
    have hr' := List.mem_range.mp hr
    have hk : cutoff + r ≤ s := by omega
    simp only [combine_sub, combine_scale,
      stateE (s - (cutoff + r)) (by omega),
      stateE (cutoff + r) (by omega), signed_eq_sign, f,
      show h + (s - (cutoff + r)) = h + s - (cutoff + r) by omega]
    ring
  rw [combine_foldl h _ _ (fun a r => a - f r) hstep,
    foldl_range_sub, stateT]

private theorem combine_count (h t : ℕ) (ht : t ≤ 18) :
    combine h (fun i => count (state i) t) = shiftedSumCount h t := by
  let g (mask : ℕ) :=
    let s := (cells t mask).1
    let cutoff := (cells t mask).2.toNat + 1
    dividedSum (2 * h + s) -
      ∑ r ∈ Finset.range ((s + 1) / 2 - cutoff),
        sign s * (moment (h + s - (cutoff + r)) - moment (h + (cutoff + r))) /
          ((s - 2 * (cutoff + r) : ℕ) : ℚ)
  have hstep (p : Fin 6 → Poly) (mask : ℕ) (_ : mask ∈ List.range 16) :
      combine h (fun i =>
        let s := (cells t mask).1
        let cutoff := (cells t mask).2.toNat + 1
        add (p i) ((List.range ((s + 1) / 2 - cutoff)).foldl (fun p r =>
          let k := cutoff + r
          sub p (scale (signed s / ((s - 2 * k : ℕ) : ℚ))
            (sub (state i).E[s - k]! (state i).E[k]!))) (state i).T[s]!)) =
        combine h p + g mask := by
    have hs : (cells t mask).1 ≤ 19 := by unfold cells; dsimp only; omega
    rw [combine_add, combine_mask h _ _ (fun i => state i)
      (fun j hj => state_eval_moment h j (by omega)) (state_eval_dividedSum h _ (by omega))]
  unfold count
  rw [combine_foldl h _ _ (fun a mask => a + g mask) hstep, foldl_range_add]
  simp [combine, eval, shiftedSumCount, g]

theorem finiteSumCount_orderEight_shift (h t : ℕ) (ht : t = 4 ∨ t = 5) :
    orderEight ((2 * h + t : ℕ) : ℚ) (fun j => finiteSumCount (2 * h + t + j)) = 0 := by
  have hcert := orderEight_linear_combination (h : ℚ) t ht (initialComponents h)
  have hn : ((2 * h + t : ℕ) : ℚ) = t + 2 * (h : ℚ) := by push_cast; ring
  rw [hn]
  refine Eq.trans ?_ hcert
  apply Finset.sum_congr rfl
  intro j hj
  have hj' := Finset.mem_range.mp hj
  have hc := combine_count h (t + j) (by omega)
  have hbase : 4 ≤ t + j := by omega
  have he : finiteSumCount (2 * h + t + j) = combine h (fun i => count (state i) (t + j)) := by
    rw [show 2 * h + t + j = 2 * h + (t + j) by omega,
      finiteSumCount_eq_shifted h (t + j) hbase, hc]
  exact congrArg (fun value => eval (t + 2 * (h : ℚ)) operatorCoeffs[j]! * value) he

/-- The exact finite sum in the paper's proof satisfies the published order-eight
operator at every natural index. Identification with permutations is separate. -/
theorem finiteSumCount_orderEight (n : ℕ) :
    orderEight n (fun j => finiteSumCount (n + j)) = 0 := by
  by_cases hn : 4 ≤ n
  · let h := (n - 4) / 2
    let t := 4 + (n - 4) % 2
    have ht : t = 4 ∨ t = 5 := by dsimp [t]; omega
    have hn' : n = 2 * h + t := by dsimp [h, t]; omega
    rw [hn']
    exact finiteSumCount_orderEight_shift h t ht
  · interval_cases n <;> decide +kernel

/-- Explicitly isolates the remaining identification of the finite sum with
the original permutation count. -/
theorem permutationCount_orderEight_of_count
    (hcount : ∀ n, (permutationCount n : ℚ) = finiteSumCount n) (n : ℕ) :
    orderEight n (fun j => (permutationCount (n + j) : ℚ)) = 0 := by
  have he : (fun j => (permutationCount (n + j) : ℚ)) = (fun j => finiteSumCount (n + j)) :=
    funext (fun j => hcount (n + j))
  exact (congrArg (orderEight n) he).trans (finiteSumCount_orderEight n)

end KauersKoutschan
