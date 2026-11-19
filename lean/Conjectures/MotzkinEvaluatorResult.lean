import Conjectures.MotzkinEvaluatorWitness

/-! The exact quotient evaluator returns a largest feasible integer threshold
and attaining coordinate residues. Positivity of m and k is the input domain. -/
namespace Motzkin.Evaluator

def quotientOptimum (m k s : ℕ) : ℕ × (ℕ × ℕ) :=
  let s₀ := s%m
  let h := optimum m k s₀
  if h=0 then (0,(0,0)) else
    let i := firstRow m k s₀ h
    (h,(k*i,secondResidue m s₀ h i))

theorem quotientOptimum_threshold (m k s : ℕ) :
    (quotientOptimum m k s).1=optimum m k (s%m) := by
  by_cases hh : optimum m k (s%m)=0 <;> simp [quotientOptimum,hh]

theorem quotientOptimum_feasible (m k s : ℕ) (hm : 0 < m) (hk : 0 < k) :
    let z := quotientOptimum m k s
    ∃ i : ℕ, i < m ∧ z.2.1=k*i ∧ z.2.2 < m*k ∧
      z.1 ≤ z.2.1 ∧ z.2.1 ≤ m*k-z.1 ∧ z.1 ≤ z.2.2 ∧
      z.2.2 ≤ m*k-z.1 ∧ m ∣ z.2.2+(s%m)*i := by
  have hN : 0 < m*k := Nat.mul_pos hm hk
  by_cases hh : optimum m k (s%m)=0
  · simp only [quotientOptimum,ite_eq_left hh]
    refine ⟨0,hm,?_,hN,?_,?_,?_,?_,?_⟩ <;> simp
  · have hp : 0 < optimum m k (s%m) := Nat.pos_of_ne_zero hh
    obtain ⟨hiL,hiU,hrow⟩ := firstRow_spec m k (s%m) (optimum m k (s%m)) hm hk hp
      (optimum_spec m k (s%m) hm hk).1
    obtain ⟨him,hkiL,hkiU⟩ :=
      (row_bounds m k (optimum m k (s%m)) (firstRow m k (s%m) (optimum m k (s%m))) hm hk hp).mp
        ⟨hiL,hiU⟩
    have hy := secondResidue_mem (m*k) m (s%m) (optimum m k (s%m))
      (firstRow m k (s%m) (optimum m k (s%m))) hm hp hrow
    obtain ⟨hy,hdiv⟩ := Finset.mem_filter.mp hy
    obtain ⟨hyL,hyU⟩ := Finset.mem_Icc.mp hy
    simp only [quotientOptimum,ite_eq_right hh]
    exact ⟨firstRow m k (s%m) (optimum m k (s%m)),him,rfl,
      hyU.trans_lt (Nat.sub_lt hN hp),hkiL,hkiU,hyL,hyU,hdiv⟩

theorem quotientOptimum_optimal (m k s : ℕ) (hm : 0 < m) (hk : 0 < k) :
    ∀ h : ℕ, Feasible m k (s%m) h → h ≤ (quotientOptimum m k s).1 := by
  rw [quotientOptimum_threshold]
  exact (optimum_spec m k (s%m) hm hk).2

theorem quotientOptimum_le_half (m k s : ℕ) (hm : 0 < m) (hk : 0 < k) :
    (quotientOptimum m k s).1 ≤ m*k/2 := by
  rw [quotientOptimum_threshold]
  exact optimum_le_half m k (s%m) hm hk

def searchCalls (m k s : ℕ) : ℕ :=
  let s₀ := s%m
  let h := optimum m k s₀
  Search.calls (feasible m k s₀) 0 (m*k/2+1)+
    if h=0 then 0 else
      Search.calls (prefixEmpty m k s₀ h) (rowStart h k-1) (upperRow m k h)

theorem searchCalls_le_log2 (m k s : ℕ) (hm : 0 < m) (hk : 0 < k) :
    searchCalls m k s ≤ 2*((m*k).log2+1) := by
  have h₁ := optimum_call_bound m k (s%m) hm hk
  have h₂ := firstRow_call_bound m k (s%m) (optimum m k (s%m)) hm hk
  by_cases hh : optimum m k (s%m)=0
  · simp only [searchCalls,ite_eq_left hh,add_zero]
    omega
  · simp only [searchCalls,ite_eq_right hh]
    omega

end Motzkin.Evaluator
