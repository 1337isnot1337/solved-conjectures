import Conjectures.NonmixedGap

namespace NonmixedGap

def numerator (a b k m d r : ℤ) : ℤ :=
  if r ≤ m then b+k*d else a-m*(d+1)

def denominator (a b k m r : ℤ) : ℤ :=
  if r ≤ m then k*a+(m+1)*b else (k+1)*a+m*b

noncomputable def densityValue (a b k m d r : ℤ) : ℝ :=
  (numerator a b k m d r : ℝ)/(denominator a b k m r : ℝ)

theorem denominator_pos {a b k m r : ℤ}
    (ha : 0 < a) (hb : 0 < b) (hk : 0 < k) (hm : 0 < m) :
    0 < denominator a b k m r := by
  unfold denominator
  split_ifs <;> positivity

theorem numerator_pos {a b k m d r : ℤ}
    (ha : 0 < a) (hb : 0 < b) (hk : 0 < k) (hm : 0 < m)
    (heq : a-b=(k+m+1)*d+r) (hr0 : 0 ≤ r) (hrs : r < k+m+1) :
    0 < numerator a b k m d r := by
  unfold numerator
  split_ifs with hrm
  · by_cases hd : 0 ≤ d
    · have hkd : 0 ≤ k*d := mul_nonneg (le_of_lt hk) hd
      omega
    · have hd' : d ≤ -1 := by omega
      have hmd := mul_le_mul_of_nonneg_left hd' (show 0 ≤ m+1 by omega)
      nlinarith only [heq,ha,hrm,hmd]
  · by_cases hd : 0 ≤ d
    · have hkd : 0 ≤ (k+1)*d := mul_nonneg (by omega) hd
      nlinarith only [heq,hb,hrm,hkd]
    · have hmd : m*(d+1) ≤ 0 := mul_nonpos_of_nonneg_of_nonpos (by omega) (by omega)
      omega

theorem densityValue_nonneg {a b k m d r : ℤ}
    (ha : 0 < a) (hb : 0 < b) (hk : 0 < k) (hm : 0 < m)
    (heq : a-b=(k+m+1)*d+r) (hr0 : 0 ≤ r) (hrs : r < k+m+1) :
    0 ≤ densityValue a b k m d r := by
  unfold densityValue
  have hp := numerator_pos ha hb hk hm heq hr0 hrs
  have hq := denominator_pos (r:=r) ha hb hk hm
  positivity

/-- The two counting inequalities imply one of the exact rational block bounds. -/
theorem counts_choose_block {a b k m d r J C z : ℤ}
    (ha : 0 < a) (hb : 0 < b) (hk : 0 < k) (hm : 0 < m)
    (heq : a-b=(k+m+1)*d+r) (hr0 : 0 ≤ r) (hrs : r < k+m+1)
    (hJ : J ≤ b+k*z) (hC : C ≤ a-m*z) :
    denominator a b k m r * J ≤ numerator a b k m d r * (k*a+(m+1)*b) ∨
    denominator a b k m r * C ≤ numerator a b k m d r * ((k+1)*a+m*b) := by
  have hn1 : 0 ≤ k*a+(m+1)*b := by positivity
  have hn2 : 0 ≤ (k+1)*a+m*b := by positivity
  obtain ⟨_,_,hid1,hid2⟩ := branch_identities a b k m d r heq
  by_cases hrm : r ≤ m
  · simp only [denominator,numerator,hrm,ite_true]
    by_cases hz : z ≤ d
    · left
      have hkd := mul_le_mul_of_nonneg_left hz (le_of_lt hk)
      have hh : J ≤ b+k*d := by omega
      have hmul := mul_le_mul_of_nonneg_left hh hn1
      nlinarith only [hmul]
    · right
      have hmz := mul_le_mul_of_nonneg_left (show d+1 ≤ z by omega) (le_of_lt hm)
      have hh : C ≤ b+(k+1)*d := by nlinarith only [hC,hmz,heq,hrm]
      have hmul := mul_le_mul_of_nonneg_left hh hn1
      have hbr : 0 ≤ b*r := mul_nonneg (le_of_lt hb) hr0
      nlinarith only [hmul,hid1,hbr]
  · simp only [denominator,numerator,hrm,ite_false]
    by_cases hz : d+1 ≤ z
    · right
      have hmz := mul_le_mul_of_nonneg_left hz (le_of_lt hm)
      have hh : C ≤ a-m*(d+1) := by omega
      have hmul := mul_le_mul_of_nonneg_left hh hn2
      nlinarith only [hmul]
    · left
      have hkz := mul_le_mul_of_nonneg_left (show z ≤ d by omega) (le_of_lt hk)
      have hh : J ≤ a-(m+1)*(d+1) := by nlinarith only [hJ,hkz,heq,hrm]
      have hmul := mul_le_mul_of_nonneg_left hh hn2
      have har : 0 ≤ a*(k+m+1-r) := mul_nonneg (le_of_lt ha) (by omega)
      nlinarith only [hmul,hid2,har]

theorem anchored_block {A : Set ℤ} {a b k m U V d r : ℤ}
    (ha : 0 < a) (hb : 0 < b) (hk : 0 < k) (hm : 0 < m) (hab : b ≤ a)
    (hbez : U*a+V*b=1) (heq : a-b=(k+m+1)*d+r)
    (hr0 : 0 ≤ r) (hrs : r < k+m+1)
    (hA : Avoids A a b k m) (hzero : 0 ∈ A) :
    ∃ L : ℤ, 0 < L ∧ L ≤ (k+1)*a+m*b ∧
      (count A 0 L : ℝ) ≤ densityValue a b k m d r * L := by
  obtain ⟨z,hJ,hC⟩ := interval_counting ha hb hk hm hab hbez hA hzero
  have hnum := counts_choose_block ha hb hk hm heq hr0 hrs hJ hC
  have hn : 0 < denominator a b k m r := denominator_pos ha hb hk hm
  have hnR : (0:ℝ) < denominator a b k m r := by exact_mod_cast hn
  have hquot : ∀ (L : ℤ),
      denominator a b k m r * (count A 0 L : ℤ) ≤ numerator a b k m d r * L →
      (count A 0 L : ℝ) ≤ densityValue a b k m d r * L := by
    intro L hL
    have hLR : (denominator a b k m r : ℝ)*(count A 0 L : ℝ) ≤
        (numerator a b k m d r : ℝ)*(L:ℝ) := by exact_mod_cast hL
    unfold densityValue
    rw [div_mul_eq_mul_div,le_div_iff₀ hnR]
    nlinarith only [hLR]
  rcases hnum with hshort | hlong
  · exact ⟨k*a+(m+1)*b,by positivity,by nlinarith only [hab],hquot _ hshort⟩
  · exact ⟨(k+1)*a+m*b,by positivity,le_rfl,hquot _ hlong⟩

end NonmixedGap
