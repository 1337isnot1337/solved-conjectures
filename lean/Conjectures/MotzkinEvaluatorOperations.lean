import Conjectures.MotzkinEvaluatorResult
import Conjectures.MotzkinFloorSumOperations
import Conjectures.MotzkinSearchOperations

/-! An explicit quadratic-logarithmic arithmetic bound for the two-search
evaluator. The fixed oracle charges bound all interval endpoints, affine
offsets, comparisons and the final subtraction in addition to both metered
floor sums. The outer charge bounds normalization, initialization and residue
recovery. Integer-size bounds are a separate obligation. -/
namespace Motzkin.Evaluator

def countOperations (N M s h I J : ℕ) : ℕ :=
  12+FloorSum.operations (J+1-I) M s (N-h+s*I)+
    FloorSum.operations (J+1-I) M s (h-1+s*I)

def feasibleOperations (m k s h : ℕ) : ℕ :=
  if h=0 then 1 else
    12+countOperations (m*k) m s h (rowStart h k) (upperRow m k h)

def prefixOperations (m k s h e : ℕ) : ℕ :=
  8+countOperations (m*k) m s h (rowStart h k) e

theorem countOperations_bound (N M s h I J : ℕ) :
    countOperations N M s h I J ≤ 68*M.size+14 := by
  have h₁ := FloorSum.operations_le_size (J+1-I) M s (N-h+s*I)
  have h₂ := FloorSum.operations_le_size (J+1-I) M s (h-1+s*I)
  unfold countOperations
  omega

theorem feasibleOperations_bound (m k s h : ℕ) :
    feasibleOperations m k s h ≤ 68*m.size+26 := by
  by_cases hh : h=0
  · simp only [feasibleOperations,ite_eq_left hh]
    omega
  · rw [feasibleOperations,ite_eq_right hh]
    have hb := countOperations_bound (m*k) m s h (rowStart h k) (upperRow m k h)
    omega

theorem prefixOperations_bound (m k s h e : ℕ) :
    prefixOperations m k s h e ≤ 68*m.size+26 := by
  have hb := countOperations_bound (m*k) m s h (rowStart h k) e
  unfold prefixOperations
  omega

def arithmeticOperations (m k s : ℕ) : ℕ :=
  let s₀ := s%m
  let h := optimum m k s₀
  32+Search.operations (feasible m k s₀) (feasibleOperations m k s₀) 0 (m*k/2+1)+
    if h=0 then 0 else
      Search.operations (prefixEmpty m k s₀ h) (prefixOperations m k s₀ h)
        (rowStart h k-1) (upperRow m k h)

theorem arithmeticOperations_le_calls (m k s : ℕ) :
    arithmeticOperations m k s ≤ 36+(68*m.size+31)*searchCalls m k s := by
  have h₁ := Search.operations_le_calls (feasible m k (s%m))
    (feasibleOperations m k (s%m)) (68*m.size+26)
    (feasibleOperations_bound m k (s%m)) 0 (m*k/2+1)
  have h₂ := Search.operations_le_calls (prefixEmpty m k (s%m) (optimum m k (s%m)))
    (prefixOperations m k (s%m) (optimum m k (s%m))) (68*m.size+26)
    (prefixOperations_bound m k (s%m) (optimum m k (s%m)))
    (rowStart (optimum m k (s%m)) k-1) (upperRow m k (optimum m k (s%m)))
  by_cases hh : optimum m k (s%m)=0
  · simp only [arithmeticOperations,searchCalls,ite_eq_left hh,add_zero]
    nlinarith
  · simp only [arithmeticOperations,searchCalls,ite_eq_right hh]
    nlinarith

/-- A fully explicit unit-arithmetic upper bound. In particular the operation
count is O(log²(mk)); the bound includes both searches and all floor-sum loops. -/
theorem arithmeticOperations_le_log2_square (m k s : ℕ) (hm : 0 < m) (hk : 0 < k) :
    arithmeticOperations m k s ≤ 256*((m*k).log2+1)^2 := by
  have hN : 0 < m*k := Nat.mul_pos hm hk
  have hmN : m ≤ m*k := by
    have h := Nat.mul_le_mul_left m (show 1 ≤ k by omega)
    simpa only [mul_one] using h
  have hbits : m.size ≤ (m*k).log2+1 := by
    rw [← FloorSum.size_eq_log2_add_one hN]
    exact Nat.size_le_size hmN
  have hc := searchCalls_le_log2 m k s hm hk
  have hop := arithmeticOperations_le_calls m k s
  have hmul := Nat.mul_le_mul
    (show 68*m.size+31 ≤ 68*((m*k).log2+1)+31 by omega) hc
  have hpos : 1 ≤ (m*k).log2+1 := by omega
  have hbb : (m*k).log2+1 ≤ ((m*k).log2+1)^2 := by
    simpa only [pow_two,mul_one] using Nat.mul_le_mul_left ((m*k).log2+1) hpos
  nlinarith

end Motzkin.Evaluator
