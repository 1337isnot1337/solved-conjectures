import Conjectures.MotzkinEvaluatorFloorBits
import Conjectures.MotzkinEvaluatorOperations
import Conjectures.MotzkinSearchValues

/-! Integer-size accounting for the complete evaluator. The finite trace
sets include initialization, both searches, all oracle arithmetic, every
recursive floor-sum computation, and recovery of the output residues. They
overapproximate arithmetic values; including unused local expressions only
strengthens the size bound. -/
namespace Motzkin.Evaluator

private theorem powers_bound (N : ℕ) (hN : 0 < N) : N ≤ N^2 ∧ N^2 ≤ N^3 := by
  constructor
  · have h := Nat.mul_le_mul_left N (show 1 ≤ N by omega)
    simpa only [mul_one,pow_two] using h
  · have h := Nat.mul_le_mul_left (N^2) (show 1 ≤ N by omega)
    simpa only [mul_one,pow_succ] using h

private theorem factor_bounds (m k : ℕ) (hm : 0 < m) (hk : 0 < k) :
    m ≤ m*k ∧ k ≤ m*k := by
  constructor
  · have h := Nat.mul_le_mul_left m (show 1 ≤ k by omega)
    simpa only [mul_one] using h
  · have h := Nat.mul_le_mul_right k (show 1 ≤ m by omega)
    simpa only [one_mul] using h

def initialValues (m k s : ℕ) : Finset ℕ :=
  {0,1,2,m,k,s,s%m,m*k,m*k/2,m*k/2+1,optimum m k (s%m)}

theorem initialValues_le (m k s : ℕ) (hm : 0 < m) (hk : 0 < k) (hs : s < m)
    {v : ℕ} (hv : v ∈ initialValues m k s) : v ≤ 4*(m*k)^3 := by
  have hN := Nat.mul_pos hm hk
  obtain ⟨hmN,hkN⟩ := factor_bounds m k hm hk
  obtain ⟨hN2,hN3⟩ := powers_bound (m*k) hN
  have hsN := hs.le.trans hmN
  have hrem := (Nat.mod_le s m).trans hsN
  have hhalf := Nat.div_le_self (m*k) 2
  have hlast : m*k/2+1 ≤ m*k := by omega
  have hopt := (optimum_le_half m k (s%m) hm hk).trans hhalf
  simp only [initialValues,Finset.mem_insert,Finset.mem_singleton] at hv
  rcases hv with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl <;> omega

def queryValues (N m k s h J : ℕ) : Finset ℕ :=
  let I := rowStart h k
  {h,h-1,h+k-1,(h-1)/k,I,m-1,N-h,(N-h)/k,upperRow m k h,J,J+1,J+1-I,
    s*I,N-h+s*I,h-1+s*I,countPairs N m s h I J}

theorem queryValues_le (N m k s h J : ℕ) (hN : 0 < N)
    (hm : m ≤ N) (hk : k ≤ N) (hs : s ≤ N) (hh : h ≤ N)
    (hI : rowStart h k ≤ N) (hJ : J+1 ≤ N)
    {v : ℕ} (hv : v ∈ queryValues N m k s h J) : v ≤ 4*N^3 := by
  obtain ⟨hN2,hN3⟩ := powers_bound N hN
  have hsi : s*rowStart h k ≤ N^2 := by simpa only [pow_two] using Nat.mul_le_mul hs hI
  have hdiv := Nat.div_le_self (h-1) k
  have hdiv' := Nat.div_le_self (N-h) k
  have hupper : upperRow m k h ≤ m-1 := min_le_left _ _
  have hn : J+1-rowStart h k ≤ N := (Nat.sub_le _ _).trans hJ
  have hB₁ : N-h+s*rowStart h k ≤ 2*N^2 := by omega
  have hcount : countPairs N m s h (rowStart h k) J ≤ 3*N^3 := by
    exact (Nat.sub_le _ _).trans
      (FloorSum.eval_le_cubic N _ m s _ hn hs hB₁)
  simp only [queryValues,Finset.mem_insert,Finset.mem_singleton] at hv
  rcases hv with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl |
    rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl <;> omega

