module
public import Mathlib.Analysis.Real.Sqrt
public import Mathlib.Algebra.BigOperators.Intervals
public import Mathlib.Algebra.BigOperators.Ring.Finset
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Positivity
import Mathlib.Tactic.Ring

@[expose] public section
namespace PomeranceSarkozy

open Finset
open scoped BigOperators

/-- A nonnegative sequence with square-root cumulative growth has
uniformly bounded reciprocally weighted partial sums. The proof uses
the exact contribution on successive intervals with endpoints 4^k. -/
theorem weighted_prefix_bounded_of_sqrt (c : ℕ→ℝ) (C : ℝ)
    (hc : ∀ n,0≤c n) (hC : 0≤C)
    (h : ∀ N,(∑ j ∈ Finset.range (N+1),c j)≤C*Real.sqrt (N:ℝ)) :
    ∃ B : ℝ,∀ N,(∑ j ∈ Finset.range (N+1),c j/(j:ℝ))≤B := by
  classical
  let S (N : ℕ) := ∑ j ∈ Finset.range (N+1),c j/(j:ℝ)
  have hmono : Monotone S := by
    intro a b hab
    unfold S
    exact Finset.sum_le_sum_of_subset_of_nonneg (Finset.range_mono (Nat.succ_le_succ hab))
      (fun j _ _ => div_nonneg (hc _) (Nat.cast_nonneg _))
  have hblock (r : ℕ) : S (4^(r+1))≤S (4^r)+2*C*(1/2:ℝ)^r := by
    have h₄ : (4:ℕ)^r≤4^(r+1) := Nat.pow_le_pow_right (by norm_num) (by omega)
    have hpos : (0:ℝ)<((4:ℕ)^r:ℝ) := by positivity
    let I := Finset.Ico ((4:ℕ)^r+1) (4^(r+1)+1)
    have hsub : I⊆Finset.range ((4:ℕ)^(r+1)+1) := by
      intro j hj
      exact Finset.mem_range.mpr (Finset.mem_Ico.mp hj).2
    have hs : S (4^(r+1))-S (4^r)=∑ j ∈ I,c j/(j:ℝ) := by
      unfold S I
      exact (Finset.sum_Ico_eq_sub (fun j => c j/(j:ℝ)) (Nat.succ_le_succ h₄)).symm
    have hle : (∑ j ∈ I,c j/(j:ℝ))≤(C*Real.sqrt (((4:ℕ)^(r+1):ℕ):ℝ))/((4:ℕ)^r:ℝ) := by
      calc
        _ ≤ ∑ j ∈ I,c j/((4:ℕ)^r:ℝ) := by
          apply Finset.sum_le_sum
          intro j hj
          have hj' : ((4:ℕ)^r:ℝ)≤(j:ℝ) := by exact_mod_cast
            (Nat.le_of_lt (Finset.mem_Ico.mp hj).1)
          exact div_le_div_of_nonneg_left (hc _) hpos hj'
        _ = (∑ j ∈ I,c j)/((4:ℕ)^r:ℝ) := by simp only [div_eq_mul_inv,Finset.sum_mul]
        _ ≤ _ := by
          apply div_le_div_of_nonneg_right _ hpos.le
          exact (Finset.sum_le_sum_of_subset_of_nonneg hsub (fun j _ _ => hc j)).trans (h _)
    have he : C*Real.sqrt (((4:ℕ)^(r+1):ℕ):ℝ)/((4:ℕ)^r:ℝ)=2*C*(1/2:ℝ)^r := by
      have hsq : (4:ℝ)^(r+1)=((2:ℝ)^(r+1))^2 := by
        rw [← pow_mul,Nat.mul_comm,pow_mul]
        norm_num
      have hsqrt : Real.sqrt ((4:ℝ)^(r+1))=(2:ℝ)^(r+1) := by
        rw [hsq,Real.sqrt_sq (by positivity)]
      push_cast
      rw [hsqrt,pow_succ]
      calc
        _ = 2*C*((2:ℝ)^r/4^r) := by ring
        _ = _ := by rw [← div_pow,show (2:ℝ)/4=1/2 by norm_num]
    rw [← hs,he] at hle
    linarith
  have hscaled (r : ℕ) : S (4^r)≤S 1+4*C*(1-(1/2:ℝ)^r) := by
    induction r with
    | zero => simp
    | succ r hr =>
      calc
        S (4^(r+1))≤S (4^r)+2*C*(1/2:ℝ)^r := hblock r
        _ ≤ (S 1+4*C*(1-(1/2:ℝ)^r))+2*C*(1/2:ℝ)^r := add_le_add hr le_rfl
        _ = _ := by rw [pow_succ (1/2:ℝ)]; ring
  have hN (N : ℕ) : N≤(4:ℕ)^N := by
    induction N with
    | zero => simp
    | succ N ih =>
      rw [pow_succ]
      have hp : 0<(4:ℕ)^N := by positivity
      omega
  refine ⟨S 1+4*C,fun N => (hmono (hN N)).trans ((hscaled N).trans ?_)⟩
  have hx : 0≤4*C*(1/2:ℝ)^N := by positivity
  linarith

end PomeranceSarkozy
