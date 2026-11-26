module
public import Mathlib.Topology.Algebra.InfiniteSum.ENNReal
public import Mathlib.Order.Interval.Finset.Nat
import Mathlib.Tactic.Positivity

@[expose] public section
namespace PomeranceSarkozy

open scoped ENNReal BigOperators

noncomputable def bandMass (p : ℕ→ℝ≥0∞) (B h : ℕ) : ℝ≥0∞ :=
  ∑' k,if h≤k+B ∧ k≤h+B then p k else 0

/-- An atom appears in at most 2B+1 threshold bands. This bounds the
expected count of near-threshold events without a local limit theorem. -/
theorem bandMass_tsum_le (p : ℕ→ℝ≥0∞) (B : ℕ) (hp : (∑' k,p k)=1) :
    (∑' h,bandMass p B h)≤((2*B+1:ℕ):ℝ≥0∞) := by
  unfold bandMass
  rw [ENNReal.tsum_comm]
  have he (k h : ℕ) : h≤k+B ∧ k≤h+B ↔ h∈Finset.Icc (k-B) (k+B) := by
    rw [Finset.mem_Icc]
    omega
  calc
    _ ≤ ∑' k,((2*B+1:ℕ):ℝ≥0∞)*p k := by
      apply ENNReal.tsum_le_tsum
      intro k
      rw [tsum_eq_sum (s:=Finset.Icc (k-B) (k+B))]
      · have hterm (h : ℕ) (hh : h∈Finset.Icc (k-B) (k+B)) :
            (if h≤k+B ∧ k≤h+B then p k else 0)=p k := ite_eq_left ((he k h).mpr hh)
        rw [Finset.sum_congr rfl hterm,Finset.sum_const,nsmul_eq_mul]
        exact mul_le_mul_of_nonneg_right (by
          exact_mod_cast (show (Finset.Icc (k-B) (k+B)).card≤2*B+1 by rw [Nat.card_Icc]; omega))
          (by positivity)
      · intro h hh
        exact ite_eq_right (fun hh' => hh ((he k h).mp hh'))
    _ = _ := by rw [ENNReal.tsum_mul_left,hp,mul_one]

end PomeranceSarkozy
