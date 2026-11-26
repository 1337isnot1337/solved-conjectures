module
public import Conjectures.PomeranceSarkozyAtomKernel
public import Mathlib.Data.Rat.Cast.Order

@[expose] public section
namespace PomeranceSarkozy

open Finset
open Classical
variable {A : Type*} [DecidableEq A]

def lawInclusion (I : Finset A) (p : Finset A→ℚ) (T : Finset A) : ℚ :=
  ∑ B ∈ I.powerset,if T⊆B then p B else 0

def recoverAtom (I : Finset A) (p : Finset A→ℚ) (S : Finset A) (r : ℕ) : ℚ :=
  ∑ T ∈ (I\S).powerset with T.card≤r,(-1:ℚ)^T.card*lawInclusion I p (S∪T)

def recoverRemainder (I : Finset A) (p : Finset A→ℚ) (S : Finset A) (r : ℕ) : ℚ :=
  ∑ T ∈ (I\S).powersetCard (r+1),lawInclusion I p (S∪T)

theorem recoverAtom_as_pointwise (I : Finset A) (p : Finset A→ℚ) (S : Finset A) (r : ℕ) :
    recoverAtom I p S r = ∑ B ∈ I.powerset,p B*(signedAtomKernel I S B r:ℚ) := by
  unfold recoverAtom lawInclusion signedAtomKernel
  simp_rw [Finset.mul_sum]
  rw [Finset.sum_comm (s:=(I\S).powerset.filter (fun T => T.card≤r))]
  apply Finset.sum_congr rfl
  intro B _
  rw [Int.cast_sum,Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro T _
  by_cases h : S∪T⊆B <;> simp [h,mul_comm]

theorem recoverRemainder_as_pointwise (I : Finset A) (p : Finset A→ℚ) (S : Finset A) (r : ℕ) :
    recoverRemainder I p S r = ∑ B ∈ I.powerset,p B*(atomRemainderKernel I S B r:ℚ) := by
  unfold recoverRemainder lawInclusion atomRemainderKernel
  rw [Finset.sum_comm (s:=(I\S).powersetCard (r+1))]
  apply Finset.sum_congr rfl
  intro B _
  rw [Int.cast_sum,Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro T _
  by_cases h : S∪T⊆B <;> simp [h]

/-- A fixed sample atom is recovered up to the exact next-rank inclusion
mass. This is Bonferroni with no asymptotic approximation. -/
theorem recoverAtom_error (I : Finset A) (p : Finset A→ℚ) (S : Finset A) (r : ℕ)
    (hp : ∀ B∈I.powerset,0≤p B) (hS : S⊆I) :
    |recoverAtom I p S r - p S| ≤ recoverRemainder I p S r := by
  have hs : (∑ B ∈ I.powerset,p B*(if B=S then (1:ℚ) else 0)) = p S := by
    simp_rw [mul_ite,mul_one,mul_zero]
    rw [Finset.sum_ite_eq',ite_eq_left (Finset.mem_powerset.mpr hS)]
  rw [recoverAtom_as_pointwise,recoverRemainder_as_pointwise,← hs,← Finset.sum_sub_distrib]
  simp_rw [← mul_sub]
  refine (Finset.abs_sum_le_sum_abs _ _).trans (Finset.sum_le_sum ?_)
  intro B hB
  rw [abs_mul,abs_of_nonneg (hp B hB)]
  apply mul_le_mul_of_nonneg_left _ (hp B hB)
  have he := signedAtomKernel_error I S B r (Finset.mem_powerset.mp hB)
  exact_mod_cast he

/-- The direct comparison between two atom masses, under a bound on
each of their truncated inclusion probabilities. -/
theorem recoverAtom_compare (I : Finset A) (p q : Finset A→ℚ) (S : Finset A) (r : ℕ)
    (hp : ∀ B∈I.powerset,0≤p B) (hq : ∀ B∈I.powerset,0≤q B)
    (hS : S⊆I) (ε : ℚ)
    (he : ∀ T ∈ ((I\S).powerset.filter fun T => T.card≤r),
      |lawInclusion I p (S∪T)-lawInclusion I q (S∪T)|≤ε) :
    |p S-q S| ≤ (recoverRemainder I p S r + recoverRemainder I q S r) +
      (((I\S).powerset.filter fun T => T.card≤r).card:ℚ)*ε := by
  have hb : |recoverAtom I p S r-recoverAtom I q S r| ≤
      (((I\S).powerset.filter fun T => T.card≤r).card:ℚ)*ε := by
    unfold recoverAtom
    rw [← Finset.sum_sub_distrib]
    simp_rw [← mul_sub]
    refine (Finset.abs_sum_le_sum_abs _ _).trans ?_
    calc
      _ ≤ ∑ T ∈ (I\S).powerset with T.card≤r,ε := by
        apply Finset.sum_le_sum
        intro T hT
        rw [abs_mul,abs_pow]
        simp only [abs_neg,abs_one,one_pow,one_mul]
        exact he T hT
      _ = _ := by simp [nsmul_eq_mul]
  have hp' := recoverAtom_error I p S r hp hS
  have hq' := recoverAtom_error I q S r hq hS
  have hjoin : p S-q S = (p S-recoverAtom I p S r) +
      (recoverAtom I p S r-recoverAtom I q S r) + (recoverAtom I q S r-q S) := by ring
  rw [hjoin]
  refine (abs_add_le _ _).trans ?_
  have hstep := abs_add_le (p S-recoverAtom I p S r)
    (recoverAtom I p S r-recoverAtom I q S r)
  rw [abs_sub_comm (p S) (recoverAtom I p S r)] at hstep
  linarith

end PomeranceSarkozy
