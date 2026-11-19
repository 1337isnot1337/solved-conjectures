import Conjectures.MotzkinEvaluatorRows
import Conjectures.MotzkinBinarySearch

/-! The exact feasibility oracle and the first binary search in the quotient
evaluator. Its specification quantifies actual admissible residue pairs. -/
namespace Motzkin.Evaluator

def rowStart (h k : ℕ) : ℕ := (h-1)/k+1

theorem rowStart_eq_python (h k : ℕ) (hh : 0 < h) (hk : 0 < k) :
    rowStart h k=(h+k-1)/k := by
  have he : h+k-1=(h-1)+k := by omega
  rw [he,Nat.add_div_right _ hk]
  rfl

def upperRow (m k h : ℕ) : ℕ := min (m-1) ((m*k-h)/k)

theorem row_bounds (m k h i : ℕ) (hm : 0 < m) (hk : 0 < k) (hh : 0 < h) :
    (rowStart h k ≤ i ∧ i ≤ upperRow m k h) ↔
      i < m ∧ h ≤ k*i ∧ k*i ≤ m*k-h := by
  have hlower : rowStart h k ≤ i ↔ h ≤ k*i := by
    rw [rowStart]
    constructor
    · intro hle
      have hl : h-1 < i*k := (Nat.div_lt_iff_lt_mul hk).mp (by omega)
      rw [mul_comm i k] at hl
      omega
    · intro hle
      have hl : h-1 < i*k := by rw [mul_comm i k]; omega
      have hd := (Nat.div_lt_iff_lt_mul hk).mpr hl
      omega
  have hupper : i ≤ upperRow m k h ↔ i < m ∧ k*i ≤ m*k-h := by
    rw [upperRow,le_min_iff]
    constructor
    · rintro ⟨hi,hu⟩
      refine ⟨by omega,?_⟩
      simpa only [mul_comm] using (Nat.le_div_iff_mul_le hk).mp hu
    · rintro ⟨hi,hu⟩
      refine ⟨by omega,(Nat.le_div_iff_mul_le hk).mpr ?_⟩
      simpa only [mul_comm] using hu
  rw [hlower,hupper]
  exact ⟨fun h => ⟨h.2.1,h.1,h.2.2⟩,fun h => ⟨h.2.1,h.1,h.2.2⟩⟩

def feasible (m k s h : ℕ) : Bool :=
  if h=0 then true else
    decide (0 < countPairs (m*k) m s h (rowStart h k) (upperRow m k h))

def Feasible (m k s h : ℕ) : Prop :=
  ∃ i y : ℕ, i < m ∧ y < m*k ∧ h ≤ k*i ∧ k*i ≤ m*k-h ∧
    h ≤ y ∧ y ≤ m*k-h ∧ m ∣ y+s*i

theorem feasible_spec (m k s h : ℕ) (hm : 0 < m) (hk : 0 < k) :
    feasible m k s h=true ↔ Feasible m k s h := by
  have hN : 0 < m*k := Nat.mul_pos hm hk
  by_cases hh : h=0
  · subst h
    constructor
    · intro _
      refine ⟨0,0,hm,hN,?_,?_,?_,?_,?_⟩ <;> simp
    · intro _
      simp only [feasible,ite_eq_left rfl]
  have hp : 0 < h := Nat.pos_of_ne_zero hh
  rw [feasible,ite_eq_right hh,decide_eq_true_eq,
    countPairs_pos_iff (m*k) m s h (rowStart h k) (upperRow m k h) hm hp]
  constructor
  · rintro ⟨i,y,hiL,hiU,hyL,hyU,hdiv⟩
    obtain ⟨him,hkiL,hkiU⟩ := (row_bounds m k h i hm hk hp).mp ⟨hiL,hiU⟩
    exact ⟨i,y,him,hyU.trans_lt (Nat.sub_lt hN hp),hkiL,hkiU,hyL,hyU,hdiv⟩
  · rintro ⟨i,y,him,_,hkiL,hkiU,hyL,hyU,hdiv⟩
    obtain ⟨hiL,hiU⟩ := (row_bounds m k h i hm hk hp).mpr ⟨him,hkiL,hkiU⟩
    exact ⟨i,y,hiL,hiU,hyL,hyU,hdiv⟩

theorem feasible_mono (m k s : ℕ) (hm : 0 < m) (hk : 0 < k)
    (x y : ℕ) (hxy : x ≤ y) (hy : feasible m k s y=true) :
    feasible m k s x=true := by
  obtain ⟨i,r,hi,hr,hkiL,hkiU,hrL,hrU,hdiv⟩ := (feasible_spec m k s y hm hk).mp hy
  apply (feasible_spec m k s x hm hk).mpr
  have hsub := Nat.sub_le_sub_left hxy (m*k)
  exact ⟨i,r,hi,hr,hxy.trans hkiL,hkiU.trans hsub,hxy.trans hrL,hrU.trans hsub,hdiv⟩

theorem feasible_half_false (m k s : ℕ) (hm : 0 < m) (hk : 0 < k) :
    feasible m k s (m*k/2+1)=false := by
  have hn : ¬ feasible m k s (m*k/2+1)=true := by
    intro h
    obtain ⟨i,y,_,_,hL,hU,_⟩ := (feasible_spec m k s (m*k/2+1) hm hk).mp h
    omega
  cases he : feasible m k s (m*k/2+1) <;> simp_all

def optimum (m k s : ℕ) : ℕ := Search.lastTrue (feasible m k s) 0 (m*k/2+1)

theorem optimum_spec (m k s : ℕ) (hm : 0 < m) (hk : 0 < k) :
    Feasible m k s (optimum m k s) ∧
      ∀ h : ℕ, Feasible m k s h → h ≤ optimum m k s := by
  have hlo : feasible m k s 0=true := by simp only [feasible,ite_eq_left rfl]
  obtain ⟨htrue,hmax⟩ := Search.is_last_true (feasible m k s) (feasible_mono m k s hm hk)
    0 (m*k/2+1) (by omega) hlo (feasible_half_false m k s hm hk)
  exact ⟨(feasible_spec m k s _ hm hk).mp htrue,
    fun h hh => hmax h ((feasible_spec m k s h hm hk).mpr hh)⟩

theorem optimum_le_half (m k s : ℕ) (hm : 0 < m) (hk : 0 < k) :
    optimum m k s ≤ m*k/2 := by
  obtain ⟨i,y,_,_,hL,hU,_⟩ := (optimum_spec m k s hm hk).1
  omega

theorem optimum_call_bound (m k s : ℕ) (hm : 0 < m) (hk : 0 < k) :
    Search.calls (feasible m k s) 0 (m*k/2+1) ≤ (m*k).log2+1 := by
  exact Search.calls_le_log2 _ _ _ _ (Nat.mul_pos hm hk) (by omega)

end Motzkin.Evaluator
