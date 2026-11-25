import Conjectures.MaTangCoreLowerBound

/-!
# Ma–Tang's random subset-sum threshold conjecture

A finite birthday bound for arbitrary duplicate-free alphabets.
-/
namespace MaTangCoreBirthday
open MaTangCoreMatrix MaTangCoreIndexed MaTangCoreOccupancy MaTangCoreSubspace
open MaTangCoreRank MaTangCoreGenerator MaTangCoreQuotient MaTangCoreLinear
open MaTangCoreEncoding MaTangCoreFactor MaTangCoreMultiplicity MaTangCoreCoupling
open MaTangCoreDecay MaTangCoreLowerBound

def containsB {α : Type} [BEq α] (a : α) (w : List α) : Bool :=
  w.any (fun b => b == a)

theorem containsB_true {α : Type} [BEq α] [LawfulBEq α]
    (a : α) (w : List α) : containsB a w = true ↔ a ∈ w := by
  simp [containsB,List.any_eq_true]

theorem containsB_false {α : Type} [BEq α] [LawfulBEq α]
    (a : α) (w : List α) : containsB a w = false ↔ a ∉ w := by
  cases e : containsB a w
  · constructor
    · intro _ h
      have he := (containsB_true a w).mpr h
      simp [e] at he
    · intro _
      rfl
  · have h := (containsB_true a w).mp e
    simp [h]

theorem tally_true {α : Type} (ws : List α) : tally (fun _ => true) ws = ws.length := by
  induction ws with
  | nil => rfl
  | cons a as ih => simp [tally,ih,Nat.add_comm]

theorem tally_eq_le_one {α : Type} [BEq α] [LawfulBEq α]
    (a : α) (A : List α) (h : A.Nodup) :
    tally (fun x => x == a) A ≤ 1 := by
  induction A with
  | nil => simp [tally]
  | cons x xs ih =>
    obtain ⟨hn,hs⟩ := List.nodup_cons.mp h
    by_cases e : x = a
    · subst x
      have hz : tally (fun x => x == a) xs = 0 := by
        apply (tally_eq_zero_iff_all_false _ _).mpr
        intro b hb
        have he : b ≠ a := fun eq => hn (eq ▸ hb)
        simp [he]
      simp [tally,hz]
    · simpa [tally,e] using ih hs

/-- Count words containing a specified letter, using at most one
occurrence of that letter in the alphabet. -/
theorem tally_extend_contains {α : Type} [BEq α] [LawfulBEq α]
    (a : α) (A : List α) (W : List (List α)) :
    tally (containsB a) (extend A W) ≤
      A.length*tally (containsB a) W + W.length*tally (fun x => x == a) A := by
  induction A with
  | nil => simp [extend,tally]
  | cons x xs ih =>
    rw [extend,tally_append,tally_map]
    by_cases e : x = a
    · subst x
      have he : (fun w : List α => containsB a (a::w)) = fun _ => true := by
        funext w
        simp [containsB]
      rw [he,tally_true]
      simp only [List.length_cons,tally,beq_self_eq_true,ite_true,Nat.add_mul,Nat.mul_add,Nat.one_mul,Nat.mul_one]
      omega
    · have he : (fun w : List α => containsB a (x::w)) = containsB a := by
        funext w
        simp [containsB,e]
      rw [he]
      simp [tally,e,Nat.add_mul]
      omega

theorem contains_count_scaled {α : Type} [BEq α] [LawfulBEq α]
    (a : α) (A : List α) (hA : A.Nodup) (k : Nat) :
    A.length*tally (containsB a) (words A k) ≤ k*(words A k).length := by
  induction k with
  | zero => simp [words,containsB,tally]
  | succ k ih =>
    let N := A.length
    let W := words A k
    let C := tally (containsB a) W
    have he : tally (containsB a) (extend A W) ≤ N*C+W.length := by
      have h := tally_extend_contains a A W
      exact Nat.le_trans h (Nat.add_le_add_left
        (by simpa using Nat.mul_le_mul_left W.length (tally_eq_le_one a A hA)) _)
    have hmul := Nat.mul_le_mul_left N he
    have hprev : N*C ≤ k*W.length := ih
    change N*tally (containsB a) (extend A W) ≤ (k+1)*(extend A W).length
    have hlen : (extend A W).length = N*W.length := by
      have h0 := words_length A (k+1)
      change (extend A W).length = _ at h0
      rw [h0,Nat.pow_succ,← words_length A k,Nat.mul_comm]
    rw [hlen]
    calc
      N*tally (containsB a) (extend A W) ≤ N*(N*C+W.length) := hmul
      _ = N*(N*C)+N*W.length := Nat.mul_add _ _ _
      _ ≤ N*(k*W.length)+N*W.length :=
        Nat.add_le_add_right (Nat.mul_le_mul_left N hprev) _
      _ = (k+1)*(N*W.length) := by rw [Nat.add_mul,Nat.one_mul]; ac_rfl

