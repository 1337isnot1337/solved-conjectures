import Mathlib.Algebra.BigOperators.Group.Finset.Basic
import Mathlib.Algebra.Order.BigOperators.Group.Finset
import Mathlib.Algebra.Order.Ring.Abs
import Mathlib.Algebra.Ring.Int.Parity
import Mathlib.Data.Int.ModEq
import Mathlib.Data.Fintype.Card
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.NormNum
import Lean.Elab.Tactic.Omega

/-! Direct arithmetic obstructions for the common symmetries in `BORDER.md`.
These proofs use the squared-row-sum equation and bounds, without enumerating
the fourteen normalized baseline patterns. -/

namespace HadamardBorderSymmetry

open scoped BigOperators

def BaselineEquation (d a b c : ℤ) : Prop :=
  (4 * d) ^ 2 + (4 * a + 2) ^ 2 + (4 * b + 2) ^ 2 + (4 * c + 2) ^ 2 = 2396

def baselineFiberValues (d a b c : ℤ) : Finset ℤ :=
  {d, a, a + 2, b, b + 2, c, c + 2}

theorem baseline_equation_normalized {d a b c : ℤ} (h : BaselineEquation d a b c) :
    4 * d ^ 2 + (2 * a + 1) ^ 2 + (2 * b + 1) ^ 2 + (2 * c + 1) ^ 2 = 599 := by
  dsimp only [BaselineEquation] at h
  nlinarith

