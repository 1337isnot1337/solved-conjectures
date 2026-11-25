module
public import Mathlib.Data.Nat.Choose.Sum
public import Mathlib.Tactic

@[expose] public section
namespace PomeranceSarkozy

open Finset

def truncatedAlternatingChoose (d r : ℕ) : ℤ :=
  ∑ k ∈ Finset.range (r+1),(-1:ℤ)^k*(d.choose k:ℤ)

theorem truncatedAlternatingChoose_zero (r : ℕ) :
    truncatedAlternatingChoose 0 r=1 := by
  unfold truncatedAlternatingChoose
  rw [Finset.sum_eq_single 0]
  · simp
  · intro k _ hk
    rw [Nat.choose_eq_zero_of_lt (Nat.pos_of_ne_zero hk)]
    simp
  · simp

/-- Exact deterministic error inequality for a truncated
inclusion-exclusion sum on a set of size d. -/
theorem truncatedAlternatingChoose_error (d r : ℕ) :
    |truncatedAlternatingChoose d r-(if d=0 then 1 else 0)| ≤ (d.choose (r+1):ℤ) := by
  cases d with
  | zero => simp [truncatedAlternatingChoose_zero]
  | succ d =>
    unfold truncatedAlternatingChoose
    rw [Int.alternating_sum_range_choose_eq_choose]
    simp only [Nat.succ_ne_zero,ite_false,sub_zero,abs_mul,abs_pow,abs_neg,abs_one,one_pow,one_mul]
    have hd : d.choose r ≤ (d+1).choose (r+1) := by rw [Nat.choose_succ_succ']; omega
    rw [abs_of_nonneg (by positivity)]
    exact_mod_cast hd

theorem powerset_truncated_alternating (S : Finset ℕ) (r : ℕ) :
    (∑ T ∈ S.powerset with T.card≤r,(-1:ℤ)^T.card) = truncatedAlternatingChoose S.card r := by
  classical
  have hf : S.powerset.filter (fun T => T.card≤r) =
      S.powerset.filter (fun T => T.card∈Finset.range (r+1)) := by
    ext T
    simp
  rw [hf,← Finset.sum_fiberwise_eq_sum_filter]
  unfold truncatedAlternatingChoose
  apply Finset.sum_congr rfl
  intro k _
  have hset : S.powerset.filter (fun T => T.card=k) = S.powersetCard k := by
    ext T
    simp
  rw [hset]
  have hmod : (∑ T ∈ S.powersetCard k,(-1:ℤ)^T.card) =
      ∑ T ∈ S.powersetCard k,(-1:ℤ)^k :=
    Finset.sum_congr rfl (fun T ht => by rw [(Finset.mem_powersetCard.mp ht).2])
  rw [hmod,Finset.sum_const,nsmul_eq_mul,Finset.card_powersetCard,mul_comm]

theorem powerset_truncated_alternating_error (S : Finset ℕ) (r : ℕ) :
    |(∑ T ∈ S.powerset with T.card≤r,(-1:ℤ)^T.card)-(if S=∅ then 1 else 0)| ≤
      (S.card.choose (r+1):ℤ) := by
  rw [powerset_truncated_alternating]
  simpa only [Finset.card_eq_zero] using truncatedAlternatingChoose_error S.card r

end PomeranceSarkozy
