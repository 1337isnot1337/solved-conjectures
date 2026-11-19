import Conjectures.MotzkinEvaluatorOracle
import Mathlib.Data.Int.ModEq

/-! The second binary search locates the first admissible row. An explicit
multiple then gives an admissible second residue without enumerating a row. -/
namespace Motzkin.Evaluator

def prefixEmpty (m k s h e : ℕ) : Bool :=
  decide (countPairs (m*k) m s h (rowStart h k) e=0)

theorem prefixEmpty_mono (m k s h : ℕ) (hm : 0 < m) (hh : 0 < h)
    (x y : ℕ) (hxy : x ≤ y) (hy : prefixEmpty m k s h y=true) :
    prefixEmpty m k s h x=true := by
  have hy0 : countPairs (m*k) m s h (rowStart h k) y=0 := of_decide_eq_true hy
  change decide (countPairs (m*k) m s h (rowStart h k) x=0)=true
  rw [decide_eq_true_eq]
  by_contra hx
  obtain ⟨i,r,hiI,hix,hrL,hrU,hdiv⟩ :=
    (countPairs_pos_iff (m*k) m s h (rowStart h k) x hm hh).mp (Nat.pos_of_ne_zero hx)
  have hp := (countPairs_pos_iff (m*k) m s h (rowStart h k) y hm hh).mpr
    ⟨i,r,hiI,hix.trans hxy,hrL,hrU,hdiv⟩
  omega

def firstRow (m k s h : ℕ) : ℕ :=
  Search.lastTrue (prefixEmpty m k s h) (rowStart h k-1) (upperRow m k h)+1

theorem firstRow_spec (m k s h : ℕ) (hm : 0 < m) (hk : 0 < k) (hh : 0 < h)
    (hfeas : Feasible m k s h) :
    rowStart h k ≤ firstRow m k s h ∧ firstRow m k s h ≤ upperRow m k h ∧
      (row (m*k) m s h (firstRow m k s h)).Nonempty := by
  obtain ⟨i,y,him,_,hkiL,hkiU,hyL,hyU,hdiv⟩ := hfeas
  obtain ⟨hiL,hiU⟩ := (row_bounds m k h i hm hk hh).mpr ⟨him,hkiL,hkiU⟩
  have hI : 0 < rowStart h k := by unfold rowStart; omega
  have hlo : prefixEmpty m k s h (rowStart h k-1)=true := by
    change decide (countPairs (m*k) m s h (rowStart h k) (rowStart h k-1)=0)=true
    rw [decide_eq_true_eq]
    by_contra hz
    obtain ⟨i',r,hi'L,hi'U,_⟩ :=
      (countPairs_pos_iff (m*k) m s h (rowStart h k) (rowStart h k-1) hm hh).mp
        (Nat.pos_of_ne_zero hz)
    omega
  have hhi : prefixEmpty m k s h (upperRow m k h)=false := by
    have hp := (countPairs_pos_iff (m*k) m s h (rowStart h k) (upperRow m k h) hm hh).mpr
      ⟨i,y,hiL,hiU,hyL,hyU,hdiv⟩
    simp only [prefixEmpty,decide_eq_false_iff_not]
    omega
  obtain ⟨_,hrU,hr0,hr1⟩ := Search.bracket (prefixEmpty m k s h)
    (rowStart h k-1) (upperRow m k h) (by omega) hlo hhi
  have hz : countPairs (m*k) m s h (rowStart h k)
      (Search.lastTrue (prefixEmpty m k s h) (rowStart h k-1) (upperRow m k h))=0 :=
    of_decide_eq_true hr0
  have hp : 0 < countPairs (m*k) m s h (rowStart h k) (firstRow m k s h) := by
    by_contra hn
    have he : countPairs (m*k) m s h (rowStart h k) (firstRow m k s h)=0 := by omega
    change prefixEmpty m k s h (firstRow m k s h)=false at hr1
    simp [prefixEmpty,he] at hr1
  obtain ⟨j,r,hjL,hjU,hrL,hrU',hdiv'⟩ :=
    (countPairs_pos_iff (m*k) m s h (rowStart h k) (firstRow m k s h) hm hh).mp hp
  have hj : j=firstRow m k s h := by
    by_contra hne
    have hj' : j ≤ Search.lastTrue (prefixEmpty m k s h)
        (rowStart h k-1) (upperRow m k h) := by unfold firstRow at hjU hne; omega
    have hp' := (countPairs_pos_iff (m*k) m s h (rowStart h k) _ hm hh).mpr
      ⟨j,r,hjL,hj',hrL,hrU',hdiv'⟩
    omega
  subst j
  refine ⟨hjL,?_,⟨r,Finset.mem_filter.mpr ⟨Finset.mem_Icc.mpr ⟨hrL,hrU'⟩,hdiv'⟩⟩⟩
  unfold firstRow
  omega