def recoveryValues (m k s h i : ℕ) : Finset ℕ :=
  {h,i,s*i,h-1,h-1+s*i,(h-1+s*i)/m,(h-1+s*i)/m+1,
    m*((h-1+s*i)/m+1),secondResidue m s h i,k*i}

theorem recoveryValues_le (N m k s h i : ℕ) (hN : 0 < N)
    (hm : m ≤ N) (hk : k ≤ N) (hs : s ≤ N) (hh : h ≤ N) (hi : i ≤ N)
    {v : ℕ} (hv : v ∈ recoveryValues m k s h i) : v ≤ 4*N^3 := by
  obtain ⟨hN2,hN3⟩ := powers_bound N hN
  have hsi : s*i ≤ N^2 := by simpa only [pow_two] using Nat.mul_le_mul hs hi
  have hki : k*i ≤ N^2 := by simpa only [pow_two] using Nat.mul_le_mul hk hi
  have ht : h-1+s*i ≤ 2*N^2 := by omega
  have hq := (Nat.div_le_self (h-1+s*i) m).trans ht
  have hq' : (h-1+s*i)/m+1 ≤ 3*N^2 := by omega
  have hprod : m*((h-1+s*i)/m+1) ≤ 3*N^3 := by
    have hp := Nat.mul_le_mul hm hq'
    nlinarith
  have hout : secondResidue m s h i ≤ 3*N^3 := (Nat.sub_le _ _).trans hprod
  simp only [recoveryValues,Finset.mem_insert,Finset.mem_singleton] at hv
  rcases hv with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl <;> omega

def firstOuterValues (m k s : ℕ) : Finset ℕ :=
  initialValues m k s ∪
    Search.allValues (feasible m k (s%m)) 0 (m*k/2+1) ∪
    (Search.queries (feasible m k (s%m)) 0 (m*k/2+1)).biUnion
      (fun h => queryValues (m*k) m k (s%m) h (upperRow m k h))

theorem firstOuterValues_le (m k s : ℕ) (hm : 0 < m) (hk : 0 < k) (hs : s < m)
    {v : ℕ} (hv : v ∈ firstOuterValues m k s) : v ≤ 4*(m*k)^3 := by
  have hN := Nat.mul_pos hm hk
  obtain ⟨hmN,hkN⟩ := factor_bounds m k hm hk
  obtain ⟨hN2,hN3⟩ := powers_bound (m*k) hN
  rcases Finset.mem_union.mp hv with hv | hv
  · rcases Finset.mem_union.mp hv with hv | hv
    · exact initialValues_le m k s hm hk hs hv
    · have hh : m*k/2+1 ≤ m*k := by omega
      have hb := Search.allValues_le (feasible m k (s%m)) 0 (m*k/2+1) (m*k)
        (Nat.zero_le _) hh hv
      omega
  · obtain ⟨h,hq,hv⟩ := Finset.mem_biUnion.mp hv
    obtain ⟨hh,hhU⟩ := Search.mem_queries_bounds (feasible m k (s%m)) 0 (m*k/2+1) h hq
    have hhN : h ≤ m*k := by omega
    have hI := (rowStart_le_order m k h hk hh hhN).trans hmN
    have hJ : upperRow m k h+1 ≤ m*k := by
      have hu : upperRow m k h ≤ m-1 := min_le_left _ _
      omega
    exact queryValues_le (m*k) m k (s%m) h _ hN hmN hkN
      ((Nat.mod_lt s hm).le.trans hmN) hhN hI hJ hv

def secondOuterValues (m k s : ℕ) : Finset ℕ :=
  let s₀ := s%m
  let h := optimum m k s₀
  if h=0 then ∅ else
    Search.allValues (prefixEmpty m k s₀ h) (rowStart h k-1) (upperRow m k h) ∪
      (Search.queries (prefixEmpty m k s₀ h) (rowStart h k-1) (upperRow m k h)).biUnion
        (fun e => queryValues (m*k) m k s₀ h e) ∪
      recoveryValues m k s₀ h (firstRow m k s₀ h)