theorem baseline_equation_odd_d {d a b c : ℤ} (h : BaselineEquation d a b c) :
    Odd d := by
  have hodd (x : ℤ) : Odd (2 * x + 1) := odd_iff_exists_bit1.mpr ⟨x, rfl⟩
  obtain ⟨ka, hka⟩ := Int.eight_dvd_sq_sub_one_of_odd (hodd a)
  obtain ⟨kb, hkb⟩ := Int.eight_dvd_sq_sub_one_of_odd (hodd b)
  obtain ⟨kc, hkc⟩ := Int.eight_dvd_sq_sub_one_of_odd (hodd c)
  have hn := baseline_equation_normalized h
  have hd : Odd (d ^ 2) := ⟨74 - ka - kb - kc, by nlinarith⟩
  exact (Int.odd_pow' (by decide : (2 : ℕ) ≠ 0)).mp hd

/-- The remaining baseline parities come from the odd length of a sign fiber. -/
theorem sign_sum_odd_of_card149 {ι : Type*} [Fintype ι]
    (f : ι → ℤ) (hsign : ∀ i, f i = 1 ∨ f i = -1)
    (hcard : Fintype.card ι = 149) : Odd (∑ i, f i) := by
  rw [Int.odd_iff, Finset.sum_int_mod]
  have hm (i : ι) : f i % 2 = 1 := by
    rcases hsign i with hi | hi <;> norm_num [hi]
  simp [hm, hcard]

theorem baseline_l1_impossible {d a b c : ℤ} (h : BaselineEquation d a b c) :
    ¬ (|d| + |a + 1| + |b + 1| + |c + 1| ≤ 1) := by
  intro hsmall
  have hdodd := baseline_equation_odd_d h
  have hd0 : d ≠ 0 := by
    intro he
    rw [he] at hdodd
    norm_num at hdodd
  have hdpos : 0 < |d| := abs_pos.mpr hd0
  have ha0 := abs_nonneg (a + 1)
  have hb0 := abs_nonneg (b + 1)
  have hc0 := abs_nonneg (c + 1)
  have ha : a = -1 := by
    have hzero : |a + 1| = 0 := by omega
    have := abs_eq_zero.mp hzero
    omega
  have hb : b = -1 := by
    have hzero : |b + 1| = 0 := by omega
    have := abs_eq_zero.mp hzero
    omega
  have hc : c = -1 := by
    have hzero : |c + 1| = 0 := by omega
    have := abs_eq_zero.mp hzero
    omega
  have hdle : |d| ≤ 1 := by omega
  have hdsq := sq_le_sq' (abs_le.mp hdle).1 (abs_le.mp hdle).2
  dsimp only [BaselineEquation] at h
  rw [ha, hb, hc] at h
  nlinarith

theorem baseline_l1_gt_one {d a b c : ℤ} (h : BaselineEquation d a b c) :
    1 < |d| + |a + 1| + |b + 1| + |c + 1| :=
  lt_of_not_ge (baseline_l1_impossible h)

private theorem abs_lt49_of_sq_le2396 (x : ℤ) (h : x ^ 2 ≤ 2396) : |x| < 49 := by
  have hs : x ^ 2 < (49 : ℤ) ^ 2 := by nlinarith
  have ha := sq_lt_sq.mp hs
  norm_num at ha
  exact ha

theorem baseline_fiber_abs_le13 {d a b c : ℤ} (h : BaselineEquation d a b c)
    (x : ℤ) (hx : x ∈ baselineFiberValues d a b c) : |x| ≤ 13 := by
  dsimp only [BaselineEquation] at h
  have hd0 := sq_nonneg (4 * d)
  have ha0 := sq_nonneg (4 * a + 2)
  have hb0 := sq_nonneg (4 * b + 2)
  have hc0 := sq_nonneg (4 * c + 2)
  have hd := abs_lt.mp (abs_lt49_of_sq_le2396 (4 * d) (by nlinarith))
  have ha := abs_lt.mp (abs_lt49_of_sq_le2396 (4 * a + 2) (by nlinarith))
  have hb := abs_lt.mp (abs_lt49_of_sq_le2396 (4 * b + 2) (by nlinarith))
  have hc := abs_lt.mp (abs_lt49_of_sq_le2396 (4 * c + 2) (by nlinarith))
  simp only [baselineFiberValues, Finset.mem_insert, Finset.mem_singleton] at hx
  rcases hx with rfl | rfl | rfl | rfl | rfl | rfl | rfl <;>
    apply abs_le.mpr <;> constructor <;> omega

theorem baseline_fiber_abs_lt36 {d a b c : ℤ} (h : BaselineEquation d a b c)
    (x : ℤ) (hx : x ∈ baselineFiberValues d a b c) : |x| < 36 := by
  have hb := baseline_fiber_abs_le13 h x hx
  omega

theorem eq_one_or_neg_one_of_mod37_of_abs_lt36 (x : ℤ) (hbound : |x| < 36)
    (hmod : Int.ModEq 37 x 1 ∨ Int.ModEq 37 x (-1)) : x = 1 ∨ x = -1 := by
  have hx := abs_lt.mp hbound
  simp only [Int.ModEq] at hmod
  norm_num at hmod
  omega

theorem eq_one_or_neg_one_of_dvd37_of_abs_lt36 (x : ℤ) (hbound : |x| < 36)
    (hdiv : (37 : ℤ) ∣ x - 1 ∨ (37 : ℤ) ∣ x + 1) : x = 1 ∨ x = -1 := by
  apply eq_one_or_neg_one_of_mod37_of_abs_lt36 x hbound
  rcases hdiv with ⟨k, hk⟩ | ⟨k, hk⟩
  · exact Or.inl (Int.modEq_iff_dvd.mpr ⟨-k, by omega⟩)
  · exact Or.inr (Int.modEq_iff_dvd.mpr ⟨-k, by omega⟩)

theorem baseline_all_fibers_signs_impossible {d a b c : ℤ}
    (h : BaselineEquation d a b c)
    (hsign : ∀ x ∈ baselineFiberValues d a b c, x = 1 ∨ x = -1) : False := by
  have hd := hsign d (by simp [baselineFiberValues])
  have ha := hsign a (by simp [baselineFiberValues])
  have ha2 := hsign (a + 2) (by simp [baselineFiberValues])
  have hb := hsign b (by simp [baselineFiberValues])
  have hb2 := hsign (b + 2) (by simp [baselineFiberValues])
  have hc := hsign c (by simp [baselineFiberValues])
  have hc2 := hsign (c + 2) (by simp [baselineFiberValues])
  have hae : a = -1 := by omega
  have hbe : b = -1 := by omega
  have hce : c = -1 := by omega
  have hdsq : d ^ 2 = 1 := by rcases hd with rfl | rfl <;> norm_num
  dsimp only [BaselineEquation] at h
  rw [hae, hbe, hce] at h
  nlinarith

theorem baseline_all_fibers_mod37_impossible {d a b c : ℤ}
    (h : BaselineEquation d a b c)
    (hmod : ∀ x ∈ baselineFiberValues d a b c,
      Int.ModEq 37 x 1 ∨ Int.ModEq 37 x (-1)) : False := by
  apply baseline_all_fibers_signs_impossible h
  intro x hx
  exact eq_one_or_neg_one_of_mod37_of_abs_lt36 x
    (baseline_fiber_abs_lt36 h x hx) (hmod x hx)

/-- The compressed energy bounds every fiber directly, without normalization. -/
theorem energy608_abs_lt25 {ι : Type*} [Fintype ι] (C : ι → ℤ)
    (henergy : ∑ i, C i ^ 2 = 608) (i : ι) : |C i| < 25 := by
  classical
  have hs : C i ^ 2 ≤ ∑ j, C j ^ 2 :=
    Finset.single_le_sum (fun j _ => sq_nonneg (C j)) (Finset.mem_univ i)
  rw [henergy] at hs
  have hsq : C i ^ 2 < (25 : ℤ) ^ 2 := by nlinarith
  have ha := sq_lt_sq.mp hsq
  norm_num at ha
  exact ha

theorem energy608_abs_lt36 {ι : Type*} [Fintype ι] (C : ι → ℤ)
    (henergy : ∑ i, C i ^ 2 = 608) (i : ι) : |C i| < 36 := by
  have hb := energy608_abs_lt25 C henergy i
  omega

theorem sum_sq_eq_card_of_signs {ι : Type*} [Fintype ι] (C : ι → ℤ)
    (hsign : ∀ i, C i = 1 ∨ C i = -1) :
    (∑ i, C i ^ 2) = (Fintype.card ι : ℤ) := by
  have hs (i : ι) : C i ^ 2 = 1 := by
    rcases hsign i with hi | hi <;> norm_num [hi]
  simp [hs]

theorem energy608_card16_not_all_signs {ι : Type*} [Fintype ι] (C : ι → ℤ)
    (hcard : Fintype.card ι = 16) (henergy : ∑ i, C i ^ 2 = 608) :
    ¬ (∀ i, C i = 1 ∨ C i = -1) := by
  intro hsign
  have h := sum_sq_eq_card_of_signs C hsign
  rw [henergy, hcard] at h
  norm_num at h

theorem energy608_card16_mod37_impossible {ι : Type*} [Fintype ι] (C : ι → ℤ)
    (hcard : Fintype.card ι = 16) (henergy : ∑ i, C i ^ 2 = 608)
    (hmod : ∀ i, Int.ModEq 37 (C i) 1 ∨ Int.ModEq 37 (C i) (-1)) : False := by
  apply energy608_card16_not_all_signs C hcard henergy
  intro i
  exact eq_one_or_neg_one_of_mod37_of_abs_lt36 (C i)
    (energy608_abs_lt36 C henergy i) (hmod i)

end HadamardBorderSymmetry
