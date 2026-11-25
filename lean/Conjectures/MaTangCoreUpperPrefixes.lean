import Conjectures.MaTangCoreUpperDistinct

/-!
# Ma–Tang's random subset-sum threshold conjecture
First-failure decomposition for the literal finite word sample space.
The statistic may be supplied by any group-model construction with
the stated initial moment and shift-sum identities.
-/
namespace MaTangCoreUpperPrefixes
open MaTangCoreBirthday MaTangCoreOccupancy MaTangCoreUpperDyadic MaTangCoreUpperDistinct

def badAt {α : Type} (missing : List α → Nat) (n i : Nat) (w : List α) : Bool :=
  decide (n < threshold i*missing w)

def flagged {α : Type} (missing : List α → Nat) (n : Nat) : Nat → List α → Bool
  | 0, w => badAt missing n 0 w
  | i+1, w => flagged missing n i w.tail || badAt missing n (i+1) w

def freshBad {α : Type} (missing : List α → Nat) (n i : Nat) (w : List α) : Bool :=
  !flagged missing n i w.tail && badAt missing n (i+1) w

theorem flagged_eq_or {α : Type} (missing : List α → Nat) (n i : Nat) :
    flagged missing n (i+1) =
      fun w => flagged missing n i w.tail || freshBad missing n i w := by
  funext w
  cases h : flagged missing n i w.tail <;> simp [flagged,freshBad,h]

theorem current_good {α : Type} (missing : List α → Nat) (n i : Nat) (w : List α)
    (h : flagged missing n i w = false) : threshold i*missing w ≤ n := by
  cases i with
  | zero => simpa [flagged,badAt] using h
  | succ i =>
    have h' : badAt missing n (i+1) w = false :=
      (Bool.or_eq_false_iff.mp h).2
    simpa [badAt] using h'

theorem tally_badAt {α β : Type} (x : α → Nat) (ys : List β) (f : β → α)
    (n i : Nat) :
    tally (fun a => decide (n < threshold i*x (f a))) ys =
      badCount n (threshold i) (ys.map fun a => x (f a)) := by
  rw [badCount, ← MaTangCoreGenerator.tally_filter_length, tally_map]

theorem extend_inherited {α : Type} (A : List α) (W : List (List α))
    (p : List α → Bool) :
    tally (fun w => p w.tail) (extend A W) = A.length*tally p W := by
  induction A with
  | nil => simp [extend,tally]
  | cons a as ih =>
    rw [extend,tally_append,tally_map,ih]
    simp only [List.tail_cons,List.length_cons,Nat.add_mul,Nat.one_mul]
    change tally p W + as.length*tally p W = as.length*tally p W + tally p W
    exact Nat.add_comm _ _

theorem sum_map_add {α : Type} (W : List α) (f g : α → Nat) :
    (W.map (fun w => f w+g w)).sum = (W.map f).sum+(W.map g).sum := by
  induction W with
  | nil => rfl
  | cons w ws ih => simp only [List.map_cons,List.sum_cons,ih]; omega

theorem sum_indicator {α : Type} (W : List α) (p : α → Bool) :
    (W.map (fun w => if p w then 1 else 0)).sum = tally p W := by
  induction W with
  | nil => rfl
  | cons w ws ih => cases hw : p w <;> simp [tally, hw, ih] <;> omega

theorem count_extend_by_parent {α : Type} (A : List α) (W : List (List α))
    (p : List α → Bool) :
    tally p (extend A W) = (W.map (fun w => tally (fun a => p (a::w)) A)).sum := by
  induction A with
  | nil =>
    rw [extend]
    induction W with
    | nil => rfl
    | cons w ws ih => simpa [tally] using ih
  | cons a rest ih =>
    rw [extend,tally_append,tally_map,ih,← sum_indicator]
    rw [← sum_map_add]
    congr 2

theorem pointwise_scale_sum {α : Type} (W : List α) (f : α → Nat) (p q : Nat)
    (h : ∀ w ∈ W, p*f w ≤ q) :
    p*(W.map f).sum ≤ W.length*q := by
  induction W with
  | nil => simp
  | cons w ws ih =>
    have h₀ := h w (by simp)
    have h₁ := ih (fun x hx => h x (by simp [hx]))
    simp only [List.map_cons,List.sum_cons,List.length_cons,Nat.mul_add,Nat.add_mul,Nat.one_mul]
    omega