theorem secondOuterValues_le (m k s : ℕ) (hm : 0 < m) (hk : 0 < k)
    {v : ℕ} (hv : v ∈ secondOuterValues m k s) : v ≤ 4*(m*k)^3 := by
  have hN := Nat.mul_pos hm hk
  obtain ⟨hmN,hkN⟩ := factor_bounds m k hm hk
  obtain ⟨hN2,hN3⟩ := powers_bound (m*k) hN
  have hsN := (Nat.mod_lt s hm).le.trans hmN
  by_cases hh : optimum m k (s%m)=0
  · simp only [secondOuterValues,ite_eq_left hh,Finset.notMem_empty] at hv
  · rw [secondOuterValues,ite_eq_right hh] at hv
    have hhP : 0 < optimum m k (s%m) := Nat.pos_of_ne_zero hh
    have hhN := (optimum_le_half m k (s%m) hm hk).trans (Nat.div_le_self _ _)
    have hI := (rowStart_le_order m k _ hk hhP hhN).trans hmN
    have hU : upperRow m k (optimum m k (s%m)) ≤ m-1 := min_le_left _ _
    rcases Finset.mem_union.mp hv with hv | hv
    · rcases Finset.mem_union.mp hv with hv | hv
      · have hlo : rowStart (optimum m k (s%m)) k-1 ≤ m*k :=
          (Nat.sub_le _ _).trans hI
        have hhi : upperRow m k (optimum m k (s%m)) ≤ m*k := by omega
        have hb := Search.allValues_le (prefixEmpty m k (s%m) (optimum m k (s%m)))
          _ _ (m*k) hlo hhi hv
        omega
      · obtain ⟨e,hq,hv⟩ := Finset.mem_biUnion.mp hv
        have he := (Search.mem_queries_bounds (prefixEmpty m k (s%m) (optimum m k (s%m)))
          (rowStart (optimum m k (s%m)) k-1) (upperRow m k (optimum m k (s%m))) e hq).2
        have hJ : e+1 ≤ m*k := by omega
        exact queryValues_le (m*k) m k (s%m) _ e hN hmN hkN hsN hhN hI hJ hv
    · have hiU := (firstRow_spec m k (s%m) (optimum m k (s%m)) hm hk hhP
        (optimum_spec m k (s%m) hm hk).1).2.1
      have hiN : firstRow m k (s%m) (optimum m k (s%m)) ≤ m*k := by omega
      exact recoveryValues_le (m*k) m k (s%m) _ _ hN hmN hkN hsN hhN hiN hv

def arithmeticValues (m k s : ℕ) : Finset ℕ :=
  firstOuterValues m k s ∪ floorValues m k s ∪ secondOuterValues m k s

/-- Every integer used by the evaluator, including recursive floor-sum
intermediates, has O(log(mk)) bits for a normalized Hermite input. -/
theorem arithmeticValues_size_bound (m k s : ℕ) (hm : 0 < m) (hk : 0 < k) (hs : s < m)
    {v : ℕ} (hv : v ∈ arithmeticValues m k s) : v.size ≤ 6*((m*k).log2+1) := by
  rcases Finset.mem_union.mp hv with hv | hv
  · rcases Finset.mem_union.mp hv with hv | hv
    · exact FloorSum.cubic_size_bound (m*k) v (Nat.mul_pos hm hk)
        (firstOuterValues_le m k s hm hk hs hv)
    · exact floorValues_size_bound m k s hm hk hv
  · exact FloorSum.cubic_size_bound (m*k) v (Nat.mul_pos hm hk)
      (secondOuterValues_le m k s hm hk hv)

theorem evaluator_complexity (m k s : ℕ) (hm : 0 < m) (hk : 0 < k) (hs : s < m) :
    arithmeticOperations m k s ≤ 256*((m*k).log2+1)^2 ∧
      ∀ v ∈ arithmeticValues m k s, v.size ≤ 6*((m*k).log2+1) :=
  ⟨arithmeticOperations_le_log2_square m k s hm hk,
    fun _ hv => arithmeticValues_size_bound m k s hm hk hs hv⟩

end Motzkin.Evaluator
