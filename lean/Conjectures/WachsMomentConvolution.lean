module
public import Conjectures.WachsMomentLogConcavity
public import Mathlib.Algebra.BigOperators.NatAntidiagonal
public import Mathlib.RingTheory.PowerSeries.Basic

@[expose] public section
namespace WachsCompleteGraph

def convNat (f g : ℕ → ℝ) (n : ℕ) : ℝ :=
  ∑ i ∈ Finset.range (n+1), f (n-i)*g i

def lowerEntry (f : ℕ → ℝ) (n i : ℕ) : ℝ :=
  if i≤n then f (n-i) else 0

def lagEntry (g : ℕ → ℝ) (i : ℕ) : ℝ :=
  if 0 < i then g (i-1) else 0

theorem lowerMinor_nonneg {f : ℕ → ℝ} (hf : PositiveLogConcave f)
    (n i j : ℕ) (hij : i < j) (hj : j≤n+1) :
    0 ≤ lowerEntry f n i*lowerEntry f (n+1) j -
      lowerEntry f n j*lowerEntry f (n+1) i := by
  have hi : i≤n := by omega
  have hi' : i≤n+1 := by omega
  unfold lowerEntry
  rw [ite_eq_left hi,ite_eq_left hi',ite_eq_left hj]
  by_cases h : j≤n
  · rw [ite_eq_left h]
    have hsub₁ : n+1-i = (n-i)+1 := by omega
    have hsub₂ : n+1-j = (n-j)+1 := by omega
    rw [hsub₁,hsub₂]
    exact sub_nonneg.mpr (positive_logConcave_cross hf (by omega : n-j≤n-i))
  · rw [ite_eq_right h,zero_mul,sub_zero]
    exact mul_nonneg (hf.1 _).le (hf.1 _).le

theorem upperMinor_nonneg {g : ℕ → ℝ} (hg : PositiveLogConcave g)
    (i j : ℕ) (hij : i < j) :
    0 ≤ g i*lagEntry g j - g j*lagEntry g i := by
  unfold lagEntry
  rw [ite_eq_left (by omega : 0 < j)]
  by_cases hi : 0 < i
  · rw [ite_eq_left hi]
    have hii : i=(i-1)+1 := by omega
    have hjj : j=(j-1)+1 := by omega
    have h := positive_logConcave_cross hg (by omega : i-1≤j-1)
    rwa [← hii,← hjj,mul_comm (g (i-1)),mul_comm (g (j-1)),← sub_nonneg] at h
  · rw [ite_eq_right hi,mul_zero,sub_zero]
    exact mul_nonneg (hg.1 _).le (hg.1 _).le

theorem lower_mul_sum (f g : ℕ → ℝ) (n : ℕ) :
    (∑ i ∈ Finset.range (n+1), lowerEntry f n i*g i) = convNat f g n := by
  unfold convNat
  apply Finset.sum_congr rfl
  intro i hi
  rw [lowerEntry,ite_eq_left (Nat.le_of_lt_succ (Finset.mem_range.mp hi))]

theorem lower_mul_sum_extra (f g : ℕ → ℝ) (n : ℕ) :
    (∑ i ∈ Finset.range (n+2), lowerEntry f n i*g i) = convNat f g n := by
  rw [Finset.sum_range_succ,lower_mul_sum,lowerEntry,ite_eq_right (by omega : ¬n+1≤n),zero_mul,add_zero]

theorem lower_lag_sum (f g : ℕ → ℝ) (n : ℕ) :
    (∑ i ∈ Finset.range (n+2), lowerEntry f (n+1) i*lagEntry g i) = convNat f g n := by
  rw [Finset.sum_range_succ',lagEntry,ite_eq_right (by omega : ¬0 < (0:ℕ)),mul_zero,add_zero]
  unfold convNat
  apply Finset.sum_congr rfl
  intro j hj
  have h : j≤n := Nat.le_of_lt_succ (Finset.mem_range.mp hj)
  rw [lowerEntry,ite_eq_left (by omega : j+1≤n+1),lagEntry,ite_eq_left (by omega : 0 < j+1)]
  congr 2
  omega

theorem lower_lag_sum_extra (f g : ℕ → ℝ) (n : ℕ) :
    (∑ i ∈ Finset.range (n+3), lowerEntry f (n+1) i*lagEntry g i) = convNat f g n := by
  rw [Finset.sum_range_succ,lower_lag_sum,lowerEntry,ite_eq_right (by omega : ¬n+2≤n+1),zero_mul,add_zero]

/-- Positive log-concave coefficient sequences remain so under the
ordinary finite Cauchy product. -/
theorem positive_logConcave_conv {f g : ℕ → ℝ}
    (hf : PositiveLogConcave f) (hg : PositiveLogConcave g) : PositiveLogConcave (convNat f g) := by
  constructor
  · intro n
    unfold convNat
    apply Finset.sum_pos
    · intro i _
      exact mul_pos (hf.1 _) (hg.1 _)
    · exact ⟨0,Finset.mem_range.mpr (Nat.zero_lt_succ _)⟩
  · intro n
    have h := finite_minor_expansion (lowerEntry f (n+1)) (lowerEntry f (n+2)) g (lagEntry g) (n+3)
    rw [lower_mul_sum_extra,lower_lag_sum,lower_lag_sum_extra,lower_mul_sum] at h
    rw [pow_two,← sub_nonneg,h]
    apply Finset.sum_nonneg
    intro j hj
    apply Finset.sum_nonneg
    intro i hi
    have hij := Finset.mem_range.mp hi
    have hj' : j≤n+2 := Nat.le_of_lt_succ (Finset.mem_range.mp hj)
    exact mul_nonneg (lowerMinor_nonneg hf (n+1) i j hij hj') (upperMinor_nonneg hg i j hij)

end WachsCompleteGraph