theorem parent_fresh_bound {α : Type} (A : List α) (missing : List α → Nat)
    (hn : 0 < A.length) (i : Nat) (w : List α)
    (hshift : (A.map (fun a => missing (a::w))).sum = missing w*missing w) :
    2^(i+3)*tally (fun a => freshBad missing A.length i (a::w)) A ≤ A.length := by
  cases hf : flagged missing A.length i w
  · have he : (fun a => freshBad missing A.length i (a::w)) =
        (fun a => decide (A.length < threshold (i+1)*missing (a::w))) := by
      funext a
      simp [freshBad,hf,badAt]
    rw [he,tally_badAt missing A (fun a => a::w)]
    exact child_bad A.length i (missing w) hn _ (current_good missing A.length i w hf) hshift
  · have he : (fun a => freshBad missing A.length i (a::w)) = fun _ => false := by
      funext a
      simp [freshBad,hf]
    rw [he,tally_false,Nat.mul_zero]
    exact Nat.zero_le _

/-- The literal ordered-word failure count from the two underlying
moment identities; no extra first-failure or recursion hypothesis. -/
theorem iid_missing_le {α : Type} (A : List α) (missing : List α → Nat) (k₀ : Nat)
    (hn : 0 < A.length)
    (hinit : 512*((words A k₀).map missing).sum ≤ (words A k₀).length*A.length)
    (hshift : ∀ w, (A.map (fun a => missing (a::w))).sum = missing w*missing w) :
    16*tally (fun w => decide (0 < missing w)) (words A (k₀+upperSteps A.length)) ≤
      5*(words A (k₀+upperSteps A.length)).length := by
  let n := A.length
  let total := (words A k₀).length
  let bad := fun i => tally (flagged missing n i) (words A (k₀+i))
  let fresh := fun i => tally (freshBad missing n i) (extend A (words A (k₀+i)))
  have hlen (i : Nat) : (words A (k₀+i)).length = total*n^i := by
    dsimp [total,n]
    rw [words_length,words_length,Nat.pow_add]
  have h₀ : 16*bad 0 ≤ total := by
    change 16*tally (fun w => decide (n<threshold 0*missing w)) (words A k₀) ≤ total
    have he : tally (fun w => decide (n<threshold 0*missing w)) (words A k₀) =
        badCount n (threshold 0) ((words A k₀).map missing) :=
      tally_badAt missing (words A k₀) (fun w => w) n 0
    rw [he]
    have h := initial_bad n hn ((words A k₀).map missing) (by simpa using hinit)
    simpa [total] using h
  have hs (i : Nat) : bad (i+1) ≤ n*bad i+fresh i := by
    change tally (flagged missing n (i+1)) (extend A (words A (k₀+i))) ≤ _
    rw [flagged_eq_or]
    have hi := tally_or_le (fun w => flagged missing n i w.tail)
      (freshBad missing n i) (extend A (words A (k₀+i)))
    rwa [extend_inherited] at hi
  have hf (i : Nat) : 2^(i+3)*fresh i ≤ total*n^(i+1) := by
    change 2^(i+3)*tally (freshBad missing n i) (extend A (words A (k₀+i))) ≤ _
    rw [count_extend_by_parent]
    have h := pointwise_scale_sum (words A (k₀+i))
      (fun w => tally (fun a => freshBad missing n i (a::w)) A) (2^(i+3)) n
      (fun w _ => parent_fresh_bound A missing hn i w (hshift w))
    rw [hlen] at h
    rw [Nat.pow_succ n i]
    exact Nat.le_trans h (Nat.le_of_eq (by ac_rfl))
  let j := upperSteps n
  have hcharged := failure_fraction n total bad fresh h₀ hs hf j
  rw [← hlen] at hcharged
  have hmono : tally (fun w => decide (0<missing w)) (words A (k₀+j)) ≤ bad j := by
    apply tally_mono_on
    intro w _ hw
    have hm : 0 < missing w := of_decide_eq_true hw
    cases hh : flagged missing n j w
    · have hz := good_terminal_is_zero n (missing w) (by omega)
        (current_good missing n j w hh)
      omega
    · rfl
  exact Nat.le_trans (Nat.mul_le_mul_left _ hmono) hcharged

/-- More than half of the genuine ordered distinct samples cover, once
the missing statistic satisfies the two stated group moment identities. -/
theorem distinct_missing_success {α : Type} [BEq α] [LawfulBEq α]
    (A : List α) (hA : A.Nodup) (missing : List α → Nat)
    (hN : 2^16 ≤ A.length)
    (hinit : 512*((words A (A.length.log2+10)).map missing).sum ≤
      (words A (A.length.log2+10)).length*A.length)
    (hshift : ∀ w, (A.map (fun a => missing (a::w))).sum = missing w*missing w) :
    (distinctWords A (upperSampleSize A.length)).length <
      2*tally (fun w => !(decide (0 < missing w))) (distinctWords A (upperSampleSize A.length)) := by
  exact upper_distinct_success_gt_half A hA hN _ (iid_missing_le A missing _ (by omega) hinit hshift)

end MaTangCoreUpperPrefixes

