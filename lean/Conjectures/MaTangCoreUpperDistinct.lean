import Conjectures.MaTangCoreBirthday
import Conjectures.MaTangCoreUpperDyadic

/-!
# Ma–Tang's random subset-sum threshold conjecture
Distinct-word conditioning at the universal upper sample size, for
any duplicate-free alphabet and any finite failure predicate.
-/
namespace MaTangCoreUpperDistinct
open MaTangCoreOccupancy MaTangCoreBirthday MaTangCoreUpperDyadic

theorem birthday_double_scaled {α : Type} [BEq α] [LawfulBEq α]
    (A : List α) (hA : A.Nodup) (k : Nat) :
    (2*A.length)*tally duplicateB (words A k) ≤ k*k*(words A k).length := by
  induction k with
  | zero => simp [words,tally,duplicateB]
  | succ k ih =>
    let N := A.length
    let W := words A k
    have h : ∀ a ∈ A, (2*N)*tally (fun w => duplicateB (a::w)) W ≤
        (k+1)*(k+1)*W.length := by
      intro a _
      have hb := tally_or_le (containsB a) duplicateB W
      have hc : (2*N)*tally (containsB a) W ≤ (2*k)*W.length := by
        calc
          (2*N)*tally (containsB a) W = 2*(N*tally (containsB a) W) :=
            Nat.mul_assoc ..
          _ ≤ 2*(k*W.length) := Nat.mul_le_mul_left _ (contains_count_scaled a A hA k)
          _ = (2*k)*W.length := (Nat.mul_assoc ..).symm
      have he : (2*k)*W.length+k*k*W.length ≤ (k+1)*(k+1)*W.length := by
        rw [← Nat.add_mul]
        apply Nat.mul_le_mul_right
        simp only [Nat.add_mul,Nat.mul_add,Nat.one_mul,Nat.mul_one]
        omega
      calc
        (2*N)*tally (fun w => duplicateB (a::w)) W
            ≤ (2*N)*(tally (containsB a) W+tally duplicateB W) :=
          Nat.mul_le_mul_left _ hb
        _ = (2*N)*tally (containsB a) W+(2*N)*tally duplicateB W := Nat.mul_add _ _ _
        _ ≤ (2*k)*W.length+k*k*W.length := Nat.add_le_add hc ih
        _ ≤ _ := he
    have hh := tally_extend_scaled duplicateB A W (2*N) _ h
    change (2*N)*tally duplicateB (extend A W) ≤ (k+1)*(k+1)*(extend A W).length
    have hlen : (extend A W).length = N*W.length := by
      have h0 := words_length A (k+1)
      change (extend A W).length = _ at h0
      rw [h0,Nat.pow_succ,← words_length A k,Nat.mul_comm]
    rw [hlen]
    apply Nat.le_trans hh
    have he : A.length*((k+1)*(k+1)*W.length) = (k+1)*(k+1)*(N*W.length) := by
      change N*((k+1)*(k+1)*W.length) = _
      ac_rfl
    exact Nat.le_of_eq he

theorem distinctWords_seven_eighths {α : Type} [BEq α] [LawfulBEq α]
    (A : List α) (hA : A.Nodup) (k : Nat) (hN : 0 < A.length)
    (h : 4*(k*k) ≤ A.length) :
    7*(words A k).length ≤ 8*(distinctWords A k).length := by
  let N := A.length
  let B := tally duplicateB (words A k)
  let T := (words A k).length
  let D := (distinctWords A k).length
  have hb : (2*N)*B ≤ k*k*T := birthday_double_scaled A hA k
  have he : N*(8*B) ≤ N*T := by
    calc
      N*(8*B) = 4*((2*N)*B) := by
        change N*((4*2)*B) = _
        ac_rfl
      _ ≤ 4*(k*k*T) := Nat.mul_le_mul_left 4 hb
      _ = (4*(k*k))*T := (Nat.mul_assoc ..).symm
      _ ≤ N*T := Nat.mul_le_mul_right _ h
  have hb' := Nat.le_of_mul_le_mul_left he hN
  have hc := tally_compl duplicateB (words A k)
  rw [MaTangCoreGenerator.tally_filter_length] at hc
  change D+B=T at hc
  change 7*T ≤ 8*D
  omega

theorem filtered_tally_le {α : Type} (p q : α → Bool) (xs : List α) :
    tally p (xs.filter q) ≤ tally p xs := by
  induction xs with
  | nil => exact Nat.le_refl _
  | cons a xs ih =>
    cases hq : q a <;> cases hp : p a <;>
      simp [hq, hp, tally] <;> omega

/-- The actual conditioning inequality on uniformly sampled words of the
chosen sample size. The iid failure estimate is an explicit input. -/
theorem upper_distinct_failure {α : Type} [BEq α] [LawfulBEq α]
    (A : List α) (hA : A.Nodup) (hN : 2^16 ≤ A.length)
    (p : List α → Bool)
    (h : 16*tally p (words A (upperSampleSize A.length)) ≤
      5*(words A (upperSampleSize A.length)).length) :
    14*tally p (distinctWords A (upperSampleSize A.length)) ≤
      5*(distinctWords A (upperSampleSize A.length)).length := by
  let k := upperSampleSize A.length
  have hd := distinctWords_seven_eighths A hA k (by omega)
    (upper_birthday_budget A.length hN)
  have hs : tally p (distinctWords A k) ≤ tally p (words A k) :=
    filtered_tally_le p (fun w => !duplicateB w) (words A k)
  exact conditioned_failure _ _ _ _ h hd hs

theorem upper_distinct_success_gt_half {α : Type} [BEq α] [LawfulBEq α]
    (A : List α) (hA : A.Nodup) (hN : 2^16 ≤ A.length)
    (p : List α → Bool)
    (h : 16*tally p (words A (upperSampleSize A.length)) ≤
      5*(words A (upperSampleSize A.length)).length) :
    (distinctWords A (upperSampleSize A.length)).length <
      2*tally (fun w => !p w) (distinctWords A (upperSampleSize A.length)) := by
  let k := upperSampleSize A.length
  let W := distinctWords A k
  have hbad : 14*tally p W ≤ 5*W.length := upper_distinct_failure A hA hN p h
  have hhalf : 7*(words A k).length ≤ 8*W.length :=
    distinctWords_seven_eighths A hA k (by omega) (upper_birthday_budget A.length hN)
  have hp : 0 < (words A k).length := by
    rw [words_length]
    exact Nat.pow_pos (by omega)
  have ht := tally_compl p W
  change W.length < 2*tally (fun w => !p w) W
  omega

end MaTangCoreUpperDistinct

