import Conjectures.MotzkinEvaluatorResult
import Conjectures.MotzkinFloorSumBits
import Conjectures.MotzkinSearchQueries

/-! The logarithmic integer-size bound for every floor-sum call actually made
by either binary search in the quotient evaluator. -/
namespace Motzkin.Evaluator

def countValues (N M s h I J : ℕ) : Finset ℕ :=
  FloorSum.allValues (J+1-I) M s (N-h+s*I) ∪
    FloorSum.allValues (J+1-I) M s (h-1+s*I)

theorem countValues_size_bound (N M s h I J : ℕ) (hN : 0 < N)
    (hM : M ≤ N) (hs : s ≤ N) (hh : h ≤ N) (hI : I ≤ N) (hJ : J+1 ≤ N)
    {v : ℕ} (hv : v ∈ countValues N M s h I J) : v.size ≤ 6*(N.log2+1) := by
  have hn : J+1-I ≤ N := (Nat.sub_le _ _).trans hJ
  have hN2 : N ≤ N^2 := by
    have h := Nat.mul_le_mul_left N (show 1 ≤ N by omega)
    simpa only [mul_one,pow_two] using h
  have hsi : s*I ≤ N^2 := by simpa only [pow_two] using Nat.mul_le_mul hs hI
  have hB₁ : N-h+s*I ≤ 2*N^2 := by omega
  have hB₂ : h-1+s*I ≤ 2*N^2 := by omega
  rcases Finset.mem_union.mp hv with hv | hv
  · exact FloorSum.allValues_size_bound N _ M s _ hN hn hM hs hB₁ hv
  · exact FloorSum.allValues_size_bound N _ M s _ hN hn hM hs hB₂ hv

theorem rowStart_le_order (m k h : ℕ) (hk : 0 < k) (hh : 0 < h) (hN : h ≤ m*k) :
    rowStart h k ≤ m := by
  have ht : h-1 < m*k := by omega
  have hd : (h-1)/k < m := (Nat.div_lt_iff_lt_mul hk).mpr ht
  unfold rowStart
  omega

def firstFloorValues (m k s : ℕ) : Finset ℕ :=
  (Search.queries (feasible m k (s%m)) 0 (m*k/2+1)).biUnion
    (fun h => countValues (m*k) m (s%m) h (rowStart h k) (upperRow m k h))

def secondFloorValues (m k s : ℕ) : Finset ℕ :=
  let h := optimum m k (s%m)
  if h=0 then ∅ else
    (Search.queries (prefixEmpty m k (s%m) h) (rowStart h k-1) (upperRow m k h)).biUnion
      (fun e => countValues (m*k) m (s%m) h (rowStart h k) e)

def floorValues (m k s : ℕ) : Finset ℕ := firstFloorValues m k s ∪ secondFloorValues m k s

theorem firstFloorValues_size_bound (m k s : ℕ) (hm : 0 < m) (hk : 0 < k)
    {v : ℕ} (hv : v ∈ firstFloorValues m k s) : v.size ≤ 6*((m*k).log2+1) := by
  have hN : 0 < m*k := Nat.mul_pos hm hk
  have hmN : m ≤ m*k := by
    have h := Nat.mul_le_mul_left m (show 1 ≤ k by omega)
    simpa only [mul_one] using h
  obtain ⟨h,hq,hv⟩ := Finset.mem_biUnion.mp hv
  obtain ⟨hh,hhU⟩ := Search.mem_queries_bounds (feasible m k (s%m)) 0 (m*k/2+1) h hq
  have hhN : h ≤ m*k := by omega
  have hI := (rowStart_le_order m k h hk hh hhN).trans hmN
  have hJ : upperRow m k h+1 ≤ m*k := by
    have hj : upperRow m k h ≤ m-1 := min_le_left _ _
    omega
  exact countValues_size_bound (m*k) m (s%m) h _ _ hN hmN
    ((Nat.mod_lt s hm).le.trans hmN) hhN hI hJ hv

theorem secondFloorValues_size_bound (m k s : ℕ) (hm : 0 < m) (hk : 0 < k)
    {v : ℕ} (hv : v ∈ secondFloorValues m k s) : v.size ≤ 6*((m*k).log2+1) := by
  have hN : 0 < m*k := Nat.mul_pos hm hk
  have hmN : m ≤ m*k := by
    have h := Nat.mul_le_mul_left m (show 1 ≤ k by omega)
    simpa only [mul_one] using h
  by_cases hh : optimum m k (s%m)=0
  · simp only [secondFloorValues,ite_eq_left hh,Finset.notMem_empty] at hv
  · rw [secondFloorValues,ite_eq_right hh] at hv
    have hhP : 0 < optimum m k (s%m) := Nat.pos_of_ne_zero hh
    have hhN := (optimum_le_half m k (s%m) hm hk).trans (Nat.div_le_self _ _)
    have hI := (rowStart_le_order m k _ hk hhP hhN).trans hmN
    obtain ⟨e,hq,hv⟩ := Finset.mem_biUnion.mp hv
    have he := (Search.mem_queries_bounds (prefixEmpty m k (s%m) (optimum m k (s%m)))
      (rowStart (optimum m k (s%m)) k-1) (upperRow m k (optimum m k (s%m))) e hq).2
    have hJ : e+1 ≤ m*k := by
      have hj : upperRow m k (optimum m k (s%m)) ≤ m-1 := min_le_left _ _
      omega
    exact countValues_size_bound (m*k) m (s%m) _ _ e hN hmN
      ((Nat.mod_lt s hm).le.trans hmN) hhN hI hJ hv

theorem floorValues_size_bound (m k s : ℕ) (hm : 0 < m) (hk : 0 < k)
    {v : ℕ} (hv : v ∈ floorValues m k s) : v.size ≤ 6*((m*k).log2+1) := by
  rcases Finset.mem_union.mp hv with hv | hv
  · exact firstFloorValues_size_bound m k s hm hk hv
  · exact secondFloorValues_size_bound m k s hm hk hv

end Motzkin.Evaluator