def duplicateB {α : Type} [BEq α] : List α → Bool
  | [] => false
  | a :: w => containsB a w || duplicateB w

theorem duplicateB_false {α : Type} [BEq α] [LawfulBEq α] (w : List α) :
    duplicateB w = false ↔ w.Nodup := by
  induction w with
  | nil => simp [duplicateB]
  | cons a w ih =>
    simp [duplicateB,containsB_false,ih,List.nodup_cons]

theorem tally_extend_scaled {α : Type} (p : List α → Bool)
    (A : List α) (W : List (List α)) (N B : Nat)
    (h : ∀ a ∈ A, N*tally (fun w => p (a::w)) W ≤ B) :
    N*tally p (extend A W) ≤ A.length*B := by
  induction A with
  | nil => simp [extend,tally]
  | cons a as ih =>
    have ha := h a (by simp)
    have hs := ih (fun b hb => h b (by simp [hb]))
    rw [extend,tally_append,tally_map,Nat.mul_add]
    simp only [List.length_cons,Nat.add_mul,Nat.one_mul]
    omega

/-- A convenient non-sharp birthday bound, in integer form:
the fraction of words with repeats is at most k^2 / |A|. -/
theorem birthday_scaled {α : Type} [BEq α] [LawfulBEq α]
    (A : List α) (hA : A.Nodup) (k : Nat) :
    A.length*tally duplicateB (words A k) ≤ k*k*(words A k).length := by
  induction k with
  | zero => simp [words,tally,duplicateB]
  | succ k ih =>
    let N := A.length
    let W := words A k
    have h : ∀ a ∈ A, N*tally (fun w => duplicateB (a::w)) W ≤
        (k+1)*(k+1)*W.length := by
      intro a _
      have hb := tally_or_le (containsB a) duplicateB W
      have hc := contains_count_scaled a A hA k
      have he : k*W.length+k*k*W.length ≤ (k+1)*(k+1)*W.length := by
        rw [← Nat.add_mul]
        apply Nat.mul_le_mul_right
        simp only [Nat.add_mul,Nat.mul_add,Nat.one_mul,Nat.mul_one]
        omega
      calc
        N*tally (fun w => duplicateB (a::w)) W
            ≤ N*(tally (containsB a) W+tally duplicateB W) :=
          Nat.mul_le_mul_left N hb
        _ = N*tally (containsB a) W+N*tally duplicateB W := Nat.mul_add _ _ _
        _ ≤ k*W.length+k*k*W.length := Nat.add_le_add hc ih
        _ ≤ _ := he
    have hh := tally_extend_scaled duplicateB A W N _ h
    change N*tally duplicateB (extend A W) ≤ (k+1)*(k+1)*(extend A W).length
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

def distinctWords {α : Type} [BEq α] (A : List α) (k : Nat) : List (List α) :=
  (words A k).filter fun w => !duplicateB w

theorem distinctWords_mem {α : Type} [BEq α] [LawfulBEq α]
    (A : List α) (k : Nat) (w : List α) :
    w ∈ distinctWords A k ↔ w ∈ words A k ∧ w.Nodup := by
  simp [distinctWords,duplicateB_false]

theorem distinctWords_half {α : Type} [BEq α] [LawfulBEq α]
    (A : List α) (hA : A.Nodup) (k : Nat)
    (hN : 0 < A.length) (h : 2*k*k ≤ A.length) :
    (words A k).length ≤ 2*(distinctWords A k).length := by
  let N := A.length
  let B := tally duplicateB (words A k)
  let T := (words A k).length
  let D := (distinctWords A k).length
  have hb : N*B ≤ k*k*T := birthday_scaled A hA k
  have he : N*(2*B) ≤ N*T := by
    calc
      N*(2*B) = 2*(N*B) := by ac_rfl
      _ ≤ 2*(k*k*T) := Nat.mul_le_mul_left 2 hb
      _ = (2*k*k)*T := by ac_rfl
      _ ≤ N*T := Nat.mul_le_mul_right _ h
  have h2 := Nat.le_of_mul_le_mul_left he hN
  have hc := tally_compl duplicateB (words A k)
  rw [tally_filter_length] at hc
  change D+B=T at hc
  omega

end MaTangCoreBirthday
