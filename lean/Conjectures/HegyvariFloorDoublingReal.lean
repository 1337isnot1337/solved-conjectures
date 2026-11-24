import Conjectures.HegyvariFloorDoublingDistinct
import Mathlib.Data.Real.Archimedean
import Mathlib.Algebra.Order.Floor.Ring
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.NormNum

/-!
# Hegyvári's conjecture

Real floor-ray reductions for sections 2--4 of the existing proof,
`results/hegyvari-floor-doubling/PROOF.md`. The tower argument giving
indexed completeness remains an explicit premise at the final endpoint.
-/
namespace HegyvariFloorDoubling

noncomputable section

def floorRay (a : ℝ) (n : ℕ) : ℕ := ⌊(2 : ℝ)^n * a⌋₊

def floorDigit (a : ℝ) (n : ℕ) : Bool :=
  decide (floorRay a (n+1) = 2 * floorRay a n + 1)

def Dyadic (a : ℝ) : Prop := ∃ n k : ℕ, (2 : ℝ)^n * a = (k : ℝ)

def NonPowerTwoRatio (a b : ℝ) : Prop :=
  ∀ z : ℤ, a / b ≠ (2 : ℝ)^z

theorem floorRay_bounds {a : ℝ} (ha : 0 ≤ a) (n : ℕ) :
    (floorRay a n : ℝ) ≤ (2 : ℝ)^n*a ∧
      (2 : ℝ)^n*a < (floorRay a n : ℝ) + 1 := by
  have hnon : 0 ≤ (2 : ℝ)^n*a := mul_nonneg (pow_nonneg (by norm_num) _) ha
  exact ⟨Nat.floor_le hnon, Nat.lt_floor_add_one _⟩

theorem floorRay_binaryStep {a : ℝ} (ha : 0 ≤ a) :
    BinaryStep (floorRay a) (floorDigit a) := by
  intro n
  have h := floorRay_bounds ha n
  have hp : (2 : ℝ)^(n+1)*a = 2*((2 : ℝ)^n*a) := by rw [pow_succ]; ring
  have hlo : 2 * floorRay a n ≤ floorRay a (n+1) := by
    change 2 * floorRay a n ≤ ⌊(2 : ℝ)^(n+1)*a⌋₊
    apply Nat.le_floor
    push_cast
    rw [hp]
    linarith only [h.1]
  have hhi : floorRay a (n+1) < 2 * floorRay a n + 2 := by
    change ⌊(2 : ℝ)^(n+1)*a⌋₊ < _
    apply (Nat.floor_lt (mul_nonneg (pow_nonneg (by norm_num : (0:ℝ) ≤ 2) _) ha)).2
    push_cast
    rw [hp]
    linarith only [h.2]
  by_cases he : floorRay a (n+1) = 2 * floorRay a n + 1
  · simp [floorDigit, he]
  · simp [floorDigit, he]
    omega