def secondResidue (m s h i : ℕ) : ℕ := m*((h-1+s*i)/m+1)-s*i

theorem secondResidue_bounds (m s h i : ℕ) (hm : 0 < m) (hh : 0 < h) :
    h ≤ secondResidue m s h i ∧ secondResidue m s h i < h+m ∧
      m ∣ secondResidue m s h i+s*i := by
  have hlow : h-1+s*i < m*((h-1+s*i)/m+1) := by
    have ht := (Nat.div_lt_iff_lt_mul hm).mp
      (show (h-1+s*i)/m < (h-1+s*i)/m+1 by omega)
    simpa only [mul_comm] using ht
  have hu : m*((h-1+s*i)/m) ≤ h-1+s*i := Nat.mul_div_le _ _
  have he : m*((h-1+s*i)/m+1)=m*((h-1+s*i)/m)+m := by ring
  have hsi : s*i ≤ m*((h-1+s*i)/m+1) := by omega
  refine ⟨?_,?_,⟨(h-1+s*i)/m+1,?_⟩⟩
  · unfold secondResidue
    omega
  · unfold secondResidue
    omega
  · exact Nat.sub_add_cancel hsi

/-- The constructive multiple formula agrees with the negative-modulo formula
used by the accompanying Python evaluator. -/
theorem secondResidue_eq_python (m s h i : ℕ) (hm : 0 < m) (hh : 0 < h) :
    (secondResidue m s h i:ℤ)=(h:ℤ)+(-(s:ℤ)*(i:ℤ)-(h:ℤ))%(m:ℤ) := by
  obtain ⟨hL,hU,hdiv⟩ := secondResidue_bounds m s h i hm hh
  have hL' : (h:ℤ) ≤ (secondResidue m s h i:ℤ) := by exact_mod_cast hL
  have hU' : (secondResidue m s h i:ℤ) < (h:ℤ)+(m:ℤ) := by exact_mod_cast hU
  have hdiv' : (m:ℤ) ∣ (secondResidue m s h i:ℤ)+(s:ℤ)*(i:ℤ) := by
    exact_mod_cast hdiv
  have hmod : (-(s:ℤ)*(i:ℤ)-(h:ℤ)) ≡
      ((secondResidue m s h i:ℤ)-(h:ℤ)) [ZMOD (m:ℤ)] := by
    apply Int.modEq_of_dvd
    convert hdiv' using 1 <;> ring
  change (-(s:ℤ)*(i:ℤ)-(h:ℤ))%(m:ℤ)=
    ((secondResidue m s h i:ℤ)-(h:ℤ))%(m:ℤ) at hmod
  rw [Int.emod_eq_of_lt (by omega) (by omega)] at hmod
  omega

theorem secondResidue_mem (N m s h i : ℕ) (hm : 0 < m) (hh : 0 < h)
    (hne : (row N m s h i).Nonempty) : secondResidue m s h i ∈ row N m s h i := by
  have hp := Finset.card_pos.mpr hne
  rw [row_card N m s h i hm hh] at hp
  have hq : (h-1+s*i)/m+1 ∈
      Finset.Icc ((h-1+s*i)/m+1) ((N-h+s*i)/m) :=
    Finset.mem_Icc.mpr ⟨le_rfl,by omega⟩
  obtain ⟨hmq,hl,hu⟩ := index_bounds N m s h i _ hm hh hq
  exact Finset.mem_filter.mpr ⟨Finset.mem_Icc.mpr ⟨hl,hu⟩,
    ⟨(h-1+s*i)/m+1,Nat.sub_add_cancel hmq⟩⟩

theorem firstRow_call_bound (m k s h : ℕ) (hm : 0 < m) (hk : 0 < k) :
    Search.calls (prefixEmpty m k s h) (rowStart h k-1) (upperRow m k h) ≤
      (m*k).log2+1 := by
  have hmk : m ≤ m*k := by
    have hp := Nat.mul_le_mul_left m (show 1 ≤ k by omega)
    simpa only [mul_one] using hp
  apply Search.calls_le_log2 _ _ _ _ (Nat.mul_pos hm hk)
  have hu : upperRow m k h ≤ m-1 := min_le_left _ _
  omega

end Motzkin.Evaluator
