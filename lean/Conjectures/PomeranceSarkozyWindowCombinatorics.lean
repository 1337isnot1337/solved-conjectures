module
public import Conjectures.PomeranceSarkozyTruncationSums
public import Mathlib.Data.Nat.Choose.Bounds

@[expose] public section
namespace PomeranceSarkozy

open Finset
open Classical
variable {A : Type*} [DecidableEq A]

omit [DecidableEq A] in
theorem truncatedSubsetCard_sum (I : Finset A) (R : ℕ) :
    (∑ T ∈ smallSubsets I R,2^T.card) =
      ∑ k ∈ Finset.range (R+1),2^k*I.card.choose k := by
  have he : smallSubsets I R=I.powerset.filter (fun T => T.card∈Finset.range (R+1)) := by
    ext T
    simp [smallSubsets]
  rw [he,← Finset.sum_fiberwise_eq_sum_filter]
  apply Finset.sum_congr rfl
  intro k _
  have hset : I.powerset.filter (fun T => T.card=k) = I.powersetCard k := by
    ext T
    simp
  rw [hset]
  have hterms : (∑ T ∈ I.powersetCard k,2^T.card) =
      ∑ _T ∈ I.powersetCard k,2^k :=
    Finset.sum_congr rfl (fun T hT => by rw [(Finset.mem_powersetCard.mp hT).2])
  rw [hterms,Finset.sum_const,Finset.card_powersetCard]
  simp [mul_comm]

theorem geometricWindow_bound (w R : ℕ) :
    (∑ k ∈ Finset.range (R+1),w^k) ≤ (w+1)^R := by
  induction R with
  | zero => simp
  | succ R ih =>
    rw [Finset.sum_range_succ',pow_succ']
    simp_rw [pow_succ' w]
    rw [← Finset.mul_sum,pow_zero]
    have h1 : 1≤(w+1)^R := by
      have hp : 0 < (w+1)^R := pow_pos (by omega) _
      omega
    calc
      _ ≤ w*(w+1)^R+1 := Nat.add_le_add_right (Nat.mul_le_mul_left _ ih) _
      _ ≤ w*(w+1)^R+(w+1)^R := Nat.add_le_add_left h1 _
      _ = _ := by ring

omit [DecidableEq A] in
/-- The exact combinatorial amplification of a uniform inclusion
error is bounded by a single geometric power in the incidence count. -/
theorem truncatedSubsetCard_bound (I : Finset A) (R : ℕ) :
    (∑ T ∈ smallSubsets I R,2^T.card) ≤ (2*I.card+1)^R := by
  rw [truncatedSubsetCard_sum]
  refine (Finset.sum_le_sum ?_).trans (geometricWindow_bound (2*I.card) R)
  intro k _
  rw [mul_pow]
  exact Nat.mul_le_mul_left _ (Nat.choose_le_pow I.card k)

end PomeranceSarkozy