theorem floorRay_multiplier_bounds {a : ℝ} (ha : 0 ≤ a)
    (l : ℕ) (hl : 0 < l) (n : ℕ) :
    l * floorRay a n ≤ floorRay ((l : ℝ)*a) n ∧
      floorRay ((l : ℝ)*a) n < l * floorRay a n + l := by
  have h := floorRay_bounds ha n
  have hl' : (0 : ℝ) < (l : ℝ) := by exact_mod_cast hl
  have hid : (2 : ℝ)^n*((l : ℝ)*a) = (l : ℝ)*((2 : ℝ)^n*a) := by ring
  constructor
  · change l * floorRay a n ≤ ⌊(2 : ℝ)^n*((l : ℝ)*a)⌋₊
    apply Nat.le_floor
    push_cast
    rw [hid]
    exact mul_le_mul_of_nonneg_left h.1 hl'.le
  · change ⌊(2 : ℝ)^n*((l : ℝ)*a)⌋₊ < _
    apply (Nat.floor_lt (mul_nonneg (pow_nonneg (by norm_num : (0:ℝ) ≤ 2) _)
      (mul_nonneg hl'.le ha))).2
    push_cast
    rw [hid]
    have hh := mul_lt_mul_of_pos_left h.2 hl'
    linarith only [hh]

theorem floorRay_positive {a : ℝ} (ha : 0 < a) :
    ∃ n, 0 < floorRay a n := by
  obtain ⟨n, hn⟩ := pow_unbounded_of_one_lt (1/a) (show (1:ℝ) < 2 by norm_num)
  have hh := (div_lt_iff₀ ha).mp hn
  exact ⟨n, Nat.floor_pos.mpr hh.le⟩

theorem floorDigit_unbounded_of_nondyadic {a : ℝ} (ha : 0 ≤ a)
    (hnd : ¬ Dyadic a) : UnboundedMarks (floorDigit a) := by
  intro N
  by_contra h
  have hz (j : ℕ) (hj : N ≤ j) : floorDigit a j = false := by
    cases hval : floorDigit a j with
    | false => rfl
    | true => exact False.elim (h ⟨j, hj, hval⟩)
  apply hnd
  refine ⟨N, floorRay a N, ?_⟩
  have hbase := (floorRay_bounds ha N).1
  apply le_antisymm _ hbase
  by_contra! hgt
  let e : ℝ := (2 : ℝ)^N*a - (floorRay a N : ℝ)
  have he : 0 < e := sub_pos.mpr hgt
  obtain ⟨k,hk⟩ := pow_unbounded_of_one_lt (1/e) (show (1:ℝ) < 2 by norm_num)
  have hk' : 1 < (2:ℝ)^k*e := (div_lt_iff₀ he).mp hk
  have hEq := zeroRun_expansion (floorRay_binaryStep ha) N k
    (fun j hj _ => hz j hj)
  have hb := (floorRay_bounds ha (N+k)).2
  have hid : (2:ℝ)^k*e =
      (2:ℝ)^(N+k)*a - (floorRay a (N+k):ℝ) := by
    dsimp [e]
    rw [hEq,pow_add]
    push_cast
    ring
  rw [hid] at hk'
  linarith only [hk', hb]

theorem floorRay_eventualCrossSep {a b : ℝ} (ha : 0 < a) (hb : 0 < b)
    (hRatio : NonPowerTwoRatio a b) :
    ∃ N : ℕ, ∀ i j, N ≤ i → N ≤ j → floorRay a i ≠ floorRay b j := by
  obtain ⟨r,hr⟩ := exists_mem_Ico_zpow (div_pos ha hb)
    (show (1:ℝ) < 2 by norm_num)
  have hlo : (2:ℝ)^r < a/b := lt_of_le_of_ne hr.1 (Ne.symm (hRatio r))
  have hhi : a/b < (2:ℝ)^(r+1) := hr.2
  have hL : (2:ℝ)^r*b < a := (lt_div_iff₀ hb).mp hlo
  have hR : a < (2:ℝ)^(r+1)*b := (div_lt_iff₀ hb).mp hhi
  let δ : ℝ := min (a - (2:ℝ)^r*b) ((2:ℝ)^(r+1)*b - a)
  have hδ : 0 < δ := lt_min (sub_pos.mpr hL) (sub_pos.mpr hR)
  obtain ⟨N,hN⟩ := pow_unbounded_of_one_lt (1/δ) (show (1:ℝ) < 2 by norm_num)
  refine ⟨N, ?_⟩
  intro i j hi _ heq
  have hlarge : 1 < (2:ℝ)^i*δ :=
    (div_lt_iff₀ hδ).mp (hN.trans_le (pow_le_pow_right₀ (by norm_num) hi))
  have hai := floorRay_bounds ha.le i
  have hbj := floorRay_bounds hb.le j
  have hc : (floorRay a i : ℝ) = (floorRay b j : ℝ) := by exact_mod_cast heq
  have hd1 : (2:ℝ)^i*a - (2:ℝ)^j*b < 1 := by
    linarith only [hai.2, hbj.1, hc]
  have hd2 : (2:ℝ)^j*b - (2:ℝ)^i*a < 1 := by
    linarith only [hbj.2, hai.1, hc]
  let z : ℤ := (j:ℤ)-(i:ℤ)
  have hscale : (2:ℝ)^i*((2:ℝ)^z*b) = (2:ℝ)^j*b := by
    calc
      (2:ℝ)^i*((2:ℝ)^z*b) = ((2:ℝ)^(i:ℤ)*(2:ℝ)^z)*b := by
        rw [zpow_natCast]
        ring
      _ = (2:ℝ)^((i:ℤ)+z)*b := by rw [zpow_add₀ (by norm_num : (2:ℝ) ≠ 0)]
      _ = (2:ℝ)^j*b := by
        rw [show (i:ℤ)+z = (j:ℤ) by dsimp [z]; omega, zpow_natCast]
  by_cases hz : z ≤ r
  · have hp := zpow_le_zpow_right₀ (by norm_num : (1:ℝ) ≤ 2) hz
    have hδle : δ ≤ a - (2:ℝ)^z*b :=
      (min_le_left _ _).trans (sub_le_sub_left (mul_le_mul_of_nonneg_right hp hb.le) a)
    have hm := mul_le_mul_of_nonneg_left hδle (pow_nonneg (by norm_num : (0:ℝ) ≤ 2) i)
    rw [mul_sub, hscale] at hm
    linarith only [hlarge, hm, hd1]
  · have hz' : r+1 ≤ z := by omega
    have hp := zpow_le_zpow_right₀ (by norm_num : (1:ℝ) ≤ 2) hz'
    have hδle : δ ≤ (2:ℝ)^z*b - a :=
      (min_le_right _ _).trans (sub_le_sub_right (mul_le_mul_of_nonneg_right hp hb.le) a)
    have hm := mul_le_mul_of_nonneg_left hδle (pow_nonneg (by norm_num : (0:ℝ) ≤ 2) i)
    rw [mul_sub, hscale] at hm
    linarith only [hlarge, hm, hd2]

theorem floorRays_strongComplete_of_indexed {a b : ℝ} (ha : 0 < a) (hb : 0 < b)
    (hRatio : NonPowerTwoRatio a b)
    (hIndexed : IndexedTailComplete (floorRay a) (floorRay b)) :
    DistinctStrongComplete (floorRay a) (floorRay b) := by
  obtain ⟨i,hi⟩ := floorRay_positive ha
  obtain ⟨j,hj⟩ := floorRay_positive hb
  exact distinctStrongComplete_of_binarySteps (floorRay_binaryStep ha.le)
    (floorRay_binaryStep hb.le) i j hi hj
    (floorRay_eventualCrossSep ha hb hRatio) hIndexed

end

end HegyvariFloorDoubling
